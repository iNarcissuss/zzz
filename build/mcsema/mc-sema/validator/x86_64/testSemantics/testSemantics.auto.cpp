#include "gtest/gtest.h"
#include "toLLVM.h"
#include "raiseX86.h"
//#define DEBUG

#include "../common/RegisterState.h"
#include "../common/to_string.h"

#include <boost/graph/breadth_first_search.hpp>
#include <boost/algorithm/string.hpp>

#ifdef _WIN32
#include <windows.h>
#include <stdio.h>
#include <float.h>
#include <math.h>
#pragma float_control(precise, on)
#pragma fenv_access(on)
#else
#include <sys/mman.h>
#include <dlfcn.h>
#ifndef __APPLE__
#ifndef __MACH__
#include <asm/mman.h>
#endif
#endif
#endif

#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/JIT.h"
#include <llvm/ADT/StringSwitch.h>

#include <boost/algorithm/string/predicate.hpp>
#include <boost/lexical_cast.hpp>
#include <cstdio>
#include <string>
#include <iostream>

using namespace llvm;
using namespace std;

#ifdef __x86_64__
    #ifdef __linux__
        #define TRIPLE "x86_64-pc-linux-gnu"
    #elif defined(_WIN32)
        #define TRIPLE "x86_64-pc-win32"
    #elif defined(__APPLE__)
        #define TRIPLE "x86_64-apple-darwin"
    #else
        #error Building on an unsupported OS
    #endif
#else
    #ifdef __linux__
        #define TRIPLE "i386-pc-linux-gnu"
    #elif defined(_WIN32)
        #define TRIPLE "i386-pc-win32"
    #elif defined(__APPLE__)
        #define TRIPLE "i386-apple-darwin"
    #else
        #error Building on an unsupported OS
    #endif
#endif

#define STACK_LEN 40960

enum fputag_vals {
    FPU_TAG_VALID = 0,
    FPU_TAG_ZERO = 1,
    FPU_TAG_SPECIAL = 2,
    FPU_TAG_EMPTY = 3
};

#define TESTS_GENERAL (1<<0) 
#define TESTS_FPU     (1<<1) 
#define TESTS_TO_RUN  (TESTS_FPU|TESTS_GENERAL)
//#define TESTS_TO_RUN  (TESTS_FPU)

const uint64_t FLAG_CF = 1 << 0;
const uint64_t FLAG_PF = 1 << 1;
const uint64_t FLAG_AF = 1 << 2;
const uint64_t FLAG_ZF = 1 << 3;
const uint64_t FLAG_SF = 1 << 4;
const uint64_t FLAG_OF = 1 << 5;
const uint64_t FLAG_DF = 1 << 6;

const uint64_t FLAG_FPU_BUSY = 1 << 7;
const uint64_t FLAG_FPU_C3 =   1 << 8;
const uint64_t FLAG_FPU_TOP =  1 << 9;
const uint64_t FLAG_FPU_C2 =   1 << 10;
const uint64_t FLAG_FPU_C1 =   1 << 11;
const uint64_t FLAG_FPU_C0 =   1 << 12;
const uint64_t FLAG_FPU_ES =   1 << 13;
const uint64_t FLAG_FPU_SF =   1 << 14;
const uint64_t FLAG_FPU_PE =   1 << 15;
const uint64_t FLAG_FPU_UE =   1 << 16;
const uint64_t FLAG_FPU_OE =   1 << 17;
const uint64_t FLAG_FPU_ZE =   1 << 18;
const uint64_t FLAG_FPU_DE =   1 << 19;
const uint64_t FLAG_FPU_IE =   1 << 20;


uint8_t g_stackMem[STACK_LEN];

// Some helpers for testing.
// Need functions to create function headers and function footers.

Function *initTestFunction(string testName, Module *M) {
    FunctionType *FT = getBaseFunctionType(M);
    Constant     *FC = M->getOrInsertFunction((testName +"_func"), FT);
    Function     *F = dyn_cast<Function>(FC);

    assert(F != NULL);

    BasicBlock  *entryBlock = BasicBlock::Create(F->getContext(),
                                                 "entry", 
                                                 F);
    assert(entryBlock != NULL);

    if(getPointerSize(M) == Pointer32){
        allocateLocals(F, 32);
        writeContextToLocals(entryBlock, 32, AllRegs);
    } else {
        allocateLocals(F, 64);
        writeContextToLocals(entryBlock, 64, AllRegs);
    }

    return F;
}

void finiTestFunction(BasicBlock *e) {
    
    Module *M = e->getParent()->getParent();

    // Spill the locals back to the context.
    if(getPointerSize(M) == Pointer32){
        writeLocalsToContext(e, 32, AllRegs);
    } else {
        writeLocalsToContext(e, 64, AllRegs);
    }

    // Return from the function.
    ReturnInst::Create(e->getContext(), e);

    return;
}

typedef map<string, uint64_t>    testCaseToFlags;
typedef map<string, int>         testCaseToTestIDT;
typedef pair<mcsema::RegState, mcsema::RegState> InOutT;
typedef map<int, InOutT>         testIDToInOutT;

enum ScanningState {
    TestCase,
    InputCase,
    OutputCase
};

void* getRegPtr(const string &regName, mcsema::RegState *regs) {
    void *regptr = StringSwitch<void*>(regName)
#ifndef __x86_64__
                    .Case("EAX", &(regs->EAX))
                    .Case("EBX", &(regs->EBX))
                    .Case("ECX", &(regs->ECX))
                    .Case("EDX", &(regs->EDX))
                    .Case("ESI", &(regs->ESI))
                    .Case("EDI", &(regs->EDI))
                    .Case("ESP", &(regs->ESP))
                    .Case("EBP", &(regs->EBP))
#else
                    .Case("RAX", &(regs->RAX))
                    .Case("RBX", &(regs->RBX))
                    .Case("RCX", &(regs->RCX))
                    .Case("RDX", &(regs->RDX))
                    .Case("RSI", &(regs->RSI))
                    .Case("RDI", &(regs->RDI))
                    .Case("RSP", &(regs->RSP))
                    .Case("RBP", &(regs->RBP))
                    .Case("R8", &(regs->R8))
                    .Case("R9", &(regs->R9))
                    .Case("R10", &(regs->R10))
                    .Case("R11", &(regs->R11))
                    .Case("R12", &(regs->R12))
                    .Case("R13", &(regs->R13))
                    .Case("R14", &(regs->R14))
                    .Case("R15", &(regs->R15))
#endif
                    .Case("CF", &(regs->CF))
                    .Case("PF", &(regs->PF))
                    .Case("AF", &(regs->AF))
                    .Case("ZF", &(regs->ZF))
                    .Case("SF", &(regs->SF))
                    .Case("OF", &(regs->OF))
                    .Case("DF", &(regs->DF))
                    .Case("ST0", &(regs->ST_regs.st[0]))
                    .Case("ST1", &(regs->ST_regs.st[1]))
                    .Case("ST2", &(regs->ST_regs.st[2]))
                    .Case("ST3", &(regs->ST_regs.st[3]))
                    .Case("ST4", &(regs->ST_regs.st[4]))
                    .Case("ST5", &(regs->ST_regs.st[5]))
                    .Case("ST6", &(regs->ST_regs.st[6]))
                    .Case("ST7", &(regs->ST_regs.st[7]))
                    .Case("XMM0", &(regs->XMM0))
                    .Case("XMM1", &(regs->XMM1))
                    .Case("XMM2", &(regs->XMM2))
                    .Case("XMM3", &(regs->XMM3))
                    .Case("XMM4", &(regs->XMM4))
                    .Case("XMM5", &(regs->XMM5))
                    .Case("XMM6", &(regs->XMM6))
                    .Case("XMM7", &(regs->XMM7))
#ifdef __x86_64__
                    .Case("XMM8", &(regs->XMM8))
                    .Case("XMM9", &(regs->XMM9))
                    .Case("XMM10", &(regs->XMM10))
                    .Case("XMM11", &(regs->XMM11))
                    .Case("XMM12", &(regs->XMM12))
                    .Case("XMM13", &(regs->XMM13))
                    .Case("XMM14", &(regs->XMM14))
                    .Case("XMM15", &(regs->XMM15))
#endif
                    .Case("FPU_BUSY", &(regs->FPU_FLAGS.BUSY))
                    .Case("FPU_C3", &(regs->FPU_FLAGS.C3))
                    .Case("FPU_TOP", &(regs->FPU_FLAGS.TOP))
                    .Case("FPU_C2", &(regs->FPU_FLAGS.C2))
                    .Case("FPU_C1", &(regs->FPU_FLAGS.C1))
                    .Case("FPU_C0", &(regs->FPU_FLAGS.C0))
                    .Case("FPU_ES", &(regs->FPU_FLAGS.ES))
                    .Case("FPU_SF", &(regs->FPU_FLAGS.SF))
                    .Case("FPU_PE", &(regs->FPU_FLAGS.PE))
                    .Case("FPU_UE", &(regs->FPU_FLAGS.UE))
                    .Case("FPU_OE", &(regs->FPU_FLAGS.OE))
                    .Case("FPU_ZE", &(regs->FPU_FLAGS.ZE))
                    .Case("FPU_DE", &(regs->FPU_FLAGS.DE))
                    .Case("FPU_IE", &(regs->FPU_FLAGS.IE))
                    .Case("FPU_X", &(regs->FPU_CONTROL.X))
                    .Case("FPU_RC", &(regs->FPU_CONTROL.RC))
                    .Case("FPU_PC", &(regs->FPU_CONTROL.PC))
                    .Case("FPU_PM", &(regs->FPU_CONTROL.PM))
                    .Case("FPU_UM", &(regs->FPU_CONTROL.UM))
                    .Case("FPU_OM", &(regs->FPU_CONTROL.OM))
                    .Case("FPU_ZM", &(regs->FPU_CONTROL.ZM))
                    .Case("FPU_DM", &(regs->FPU_CONTROL.DM))
                    .Case("FPU_IM", &(regs->FPU_CONTROL.IM))
                    .Case("FPU_FOPCODE", &(regs->FPU_FOPCODE))
                    .Default(NULL);

    return regptr;
}

template<typename T>
void writeToState(string regName, T regVal, mcsema::RegState *regs) {
    
    if (regName == "FPUTW")
    {
        for (int i = 0; i < STREGS_MAX; i++)
        {
            // this will be uint32_t for FPUTW, hence the
            // awfully unsafe cast
            uint8_t new_regval = *((uint32_t*)((void*)&regVal));
            uint8_t thistag = ((new_regval >> i) & 1);

            // Convert from FXSAVE format to native CPU format.
            // In FXSAVE, 0 == tag empty; 1 == tag not empty (assume valid for
            // now).
            uint8_t expanded_val = thistag == 0 ? FPU_TAG_EMPTY : FPU_TAG_VALID;
            //uint8_t expanded_val = FPU_TAG_VALID;
            regs->FPU_TAG.tag[i] = expanded_val;
        }
    }
    else
    {
        T *r = static_cast<T*>(getRegPtr(regName, regs));
        assert(r != NULL);
        *r = regVal;
    }

    return;
}

void getValueWriteToState(const string &line, mcsema::RegState &state)
{
    int k = line.find(':');
    string regName = line.substr(0, k);
    std::string v = line.substr(k+1);
    
    if (boost::starts_with(regName, "ST"))
    { // Only the STi registers are long doubles, for now.
        mcsema::nativefpu regVal;
        unsigned count=0;
        memset(&regVal, 0, sizeof(regVal));

        vector<string> hexchars;
        boost::split(hexchars, v, boost::is_any_of(" "));
        std::stringstream ss;
        // the text string we are reading has 16 bytes
        // since it is output with padding
        // only 12 are read in, as we read in without padding.
        //printf("reading fpu bytes: ");
        for(vector<string>::iterator itr = hexchars.begin();
                itr != hexchars.end() && count < sizeof(((mcsema::nativefpu*)0)->b);
                itr++, count++) 
        {

            std::string bytestr(*itr);
            boost::algorithm::trim(bytestr);

            if(bytestr == "")
                continue;

            //printf("Reading char: '%s'\n", bytestr.c_str());
            assert(count < 12);
            regVal.b[count] = strtoul(bytestr.c_str(), NULL, 16);
            //printf("%02x ", regVal.b[count]);
        }
        //printf("\n");
            

        //printf("Writing back to native value\n");
        //printf("Loaded value: %Lf\n", regVal);
        writeToState<mcsema::nativefpu>(regName, regVal, &state);
    }
    else if (boost::starts_with(regName, "XMM"))
    {
        mcsema::xmmregstate regVal;
        unsigned count=0;
        memset(&regVal, 0, sizeof(regVal));

        vector<string> hexchars;
        boost::split(hexchars, v, boost::is_any_of(" "));
        std::stringstream ss;

        for(vector<string>::iterator itr = hexchars.begin();
                itr != hexchars.end() && count < sizeof(((mcsema::xmmregstate *)0)->tag);
                itr++, count++)
        {
            
            std::string bytestr(*itr);
            boost::algorithm::trim(bytestr);
            
            if(bytestr == "")
                continue;
                
            assert(count < 16);
            regVal.tag[count] = strtoul(bytestr.c_str(), NULL, 16);           
        }

        writeToState<mcsema::xmmregstate>(regName, regVal, &state);
    }
    else if (boost::equals(regName, "FPU_FOPCODE"))
    {
        uint16_t regVal = 0;
        try {
            regVal = boost::numeric_cast<uint16_t>(boost::lexical_cast<uint32_t>(v));
        } catch (bad_cast &e) {
            cerr << "could not parse " << v << " as a uint16_t\n";
            throw e;
        }
        writeToState<uint16_t>(regName, regVal, &state);
    }
    else if (boost::starts_with(regName, "FPU_") || 
             regName == "CF" ||
             regName == "PF" ||
             regName == "AF" ||
             regName == "ZF" ||
             regName == "SF" ||
             regName == "OF" ||
             regName == "DF")
    {
        uint8_t regVal = 0;
        try {
            regVal = boost::numeric_cast<uint8_t>(boost::lexical_cast<uint32_t>(v));
        } catch (bad_cast &e) {
            cerr << "could not parse " << v << " as a uint8_t\n";
        }

        writeToState<uint8_t>(regName, regVal, &state);
    }
    else
    {
        uint64_t regVal = 0;
        try {
            regVal = boost::lexical_cast<uint64_t>(v);
        } catch (bad_cast &e) {
            cerr << "could not parse " << v << " as a uint32_t\n";
            throw e;
        }
        cout << regName << " : " << regVal <<"\n";
        writeToState<uint64_t>(regName, regVal, &state);
    }
}

static testIDToInOutT g_stateMap;

testIDToInOutT getTestCaseMap(string tests) {

    if(g_stateMap.empty() == false)
    {
        return g_stateMap;
    }

    // Open the input file as an input stream.
    ifstream inStream(tests.c_str());

    if (!inStream.is_open())
    {
        std::cerr << "Could not open: " << tests << "\n";
        exit(-1);
    }

    // Read until the ifstream is over.
    string line;
    ScanningState ss = TestCase;
    int           testCaseNumber;
    mcsema::RegState      inputState;
    mcsema::RegState      outputState;
    memset(&inputState, 0, sizeof(mcsema::RegState));
    memset(&outputState, 0, sizeof(mcsema::RegState));

#ifdef DEBUG
    cout << "Calling getTestCaseMap\n";
#endif

    while (inStream.good()) {
        getline(inStream, line, '\n');
        size_t  rPos = line.find('\r');
        if(rPos != string::npos) {
          line.erase(rPos);
        }
        switch(ss) {
            case TestCase:
                if ( line.substr(0, 8) == "TESTCASE" ) {
                    // Read out the test case number.
                    testCaseNumber = boost::lexical_cast<int>(line.substr(9));
                }
                else if ( line == "INPUTSTATE" ) {
                    ss = InputCase;
                } else {
                    // Parse error.
                }
                break;

            case InputCase:
                if (line == "OUTPUTSTATE") {
                    ss = OutputCase;
                } else {
                    // Parse the line into a reg/flag assignment.
                    getValueWriteToState(line, inputState);
                }
                break;

            case OutputCase:
                if (line == "ENDCASE") {
                    ss = TestCase;
                    // Take our current map and shove it into the g_stateMap.
                    InOutT inOut(inputState, outputState);
#ifdef DEBUG
		    printf("Adding test case: %d\n", testCaseNumber);
#endif
                    g_stateMap.insert(pair<int, InOutT>(testCaseNumber, inOut));

                    // Then zero the input and output.
                    memset(&inputState, 0, sizeof(mcsema::RegState));
                    memset(&outputState, 0, sizeof(mcsema::RegState));
                } else {
                    // Parse the line into a reg/flag assignment.
                    getValueWriteToState(line, outputState);
                }
                break;
        }
    }

#ifdef DEBUG
    cout << "Done with getTestCaseMap" << endl;
#endif

    return g_stateMap;
}

// This is a class that lets us carry state between tests.
// The state that we carry will be a single LLVM Module.
// It can also carry our instruction decoder and so on.

class ModuleTest : public ::testing::Test {
protected:
    virtual void SetUp(void) {
        // Sanity checks on register function.
#ifdef DEBUG
        printf("sizeof(mcsema::fpuregs): %ld\n", sizeof(mcsema::fpuregs));
        printf("sizeof(mcsema::RegState): %ld\n", sizeof(mcsema::RegState));
#endif
#ifdef __x86_64__

#ifdef DEBUG
        printf("sizeof(RegState) [%ld] - sizeof(((mcsema::nativefpu*)0)->pad)*STREGS_MAX [%ld] = [%ld] (316)\n", 
                sizeof(mcsema::RegState),
                sizeof(((mcsema::nativefpu*)0)->pad)*STREGS_MAX,
                sizeof(mcsema::RegState) - sizeof(((mcsema::nativefpu*)0)->pad)*STREGS_MAX);
#endif

       // assert(sizeof(mcsema::RegState) - sizeof(((mcsema::nativefpu*)0)->pad)*STREGS_MAX == 316);
#else
        assert(sizeof(mcsema::RegState) == 316);
        assert(sizeof(mcsema::fpuregs) == 96);
#endif

        llvm::InitializeAllTargetInfos();
        llvm::InitializeAllTargetMCs();
        llvm::InitializeAllAsmParsers();
        llvm::InitializeAllDisassemblers();
        llvm::InitializeNativeTarget();

        this->M = new Module("testModule", getGlobalContext());
        this->M->setTargetTriple(TRIPLE);

        // Create the disassembler objects.
        const llvm::Target          *t = NULL;
        const llvm::MCSubtargetInfo *STI = NULL;
        const llvm::MCAsmInfo       *AsmInfo = NULL;
        llvm::MCRegisterInfo        *MRI = NULL;
        const llvm::MCInstrInfo     *MCII = NULL;

#ifdef __x86_64__
        t = findDisTarget("x86-64");
        this->M->setDataLayout(
            "e-m:e-i64:64-f80:128-n8:16:32:64-S128");
        doGlobalInit(this->M);
#else
        t = findDisTarget("x86");
        this->M->setDataLayout(
            "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32");
        doGlobalInit(this->M);
#endif

        assert(t != NULL);
        STI = t->createMCSubtargetInfo( TRIPLE, "", "");

        MRI = t->createMCRegInfo(TRIPLE);
        AsmInfo = t->createMCAsmInfo(*MRI, TRIPLE);
        
        assert(t != NULL);
        assert(STI);
        assert(AsmInfo);

        // Get an inst printer.
        int AsmPrinterVariant = AsmInfo->getAssemblerDialect();
        MCII = t->createMCInstrInfo();
        llvm::MCInstPrinter
            *IP = t->createMCInstPrinter( AsmPrinterVariant, 
                                          *AsmInfo, 
                                          *MCII,
                                          *MRI,
                                          *STI);

        assert(IP);
        llvm::MCContext *Ctx = new llvm::MCContext(AsmInfo, MRI, nullptr);
        const llvm::MCDisassembler *DisAsm = t->createMCDisassembler(*STI, *Ctx);

        assert(DisAsm);

        this->Dis = DisAsm;
        this->InstPrinter = IP;

        this->testCases = getTestCaseMap("tests.out");

        // Create the native module.
        //list<NativeFunctionPtr> funcList;
        //this->natM = NativeModulePtr(new NativeModule("testMod", funcList, IP));

#define NEW_TEST(x, k) do {\
    this->caseMap.insert(pair<string,int>(x, k));\
    this->flagMap.insert(pair<string, uint64_t>(x, 0));\
    } while (0);

#define NEW_TEST_IGNOREFLAGS(x, k, f)  do {\
    this->caseMap.insert(pair<string,int>(x, k));\
    this->flagMap.insert(pair<string, uint64_t>(x, f));\
    } while (0);

        // ADD TESTS HERE.
        // Begin Declarations

NEW_TEST("ADC16i16",   0x300);

NEW_TEST("ADC16ri",   0x301);

NEW_TEST("ADC16rr",   0x302);

NEW_TEST("ADC32i32",   0x303);

NEW_TEST("ADC32ri",   0x304);

NEW_TEST("ADC32rr",   0x305);

NEW_TEST("ADC64i32",   0x306);

NEW_TEST("ADC64ri32",   0x307);

NEW_TEST("ADC64rr",   0x308);

NEW_TEST("ADC8i8",   0x309);

NEW_TEST("ADC8ri",   0x30a);

NEW_TEST("ADC8rr",   0x30b);

NEW_TEST("ADD16i16",   0x30c);

NEW_TEST("ADD16ri",   0x30d);

NEW_TEST("ADD16rm",   0x30e);

NEW_TEST("ADD16rr",   0x30f);

NEW_TEST("ADD32i32",   0x310);

NEW_TEST("ADD32ri",   0x311);

NEW_TEST("ADD32rr",   0x312);

NEW_TEST("ADD64i32",   0x313);

NEW_TEST("ADD64ri32",   0x314);

NEW_TEST("ADD64ri8",   0x315);

NEW_TEST("ADD64rr",   0x316);

NEW_TEST("ADD64rr_DB",   0x317);

NEW_TEST("ADD8i8",   0x318);

NEW_TEST("ADD8ri",   0x319);

NEW_TEST("ADD8rr",   0x31a);

NEW_TEST("ADDSDrm",   0x31b);

NEW_TEST("ADDSDrr",   0x31c);

NEW_TEST("ADDSSrm",   0x31d);

NEW_TEST("ADDSSrr",   0x31e);

NEW_TEST("ADD_F32m",   0x31f);

NEW_TEST("ADD_F64m",   0x320);

NEW_TEST_IGNOREFLAGS("AND16i16", 0x321, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND16mi", 0x322, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND16mr", 0x323, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND16ri", 0x324, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND16rr", 0x325, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND32i32", 0x326, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND32mr", 0x327, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND32ri", 0x328, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND32rr", 0x329, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND8i8", 0x32a, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND8mi", 0x32b, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND8mr", 0x32c, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND8ri", 0x32d, FLAG_AF);

NEW_TEST_IGNOREFLAGS("AND8rr", 0x32e, FLAG_AF);

NEW_TEST_IGNOREFLAGS("BSR16rr", 0x32f, FLAG_CF|FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF);

NEW_TEST_IGNOREFLAGS("BSR32rr", 0x330, FLAG_CF|FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF);

NEW_TEST_IGNOREFLAGS("BSR32rr_2", 0x331, FLAG_CF|FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF);

NEW_TEST("BSWAP32r",   0x332);

NEW_TEST_IGNOREFLAGS("BT16rr", 0x333, FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF);

NEW_TEST_IGNOREFLAGS("BT32rr", 0x334, FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF);

NEW_TEST("CDQ",   0x335);

NEW_TEST("CLC",   0x336);

NEW_TEST("CLD",   0x337);

NEW_TEST("CMOVA16rr",   0x338);

NEW_TEST("CMOVA32rm",   0x339);

NEW_TEST("CMOVA32rr",   0x33a);

NEW_TEST("CMOVAE16rr",   0x33b);

NEW_TEST("CMOVAE32rr",   0x33c);

NEW_TEST("CMOVB16rr",   0x33d);

NEW_TEST("CMOVB32rr",   0x33e);

NEW_TEST("CMOVBE16rr",   0x33f);

NEW_TEST("CMOVBE32rr",   0x340);

NEW_TEST("CMOVE16rr",   0x341);

NEW_TEST("CMOVE32rr",   0x342);

NEW_TEST("CMOVG16rr",   0x343);

NEW_TEST("CMOVG32rr",   0x344);

NEW_TEST("CMOVGE16rr",   0x345);

NEW_TEST("CMOVGE32rr",   0x346);

NEW_TEST("CMOVL16rr",   0x347);

NEW_TEST("CMOVL32rr",   0x348);

NEW_TEST("CMOVLE16rr",   0x349);

NEW_TEST("CMOVLE32rr",   0x34a);

NEW_TEST("CMOVNE16rr",   0x34b);

NEW_TEST("CMOVNE32rr",   0x34c);

NEW_TEST("CMOVNO16rr",   0x34d);

NEW_TEST("CMOVNO32rr",   0x34e);

NEW_TEST("CMOVNP16rr",   0x34f);

NEW_TEST("CMOVNP32rr",   0x350);

NEW_TEST("CMOVNS16rr",   0x351);

NEW_TEST("CMOVNS32rr",   0x352);

NEW_TEST("CMOVO16rr",   0x353);

NEW_TEST("CMOVO32rr",   0x354);

NEW_TEST("CMOVP16rr",   0x355);

NEW_TEST("CMOVP32rr",   0x356);

NEW_TEST("CMOVS16rr",   0x357);

NEW_TEST("CMOVS32rr",   0x358);

NEW_TEST("CMP16mi",   0x359);

NEW_TEST("CMP16rr",   0x35a);

NEW_TEST("CMP32i32",   0x35b);

NEW_TEST("CMP32ri",   0x35c);

NEW_TEST("CMP32rr",   0x35d);

NEW_TEST("CMP8rr",   0x35e);

NEW_TEST("CMPXCHG16r",   0x35f);

NEW_TEST("CMPXCHG32rm",   0x360);

NEW_TEST("CMPXCHG32rr",   0x361);

NEW_TEST("CMPXCHG8rr",   0x362);

NEW_TEST("CVTPS2PDrm",   0x363);

NEW_TEST("CVTPS2PDrr",   0x364);

NEW_TEST("CVTSD2SSrm",   0x365);

NEW_TEST("CVTSD2SSrr",   0x366);

NEW_TEST("CVTSI2SDrm",   0x367);

NEW_TEST("CVTSI2SDrr",   0x368);

NEW_TEST("CVTSI2SSrm",   0x369);

NEW_TEST("CVTSI2SSrr",   0x36a);

NEW_TEST("CVTSS2SDrm",   0x36b);

NEW_TEST("CVTSS2SDrr",   0x36c);

NEW_TEST("CVTTSD2SIrm",   0x36d);

NEW_TEST("CVTTSD2SIrr",   0x36e);

NEW_TEST("CVTTSS2SIrm",   0x36f);

NEW_TEST("CVTTSS2SIrr",   0x370);

NEW_TEST("Cmp32RR1",   0x371);

NEW_TEST("Cmp32RR2",   0x372);

NEW_TEST("Cmpxch16RR",   0x373);

NEW_TEST("Composite1",   0x374);

NEW_TEST("Composite2",   0x375);

NEW_TEST("DEC16r",   0x376);

NEW_TEST("DEC32r",   0x377);

NEW_TEST("DEC64r",   0x378);

NEW_TEST("DEC8r",   0x379);

NEW_TEST_IGNOREFLAGS("DIV64r", 0x37a, FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST("DIVSDrm",   0x37b);

NEW_TEST("DIVSDrr",   0x37c);

NEW_TEST("DIVSSrm",   0x37d);

NEW_TEST("DIVSSrr",   0x37e);

NEW_TEST_IGNOREFLAGS("DIV_F32m", 0x37f, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("DIV_F64m", 0x380, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST("DIV_PFrST0",   0x381);

NEW_TEST_IGNOREFLAGS("DIV_ST0Fr", 0x382, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST("ENTER",   0x383);

NEW_TEST("FABS",   0x384);

NEW_TEST("FADDP",   0x385);

NEW_TEST("FADDP_rST0",   0x386);

NEW_TEST("FBLD",   0x387);

NEW_TEST("FBSTP",   0x388);

NEW_TEST("FCHS",   0x389);

NEW_TEST("FCLEX",   0x38a);

NEW_TEST("FCMOVB",   0x38b);

NEW_TEST("FCMOVBE",   0x38c);

NEW_TEST("FCMOVE",   0x38d);

NEW_TEST("FCMOVNB",   0x38e);

NEW_TEST("FCMOVNBE",   0x38f);

NEW_TEST("FCMOVNE",   0x390);

NEW_TEST("FCMOVNU",   0x391);

NEW_TEST("FCMOVU",   0x392);

NEW_TEST("FCOM",   0x393);

NEW_TEST("FCOMIP_STFr",   0x394);

NEW_TEST("FCOMI_STFr",   0x395);

NEW_TEST("FCOMP",   0x396);

NEW_TEST("FCOMPP",   0x397);

NEW_TEST("FCOMP_F32m",   0x398);

NEW_TEST("FCOMP_F64m",   0x399);

NEW_TEST("FCOMP_STFr",   0x39a);

NEW_TEST("FCOM_F32m",   0x39b);

NEW_TEST("FCOM_F64m",   0x39c);

NEW_TEST("FCOM_STFr",   0x39d);

NEW_TEST("FDECSTP",   0x39e);

NEW_TEST("FDIVP",   0x39f);

NEW_TEST_IGNOREFLAGS("FDIVRP", 0x3a0, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST_IGNOREFLAGS("FDIVR_F32m", 0x3a1, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("FDIVR_F64m", 0x3a2, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("FDIVR_FrST0", 0x3a3, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("FDIVR_PFrST0", 0x3a4, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST("FDIVR_ST0Fr",   0x3a5);

NEW_TEST("FFREE",   0x3a6);

NEW_TEST_IGNOREFLAGS("FIADDm16", 0x3a7, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST_IGNOREFLAGS("FIADDm32", 0x3a8, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST("FICOMP_16m",   0x3a9);

NEW_TEST("FICOMP_32m",   0x3aa);

NEW_TEST("FICOM_16m",   0x3ab);

NEW_TEST("FICOM_32m",   0x3ac);

NEW_TEST_IGNOREFLAGS("FIDIVR_32m", 0x3ad, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST_IGNOREFLAGS("FIDIVR_64m", 0x3ae, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST("FIDIV_32m",   0x3af);

NEW_TEST("FIDIV_64m",   0x3b0);

NEW_TEST("FILD_16m",   0x3b1);

NEW_TEST("FILD_32m",   0x3b2);

NEW_TEST("FILD_64m",   0x3b3);

NEW_TEST("FIMUL_m16",   0x3b4);

NEW_TEST("FIMUL_m32",   0x3b5);

NEW_TEST("FINCSTP",   0x3b6);

NEW_TEST("FINIT",   0x3b7);

NEW_TEST_IGNOREFLAGS("FISTP_16m", 0x3b8, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("FISTP_32m", 0x3b9, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("FISTP_64m", 0x3ba, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("FISTTP_16m", 0x3bb, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("FISTTP_32m", 0x3bc, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("FISTTP_64m", 0x3bd, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("FIST_16m", 0x3be, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("FIST_32m", 0x3bf, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("FISUBRm16", 0x3c0, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST_IGNOREFLAGS("FISUBRm32", 0x3c1, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST_IGNOREFLAGS("FISUBm16", 0x3c2, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST_IGNOREFLAGS("FISUBm32", 0x3c3, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST("FLD1",   0x3c4);

NEW_TEST("FLDCW",   0x3c5);

NEW_TEST("FLDENV",   0x3c6);

NEW_TEST("FLDL2E",   0x3c7);

NEW_TEST("FLDL2T",   0x3c8);

NEW_TEST("FLDLG2",   0x3c9);

NEW_TEST("FLDLN2",   0x3ca);

NEW_TEST("FLDPI",   0x3cb);

NEW_TEST("FLDZ",   0x3cc);

NEW_TEST_IGNOREFLAGS("FMULP", 0x3cd, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("FMULP_rST0", 0x3ce, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST("FNCLEX",   0x3cf);

NEW_TEST("FNINIT",   0x3d0);

NEW_TEST("FNOP",   0x3d1);

NEW_TEST("FNSAVE",   0x3d2);

NEW_TEST("FNSTCW",   0x3d3);

NEW_TEST("FNSTENVm",   0x3d4);

NEW_TEST("FNSTSWa",   0x3d5);

NEW_TEST("FNSTSWm",   0x3d6);

NEW_TEST("FPATAN",   0x3d7);

NEW_TEST("FPREM",   0x3d8);

NEW_TEST("FPREM1",   0x3d9);

NEW_TEST("FRSTOR",   0x3da);

NEW_TEST("FSAVE",   0x3db);

NEW_TEST("FSQRT",   0x3dc);

NEW_TEST("FSTCW",   0x3dd);

NEW_TEST("FSTENVm",   0x3de);

NEW_TEST("FSTSWa",   0x3df);

NEW_TEST("FSTSWm",   0x3e0);

NEW_TEST("FSUBP",   0x3e1);

NEW_TEST("FSUBP_rST0",   0x3e2);

NEW_TEST("FSUBRP",   0x3e3);

NEW_TEST("FSUBRP_rST0",   0x3e4);

NEW_TEST("FTST",   0x3e5);

NEW_TEST("FUCOM",   0x3e6);

NEW_TEST("FUCOMIP_STFr",   0x3e7);

NEW_TEST("FUCOMI_STFr",   0x3e8);

NEW_TEST("FUCOMP",   0x3e9);

NEW_TEST("FUCOMPP",   0x3ea);

NEW_TEST("FUCOMP_STFr",   0x3eb);

NEW_TEST("FUCOM_STFr",   0x3ec);

NEW_TEST("FXAM",   0x3ed);

NEW_TEST("FXRSTOR",   0x3ee);

NEW_TEST("FXSAVE",   0x3ef);

NEW_TEST("FXTRACT",   0x3f0);

NEW_TEST_IGNOREFLAGS("FYL2X", 0x3f1, FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("FYL2XP1", 0x3f2, FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("IDIV16r", 0x3f3, FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IDIV32r", 0x3f4, FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IDIV64r", 0x3f5, FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IDIV8r", 0x3f6, FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST("ILD_F16m",   0x3f7);

NEW_TEST("ILD_F32m",   0x3f8);

NEW_TEST("ILD_F64m",   0x3f9);

NEW_TEST_IGNOREFLAGS("IMUL16r", 0x3fa, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL16rr", 0x3fb, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL16rri", 0x3fc, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL32r", 0x3fd, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL32rr", 0x3fe, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL32rri", 0x3ff, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL64m", 0x400, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL64r", 0x401, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL64rr", 0x402, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL64rri32", 0x403, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL64rri8", 0x404, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("IMUL8r", 0x405, FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF);

NEW_TEST("INC16r",   0x406);

NEW_TEST("INC32r",   0x407);

NEW_TEST("INC64r",   0x408);

NEW_TEST("INC8r",   0x409);

NEW_TEST("LAHF",   0x40a);

NEW_TEST("LD_F0",   0x40b);

NEW_TEST("LD_F1",   0x40c);

NEW_TEST("LD_F32m",   0x40d);

NEW_TEST("LD_F80m",   0x40e);

NEW_TEST("LD_Frr",   0x40f);

NEW_TEST("LEA16r",   0x410);

NEW_TEST("LEA32r",   0x411);

NEW_TEST("LEAVE",   0x412);

NEW_TEST("LOOP",   0x413);

NEW_TEST("Lea32R1",   0x414);

NEW_TEST("Lea32R2",   0x415);

NEW_TEST("MOV16ri",   0x416);

NEW_TEST("MOV16rr",   0x417);

NEW_TEST("MOV32ri",   0x418);

NEW_TEST("MOV32rr",   0x419);

NEW_TEST("MOV8ri",   0x41a);

NEW_TEST("MOV8rr",   0x41b);

NEW_TEST("MOVDI2PDIrm",   0x41c);

NEW_TEST("MOVDI2PDIrr",   0x41d);

NEW_TEST("MOVPDI2DImr",   0x41e);

NEW_TEST("MOVPDI2DIrr",   0x41f);

NEW_TEST("MOVSDmr",   0x420);

NEW_TEST("MOVSDrm",   0x421);

NEW_TEST("MOVSDrr",   0x422);

NEW_TEST("MOVSSmr",   0x423);

NEW_TEST("MOVSSrm",   0x424);

NEW_TEST("MOVSSrr",   0x425);

NEW_TEST("MOVSX16rr8",   0x426);

NEW_TEST("MOVSX32rr16",   0x427);

NEW_TEST("MOVSX32rr8",   0x428);

NEW_TEST("MOVZX16rr8",   0x429);

NEW_TEST("MOVZX32rr16",   0x42a);

NEW_TEST("MOVZX32rr8",   0x42b);

NEW_TEST("MULSDrm",   0x42c);

NEW_TEST("MULSDrr",   0x42d);

NEW_TEST("MULSSrm",   0x42e);

NEW_TEST("MULSSrr",   0x42f);

NEW_TEST_IGNOREFLAGS("MUL_F32m", 0x430, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("MUL_F64m", 0x431, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("MUL_FST0r", 0x432, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("MUL_FrST0", 0x433, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST("NEG16r",   0x434);

NEW_TEST("NEG32r",   0x435);

NEW_TEST("NEG8r",   0x436);

NEW_TEST("NOOP",   0x437);

NEW_TEST("NOT16r",   0x438);

NEW_TEST("NOT32r",   0x439);

NEW_TEST("NOT64r",   0x43a);

NEW_TEST("NOT8r",   0x43b);

NEW_TEST_IGNOREFLAGS("OR16i16", 0x43c, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR16ri", 0x43d, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR16rm", 0x43e, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR16rr", 0x43f, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR32i32", 0x440, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR32mr", 0x441, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR32ri", 0x442, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR32rr", 0x443, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR8i8", 0x444, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR8ri", 0x445, FLAG_AF);

NEW_TEST_IGNOREFLAGS("OR8rr", 0x446, FLAG_AF);

NEW_TEST_IGNOREFLAGS("ORPDrm", 0x447, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("ORPDrr",   0x448);

NEW_TEST_IGNOREFLAGS("ORPSrm", 0x449, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("ORPSrr",   0x44a);

NEW_TEST_IGNOREFLAGS("PADDBrm", 0x44b, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PADDBrr",   0x44c);

NEW_TEST_IGNOREFLAGS("PADDDrm", 0x44d, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PADDDrr",   0x44e);

NEW_TEST_IGNOREFLAGS("PADDQrm", 0x44f, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PADDQrr",   0x450);

NEW_TEST_IGNOREFLAGS("PADDWrm", 0x451, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PADDWrr",   0x452);

NEW_TEST_IGNOREFLAGS("PEXTRWmr", 0x453, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PEXTRWri", 0x454, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PINSRWrmi", 0x455, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PINSRWrri", 0x456, FLAG_SF|FLAG_PF);

NEW_TEST("POP16r",   0x457);

NEW_TEST_IGNOREFLAGS("PORrm", 0x458, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PORrr",   0x459);

NEW_TEST_IGNOREFLAGS("PSHUFDmi", 0x45a, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PSHUFDri", 0x45b, FLAG_SF|FLAG_PF);

NEW_TEST("PSLLDrr",   0x45c);

NEW_TEST("PSLLDrr2",   0x45d);

NEW_TEST("PSLLWrr",   0x45e);

NEW_TEST("PSRADrr",   0x45f);

NEW_TEST("PSRADrr2",   0x460);

NEW_TEST("PSRAWrr",   0x461);

NEW_TEST_IGNOREFLAGS("PSUBBrm", 0x462, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PSUBBrr",   0x463);

NEW_TEST_IGNOREFLAGS("PSUBDrm", 0x464, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PSUBDrr",   0x465);

NEW_TEST_IGNOREFLAGS("PSUBQrm", 0x466, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PSUBQrr",   0x467);

NEW_TEST_IGNOREFLAGS("PSUBWrm", 0x468, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("PSUBWrr",   0x469);

NEW_TEST_IGNOREFLAGS("PUNPCKLBWrm", 0x46a, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PUNPCKLBWrr", 0x46b, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PUNPCKLDQrm", 0x46c, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PUNPCKLDQrr", 0x46d, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PUNPCKLQDQrm", 0x46e, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PUNPCKLQDQrr", 0x46f, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PUNPCKLWDrm", 0x470, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("PUNPCKLWDrr", 0x471, FLAG_SF|FLAG_PF);

NEW_TEST("PUSH16r",   0x472);

NEW_TEST("RCL16r1",   0x473);

NEW_TEST_IGNOREFLAGS("RCL16rCL", 0x474, FLAG_OF);

NEW_TEST_IGNOREFLAGS("RCL16ri", 0x475, FLAG_OF);

NEW_TEST("RCL32r1",   0x476);

NEW_TEST_IGNOREFLAGS("RCL32rCL", 0x477, FLAG_OF);

NEW_TEST_IGNOREFLAGS("RCL32ri", 0x478, FLAG_OF);

NEW_TEST("RCL8r1",   0x479);

NEW_TEST_IGNOREFLAGS("RCL8rCL", 0x47a, FLAG_OF);

NEW_TEST_IGNOREFLAGS("RCL8ri", 0x47b, FLAG_OF);

NEW_TEST("RCR16r1",   0x47c);

NEW_TEST_IGNOREFLAGS("RCR16rCL", 0x47d, FLAG_OF);

NEW_TEST_IGNOREFLAGS("RCR16ri", 0x47e, FLAG_OF);

NEW_TEST("RCR32r1",   0x47f);

NEW_TEST_IGNOREFLAGS("RCR32rCL", 0x480, FLAG_OF);

NEW_TEST_IGNOREFLAGS("RCR32ri", 0x481, FLAG_OF);

NEW_TEST_IGNOREFLAGS("RCR8r1", 0x482, FLAG_OF);

NEW_TEST_IGNOREFLAGS("RCR8rCL", 0x483, FLAG_OF);

NEW_TEST_IGNOREFLAGS("RCR8ri", 0x484, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROL16r1", 0x485, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROL16rCL", 0x486, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROL16ri", 0x487, FLAG_OF);

NEW_TEST("ROL32r1",   0x488);

NEW_TEST_IGNOREFLAGS("ROL32rCL", 0x489, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROL32ri", 0x48a, FLAG_OF);

NEW_TEST("ROL8r1",   0x48b);

NEW_TEST_IGNOREFLAGS("ROL8rCL", 0x48c, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROL8ri", 0x48d, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR16r1", 0x48e, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR16rCL", 0x48f, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR16ri", 0x490, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR32r1", 0x491, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR32rCL", 0x492, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR32ri", 0x493, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR8r1", 0x494, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR8rCL", 0x495, FLAG_OF);

NEW_TEST_IGNOREFLAGS("ROR8ri", 0x496, FLAG_OF);

NEW_TEST("SAHF",   0x497);

NEW_TEST("SBB16i16",   0x498);

NEW_TEST("SBB16ri",   0x499);

NEW_TEST("SBB16rr",   0x49a);

NEW_TEST("SBB32i32",   0x49b);

NEW_TEST("SBB32mr",   0x49c);

NEW_TEST("SBB32ri",   0x49d);

NEW_TEST("SBB32rm",   0x49e);

NEW_TEST("SBB32rr",   0x49f);

NEW_TEST("SBB8i8",   0x4a0);

NEW_TEST("SBB8ri",   0x4a1);

NEW_TEST("SBB8rr",   0x4a2);

NEW_TEST("SETAr",   0x4a3);

NEW_TEST("SETBr",   0x4a4);

NEW_TEST("SETEr",   0x4a5);

NEW_TEST("SETGEr",   0x4a6);

NEW_TEST("SETGr",   0x4a7);

NEW_TEST("SETLEr",   0x4a8);

NEW_TEST("SETLr",   0x4a9);

NEW_TEST_IGNOREFLAGS("SETNEm", 0x4aa, FLAG_AF);

NEW_TEST("SETNEr",   0x4ab);

NEW_TEST("SETSr",   0x4ac);

NEW_TEST_IGNOREFLAGS("SHL16r1", 0x4ad, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHL16rCL", 0x4ae, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHL16ri", 0x4af, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHL32r1", 0x4b0, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHL32rCL", 0x4b1, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHL32ri", 0x4b2, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHL8r1", 0x4b3, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHL8rCL", 0x4b4, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHL8ri", 0x4b5, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHR16r1", 0x4b6, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHR16rCL", 0x4b7, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHR16ri", 0x4b8, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHR32r1", 0x4b9, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHR32rCL", 0x4ba, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHR32ri", 0x4bb, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHR8r1", 0x4bc, FLAG_AF);

NEW_TEST_IGNOREFLAGS("SHR8rCL", 0x4bd, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHR8ri", 0x4be, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("SHRD32rri8", 0x4bf, FLAG_AF|FLAG_OF);

NEW_TEST("STC",   0x4c0);

NEW_TEST("STD",   0x4c1);

NEW_TEST_IGNOREFLAGS("ST_F32m", 0x4c2, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("ST_F64m", 0x4c3, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("ST_Frr", 0x4c4, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("ST_PF32m", 0x4c5, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("ST_PF64m", 0x4c6, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("ST_PF80m", 0x4c7, FLAG_FPU_IE);

NEW_TEST_IGNOREFLAGS("ST_PFr", 0x4c8, FLAG_FPU_IE);

NEW_TEST("SUB16i16",   0x4c9);

NEW_TEST("SUB16mr",   0x4ca);

NEW_TEST("SUB16ri",   0x4cb);

NEW_TEST_IGNOREFLAGS("SUB16rm", 0x4cc, FLAG_OF);

NEW_TEST("SUB32i32",   0x4cd);

NEW_TEST("SUB32ri",   0x4ce);

NEW_TEST("SUB32rr",   0x4cf);

NEW_TEST("SUB8i8",   0x4d0);

NEW_TEST("SUB8mr",   0x4d1);

NEW_TEST("SUB8ri",   0x4d2);

NEW_TEST("SUB8rm",   0x4d3);

NEW_TEST_IGNOREFLAGS("SUBR_F32m", 0x4d4, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST("SUBR_F64m",   0x4d5);

NEW_TEST("SUBR_FST0r",   0x4d6);

NEW_TEST("SUBR_FrST0",   0x4d7);

NEW_TEST("SUBSDrm",   0x4d8);

NEW_TEST("SUBSDrr",   0x4d9);

NEW_TEST("SUBSSrm",   0x4da);

NEW_TEST("SUBSSrr",   0x4db);

NEW_TEST_IGNOREFLAGS("SUB_F32m", 0x4dc, FLAG_FPU_C1|FLAG_FPU_PE);

NEW_TEST_IGNOREFLAGS("SUB_F64m", 0x4dd, FLAG_FPU_PE|FLAG_FPU_C1);

NEW_TEST("SUB_FST0r",   0x4de);

NEW_TEST("SUB_FrST0",   0x4df);

NEW_TEST_IGNOREFLAGS("Sar32RI1", 0x4e0, FLAG_AF|FLAG_OF);

NEW_TEST_IGNOREFLAGS("Sar32RI2", 0x4e1, FLAG_AF|FLAG_OF);

NEW_TEST("Sbb32RR1",   0x4e2);

NEW_TEST("Sbb32RR2",   0x4e3);

NEW_TEST_IGNOREFLAGS("TEST16i16", 0x4e4, FLAG_AF);

NEW_TEST_IGNOREFLAGS("TEST16ri", 0x4e5, FLAG_AF);

NEW_TEST_IGNOREFLAGS("TEST16rr", 0x4e6, FLAG_AF);

NEW_TEST_IGNOREFLAGS("TEST32i32", 0x4e7, FLAG_AF);

NEW_TEST_IGNOREFLAGS("TEST32ri", 0x4e8, FLAG_AF);

NEW_TEST_IGNOREFLAGS("TEST32rr", 0x4e9, FLAG_AF);

NEW_TEST_IGNOREFLAGS("TEST8i8", 0x4ea, FLAG_AF);

NEW_TEST_IGNOREFLAGS("TEST8ri", 0x4eb, FLAG_AF);

NEW_TEST_IGNOREFLAGS("TEST8rr", 0x4ec, FLAG_AF);

NEW_TEST_IGNOREFLAGS("Test32RR1", 0x4ed, FLAG_AF);

NEW_TEST_IGNOREFLAGS("Test32RR2", 0x4ee, FLAG_AF);

NEW_TEST("UCOMISDrm",   0x4ef);

NEW_TEST("UCOMISDrr",   0x4f0);

NEW_TEST("UCOMISSrm",   0x4f1);

NEW_TEST("UCOMISSrr",   0x4f2);

NEW_TEST_IGNOREFLAGS("UNPCKLPSrm", 0x4f3, FLAG_SF|FLAG_PF);

NEW_TEST_IGNOREFLAGS("UNPCKLPSrr", 0x4f4, FLAG_SF|FLAG_PF);

NEW_TEST("XADD16rr",   0x4f5);

NEW_TEST("XADD32rm",   0x4f6);

NEW_TEST("XADD32rr",   0x4f7);

NEW_TEST("XADD8rr",   0x4f8);

NEW_TEST("XCHG16ar",   0x4f9);

NEW_TEST("XCHG16rr",   0x4fa);

NEW_TEST("XCHG32ar",   0x4fb);

NEW_TEST("XCHG32rr",   0x4fc);

NEW_TEST("XCHG8rr",   0x4fd);

NEW_TEST_IGNOREFLAGS("XOR16i16", 0x4fe, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XOR16ri", 0x4ff, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XOR16rr", 0x500, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XOR32i32", 0x501, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XOR32ri", 0x502, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XOR32rr", 0x503, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XOR8i8", 0x504, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XOR8ri", 0x505, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XOR8rr", 0x506, FLAG_AF);

NEW_TEST_IGNOREFLAGS("XORPSrm", 0x507, FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF);

NEW_TEST("XORPSrr",   0x508);
// End Declarations


#undef NEW_TEST
    }

    virtual void TearDown(void) {
        delete this->M;
    }

    Function *getFunctionForBuffer(string nm, uint8_t *buf, size_t len);

    void runFunctionOnState(mcsema::RegState *, Function *);

    void getStatesForTest(mcsema::RegState *, mcsema::RegState *, string);

    Module               *M;
    const MCDisassembler *Dis;
    MCInstPrinter        *InstPrinter;
    testIDToInOutT       testCases;
    testCaseToTestIDT    caseMap;
    testCaseToFlags      flagMap;
#if 0
    uint32_t             stackMem;
    void                 *stackMemPtr;
#endif
};

static void* JITFunctionCreator(const std::string &s) {
#ifdef _WIN32
    HMODULE mod;
    FARPROC proc;

    printf("WARNING: JITted code references library function: %s\n", s.c_str());

    mod = GetModuleHandle("MSVCRT");
    assert(mod != NULL);
    proc = GetProcAddress(mod, s.c_str());
    if (proc == NULL) {
        std::string s2 = s.substr(0, s.size()-1);
        proc = GetProcAddress(mod, s2.c_str());
    }

    if(proc == NULL) {
        printf("%s: Could not find function: %s\n", __FUNCTION__, s.c_str());
    }

    return proc;

#else
    printf("WARNING: JITted code references library function: %s\n", s.c_str());

    void *sym_addr = dlsym(RTLD_DEFAULT, s.c_str());
    char *error = dlerror();
    if(sym_addr == NULL && error != NULL) {
        printf("ERROR: %s\n", error);
        return NULL;
    }

    return sym_addr;

#endif
}

void ModuleTest::getStatesForTest(mcsema::RegState *inState, mcsema::RegState *outState, string testName) {
    int testId = this->caseMap.at(testName);
    InOutT states = this->testCases.at(testId);

#ifdef DEBUG
    printf("Mapping testName[%s] to testId[%d]\n", testName.c_str(), testId);
#endif
    *inState = states.first;
    *outState = states.second;
    return;
}

void ModuleTest::runFunctionOnState(mcsema::RegState *state, Function *F) {
    EngineBuilder builder(this->M);
    ExecutionEngine *EE;

    builder.setEngineKind(EngineKind::JIT);
    builder.setOptLevel(CodeGenOpt::None);
    builder.setUseMCJIT(true);

    TargetOptions to;
    to.UnsafeFPMath = true;
    
    builder.setTargetOptions(to);

    std::string errmsg;
    //printf("pre-jit DUMP:\n");
    //F->dump();

    EE = builder.create();
    EE->runStaticConstructorsDestructors(false);
    EE->DisableSymbolSearching(false);
    EE->InstallLazyFunctionCreator(JITFunctionCreator);

    // Set up the arguments to the function.
    vector<GenericValue> args;
    args.push_back(PTOGV(state));

#ifdef DEBUG
    void *ptr = EE->getPointerToFunction(F);
    F->print(llvm::outs());
    printf("function ptr is: %p\n\n", ptr);

#if 0
#ifdef _WIN32
    __debugbreak();
#else
    asm("int3");
#endif
#endif

#endif


    unsigned int cw = 0;

#ifdef _WIN32
    cw = _control87(0, 0);
    _control87(_PC_64, _MCW_PC);
#endif    

    // Run the function to get the sequences effects.
    EE->runFunction(F, args);

#ifdef _WIN32
    _control87((cw & _MCW_PC), _MCW_PC);
#endif    

    // Clean up by removing the module and deleting the engine.
    EE->removeModule(this->M);
    delete EE;

    // We leave. The effects have been written into the register state
    // structure.
    return;
}

class counting_cfg_visitor : public boost::default_bfs_visitor {
private:
    NativeFunctionPtr    natFun;
    list<NativeBlockPtr> &blocks;
public:
    counting_cfg_visitor(NativeFunctionPtr n, list<NativeBlockPtr> &l) : natFun(n), blocks(l) { }
    
    template < typename Vertex, typename Graph >
    void discover_vertex(Vertex u, const Graph &g) const {
        NativeBlockPtr  curBlock = this->natFun->block_from_id(u);

        this->blocks.push_back(curBlock);
        return;
    }

    list<NativeBlockPtr> get_blocks(void) { return this->blocks; }
};

list<NativeBlockPtr> getBlocksFromFunction(NativeFunctionPtr f) {
    CFG funcGraph = f->get_cfg();
    list<NativeBlockPtr> blocks;
    counting_cfg_visitor c(f, blocks);

    boost::breadth_first_search(funcGraph, 
                                boost::vertex(0, funcGraph), 
                                boost::visitor(c));

    return blocks;
}

Function *ModuleTest::getFunctionForBuffer(string nm, uint8_t *b, size_t l) {
    BufferMemoryObject bmo(b, l);
    list<NativeBlockPtr> blocks;
    BasicBlock *firstBB = NULL;
    BasicBlock *entryBB = NULL;
    bool broken = false;

    NativeFunctionPtr testF =
        funcFromBuff(0, bmo, this->Dis, this->InstPrinter);
    Function *testFn = initTestFunction(nm, this->M);

    entryBB = testFn->begin();
    blocks = getBlocksFromFunction(testF);

    for (list<NativeBlockPtr>::iterator it = blocks.begin();
        it != blocks.end(); ++it)
    {
        NativeBlockPtr curBlock = *it;
        list<InstPtr>  insts = curBlock->get_insts();
        BasicBlock     *curLLVMBlock;

        curLLVMBlock = bbFromStrName(curBlock->get_name(), testFn);

        if (curLLVMBlock == NULL) {
            curLLVMBlock = BasicBlock::Create(testFn->getContext(),
                                              curBlock->get_name(),
                                              testFn);
            assert(curLLVMBlock != NULL);
        }

        if (firstBB == NULL) {
            firstBB = curLLVMBlock;
        }

        list<VA> &follows = curBlock->get_follows();

        for (list<VA>::iterator i = follows.begin(); i != follows.end(); ++i) {
            VA blockBase = *i;

            // Try to look up a block that has this block's name.
            string followName = "block_0x" + to_string<VA>(blockBase, hex);
            
            BasicBlock  *fBB = bbFromStrName(followName, testFn);

            if (fBB == NULL) {
                fBB = BasicBlock::Create(testFn->getContext(),
                                         followName,
                                         testFn);
                assert(fBB != NULL);
            }
        }

        list<InstPtr>::iterator instIt = insts.begin();

        while (instIt != insts.end()) {
            InstTransResult t;
            InstPtr p = *instIt;

            t = disInstr(p, 
                         curLLVMBlock, 
                         curBlock, 
                         testFn, 
                         testF, 
                         NativeModulePtr(),
			 false); 

            if (t == TranslateError || t == TranslateErrorUnsupported) {
                broken = true;
                break;
            }

            ++instIt;
        }

        if (broken) {
            break;
        }
    }

    if (broken) {
        return NULL;
    }

    BranchInst::Create(firstBB, entryBB);

    BasicBlock *endBlock = NULL;

    // Now we have to find the block that does NOT have a terminator.
    for (Function::iterator fit = testFn->begin(); fit != testFn->end(); ++fit ) {
        BasicBlock *b = fit;

        if ( b->getTerminator() == NULL ) {
            endBlock = b;
            break;
        }
    }

    assert(endBlock != NULL);
    finiTestFunction(endBlock);

    return testFn;
}

void regStatesEq(mcsema::RegState *in, mcsema::RegState *out, uint64_t ignoreflags) {
#ifdef __x86_64__
    EXPECT_EQ(out->RAX, in->RAX);
    EXPECT_EQ(out->RBX, in->RBX);
    EXPECT_EQ(out->RCX, in->RCX);
    EXPECT_EQ(out->RDX, in->RDX);
    EXPECT_EQ(out->RDI, in->RDI);
    EXPECT_EQ(out->RSP, in->RSP);
    EXPECT_EQ(out->RBP, in->RBP);
#else
    EXPECT_EQ(out->EAX, in->EAX);
    EXPECT_EQ(out->EBX, in->EBX);
    EXPECT_EQ(out->ECX, in->ECX);
    EXPECT_EQ(out->EDX, in->EDX);
    EXPECT_EQ(out->EDI, in->EDI);
    EXPECT_EQ(out->ESP, in->ESP);
    EXPECT_EQ(out->EBP, in->EBP);
#endif

    //EXPECT_EQ(out->FPU_FOPCODE, in->FPU_FOPCODE);

    if (!(ignoreflags & FLAG_CF)) {
        EXPECT_EQ(out->CF, in->CF);
    }

    if (!(ignoreflags & FLAG_AF)) { 
        EXPECT_EQ(out->AF, in->AF);
    }

    if (!(ignoreflags & FLAG_PF)) {
        EXPECT_EQ(out->PF, in->PF);
    }

    if (!(ignoreflags & FLAG_OF)) {
        EXPECT_EQ(out->OF, in->OF);
    }

    if (!(ignoreflags & FLAG_SF)) {
        EXPECT_EQ(out->SF, in->SF);
    }

    if (!(ignoreflags & FLAG_DF)) {
        EXPECT_EQ(out->DF, in->DF);
    }

    if (!(ignoreflags & FLAG_ZF)) {
        EXPECT_EQ(out->ZF, in->ZF);
    }

#ifdef DEBUG    
    printf("Comparing [%d] : OUT[%s] vs. IN[%s]\n", 0, out->ST_regs.st[0].printMe().c_str(), in->ST_regs.st[0].printMe().c_str());
#endif
    EXPECT_EQ(out->ST_regs.st[0], in->ST_regs.st[0]);
    
#ifdef DEBUG    
    printf("Comparing [%d] : OUT[%s] vs. IN[%s]\n", 1, out->ST_regs.st[1].printMe().c_str(), in->ST_regs.st[1].printMe().c_str());
#endif
    EXPECT_EQ(out->ST_regs.st[1], in->ST_regs.st[1]);

#ifdef DEBUG    
    printf("Comparing [%d] : OUT[%s] vs. IN[%s]\n", 2, out->ST_regs.st[2].printMe().c_str(), in->ST_regs.st[2].printMe().c_str());
#endif
    EXPECT_EQ(out->ST_regs.st[2], in->ST_regs.st[2]);

#ifdef DEBUG    
    printf("Comparing [%d] : OUT[%s] vs. IN[%s]\n", 3, out->ST_regs.st[3].printMe().c_str(), in->ST_regs.st[3].printMe().c_str());
#endif
    EXPECT_EQ(out->ST_regs.st[3], in->ST_regs.st[3]);

#ifdef DEBUG    
    printf("Comparing [%d] : OUT[%s] vs. IN[%s]\n", 4, out->ST_regs.st[4].printMe().c_str(), in->ST_regs.st[4].printMe().c_str());
#endif
    EXPECT_EQ(out->ST_regs.st[4], in->ST_regs.st[4]);

#ifdef DEBUG    
    printf("Comparing [%d] : OUT[%s] vs. IN[%s]\n", 5, out->ST_regs.st[5].printMe().c_str(), in->ST_regs.st[5].printMe().c_str());
#endif
    EXPECT_EQ(out->ST_regs.st[5], in->ST_regs.st[5]);

#ifdef DEBUG    
    printf("Comparing [%d] : OUT[%s] vs. IN[%s]\n", 6, out->ST_regs.st[6].printMe().c_str(), in->ST_regs.st[6].printMe().c_str());
#endif
    EXPECT_EQ(out->ST_regs.st[6], in->ST_regs.st[6]);

#ifdef DEBUG    
    printf("Comparing [%d] : OUT[%s] vs. IN[%s]\n", 7, out->ST_regs.st[7].printMe().c_str(), in->ST_regs.st[7].printMe().c_str());
#endif
    EXPECT_EQ(out->ST_regs.st[7], in->ST_regs.st[7]);
    
#ifdef DEBUG
    printf("XMM%d: OUT[%s] vs IN[%s]\n", 0, out->XMM0.printMe().c_str(), in->XMM0.printMe().c_str());
    printf("XMM%d: OUT[%s] vs IN[%s]\n", 1, out->XMM1.printMe().c_str(), in->XMM1.printMe().c_str());
    printf("XMM%d: OUT[%s] vs IN[%s]\n", 2, out->XMM2.printMe().c_str(), in->XMM2.printMe().c_str());
    printf("XMM%d: OUT[%s] vs IN[%s]\n", 3, out->XMM3.printMe().c_str(), in->XMM3.printMe().c_str());
    printf("XMM%d: OUT[%s] vs IN[%s]\n", 4, out->XMM4.printMe().c_str(), in->XMM4.printMe().c_str());
    printf("XMM%d: OUT[%s] vs IN[%s]\n", 5, out->XMM5.printMe().c_str(), in->XMM5.printMe().c_str());
    printf("XMM%d: OUT[%s] vs IN[%s]\n", 6, out->XMM6.printMe().c_str(), in->XMM6.printMe().c_str());
    printf("XMM%d: OUT[%s] vs IN[%s]\n", 7, out->XMM7.printMe().c_str(), in->XMM7.printMe().c_str());
#endif 

    EXPECT_EQ(out->XMM0, in->XMM0);    
    EXPECT_EQ(out->XMM1, in->XMM1);
    EXPECT_EQ(out->XMM2, in->XMM2);
    EXPECT_EQ(out->XMM3, in->XMM3);
    EXPECT_EQ(out->XMM4, in->XMM4);
    EXPECT_EQ(out->XMM5, in->XMM5);
    EXPECT_EQ(out->XMM6, in->XMM6);
    EXPECT_EQ(out->XMM7, in->XMM7);

    if (!(ignoreflags & FLAG_FPU_BUSY)) {
        EXPECT_EQ(out->FPU_FLAGS.BUSY, in->FPU_FLAGS.BUSY);
    }

    if (!(ignoreflags & FLAG_FPU_C3)) {
        EXPECT_EQ(out->FPU_FLAGS.C3, in->FPU_FLAGS.C3);
    }

    if (!(ignoreflags & FLAG_FPU_TOP)) {
        EXPECT_EQ(out->FPU_FLAGS.TOP, in->FPU_FLAGS.TOP);
    }

    if (!(ignoreflags & FLAG_FPU_C2)) {
        EXPECT_EQ(out->FPU_FLAGS.C2, in->FPU_FLAGS.C2);
    }

    if (!(ignoreflags & FLAG_FPU_C1)) {
        EXPECT_EQ(out->FPU_FLAGS.C1, in->FPU_FLAGS.C1);
    }

    if (!(ignoreflags & FLAG_FPU_C0)) {
        EXPECT_EQ(out->FPU_FLAGS.C0, in->FPU_FLAGS.C0);
    }

    if (!(ignoreflags & FLAG_FPU_ES)) {
        EXPECT_EQ(out->FPU_FLAGS.ES, in->FPU_FLAGS.ES);
    }

    if (!(ignoreflags & FLAG_FPU_SF)) {
        EXPECT_EQ(out->FPU_FLAGS.SF, in->FPU_FLAGS.SF);
    }

    if (!(ignoreflags & FLAG_FPU_PE)) {
        EXPECT_EQ(out->FPU_FLAGS.PE, in->FPU_FLAGS.PE);
    }

    if (!(ignoreflags & FLAG_FPU_UE)) {
        EXPECT_EQ(out->FPU_FLAGS.UE, in->FPU_FLAGS.UE);
    }

    if (!(ignoreflags & FLAG_FPU_OE)) {
        EXPECT_EQ(out->FPU_FLAGS.OE, in->FPU_FLAGS.OE);
    }

    if (!(ignoreflags & FLAG_FPU_ZE)) {
        EXPECT_EQ(out->FPU_FLAGS.ZE, in->FPU_FLAGS.ZE);
    }

    if (!(ignoreflags & FLAG_FPU_DE)) {
        EXPECT_EQ(out->FPU_FLAGS.DE, in->FPU_FLAGS.DE);
    }

    if (!(ignoreflags & FLAG_FPU_IE)) {
        EXPECT_EQ(out->FPU_FLAGS.IE, in->FPU_FLAGS.IE);
    }

    EXPECT_EQ(out->FPU_TAG, in->FPU_TAG);

    return;
}

void* get_low_addr(uint32_t len) {
    void *v = ((void *)0x00001000);
    void *k;

    while (1) {
#ifdef _WIN32
        k = VirtualAlloc(v,
                         len,
                         MEM_RESERVE|MEM_COMMIT,
                         PAGE_READWRITE);
#else
        k = mmap(v,
                 len,
                 PROT_READ|PROT_WRITE,
#ifdef __linux__
                 MAP_ANON|MAP_PRIVATE|MAP_32BIT,
#else
                 MAP_ANON|MAP_PRIVATE,
#endif
                 -1,
                 0);
#endif

#ifdef _WIN32
        if (k != NULL) {
#else
        if (k != MAP_FAILED) {
#endif
            break;
        } else {
            v = (void *)(((ptrdiff_t)v) + len);
        }
    }

#ifndef _WIN32
#ifdef __x86_64__
    assert((((ptrdiff_t)k) >> 32) == 0);
#endif // sizeof(ptrdiff_t)
#endif // _WIN32
    return k;
}

void release_low_addr(void *v, uint32_t len) {
#ifdef _WIN32
    VirtualFree(v, STACK_LEN, MEM_RELEASE);
#else
    munmap(v, STACK_LEN);
#endif
    return;
}

// The new input and output ESP/EBP must differ from each other in the same way
// that they did in the original input.
void fixStatesForStack(mcsema::RegState *inState, mcsema::RegState *outState, void *stack) {
    // Compute deltas for EBP and ESP.
#ifdef __x86_64__
    int64_t espebpDelta =  ((int64_t)inState->RBP) - ((int64_t)inState->RSP);
    int64_t espDelta = ((int64_t)inState->RSP) - ((int64_t)outState->RSP);
    int64_t ebpDelta = ((int64_t)inState->RBP) - ((int64_t)outState->RBP);

    if(espebpDelta > 0){
        inState->RBP = (uint64_t)((ptrdiff_t)stack - 32);
        outState->RBP = (uint64_t)((ptrdiff_t)stack - 32);

        inState->RSP = (uint64_t)((ptrdiff_t)stack - 32) - espebpDelta;
        outState->RSP = (uint64_t)((ptrdiff_t)stack - 32) - espebpDelta;
    } else {
        inState->RSP = (uint64_t)((ptrdiff_t)stack - 32);
        outState->RSP = (uint64_t)((ptrdiff_t)stack - 32);

        inState->RBP = (uint64_t)((ptrdiff_t)stack - 32) + espebpDelta;
        outState->RBP = (uint64_t)((ptrdiff_t)stack - 32) + espebpDelta;
    }


    //inState->RSP = (uint64_t)((ptrdiff_t)stack);
    //outState->RSP = (uint64_t)((ptrdiff_t)stack);

    //inState->RBP = (uint64_t)((ptrdiff_t)stack) + (espebpDelta);
    //outState->RBP = (uint64_t)((ptrdiff_t)stack) + (espebpDelta);

    outState->RSP -= espDelta;
    outState->RBP -= ebpDelta;

#else
    int32_t espDelta = ((int32_t)inState->ESP) - ((int32_t)outState->ESP);
    int32_t ebpDelta = ((int32_t)inState->EBP) - ((int32_t)outState->EBP);

    inState->ESP = (uint32_t)((ptrdiff_t)stack - 32);
    outState->ESP = (uint32_t)((ptrdiff_t)stack - 32);

    inState->EBP = (uint32_t)((ptrdiff_t)stack);
    outState->EBP = (uint32_t)((ptrdiff_t)stack);

    outState->ESP -= espDelta;
    outState->EBP -= ebpDelta;
#endif
    return;
}

// The PIN based tester outputs FPU registers in their native order:
// that is, ST0 = REGISTERS[FPU CW.TOP].
// The state.ST_regs[0] structure does not use a TOP-relative
// representation: that is, ST_regs[0] == REGISTERS[0].
// This function converts the ST_regs representation to a top-relative
// representation for comparison with PIN outputs.

void toTopRelative(mcsema::RegState &state) {
    mcsema::fpuregs tmpregs;

    uint8_t topval = state.FPU_FLAGS.TOP;
#ifdef DEBUG
    printf("pre transform top is: %d\n", topval);
    for (unsigned i = 0; i < STREGS_MAX; i++)
    {
        printf("pre transform regs array [%d] = %s\n", i, state.ST_regs.st[i].printMe().c_str());
    }
#endif

    for (unsigned i = topval; i < STREGS_MAX; i++) {
        tmpregs.st[i - topval] = state.ST_regs.st[i];
    }

    for (unsigned i = 0; i < topval; i++) {
        tmpregs.st[i + STREGS_MAX - topval] = state.ST_regs.st[i];
    }

   memcpy(&state.ST_regs.st[0], &tmpregs.st[0], sizeof(tmpregs.st)); 

#ifdef DEBUG
    printf("post transform top is: %d\n", topval);
    for (unsigned i = 0; i < STREGS_MAX; i++)
    {
        printf("post transform regs array [%d] = %s\n", i, state.ST_regs.st[i].printMe().c_str());
    }
#endif
}

void fromTopRelative(mcsema::RegState &state) {
    mcsema::fpuregs tmpregs;

    uint8_t topval = state.FPU_FLAGS.TOP;
#ifdef DEBUG
    printf("pre transform top is: %d\n", topval);
    for (unsigned i = 0; i < STREGS_MAX; i++)
    {
        printf("pre transform regs array [%d] = %s\n", i, state.ST_regs.st[i].printMe().c_str());
    }
#endif
    
    for (unsigned i = topval; i < STREGS_MAX; i++) {
        tmpregs.st[i] = state.ST_regs.st[i - topval];
    }
    
    for (unsigned i = 0; i < topval; i++) {
        tmpregs.st[i] = state.ST_regs.st[i + STREGS_MAX - topval];
    }

   memcpy(&state.ST_regs.st[0], &tmpregs.st[0], sizeof(tmpregs.st)); 

#ifdef DEBUG
    printf("post transform top is: %d\n", topval);
    for (unsigned i = 0; i < STREGS_MAX; i++)
    {
        printf("post transform regs array [%d] = %s\n", i, state.ST_regs.st[i].printMe().c_str());
    }
#endif
}

#ifdef DEBUG
void printXMM(mcsema::RegState *in)
{
    printf("XMM%d: %s\n", 0, in->XMM0.printMe().c_str());
    printf("XMM%d: %s\n", 1, in->XMM1.printMe().c_str());
    printf("XMM%d: %s\n", 2, in->XMM2.printMe().c_str());
    printf("XMM%d: %s\n", 3, in->XMM3.printMe().c_str());
    printf("XMM%d: %s\n", 4, in->XMM4.printMe().c_str());
    printf("XMM%d: %s\n", 5, in->XMM5.printMe().c_str());
    printf("XMM%d: %s\n", 6, in->XMM6.printMe().c_str());
    printf("XMM%d: %s\n", 7, in->XMM7.printMe().c_str());
}
#endif
#
#define IN_OUT_TEST(testName, bytes) {\
    Function *testFn =\
        this->getFunctionForBuffer(testName, byteArr, sizeof(byteArr));\
    EXPECT_TRUE(testFn != NULL);\
    if (testFn != NULL) {\
        mcsema::RegState inputState;\
        mcsema::RegState outputState;\
        this->getStatesForTest(&inputState, &outputState, testName);\
        void *b = get_low_addr(STACK_LEN);\
        assert(b != NULL);\
        fixStatesForStack(&inputState, &outputState, (void*)((ptrdiff_t)b + (STACK_LEN - 8)));\
        fromTopRelative(inputState);\
        inputState.printMe(testName "_PRE_INPUT");\
        outputState.printMe(testName "_PRE_OUTPUT");\
        this->runFunctionOnState(&inputState, testFn);\
        toTopRelative(inputState);\
        inputState.printMe(testName "_POST_INPUT");\
        outputState.printMe(testName "_POST_OUTPUT");\
        regStatesEq(&inputState, &outputState, this->flagMap[testName]);\
        release_low_addr(b, STACK_LEN);\
    }\
}

#define NO_MEM_TEST(testName, bytes) {\
    Function *testFn =\
        this->getFunctionForBuffer(testName, byteArr, sizeof(byteArr));\
    EXPECT_TRUE(testFn != NULL);\
    if (testFn != NULL) {\
        mcsema::RegState inputState;\
        mcsema::RegState outputState;\
        this->getStatesForTest(&inputState, &outputState, testName);\
        fromTopRelative(inputState);\
        this->runFunctionOnState(&inputState, testFn);\
        toTopRelative(inputState);\
        regStatesEq(&inputState, &outputState, this->flagMap[testName]);\
    }\
}


// Begin Definitions

TEST_F(ModuleTest, ADC16i16) {
    uint8_t byteArr[] = { 0x66, 0x15, 0xee, 0xe };
    IN_OUT_TEST("ADC16i16", byteArr);
}

TEST_F(ModuleTest, ADC16ri) {
    uint8_t byteArr[] = { 0x66, 0x15, 0x34, 0x12 };
    IN_OUT_TEST("ADC16ri", byteArr);
}

TEST_F(ModuleTest, ADC16rr) {
    uint8_t byteArr[] = { 0x66, 0x11, 0xd1 };
    IN_OUT_TEST("ADC16rr", byteArr);
}

TEST_F(ModuleTest, ADC32i32) {
    uint8_t byteArr[] = { 0x15, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("ADC32i32", byteArr);
}

TEST_F(ModuleTest, ADC32ri) {
    uint8_t byteArr[] = { 0x81, 0xd3, 0x44, 0x44, 0x4, 0x0 };
    IN_OUT_TEST("ADC32ri", byteArr);
}

TEST_F(ModuleTest, ADC32rr) {
    uint8_t byteArr[] = { 0x11, 0xd0 };
    IN_OUT_TEST("ADC32rr", byteArr);
}

TEST_F(ModuleTest, ADC64i32) {
    uint8_t byteArr[] = { 0x48, 0x15, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("ADC64i32", byteArr);
}

TEST_F(ModuleTest, ADC64ri32) {
    uint8_t byteArr[] = { 0x48, 0x81, 0xd3, 0x44, 0x44, 0x4, 0x0 };
    IN_OUT_TEST("ADC64ri32", byteArr);
}

TEST_F(ModuleTest, ADC64rr) {
    uint8_t byteArr[] = { 0x48, 0x11, 0xd0 };
    IN_OUT_TEST("ADC64rr", byteArr);
}

TEST_F(ModuleTest, ADC8i8) {
    uint8_t byteArr[] = { 0x14, 0x5 };
    IN_OUT_TEST("ADC8i8", byteArr);
}

TEST_F(ModuleTest, ADC8ri) {
    uint8_t byteArr[] = { 0x80, 0xd4, 0x3 };
    IN_OUT_TEST("ADC8ri", byteArr);
}

TEST_F(ModuleTest, ADC8rr) {
    uint8_t byteArr[] = { 0x10, 0xf5 };
    IN_OUT_TEST("ADC8rr", byteArr);
}

TEST_F(ModuleTest, ADD16i16) {
    uint8_t byteArr[] = { 0x66, 0x5, 0xee, 0xee };
    IN_OUT_TEST("ADD16i16", byteArr);
}

TEST_F(ModuleTest, ADD16ri) {
    uint8_t byteArr[] = { 0x66, 0x81, 0xc3, 0x44, 0x4 };
    IN_OUT_TEST("ADD16ri", byteArr);
}

TEST_F(ModuleTest, ADD16rm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xf0, 0xc7, 0x0, 0x0, 0x10, 0x0, 0x0, 0x66, 0xbb, 0x2, 0x0, 0x66, 0x3, 0x18, 0x8b, 0x0 };
    IN_OUT_TEST("ADD16rm", byteArr);
}

TEST_F(ModuleTest, ADD16rr) {
    uint8_t byteArr[] = { 0x66, 0x1, 0xd1 };
    IN_OUT_TEST("ADD16rr", byteArr);
}

TEST_F(ModuleTest, ADD32i32) {
    uint8_t byteArr[] = { 0x5, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("ADD32i32", byteArr);
}

TEST_F(ModuleTest, ADD32ri) {
    uint8_t byteArr[] = { 0x5, 0x11, 0x11, 0x1, 0x0 };
    IN_OUT_TEST("ADD32ri", byteArr);
}

TEST_F(ModuleTest, ADD32rr) {
    uint8_t byteArr[] = { 0x1, 0xd1 };
    IN_OUT_TEST("ADD32rr", byteArr);
}

TEST_F(ModuleTest, ADD64i32) {
    uint8_t byteArr[] = { 0x48, 0x5, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("ADD64i32", byteArr);
}

TEST_F(ModuleTest, ADD64ri32) {
    uint8_t byteArr[] = { 0x48, 0x5, 0x11, 0x11, 0x7f, 0x0 };
    IN_OUT_TEST("ADD64ri32", byteArr);
}

TEST_F(ModuleTest, ADD64ri8) {
    uint8_t byteArr[] = { 0x48, 0x83, 0xc0, 0x7 };
    IN_OUT_TEST("ADD64ri8", byteArr);
}

TEST_F(ModuleTest, ADD64rr) {
    uint8_t byteArr[] = { 0x48, 0x1, 0xd1 };
    IN_OUT_TEST("ADD64rr", byteArr);
}

TEST_F(ModuleTest, ADD64rr_DB) {
    uint8_t byteArr[] = { 0x48, 0x1, 0xd1 };
    IN_OUT_TEST("ADD64rr_DB", byteArr);
}

TEST_F(ModuleTest, ADD8i8) {
    uint8_t byteArr[] = { 0x4, 0x5 };
    IN_OUT_TEST("ADD8i8", byteArr);
}

TEST_F(ModuleTest, ADD8ri) {
    uint8_t byteArr[] = { 0x80, 0xc4, 0x3 };
    IN_OUT_TEST("ADD8ri", byteArr);
}

TEST_F(ModuleTest, ADD8rr) {
    uint8_t byteArr[] = { 0x0, 0xf5 };
    IN_OUT_TEST("ADD8rr", byteArr);
}

TEST_F(ModuleTest, ADDSDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x4, 0x40, 0xf2, 0xf, 0x58, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("ADDSDrm", byteArr);
}

TEST_F(ModuleTest, ADDSDrr) {
    uint8_t byteArr[] = { 0xf2, 0xf, 0x58, 0xc1 };
    IN_OUT_TEST("ADDSDrr", byteArr);
}

TEST_F(ModuleTest, ADDSSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0xc7, 0x1, 0x0, 0x0, 0xc0, 0x3f, 0xf3, 0xf, 0x58, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("ADDSSrm", byteArr);
}

TEST_F(ModuleTest, ADDSSrr) {
    uint8_t byteArr[] = { 0xf3, 0xf, 0x58, 0xc1 };
    IN_OUT_TEST("ADDSSrr", byteArr);
}

TEST_F(ModuleTest, ADD_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x48, 0xc7, 0x7, 0xdb, 0xf, 0x49, 0x40, 0xdc, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ADD_F32m", byteArr);
}

TEST_F(ModuleTest, ADD_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x18, 0x2d, 0x44, 0x54, 0xc7, 0x47, 0x4, 0xfb, 0x21, 0x9, 0x40, 0xdc, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ADD_F64m", byteArr);
}

TEST_F(ModuleTest, AND16i16) {
    uint8_t byteArr[] = { 0x66, 0x25, 0xee, 0xee };
    IN_OUT_TEST("AND16i16", byteArr);
}

TEST_F(ModuleTest, AND16mi) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xfc, 0xc7, 0x0, 0x44, 0x0, 0x0, 0x0, 0x66, 0x83, 0x20, 0x44, 0xb8, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("AND16mi", byteArr);
}

TEST_F(ModuleTest, AND16mr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xfc, 0xc7, 0x0, 0x55, 0x55, 0x0, 0x0, 0xbb, 0x77, 0x77, 0x0, 0x0, 0x66, 0x21, 0x18, 0xb8, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("AND16mr", byteArr);
}

TEST_F(ModuleTest, AND16ri) {
    uint8_t byteArr[] = { 0x66, 0x81, 0xe3, 0x44, 0x4 };
    IN_OUT_TEST("AND16ri", byteArr);
}

TEST_F(ModuleTest, AND16rr) {
    uint8_t byteArr[] = { 0x66, 0x21, 0xd1 };
    IN_OUT_TEST("AND16rr", byteArr);
}

TEST_F(ModuleTest, AND32i32) {
    uint8_t byteArr[] = { 0x25, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("AND32i32", byteArr);
}

TEST_F(ModuleTest, AND32mr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xfc, 0xc7, 0x0, 0x55, 0x55, 0x5, 0x0, 0xbb, 0x77, 0x77, 0x7, 0x0, 0x21, 0x18, 0xb8, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("AND32mr", byteArr);
}

TEST_F(ModuleTest, AND32ri) {
    uint8_t byteArr[] = { 0x81, 0xe3, 0x44, 0x44, 0x4, 0x0 };
    IN_OUT_TEST("AND32ri", byteArr);
}

TEST_F(ModuleTest, AND32rr) {
    uint8_t byteArr[] = { 0x21, 0xd1 };
    IN_OUT_TEST("AND32rr", byteArr);
}

TEST_F(ModuleTest, AND8i8) {
    uint8_t byteArr[] = { 0x24, 0x5 };
    IN_OUT_TEST("AND8i8", byteArr);
}

TEST_F(ModuleTest, AND8mi) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x5c, 0x24, 0xfc, 0xc7, 0x3, 0x55, 0x0, 0x0, 0x0, 0x80, 0x23, 0x44, 0xbb, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("AND8mi", byteArr);
}

TEST_F(ModuleTest, AND8mr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xfc, 0xc7, 0x0, 0x55, 0x0, 0x0, 0x0, 0xbb, 0x77, 0x0, 0x0, 0x0, 0x20, 0x18, 0xb8, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("AND8mr", byteArr);
}

TEST_F(ModuleTest, AND8ri) {
    uint8_t byteArr[] = { 0x80, 0xe4, 0x3 };
    IN_OUT_TEST("AND8ri", byteArr);
}

TEST_F(ModuleTest, AND8rr) {
    uint8_t byteArr[] = { 0x20, 0xf5 };
    IN_OUT_TEST("AND8rr", byteArr);
}

TEST_F(ModuleTest, BSR16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xbd, 0xd8 };
    IN_OUT_TEST("BSR16rr", byteArr);
}

TEST_F(ModuleTest, BSR32rr) {
    uint8_t byteArr[] = { 0xf, 0xbd, 0xd8 };
    IN_OUT_TEST("BSR32rr", byteArr);
}

TEST_F(ModuleTest, BSR32rr_2) {
    uint8_t byteArr[] = { 0xf, 0xbd, 0xd8 };
    IN_OUT_TEST("BSR32rr_2", byteArr);
}

TEST_F(ModuleTest, BSWAP32r) {
    uint8_t byteArr[] = { 0xf, 0xc8 };
    IN_OUT_TEST("BSWAP32r", byteArr);
}

TEST_F(ModuleTest, BT16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xa3, 0xd8 };
    IN_OUT_TEST("BT16rr", byteArr);
}

TEST_F(ModuleTest, BT32rr) {
    uint8_t byteArr[] = { 0xf, 0xa3, 0xd8 };
    IN_OUT_TEST("BT32rr", byteArr);
}

TEST_F(ModuleTest, CDQ) {
    uint8_t byteArr[] = { 0x99 };
    IN_OUT_TEST("CDQ", byteArr);
}

TEST_F(ModuleTest, CLC) {
    uint8_t byteArr[] = { 0xf8 };
    IN_OUT_TEST("CLC", byteArr);
}

TEST_F(ModuleTest, CLD) {
    uint8_t byteArr[] = { 0xfc };
    IN_OUT_TEST("CLD", byteArr);
}

TEST_F(ModuleTest, CMOVA16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x47, 0xc2 };
    IN_OUT_TEST("CMOVA16rr", byteArr);
}

TEST_F(ModuleTest, CMOVA32rm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xc7, 0x7, 0x3, 0x0, 0x0, 0x0, 0xf, 0x47, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("CMOVA32rm", byteArr);
}

TEST_F(ModuleTest, CMOVA32rr) {
    uint8_t byteArr[] = { 0xf, 0x47, 0xc1 };
    IN_OUT_TEST("CMOVA32rr", byteArr);
}

TEST_F(ModuleTest, CMOVAE16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x43, 0xc3 };
    IN_OUT_TEST("CMOVAE16rr", byteArr);
}

TEST_F(ModuleTest, CMOVAE32rr) {
    uint8_t byteArr[] = { 0xf, 0x43, 0xca };
    IN_OUT_TEST("CMOVAE32rr", byteArr);
}

TEST_F(ModuleTest, CMOVB16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x42, 0xc3 };
    IN_OUT_TEST("CMOVB16rr", byteArr);
}

TEST_F(ModuleTest, CMOVB32rr) {
    uint8_t byteArr[] = { 0xf, 0x42, 0xca };
    IN_OUT_TEST("CMOVB32rr", byteArr);
}

TEST_F(ModuleTest, CMOVBE16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x46, 0xc3 };
    IN_OUT_TEST("CMOVBE16rr", byteArr);
}

TEST_F(ModuleTest, CMOVBE32rr) {
    uint8_t byteArr[] = { 0xf, 0x46, 0xca };
    IN_OUT_TEST("CMOVBE32rr", byteArr);
}

TEST_F(ModuleTest, CMOVE16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x44, 0xc3 };
    IN_OUT_TEST("CMOVE16rr", byteArr);
}

TEST_F(ModuleTest, CMOVE32rr) {
    uint8_t byteArr[] = { 0xf, 0x44, 0xca };
    IN_OUT_TEST("CMOVE32rr", byteArr);
}

TEST_F(ModuleTest, CMOVG16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x4f, 0xc3 };
    IN_OUT_TEST("CMOVG16rr", byteArr);
}

TEST_F(ModuleTest, CMOVG32rr) {
    uint8_t byteArr[] = { 0xf, 0x4f, 0xca };
    IN_OUT_TEST("CMOVG32rr", byteArr);
}

TEST_F(ModuleTest, CMOVGE16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x4d, 0xc3 };
    IN_OUT_TEST("CMOVGE16rr", byteArr);
}

TEST_F(ModuleTest, CMOVGE32rr) {
    uint8_t byteArr[] = { 0xf, 0x4d, 0xca };
    IN_OUT_TEST("CMOVGE32rr", byteArr);
}

TEST_F(ModuleTest, CMOVL16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x4c, 0xc3 };
    IN_OUT_TEST("CMOVL16rr", byteArr);
}

TEST_F(ModuleTest, CMOVL32rr) {
    uint8_t byteArr[] = { 0xf, 0x4c, 0xca };
    IN_OUT_TEST("CMOVL32rr", byteArr);
}

TEST_F(ModuleTest, CMOVLE16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x4e, 0xc3 };
    IN_OUT_TEST("CMOVLE16rr", byteArr);
}

TEST_F(ModuleTest, CMOVLE32rr) {
    uint8_t byteArr[] = { 0xf, 0x4e, 0xca };
    IN_OUT_TEST("CMOVLE32rr", byteArr);
}

TEST_F(ModuleTest, CMOVNE16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x45, 0xc3 };
    IN_OUT_TEST("CMOVNE16rr", byteArr);
}

TEST_F(ModuleTest, CMOVNE32rr) {
    uint8_t byteArr[] = { 0xf, 0x45, 0xca };
    IN_OUT_TEST("CMOVNE32rr", byteArr);
}

TEST_F(ModuleTest, CMOVNO16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x41, 0xc3 };
    IN_OUT_TEST("CMOVNO16rr", byteArr);
}

TEST_F(ModuleTest, CMOVNO32rr) {
    uint8_t byteArr[] = { 0xf, 0x41, 0xca };
    IN_OUT_TEST("CMOVNO32rr", byteArr);
}

TEST_F(ModuleTest, CMOVNP16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x4b, 0xc3 };
    IN_OUT_TEST("CMOVNP16rr", byteArr);
}

TEST_F(ModuleTest, CMOVNP32rr) {
    uint8_t byteArr[] = { 0xf, 0x4b, 0xca };
    IN_OUT_TEST("CMOVNP32rr", byteArr);
}

TEST_F(ModuleTest, CMOVNS16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x49, 0xc3 };
    IN_OUT_TEST("CMOVNS16rr", byteArr);
}

TEST_F(ModuleTest, CMOVNS32rr) {
    uint8_t byteArr[] = { 0xf, 0x49, 0xca };
    IN_OUT_TEST("CMOVNS32rr", byteArr);
}

TEST_F(ModuleTest, CMOVO16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x40, 0xc3 };
    IN_OUT_TEST("CMOVO16rr", byteArr);
}

TEST_F(ModuleTest, CMOVO32rr) {
    uint8_t byteArr[] = { 0xf, 0x40, 0xca };
    IN_OUT_TEST("CMOVO32rr", byteArr);
}

TEST_F(ModuleTest, CMOVP16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x4a, 0xc3 };
    IN_OUT_TEST("CMOVP16rr", byteArr);
}

TEST_F(ModuleTest, CMOVP32rr) {
    uint8_t byteArr[] = { 0xf, 0x4a, 0xca };
    IN_OUT_TEST("CMOVP32rr", byteArr);
}

TEST_F(ModuleTest, CMOVS16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x48, 0xc3 };
    IN_OUT_TEST("CMOVS16rr", byteArr);
}

TEST_F(ModuleTest, CMOVS32rr) {
    uint8_t byteArr[] = { 0xf, 0x48, 0xca };
    IN_OUT_TEST("CMOVS32rr", byteArr);
}

TEST_F(ModuleTest, CMP16mi) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xfc, 0xc7, 0x0, 0x0, 0x2, 0x0, 0x0, 0x66, 0x81, 0x38, 0x22, 0x2, 0xb8, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("CMP16mi", byteArr);
}

TEST_F(ModuleTest, CMP16rr) {
    uint8_t byteArr[] = { 0x66, 0x39, 0xd1 };
    IN_OUT_TEST("CMP16rr", byteArr);
}

TEST_F(ModuleTest, CMP32i32) {
    uint8_t byteArr[] = { 0x3d, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("CMP32i32", byteArr);
}

TEST_F(ModuleTest, CMP32ri) {
    uint8_t byteArr[] = { 0x81, 0xfb, 0x44, 0x44, 0x4, 0x0 };
    IN_OUT_TEST("CMP32ri", byteArr);
}

TEST_F(ModuleTest, CMP32rr) {
    uint8_t byteArr[] = { 0x39, 0xd1 };
    IN_OUT_TEST("CMP32rr", byteArr);
}

TEST_F(ModuleTest, CMP8rr) {
    uint8_t byteArr[] = { 0x38, 0xf5 };
    IN_OUT_TEST("CMP8rr", byteArr);
}

TEST_F(ModuleTest, CMPXCHG16r) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xb1, 0xeb };
    IN_OUT_TEST("CMPXCHG16r", byteArr);
}

TEST_F(ModuleTest, CMPXCHG32rm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf0, 0xc7, 0x7, 0x21, 0x43, 0xcd, 0xab, 0xb8, 0x21, 0x43, 0xcd, 0xab, 0xf, 0xb1, 0xf, 0x8b, 0x17, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("CMPXCHG32rm", byteArr);
}

TEST_F(ModuleTest, CMPXCHG32rr) {
    uint8_t byteArr[] = { 0xf, 0xb1, 0xca };
    IN_OUT_TEST("CMPXCHG32rr", byteArr);
}

TEST_F(ModuleTest, CMPXCHG8rr) {
    uint8_t byteArr[] = { 0xf, 0xb0, 0xef };
    IN_OUT_TEST("CMPXCHG8rr", byteArr);
}

TEST_F(ModuleTest, CVTPS2PDrm) {
    uint8_t byteArr[] = { 0xf, 0x5a, 0xc0 };
    IN_OUT_TEST("CVTPS2PDrm", byteArr);
}

TEST_F(ModuleTest, CVTPS2PDrr) {
    uint8_t byteArr[] = { 0xf, 0x5a, 0xc0 };
    IN_OUT_TEST("CVTPS2PDrr", byteArr);
}

TEST_F(ModuleTest, CVTSD2SSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xf2, 0xf, 0x11, 0x1, 0xf2, 0xf, 0x5a, 0x9, 0xb8, 0x0, 0x0, 0x0, 0x0, 0xb9, 0x2, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("CVTSD2SSrm", byteArr);
}

TEST_F(ModuleTest, CVTSD2SSrr) {
    uint8_t byteArr[] = { 0xf2, 0xf, 0x5a, 0xc8 };
    IN_OUT_TEST("CVTSD2SSrr", byteArr);
}

TEST_F(ModuleTest, CVTSI2SDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0x89, 0x1, 0xf2, 0xf, 0x2a, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("CVTSI2SDrm", byteArr);
}

TEST_F(ModuleTest, CVTSI2SDrr) {
    uint8_t byteArr[] = { 0xf2, 0xf, 0x2a, 0xc1 };
    IN_OUT_TEST("CVTSI2SDrr", byteArr);
}

TEST_F(ModuleTest, CVTSI2SSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0x89, 0x1, 0xf3, 0xf, 0x2a, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("CVTSI2SSrm", byteArr);
}

TEST_F(ModuleTest, CVTSI2SSrr) {
    uint8_t byteArr[] = { 0xf3, 0xf, 0x2a, 0xc1 };
    IN_OUT_TEST("CVTSI2SSrr", byteArr);
}

TEST_F(ModuleTest, CVTSS2SDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0xc7, 0x1, 0x0, 0x0, 0xc0, 0x3f, 0xf3, 0xf, 0x5a, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("CVTSS2SDrm", byteArr);
}

TEST_F(ModuleTest, CVTSS2SDrr) {
    uint8_t byteArr[] = { 0xf3, 0xf, 0x5a, 0xc8 };
    IN_OUT_TEST("CVTSS2SDrr", byteArr);
}

TEST_F(ModuleTest, CVTTSD2SIrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xf2, 0xf, 0x11, 0x1, 0xf2, 0xf, 0x2c, 0x9 };
    IN_OUT_TEST("CVTTSD2SIrm", byteArr);
}

TEST_F(ModuleTest, CVTTSD2SIrr) {
    uint8_t byteArr[] = { 0xf2, 0xf, 0x2c, 0xc8 };
    IN_OUT_TEST("CVTTSD2SIrr", byteArr);
}

TEST_F(ModuleTest, CVTTSS2SIrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xf3, 0xf, 0x11, 0x1, 0xf3, 0xf, 0x2c, 0x9 };
    IN_OUT_TEST("CVTTSS2SIrm", byteArr);
}

TEST_F(ModuleTest, CVTTSS2SIrr) {
    uint8_t byteArr[] = { 0xf3, 0xf, 0x2c, 0xc8 };
    IN_OUT_TEST("CVTTSS2SIrr", byteArr);
}

TEST_F(ModuleTest, Cmp32RR1) {
    uint8_t byteArr[] = { 0x39, 0xd8 };
    IN_OUT_TEST("Cmp32RR1", byteArr);
}

TEST_F(ModuleTest, Cmp32RR2) {
    uint8_t byteArr[] = { 0x39, 0xd8 };
    IN_OUT_TEST("Cmp32RR2", byteArr);
}

TEST_F(ModuleTest, Cmpxch16RR) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xb1, 0xca };
    IN_OUT_TEST("Cmpxch16RR", byteArr);
}

TEST_F(ModuleTest, Composite1) {
    uint8_t byteArr[] = { 0x89, 0xc1, 0x31, 0xc0, 0x31, 0xdb, 0x39, 0xcb };
    IN_OUT_TEST("Composite1", byteArr);
}

TEST_F(ModuleTest, Composite2) {
    uint8_t byteArr[] = { 0x39, 0xcb, 0x74, 0x6, 0xff, 0xc3, 0x1, 0xc0, 0xeb, 0xf6, 0xff, 0xc0 };
    IN_OUT_TEST("Composite2", byteArr);
}

TEST_F(ModuleTest, DEC16r) {
    uint8_t byteArr[] = { 0x66, 0xff, 0xca };
    IN_OUT_TEST("DEC16r", byteArr);
}

TEST_F(ModuleTest, DEC32r) {
    uint8_t byteArr[] = { 0xff, 0xc8 };
    IN_OUT_TEST("DEC32r", byteArr);
}

TEST_F(ModuleTest, DEC64r) {
    uint8_t byteArr[] = { 0x48, 0xff, 0xc8 };
    IN_OUT_TEST("DEC64r", byteArr);
}

TEST_F(ModuleTest, DEC8r) {
    uint8_t byteArr[] = { 0xfe, 0xc9 };
    IN_OUT_TEST("DEC8r", byteArr);
}

TEST_F(ModuleTest, DIV64r) {
    uint8_t byteArr[] = { 0xba, 0x0, 0x0, 0x0, 0x0, 0xb8, 0x0, 0x1, 0x0, 0x0, 0xbb, 0xa, 0x0, 0x0, 0x0, 0x48, 0xf7, 0xf3 };
    IN_OUT_TEST("DIV64r", byteArr);
}

TEST_F(ModuleTest, DIVSDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x4, 0x40, 0xf2, 0xf, 0x5e, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("DIVSDrm", byteArr);
}

TEST_F(ModuleTest, DIVSDrr) {
    uint8_t byteArr[] = { 0xf2, 0xf, 0x5e, 0xc1 };
    IN_OUT_TEST("DIVSDrr", byteArr);
}

TEST_F(ModuleTest, DIVSSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0xc7, 0x1, 0x0, 0x0, 0xc0, 0x3f, 0xf3, 0xf, 0x5e, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("DIVSSrm", byteArr);
}

TEST_F(ModuleTest, DIVSSrr) {
    uint8_t byteArr[] = { 0xf3, 0xf, 0x5e, 0xc1 };
    IN_OUT_TEST("DIVSSrr", byteArr);
}

TEST_F(ModuleTest, DIV_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xd9, 0x1f, 0xd8, 0x37, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("DIV_F32m", byteArr);
}

TEST_F(ModuleTest, DIV_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xdd, 0x1f, 0xdc, 0x37, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("DIV_F64m", byteArr);
}

TEST_F(ModuleTest, DIV_PFrST0) {
    uint8_t byteArr[] = { 0xde, 0xfa, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("DIV_PFrST0", byteArr);
}

TEST_F(ModuleTest, DIV_ST0Fr) {
    uint8_t byteArr[] = { 0xd8, 0xf1, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("DIV_ST0Fr", byteArr);
}

TEST_F(ModuleTest, ENTER) {
    uint8_t byteArr[] = { 0xc8, 0x8, 0x0, 0x0, 0x48, 0x39, 0xdd, 0xbd, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ENTER", byteArr);
}

TEST_F(ModuleTest, FABS) {
    uint8_t byteArr[] = { 0xd9, 0xe1, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FABS", byteArr);
}

TEST_F(ModuleTest, FADDP) {
    uint8_t byteArr[] = { 0xde, 0xc1, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FADDP", byteArr);
}

TEST_F(ModuleTest, FADDP_rST0) {
    uint8_t byteArr[] = { 0xde, 0xc2 };
    IN_OUT_TEST("FADDP_rST0", byteArr);
}

TEST_F(ModuleTest, FBLD) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf0, 0xc7, 0x7, 0x78, 0x56, 0x34, 0x12, 0xc7, 0x47, 0x4, 0x78, 0x56, 0x34, 0x12, 0xc7, 0x47, 0x8, 0x34, 0x12, 0x0, 0x0, 0xdf, 0x27, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FBLD", byteArr);
}

TEST_F(ModuleTest, FBSTP) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf0, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x47, 0x4, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x47, 0x8, 0x0, 0x0, 0x0, 0x0, 0xdf, 0x37, 0x8b, 0x7, 0x8b, 0x5f, 0x4, 0x8b, 0x4f, 0x8, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FBSTP", byteArr);
}

TEST_F(ModuleTest, FCHS) {
    uint8_t byteArr[] = { 0xd9, 0xe0 };
    IN_OUT_TEST("FCHS", byteArr);
}

TEST_F(ModuleTest, FCLEX) {
    uint8_t byteArr[] = { 0x9b, 0xdb, 0xe2 };
    IN_OUT_TEST("FCLEX", byteArr);
}

TEST_F(ModuleTest, FCMOVB) {
    uint8_t byteArr[] = { 0xda, 0xc1 };
    IN_OUT_TEST("FCMOVB", byteArr);
}

TEST_F(ModuleTest, FCMOVBE) {
    uint8_t byteArr[] = { 0xda, 0xd1 };
    IN_OUT_TEST("FCMOVBE", byteArr);
}

TEST_F(ModuleTest, FCMOVE) {
    uint8_t byteArr[] = { 0xda, 0xc9 };
    IN_OUT_TEST("FCMOVE", byteArr);
}

TEST_F(ModuleTest, FCMOVNB) {
    uint8_t byteArr[] = { 0xdb, 0xc1 };
    IN_OUT_TEST("FCMOVNB", byteArr);
}

TEST_F(ModuleTest, FCMOVNBE) {
    uint8_t byteArr[] = { 0xdb, 0xd1 };
    IN_OUT_TEST("FCMOVNBE", byteArr);
}

TEST_F(ModuleTest, FCMOVNE) {
    uint8_t byteArr[] = { 0xdb, 0xc9 };
    IN_OUT_TEST("FCMOVNE", byteArr);
}

TEST_F(ModuleTest, FCMOVNU) {
    uint8_t byteArr[] = { 0xdb, 0xd9 };
    IN_OUT_TEST("FCMOVNU", byteArr);
}

TEST_F(ModuleTest, FCMOVU) {
    uint8_t byteArr[] = { 0xda, 0xd9 };
    IN_OUT_TEST("FCMOVU", byteArr);
}

TEST_F(ModuleTest, FCOM) {
    uint8_t byteArr[] = { 0xd8, 0xd1, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOM", byteArr);
}

TEST_F(ModuleTest, FCOMIP_STFr) {
    uint8_t byteArr[] = { 0xdf, 0xf1 };
    IN_OUT_TEST("FCOMIP_STFr", byteArr);
}

TEST_F(ModuleTest, FCOMI_STFr) {
    uint8_t byteArr[] = { 0xdb, 0xf1 };
    IN_OUT_TEST("FCOMI_STFr", byteArr);
}

TEST_F(ModuleTest, FCOMP) {
    uint8_t byteArr[] = { 0xd8, 0xd9, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOMP", byteArr);
}

TEST_F(ModuleTest, FCOMPP) {
    uint8_t byteArr[] = { 0xde, 0xd9, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOMPP", byteArr);
}

TEST_F(ModuleTest, FCOMP_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xd9, 0x17, 0xd8, 0x1f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOMP_F32m", byteArr);
}

TEST_F(ModuleTest, FCOMP_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdd, 0x17, 0xdc, 0x1f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOMP_F64m", byteArr);
}

TEST_F(ModuleTest, FCOMP_STFr) {
    uint8_t byteArr[] = { 0xd8, 0xda, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOMP_STFr", byteArr);
}

TEST_F(ModuleTest, FCOM_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xd9, 0x17, 0xd8, 0x17, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOM_F32m", byteArr);
}

TEST_F(ModuleTest, FCOM_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdd, 0x17, 0xdc, 0x17, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOM_F64m", byteArr);
}

TEST_F(ModuleTest, FCOM_STFr) {
    uint8_t byteArr[] = { 0xd8, 0xd2, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FCOM_STFr", byteArr);
}

TEST_F(ModuleTest, FDECSTP) {
    uint8_t byteArr[] = { 0xd9, 0xf6 };
    IN_OUT_TEST("FDECSTP", byteArr);
}

TEST_F(ModuleTest, FDIVP) {
    uint8_t byteArr[] = { 0xde, 0xf9, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FDIVP", byteArr);
}

TEST_F(ModuleTest, FDIVRP) {
    uint8_t byteArr[] = { 0xde, 0xf1, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FDIVRP", byteArr);
}

TEST_F(ModuleTest, FDIVR_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xd9, 0x1f, 0xd8, 0x3f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FDIVR_F32m", byteArr);
}

TEST_F(ModuleTest, FDIVR_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xdd, 0x1f, 0xdc, 0x3f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FDIVR_F64m", byteArr);
}

TEST_F(ModuleTest, FDIVR_FrST0) {
    uint8_t byteArr[] = { 0xdc, 0xf2, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FDIVR_FrST0", byteArr);
}

TEST_F(ModuleTest, FDIVR_PFrST0) {
    uint8_t byteArr[] = { 0xde, 0xf2, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FDIVR_PFrST0", byteArr);
}

TEST_F(ModuleTest, FDIVR_ST0Fr) {
    uint8_t byteArr[] = { 0xd8, 0xfa, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FDIVR_ST0Fr", byteArr);
}

TEST_F(ModuleTest, FFREE) {
    uint8_t byteArr[] = { 0xdd, 0xc0 };
    IN_OUT_TEST("FFREE", byteArr);
}

TEST_F(ModuleTest, FIADDm16) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xde, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIADDm16", byteArr);
}

TEST_F(ModuleTest, FIADDm32) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x0, 0x0, 0x1, 0x0, 0xda, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIADDm32", byteArr);
}

TEST_F(ModuleTest, FICOMP_16m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xde, 0x1f };
    IN_OUT_TEST("FICOMP_16m", byteArr);
}

TEST_F(ModuleTest, FICOMP_32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x1, 0x0, 0x0, 0x0, 0xda, 0x1f };
    IN_OUT_TEST("FICOMP_32m", byteArr);
}

TEST_F(ModuleTest, FICOM_16m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xde, 0x17 };
    IN_OUT_TEST("FICOM_16m", byteArr);
}

TEST_F(ModuleTest, FICOM_32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x1, 0x0, 0x0, 0x0, 0xda, 0x17 };
    IN_OUT_TEST("FICOM_32m", byteArr);
}

TEST_F(ModuleTest, FIDIVR_32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x1, 0x0, 0x0, 0x0, 0xda, 0x3f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIDIVR_32m", byteArr);
}

TEST_F(ModuleTest, FIDIVR_64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xde, 0x3f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIDIVR_64m", byteArr);
}

TEST_F(ModuleTest, FIDIV_32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x1, 0x0, 0x0, 0x0, 0xda, 0x37, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIDIV_32m", byteArr);
}

TEST_F(ModuleTest, FIDIV_64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xde, 0x37, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIDIV_64m", byteArr);
}

TEST_F(ModuleTest, FILD_16m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xdf, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FILD_16m", byteArr);
}

TEST_F(ModuleTest, FILD_32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x1, 0x0, 0x0, 0x0, 0xdb, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FILD_32m", byteArr);
}

TEST_F(ModuleTest, FILD_64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x47, 0x4, 0x1, 0x0, 0x0, 0x0, 0xdf, 0x2f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FILD_64m", byteArr);
}

TEST_F(ModuleTest, FIMUL_m16) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0x66, 0xc7, 0x7, 0x2, 0x0, 0xde, 0xf, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIMUL_m16", byteArr);
}

TEST_F(ModuleTest, FIMUL_m32) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xc7, 0x7, 0x2, 0x0, 0x0, 0x0, 0xda, 0xf, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIMUL_m32", byteArr);
}

TEST_F(ModuleTest, FINCSTP) {
    uint8_t byteArr[] = { 0xd9, 0xf7 };
    IN_OUT_TEST("FINCSTP", byteArr);
}

TEST_F(ModuleTest, FINIT) {
    uint8_t byteArr[] = { 0x9b, 0xdb, 0xe3 };
    IN_OUT_TEST("FINIT", byteArr);
}

TEST_F(ModuleTest, FISTP_16m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdf, 0x1f, 0x66, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISTP_16m", byteArr);
}

TEST_F(ModuleTest, FISTP_32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdb, 0x1f, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISTP_32m", byteArr);
}

TEST_F(ModuleTest, FISTP_64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdf, 0x3f, 0x8b, 0x7, 0x8b, 0x5f, 0x4, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISTP_64m", byteArr);
}

TEST_F(ModuleTest, FISTTP_16m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdf, 0xf, 0x66, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISTTP_16m", byteArr);
}

TEST_F(ModuleTest, FISTTP_32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdb, 0xf, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISTTP_32m", byteArr);
}

TEST_F(ModuleTest, FISTTP_64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdd, 0xf, 0x8b, 0x7, 0x8b, 0x5f, 0x4, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISTTP_64m", byteArr);
}

TEST_F(ModuleTest, FIST_16m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdf, 0x17, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIST_16m", byteArr);
}

TEST_F(ModuleTest, FIST_32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdb, 0x17, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FIST_32m", byteArr);
}

TEST_F(ModuleTest, FISUBRm16) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xde, 0x2f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISUBRm16", byteArr);
}

TEST_F(ModuleTest, FISUBRm32) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x1, 0x0, 0x0, 0x0, 0xda, 0x2f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISUBRm32", byteArr);
}

TEST_F(ModuleTest, FISUBm16) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xde, 0x27, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISUBm16", byteArr);
}

TEST_F(ModuleTest, FISUBm32) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x1, 0x0, 0x0, 0x0, 0xda, 0x27, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FISUBm32", byteArr);
}

TEST_F(ModuleTest, FLD1) {
    uint8_t byteArr[] = { 0xd9, 0xe8 };
    IN_OUT_TEST("FLD1", byteArr);
}

TEST_F(ModuleTest, FLDCW) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0x9b, 0xd9, 0x3f, 0xd9, 0x2f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FLDCW", byteArr);
}

TEST_F(ModuleTest, FLDENV) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0x80, 0x9b, 0xd9, 0x37, 0xd9, 0x27, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FLDENV", byteArr);
}

TEST_F(ModuleTest, FLDL2E) {
    uint8_t byteArr[] = { 0xd9, 0xea };
    IN_OUT_TEST("FLDL2E", byteArr);
}

TEST_F(ModuleTest, FLDL2T) {
    uint8_t byteArr[] = { 0xd9, 0xe9 };
    IN_OUT_TEST("FLDL2T", byteArr);
}

TEST_F(ModuleTest, FLDLG2) {
    uint8_t byteArr[] = { 0xd9, 0xec };
    IN_OUT_TEST("FLDLG2", byteArr);
}

TEST_F(ModuleTest, FLDLN2) {
    uint8_t byteArr[] = { 0xd9, 0xed };
    IN_OUT_TEST("FLDLN2", byteArr);
}

TEST_F(ModuleTest, FLDPI) {
    uint8_t byteArr[] = { 0xd9, 0xeb };
    IN_OUT_TEST("FLDPI", byteArr);
}

TEST_F(ModuleTest, FLDZ) {
    uint8_t byteArr[] = { 0xd9, 0xee };
    IN_OUT_TEST("FLDZ", byteArr);
}

TEST_F(ModuleTest, FMULP) {
    uint8_t byteArr[] = { 0xde, 0xc9 };
    IN_OUT_TEST("FMULP", byteArr);
}

TEST_F(ModuleTest, FMULP_rST0) {
    uint8_t byteArr[] = { 0xde, 0xca };
    IN_OUT_TEST("FMULP_rST0", byteArr);
}

TEST_F(ModuleTest, FNCLEX) {
    uint8_t byteArr[] = { 0xdb, 0xe2 };
    IN_OUT_TEST("FNCLEX", byteArr);
}

TEST_F(ModuleTest, FNINIT) {
    uint8_t byteArr[] = { 0xdb, 0xe3 };
    IN_OUT_TEST("FNINIT", byteArr);
}

TEST_F(ModuleTest, FNOP) {
    uint8_t byteArr[] = { 0xd9, 0xd0 };
    IN_OUT_TEST("FNOP", byteArr);
}

TEST_F(ModuleTest, FNSAVE) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0xbc, 0x24, 0x0, 0xfe, 0xff, 0xff, 0xdd, 0x37, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FNSAVE", byteArr);
}

TEST_F(ModuleTest, FNSTCW) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0xd9, 0x3f, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FNSTCW", byteArr);
}

TEST_F(ModuleTest, FNSTENVm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0xbc, 0x24, 0x0, 0xfe, 0xff, 0xff, 0xd9, 0x37, 0x8b, 0x7, 0x8b, 0x5f, 0x4, 0x8b, 0x4f, 0x8, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FNSTENVm", byteArr);
}

TEST_F(ModuleTest, FNSTSWa) {
    uint8_t byteArr[] = { 0xb8, 0x0, 0x0, 0x0, 0x0, 0xdf, 0xe0 };
    IN_OUT_TEST("FNSTSWa", byteArr);
}

TEST_F(ModuleTest, FNSTSWm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0xdd, 0x3f, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FNSTSWm", byteArr);
}

TEST_F(ModuleTest, FPATAN) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0x66, 0xc7, 0x7, 0x4, 0x0, 0xdf, 0x7, 0xd9, 0xf3, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FPATAN", byteArr);
}

TEST_F(ModuleTest, FPREM) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0x66, 0xc7, 0x7, 0x2, 0x0, 0xdf, 0x7, 0x66, 0xc7, 0x7, 0x5, 0x0, 0xdf, 0x7, 0xd9, 0xf8, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FPREM", byteArr);
}

TEST_F(ModuleTest, FPREM1) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0x66, 0xc7, 0x7, 0x2, 0x0, 0xdf, 0x7, 0x66, 0xc7, 0x7, 0x5, 0x0, 0xdf, 0x7, 0xd9, 0xf5, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FPREM1", byteArr);
}

TEST_F(ModuleTest, FRSTOR) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0xbc, 0x24, 0x0, 0xfe, 0xff, 0xff, 0xdd, 0x37, 0xdd, 0x27, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FRSTOR", byteArr);
}

TEST_F(ModuleTest, FSAVE) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0xbc, 0x24, 0x0, 0xf8, 0xff, 0xff, 0x9b, 0xdd, 0x37, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FSAVE", byteArr);
}

TEST_F(ModuleTest, FSQRT) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0x66, 0xc7, 0x7, 0x4, 0x0, 0xdf, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0, 0xd9, 0xfa };
    IN_OUT_TEST("FSQRT", byteArr);
}

TEST_F(ModuleTest, FSTCW) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0x9b, 0xd9, 0x3f, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FSTCW", byteArr);
}

TEST_F(ModuleTest, FSTENVm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0xbc, 0x24, 0x0, 0xfe, 0xff, 0xff, 0x9b, 0xd9, 0x37, 0x8b, 0x7, 0x8b, 0x5f, 0x4, 0x8b, 0x4f, 0x8, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FSTENVm", byteArr);
}

TEST_F(ModuleTest, FSTSWa) {
    uint8_t byteArr[] = { 0xb8, 0x0, 0x0, 0x0, 0x0, 0x9b, 0xdf, 0xe0 };
    IN_OUT_TEST("FSTSWa", byteArr);
}

TEST_F(ModuleTest, FSTSWm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0x9b, 0xdd, 0x3f, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FSTSWm", byteArr);
}

TEST_F(ModuleTest, FSUBP) {
    uint8_t byteArr[] = { 0xde, 0xe9, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FSUBP", byteArr);
}

TEST_F(ModuleTest, FSUBP_rST0) {
    uint8_t byteArr[] = { 0xde, 0xea };
    IN_OUT_TEST("FSUBP_rST0", byteArr);
}

TEST_F(ModuleTest, FSUBRP) {
    uint8_t byteArr[] = { 0xde, 0xe1, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FSUBRP", byteArr);
}

TEST_F(ModuleTest, FSUBRP_rST0) {
    uint8_t byteArr[] = { 0xde, 0xe2 };
    IN_OUT_TEST("FSUBRP_rST0", byteArr);
}

TEST_F(ModuleTest, FTST) {
    uint8_t byteArr[] = { 0xd9, 0xe4 };
    IN_OUT_TEST("FTST", byteArr);
}

TEST_F(ModuleTest, FUCOM) {
    uint8_t byteArr[] = { 0xdd, 0xe1 };
    IN_OUT_TEST("FUCOM", byteArr);
}

TEST_F(ModuleTest, FUCOMIP_STFr) {
    uint8_t byteArr[] = { 0xdf, 0xe9 };
    IN_OUT_TEST("FUCOMIP_STFr", byteArr);
}

TEST_F(ModuleTest, FUCOMI_STFr) {
    uint8_t byteArr[] = { 0xdb, 0xe9 };
    IN_OUT_TEST("FUCOMI_STFr", byteArr);
}

TEST_F(ModuleTest, FUCOMP) {
    uint8_t byteArr[] = { 0xdd, 0xe9 };
    IN_OUT_TEST("FUCOMP", byteArr);
}

TEST_F(ModuleTest, FUCOMPP) {
    uint8_t byteArr[] = { 0xda, 0xe9 };
    IN_OUT_TEST("FUCOMPP", byteArr);
}

TEST_F(ModuleTest, FUCOMP_STFr) {
    uint8_t byteArr[] = { 0xdd, 0xea };
    IN_OUT_TEST("FUCOMP_STFr", byteArr);
}

TEST_F(ModuleTest, FUCOM_STFr) {
    uint8_t byteArr[] = { 0xdd, 0xe2 };
    IN_OUT_TEST("FUCOM_STFr", byteArr);
}

TEST_F(ModuleTest, FXAM) {
    uint8_t byteArr[] = { 0xd9, 0xe5 };
    IN_OUT_TEST("FXAM", byteArr);
}

TEST_F(ModuleTest, FXRSTOR) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0xbc, 0x24, 0x0, 0xfd, 0xff, 0xff, 0x48, 0x83, 0xe7, 0xf0, 0xf, 0xae, 0x7, 0xf, 0xae, 0xf, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FXRSTOR", byteArr);
}

TEST_F(ModuleTest, FXSAVE) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0xbc, 0x24, 0x0, 0xfd, 0xff, 0xff, 0x48, 0x83, 0xe7, 0xf0, 0xf, 0xae, 0x7, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("FXSAVE", byteArr);
}

TEST_F(ModuleTest, FXTRACT) {
    uint8_t byteArr[] = { 0xd9, 0xf4 };
    IN_OUT_TEST("FXTRACT", byteArr);
}

TEST_F(ModuleTest, FYL2X) {
    uint8_t byteArr[] = { 0xd9, 0xf1 };
    IN_OUT_TEST("FYL2X", byteArr);
}

TEST_F(ModuleTest, FYL2XP1) {
    uint8_t byteArr[] = { 0xd9, 0xf9 };
    IN_OUT_TEST("FYL2XP1", byteArr);
}

TEST_F(ModuleTest, IDIV16r) {
    uint8_t byteArr[] = { 0x66, 0xf7, 0xfb };
    IN_OUT_TEST("IDIV16r", byteArr);
}

TEST_F(ModuleTest, IDIV32r) {
    uint8_t byteArr[] = { 0xf7, 0xfb };
    IN_OUT_TEST("IDIV32r", byteArr);
}

TEST_F(ModuleTest, IDIV64r) {
    uint8_t byteArr[] = { 0x48, 0xf7, 0xfb };
    IN_OUT_TEST("IDIV64r", byteArr);
}

TEST_F(ModuleTest, IDIV8r) {
    uint8_t byteArr[] = { 0xf6, 0xfb };
    IN_OUT_TEST("IDIV8r", byteArr);
}

TEST_F(ModuleTest, ILD_F16m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0x66, 0xc7, 0x7, 0x1, 0x0, 0xdf, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ILD_F16m", byteArr);
}

TEST_F(ModuleTest, ILD_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xc7, 0x7, 0x1, 0x0, 0x1, 0x0, 0xdb, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ILD_F32m", byteArr);
}

TEST_F(ModuleTest, ILD_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf0, 0xc7, 0x7, 0x1, 0x0, 0x0, 0x0, 0xc7, 0x47, 0x4, 0x1, 0x0, 0x1, 0x0, 0xdf, 0x2f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ILD_F64m", byteArr);
}

TEST_F(ModuleTest, IMUL16r) {
    uint8_t byteArr[] = { 0x66, 0xf7, 0xeb };
    IN_OUT_TEST("IMUL16r", byteArr);
}

TEST_F(ModuleTest, IMUL16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xaf, 0xd9 };
    IN_OUT_TEST("IMUL16rr", byteArr);
}

TEST_F(ModuleTest, IMUL16rri) {
    uint8_t byteArr[] = { 0x66, 0x69, 0xd9, 0xbb, 0xb };
    IN_OUT_TEST("IMUL16rri", byteArr);
}

TEST_F(ModuleTest, IMUL32r) {
    uint8_t byteArr[] = { 0xf7, 0xeb };
    IN_OUT_TEST("IMUL32r", byteArr);
}

TEST_F(ModuleTest, IMUL32rr) {
    uint8_t byteArr[] = { 0xf, 0xaf, 0xd9 };
    IN_OUT_TEST("IMUL32rr", byteArr);
}

TEST_F(ModuleTest, IMUL32rri) {
    uint8_t byteArr[] = { 0x69, 0xd9, 0xbb, 0xbb, 0xb, 0x0 };
    IN_OUT_TEST("IMUL32rri", byteArr);
}

TEST_F(ModuleTest, IMUL64m) {
    uint8_t byteArr[] = { 0x48, 0xf, 0xaf, 0x44, 0x24, 0xf8 };
    IN_OUT_TEST("IMUL64m", byteArr);
}

TEST_F(ModuleTest, IMUL64r) {
    uint8_t byteArr[] = { 0xf7, 0xeb };
    IN_OUT_TEST("IMUL64r", byteArr);
}

TEST_F(ModuleTest, IMUL64rr) {
    uint8_t byteArr[] = { 0xf, 0xaf, 0xd9 };
    IN_OUT_TEST("IMUL64rr", byteArr);
}

TEST_F(ModuleTest, IMUL64rri32) {
    uint8_t byteArr[] = { 0x69, 0xd9, 0xbb, 0xbb, 0xb, 0x0 };
    IN_OUT_TEST("IMUL64rri32", byteArr);
}

TEST_F(ModuleTest, IMUL64rri8) {
    uint8_t byteArr[] = { 0x6b, 0xd9, 0xb };
    IN_OUT_TEST("IMUL64rri8", byteArr);
}

TEST_F(ModuleTest, IMUL8r) {
    uint8_t byteArr[] = { 0xf6, 0xe9 };
    IN_OUT_TEST("IMUL8r", byteArr);
}

TEST_F(ModuleTest, INC16r) {
    uint8_t byteArr[] = { 0x66, 0xff, 0xc2 };
    IN_OUT_TEST("INC16r", byteArr);
}

TEST_F(ModuleTest, INC32r) {
    uint8_t byteArr[] = { 0xff, 0xc0 };
    IN_OUT_TEST("INC32r", byteArr);
}

TEST_F(ModuleTest, INC64r) {
    uint8_t byteArr[] = { 0x48, 0xff, 0xc0 };
    IN_OUT_TEST("INC64r", byteArr);
}

TEST_F(ModuleTest, INC8r) {
    uint8_t byteArr[] = { 0xfe, 0xc1 };
    IN_OUT_TEST("INC8r", byteArr);
}

TEST_F(ModuleTest, LAHF) {
    uint8_t byteArr[] = { 0x9f };
    IN_OUT_TEST("LAHF", byteArr);
}

TEST_F(ModuleTest, LD_F0) {
    uint8_t byteArr[] = { 0xd9, 0xee };
    IN_OUT_TEST("LD_F0", byteArr);
}

TEST_F(ModuleTest, LD_F1) {
    uint8_t byteArr[] = { 0xd9, 0xe8 };
    IN_OUT_TEST("LD_F1", byteArr);
}

TEST_F(ModuleTest, LD_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xc7, 0x7, 0xdb, 0xf, 0x49, 0x40, 0xd9, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("LD_F32m", byteArr);
}

TEST_F(ModuleTest, LD_F80m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xc7, 0x7, 0x0, 0xc0, 0x68, 0x21, 0xc7, 0x47, 0x4, 0xa2, 0xda, 0xf, 0xc9, 0xc7, 0x47, 0x8, 0x0, 0x40, 0x0, 0x0, 0xdb, 0x2f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("LD_F80m", byteArr);
}

TEST_F(ModuleTest, LD_Frr) {
    uint8_t byteArr[] = { 0xd9, 0xc1 };
    IN_OUT_TEST("LD_Frr", byteArr);
}

TEST_F(ModuleTest, LEA16r) {
    uint8_t byteArr[] = { 0x66, 0x67, 0x8d, 0x8a, 0xbc, 0xfb, 0xff, 0xff };
    IN_OUT_TEST("LEA16r", byteArr);
}

TEST_F(ModuleTest, LEA32r) {
    uint8_t byteArr[] = { 0x67, 0x8d, 0x8a, 0xbc, 0xfb, 0xff, 0xff };
    IN_OUT_TEST("LEA32r", byteArr);
}

TEST_F(ModuleTest, LEAVE) {
    uint8_t byteArr[] = { 0xc9 };
    IN_OUT_TEST("LEAVE", byteArr);
}

TEST_F(ModuleTest, LOOP) {
    uint8_t byteArr[] = { 0x1, 0xc0, 0xe2, 0xfc, 0xff, 0xc0 };
    IN_OUT_TEST("LOOP", byteArr);
}

TEST_F(ModuleTest, Lea32R1) {
    uint8_t byteArr[] = { 0x67, 0x8d, 0x44, 0x38, 0x1 };
    IN_OUT_TEST("Lea32R1", byteArr);
}

TEST_F(ModuleTest, Lea32R2) {
    uint8_t byteArr[] = { 0x67, 0x8d, 0xc, 0x90 };
    IN_OUT_TEST("Lea32R2", byteArr);
}

TEST_F(ModuleTest, MOV16ri) {
    uint8_t byteArr[] = { 0x66, 0xbb, 0xcc, 0xff };
    IN_OUT_TEST("MOV16ri", byteArr);
}

TEST_F(ModuleTest, MOV16rr) {
    uint8_t byteArr[] = { 0x88, 0xf5 };
    IN_OUT_TEST("MOV16rr", byteArr);
}

TEST_F(ModuleTest, MOV32ri) {
    uint8_t byteArr[] = { 0xb8, 0x11, 0x81, 0x1, 0x0 };
    IN_OUT_TEST("MOV32ri", byteArr);
}

TEST_F(ModuleTest, MOV32rr) {
    uint8_t byteArr[] = { 0x89, 0xc1 };
    IN_OUT_TEST("MOV32rr", byteArr);
}

TEST_F(ModuleTest, MOV8ri) {
    uint8_t byteArr[] = { 0xb4, 0x3 };
    IN_OUT_TEST("MOV8ri", byteArr);
}

TEST_F(ModuleTest, MOV8rr) {
    uint8_t byteArr[] = { 0x88, 0xf5 };
    IN_OUT_TEST("MOV8rr", byteArr);
}

TEST_F(ModuleTest, MOVDI2PDIrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0x89, 0x1, 0x66, 0xf, 0x6e, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("MOVDI2PDIrm", byteArr);
}

TEST_F(ModuleTest, MOVDI2PDIrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x6e, 0xc1 };
    IN_OUT_TEST("MOVDI2PDIrr", byteArr);
}

TEST_F(ModuleTest, MOVPDI2DImr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0x66, 0xf, 0x7e, 0x1, 0x8b, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("MOVPDI2DImr", byteArr);
}

TEST_F(ModuleTest, MOVPDI2DIrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x7e, 0xc0 };
    IN_OUT_TEST("MOVPDI2DIrr", byteArr);
}

TEST_F(ModuleTest, MOVSDmr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xf2, 0xf, 0x11, 0x1, 0x8b, 0x1, 0x8b, 0x59, 0x4, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("MOVSDmr", byteArr);
}

TEST_F(ModuleTest, MOVSDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x4, 0x40, 0xf2, 0xf, 0x10, 0x1, 0x48, 0x8b, 0x9 };
    IN_OUT_TEST("MOVSDrm", byteArr);
}

TEST_F(ModuleTest, MOVSDrr) {
    uint8_t byteArr[] = { 0xf2, 0xf, 0x10, 0xc1 };
    IN_OUT_TEST("MOVSDrr", byteArr);
}

TEST_F(ModuleTest, MOVSSmr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xf3, 0xf, 0x11, 0x1, 0x48, 0x8b, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("MOVSSmr", byteArr);
}

TEST_F(ModuleTest, MOVSSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xf3, 0xf, 0x11, 0x1, 0xf3, 0xf, 0x10, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("MOVSSrm", byteArr);
}

TEST_F(ModuleTest, MOVSSrr) {
    uint8_t byteArr[] = { 0xf3, 0xf, 0x10, 0xc1, 0xf3, 0xf, 0x10, 0xd1, 0xf3, 0xf, 0x10, 0xd9 };
    IN_OUT_TEST("MOVSSrr", byteArr);
}

TEST_F(ModuleTest, MOVSX16rr8) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xbe, 0xdb };
    IN_OUT_TEST("MOVSX16rr8", byteArr);
}

TEST_F(ModuleTest, MOVSX32rr16) {
    uint8_t byteArr[] = { 0xf, 0xbf, 0xc0 };
    IN_OUT_TEST("MOVSX32rr16", byteArr);
}

TEST_F(ModuleTest, MOVSX32rr8) {
    uint8_t byteArr[] = { 0xf, 0xbe, 0xc4 };
    IN_OUT_TEST("MOVSX32rr8", byteArr);
}

TEST_F(ModuleTest, MOVZX16rr8) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xb6, 0xdb };
    IN_OUT_TEST("MOVZX16rr8", byteArr);
}

TEST_F(ModuleTest, MOVZX32rr16) {
    uint8_t byteArr[] = { 0xf, 0xb7, 0xd8 };
    IN_OUT_TEST("MOVZX32rr16", byteArr);
}

TEST_F(ModuleTest, MOVZX32rr8) {
    uint8_t byteArr[] = { 0xf, 0xb6, 0xd6 };
    IN_OUT_TEST("MOVZX32rr8", byteArr);
}

TEST_F(ModuleTest, MULSDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x4, 0x40, 0xf2, 0xf, 0x59, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("MULSDrm", byteArr);
}

TEST_F(ModuleTest, MULSDrr) {
    uint8_t byteArr[] = { 0xf2, 0xf, 0x59, 0xc1 };
    IN_OUT_TEST("MULSDrr", byteArr);
}

TEST_F(ModuleTest, MULSSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0xc7, 0x1, 0x0, 0x0, 0xc0, 0x3f, 0xf3, 0xf, 0x59, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("MULSSrm", byteArr);
}

TEST_F(ModuleTest, MULSSrr) {
    uint8_t byteArr[] = { 0xf3, 0xf, 0x59, 0xc1 };
    IN_OUT_TEST("MULSSrr", byteArr);
}

TEST_F(ModuleTest, MUL_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xd9, 0x17, 0xd8, 0xf, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("MUL_F32m", byteArr);
}

TEST_F(ModuleTest, MUL_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdd, 0x17, 0xdc, 0xf, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("MUL_F64m", byteArr);
}

TEST_F(ModuleTest, MUL_FST0r) {
    uint8_t byteArr[] = { 0xd8, 0xc9 };
    IN_OUT_TEST("MUL_FST0r", byteArr);
}

TEST_F(ModuleTest, MUL_FrST0) {
    uint8_t byteArr[] = { 0xdc, 0xc9 };
    IN_OUT_TEST("MUL_FrST0", byteArr);
}

TEST_F(ModuleTest, NEG16r) {
    uint8_t byteArr[] = { 0x66, 0xf7, 0xdb };
    IN_OUT_TEST("NEG16r", byteArr);
}

TEST_F(ModuleTest, NEG32r) {
    uint8_t byteArr[] = { 0xf7, 0xdb };
    IN_OUT_TEST("NEG32r", byteArr);
}

TEST_F(ModuleTest, NEG8r) {
    uint8_t byteArr[] = { 0xf6, 0xda };
    IN_OUT_TEST("NEG8r", byteArr);
}

TEST_F(ModuleTest, NOOP) {
    uint8_t byteArr[] = { 0x90 };
    IN_OUT_TEST("NOOP", byteArr);
}

TEST_F(ModuleTest, NOT16r) {
    uint8_t byteArr[] = { 0x66, 0xf7, 0xd1 };
    IN_OUT_TEST("NOT16r", byteArr);
}

TEST_F(ModuleTest, NOT32r) {
    uint8_t byteArr[] = { 0xf7, 0xd0 };
    IN_OUT_TEST("NOT32r", byteArr);
}

TEST_F(ModuleTest, NOT64r) {
    uint8_t byteArr[] = { 0x48, 0xf7, 0xd0 };
    IN_OUT_TEST("NOT64r", byteArr);
}

TEST_F(ModuleTest, NOT8r) {
    uint8_t byteArr[] = { 0xf6, 0xd2 };
    IN_OUT_TEST("NOT8r", byteArr);
}

TEST_F(ModuleTest, OR16i16) {
    uint8_t byteArr[] = { 0x66, 0xd, 0xee, 0xee };
    IN_OUT_TEST("OR16i16", byteArr);
}

TEST_F(ModuleTest, OR16ri) {
    uint8_t byteArr[] = { 0x66, 0x81, 0xcb, 0x44, 0x4 };
    IN_OUT_TEST("OR16ri", byteArr);
}

TEST_F(ModuleTest, OR16rm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfa, 0x66, 0xc7, 0x7, 0x34, 0x12, 0x66, 0xb8, 0x78, 0x56, 0x66, 0xb, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("OR16rm", byteArr);
}

TEST_F(ModuleTest, OR16rr) {
    uint8_t byteArr[] = { 0x66, 0x9, 0xd1 };
    IN_OUT_TEST("OR16rr", byteArr);
}

TEST_F(ModuleTest, OR32i32) {
    uint8_t byteArr[] = { 0xd, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("OR32i32", byteArr);
}

TEST_F(ModuleTest, OR32mr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xc7, 0x7, 0xcd, 0xab, 0x34, 0x12, 0xb8, 0xdc, 0xfe, 0x78, 0x56, 0x9, 0x7, 0x8b, 0x17, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("OR32mr", byteArr);
}

TEST_F(ModuleTest, OR32ri) {
    uint8_t byteArr[] = { 0x81, 0xcb, 0x44, 0x44, 0x4, 0x0 };
    IN_OUT_TEST("OR32ri", byteArr);
}

TEST_F(ModuleTest, OR32rr) {
    uint8_t byteArr[] = { 0x9, 0xd1 };
    IN_OUT_TEST("OR32rr", byteArr);
}

TEST_F(ModuleTest, OR8i8) {
    uint8_t byteArr[] = { 0xc, 0x2 };
    IN_OUT_TEST("OR8i8", byteArr);
}

TEST_F(ModuleTest, OR8ri) {
    uint8_t byteArr[] = { 0x80, 0xcf, 0x82 };
    IN_OUT_TEST("OR8ri", byteArr);
}

TEST_F(ModuleTest, OR8rr) {
    uint8_t byteArr[] = { 0x8, 0xe0 };
    IN_OUT_TEST("OR8rr", byteArr);
}

TEST_F(ModuleTest, ORPDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0x56, 0x1, 0x48, 0x8b, 0x9, 0x48, 0x31, 0xc9 };
    IN_OUT_TEST("ORPDrm", byteArr);
}

TEST_F(ModuleTest, ORPDrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x56, 0xc1 };
    IN_OUT_TEST("ORPDrr", byteArr);
}

TEST_F(ModuleTest, ORPSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0xf, 0x56, 0x1, 0x48, 0x8b, 0x9, 0x48, 0x31, 0xc9 };
    IN_OUT_TEST("ORPSrm", byteArr);
}

TEST_F(ModuleTest, ORPSrr) {
    uint8_t byteArr[] = { 0xf, 0x56, 0xc1 };
    IN_OUT_TEST("ORPSrr", byteArr);
}

TEST_F(ModuleTest, PADDBrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xfc, 0x1, 0x48, 0x8b, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PADDBrm", byteArr);
}

TEST_F(ModuleTest, PADDBrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xfc, 0xc1 };
    IN_OUT_TEST("PADDBrr", byteArr);
}

TEST_F(ModuleTest, PADDDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xfe, 0x1, 0x48, 0x8b, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PADDDrm", byteArr);
}

TEST_F(ModuleTest, PADDDrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xfe, 0xc1 };
    IN_OUT_TEST("PADDDrr", byteArr);
}

TEST_F(ModuleTest, PADDQrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xd4, 0x1, 0x48, 0x8b, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PADDQrm", byteArr);
}

TEST_F(ModuleTest, PADDQrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xd4, 0xc1 };
    IN_OUT_TEST("PADDQrr", byteArr);
}

TEST_F(ModuleTest, PADDWrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xfd, 0x1, 0x48, 0x8b, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PADDWrm", byteArr);
}

TEST_F(ModuleTest, PADDWrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xfd, 0xc1 };
    IN_OUT_TEST("PADDWrr", byteArr);
}

TEST_F(ModuleTest, PEXTRWmr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x5c, 0x24, 0xfc, 0xc7, 0x3, 0x0, 0x0, 0x0, 0x0, 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x4, 0xbb, 0xbb, 0xbb, 0xbb, 0xc7, 0x41, 0x8, 0xcc, 0xcc, 0xcc, 0xcc, 0xc7, 0x41, 0xc, 0xdd, 0xdd, 0xdd, 0xdd, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0x3a, 0x15, 0xb, 0x7, 0x8b, 0x1b, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PEXTRWmr", byteArr);
}

TEST_F(ModuleTest, PEXTRWri) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xb8, 0xff, 0xff, 0xff, 0xff, 0xc7, 0x1, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x4, 0xbb, 0xbb, 0xbb, 0xbb, 0xc7, 0x41, 0x8, 0xcc, 0xcc, 0xcc, 0xcc, 0xc7, 0x41, 0xc, 0xdd, 0xdd, 0xdd, 0xdd, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0xc5, 0xc1, 0x5, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PEXTRWri", byteArr);
}

TEST_F(ModuleTest, PINSRWrmi) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xfc, 0xc7, 0x0, 0x99, 0x99, 0x99, 0x99, 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x4, 0xbb, 0xbb, 0xbb, 0xbb, 0xc7, 0x41, 0x8, 0xcc, 0xcc, 0xcc, 0xcc, 0xc7, 0x41, 0xc, 0xdd, 0xdd, 0xdd, 0xdd, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0xc4, 0x8, 0x7, 0xb9, 0x0, 0x0, 0x0, 0x0, 0xb8, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PINSRWrmi", byteArr);
}

TEST_F(ModuleTest, PINSRWrri) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x4, 0xbb, 0xbb, 0xbb, 0xbb, 0xc7, 0x41, 0x8, 0xcc, 0xcc, 0xcc, 0xcc, 0xc7, 0x41, 0xc, 0xdd, 0xdd, 0xdd, 0xdd, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0xc4, 0xc8, 0x5, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PINSRWrri", byteArr);
}

TEST_F(ModuleTest, POP16r) {
    uint8_t byteArr[] = { 0x66, 0x51, 0x66, 0x5f };
    IN_OUT_TEST("POP16r", byteArr);
}

TEST_F(ModuleTest, PORrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xeb, 0x1, 0x8b, 0x9, 0x31, 0xc9 };
    IN_OUT_TEST("PORrm", byteArr);
}

TEST_F(ModuleTest, PORrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xeb, 0xc1 };
    IN_OUT_TEST("PORrr", byteArr);
}

TEST_F(ModuleTest, PSHUFDmi) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x4, 0xbb, 0xbb, 0xbb, 0xbb, 0xc7, 0x41, 0x8, 0xcc, 0xcc, 0xcc, 0xcc, 0xc7, 0x41, 0xc, 0xdd, 0xdd, 0xdd, 0xdd, 0x66, 0xf, 0x70, 0x1, 0x4e, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSHUFDmi", byteArr);
}

TEST_F(ModuleTest, PSHUFDri) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x4, 0xbb, 0xbb, 0xbb, 0xbb, 0xc7, 0x41, 0x8, 0xcc, 0xcc, 0xcc, 0xcc, 0xc7, 0x41, 0xc, 0xdd, 0xdd, 0xdd, 0xdd, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0x70, 0xc1, 0x4e, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSHUFDri", byteArr);
}

TEST_F(ModuleTest, PSLLDrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf0, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x8, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0xc, 0x10, 0x0, 0x0, 0x0, 0xf3, 0xf, 0x6f, 0x9, 0xc7, 0x1, 0x0, 0xf0, 0xff, 0x0, 0xc7, 0x41, 0x4, 0x0, 0xf0, 0xff, 0x0, 0xc7, 0x41, 0x8, 0x0, 0xf0, 0xff, 0x0, 0xc7, 0x41, 0xc, 0x0, 0xf0, 0xff, 0x0, 0xf3, 0xf, 0x6f, 0x1, 0x66, 0xf, 0xf2, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSLLDrr", byteArr);
}

TEST_F(ModuleTest, PSLLDrr2) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf0, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x8, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0xc, 0xff, 0x0, 0x0, 0x0, 0xf3, 0xf, 0x6f, 0x9, 0xc7, 0x1, 0x0, 0xf0, 0xff, 0xf0, 0xc7, 0x41, 0x4, 0x0, 0xf0, 0xff, 0xf0, 0xc7, 0x41, 0x8, 0x0, 0xf0, 0xff, 0xf0, 0xc7, 0x41, 0xc, 0x0, 0xf0, 0xff, 0xf0, 0xf3, 0xf, 0x6f, 0x1, 0x66, 0xf, 0xf2, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSLLDrr2", byteArr);
}

TEST_F(ModuleTest, PSLLWrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf0, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x8, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0xc, 0x4, 0x0, 0x0, 0x0, 0xf3, 0xf, 0x6f, 0x9, 0xc7, 0x1, 0xf0, 0xf0, 0xf0, 0xf0, 0xc7, 0x41, 0x4, 0xf0, 0xf0, 0xf0, 0xf0, 0xc7, 0x41, 0x8, 0xf0, 0xf0, 0xf0, 0xf0, 0xc7, 0x41, 0xc, 0xf0, 0xf0, 0xf0, 0xf0, 0xf3, 0xf, 0x6f, 0x1, 0x66, 0xf, 0xf1, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSLLWrr", byteArr);
}

TEST_F(ModuleTest, PSRADrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf0, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x8, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0xc, 0x10, 0x0, 0x0, 0x0, 0xf3, 0xf, 0x6f, 0x9, 0xc7, 0x1, 0x0, 0xf0, 0xff, 0x0, 0xc7, 0x41, 0x4, 0x0, 0xf0, 0xff, 0x0, 0xc7, 0x41, 0x8, 0x0, 0xf0, 0xff, 0x0, 0xc7, 0x41, 0xc, 0x0, 0xf0, 0xff, 0x0, 0xf3, 0xf, 0x6f, 0x1, 0x66, 0xf, 0xe2, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSRADrr", byteArr);
}

TEST_F(ModuleTest, PSRADrr2) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf0, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x8, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0xc, 0xff, 0x0, 0x0, 0x0, 0xf3, 0xf, 0x6f, 0x9, 0xc7, 0x1, 0x0, 0xf0, 0xff, 0xf0, 0xc7, 0x41, 0x4, 0x0, 0xf0, 0xff, 0xf0, 0xc7, 0x41, 0x8, 0x0, 0xf0, 0xff, 0xf0, 0xc7, 0x41, 0xc, 0x0, 0xf0, 0xff, 0xf0, 0xf3, 0xf, 0x6f, 0x1, 0x66, 0xf, 0xe1, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSRADrr2", byteArr);
}

TEST_F(ModuleTest, PSRAWrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf0, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x8, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0xc, 0x8, 0x0, 0x0, 0x0, 0xf3, 0xf, 0x6f, 0x9, 0xc7, 0x1, 0xf0, 0xf0, 0xf0, 0xf0, 0xc7, 0x41, 0x4, 0xf0, 0xf0, 0xf0, 0xf0, 0xc7, 0x41, 0x8, 0xf0, 0xf0, 0xf0, 0xf0, 0xc7, 0x41, 0xc, 0xf0, 0xf0, 0xf0, 0xf0, 0xf3, 0xf, 0x6f, 0x1, 0x66, 0xf, 0xe1, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSRAWrr", byteArr);
}

TEST_F(ModuleTest, PSUBBrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xf8, 0x1, 0x8b, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSUBBrm", byteArr);
}

TEST_F(ModuleTest, PSUBBrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xf8, 0xc1 };
    IN_OUT_TEST("PSUBBrr", byteArr);
}

TEST_F(ModuleTest, PSUBDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xfa, 0x1, 0x8b, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSUBDrm", byteArr);
}

TEST_F(ModuleTest, PSUBDrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xfa, 0xc1 };
    IN_OUT_TEST("PSUBDrr", byteArr);
}

TEST_F(ModuleTest, PSUBQrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xfb, 0x1, 0x8b, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSUBQrm", byteArr);
}

TEST_F(ModuleTest, PSUBQrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xfb, 0xc1 };
    IN_OUT_TEST("PSUBQrr", byteArr);
}

TEST_F(ModuleTest, PSUBWrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0x66, 0xf, 0xf9, 0x1, 0x8b, 0x9, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PSUBWrm", byteArr);
}

TEST_F(ModuleTest, PSUBWrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xf9, 0xc1 };
    IN_OUT_TEST("PSUBWrr", byteArr);
}

TEST_F(ModuleTest, PUNPCKLBWrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0x66, 0xf, 0x60, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PUNPCKLBWrm", byteArr);
}

TEST_F(ModuleTest, PUNPCKLBWrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0x60, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PUNPCKLBWrr", byteArr);
}

TEST_F(ModuleTest, PUNPCKLDQrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0x66, 0xf, 0x62, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PUNPCKLDQrm", byteArr);
}

TEST_F(ModuleTest, PUNPCKLDQrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0x62, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PUNPCKLDQrr", byteArr);
}

TEST_F(ModuleTest, PUNPCKLQDQrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0x66, 0xf, 0x6c, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PUNPCKLQDQrm", byteArr);
}

TEST_F(ModuleTest, PUNPCKLQDQrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0x6c, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PUNPCKLQDQrr", byteArr);
}

TEST_F(ModuleTest, PUNPCKLWDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0x66, 0xf, 0x61, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PUNPCKLWDrm", byteArr);
}

TEST_F(ModuleTest, PUNPCKLWDrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0xf3, 0xf, 0x6f, 0x9, 0x66, 0xf, 0x61, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("PUNPCKLWDrr", byteArr);
}

TEST_F(ModuleTest, PUSH16r) {
    uint8_t byteArr[] = { 0x66, 0x51 };
    IN_OUT_TEST("PUSH16r", byteArr);
}

TEST_F(ModuleTest, RCL16r1) {
    uint8_t byteArr[] = { 0x66, 0xd1, 0xd2 };
    IN_OUT_TEST("RCL16r1", byteArr);
}

TEST_F(ModuleTest, RCL16rCL) {
    uint8_t byteArr[] = { 0x66, 0xd3, 0xd3 };
    IN_OUT_TEST("RCL16rCL", byteArr);
}

TEST_F(ModuleTest, RCL16ri) {
    uint8_t byteArr[] = { 0x66, 0xc1, 0xd1, 0x8 };
    IN_OUT_TEST("RCL16ri", byteArr);
}

TEST_F(ModuleTest, RCL32r1) {
    uint8_t byteArr[] = { 0xd1, 0xd0 };
    IN_OUT_TEST("RCL32r1", byteArr);
}

TEST_F(ModuleTest, RCL32rCL) {
    uint8_t byteArr[] = { 0xd3, 0xd3 };
    IN_OUT_TEST("RCL32rCL", byteArr);
}

TEST_F(ModuleTest, RCL32ri) {
    uint8_t byteArr[] = { 0xc1, 0xd1, 0x8 };
    IN_OUT_TEST("RCL32ri", byteArr);
}

TEST_F(ModuleTest, RCL8r1) {
    uint8_t byteArr[] = { 0xd0, 0xd4 };
    IN_OUT_TEST("RCL8r1", byteArr);
}

TEST_F(ModuleTest, RCL8rCL) {
    uint8_t byteArr[] = { 0xd2, 0xd7 };
    IN_OUT_TEST("RCL8rCL", byteArr);
}

TEST_F(ModuleTest, RCL8ri) {
    uint8_t byteArr[] = { 0xc0, 0xd5, 0x2 };
    IN_OUT_TEST("RCL8ri", byteArr);
}

TEST_F(ModuleTest, RCR16r1) {
    uint8_t byteArr[] = { 0x66, 0xd1, 0xda };
    IN_OUT_TEST("RCR16r1", byteArr);
}

TEST_F(ModuleTest, RCR16rCL) {
    uint8_t byteArr[] = { 0x66, 0xd3, 0xdb };
    IN_OUT_TEST("RCR16rCL", byteArr);
}

TEST_F(ModuleTest, RCR16ri) {
    uint8_t byteArr[] = { 0x66, 0xc1, 0xd9, 0x8 };
    IN_OUT_TEST("RCR16ri", byteArr);
}

TEST_F(ModuleTest, RCR32r1) {
    uint8_t byteArr[] = { 0xd1, 0xd8 };
    IN_OUT_TEST("RCR32r1", byteArr);
}

TEST_F(ModuleTest, RCR32rCL) {
    uint8_t byteArr[] = { 0xd3, 0xdb };
    IN_OUT_TEST("RCR32rCL", byteArr);
}

TEST_F(ModuleTest, RCR32ri) {
    uint8_t byteArr[] = { 0xc1, 0xd9, 0x8 };
    IN_OUT_TEST("RCR32ri", byteArr);
}

TEST_F(ModuleTest, RCR8r1) {
    uint8_t byteArr[] = { 0xd0, 0xdc };
    IN_OUT_TEST("RCR8r1", byteArr);
}

TEST_F(ModuleTest, RCR8rCL) {
    uint8_t byteArr[] = { 0xd2, 0xdf };
    IN_OUT_TEST("RCR8rCL", byteArr);
}

TEST_F(ModuleTest, RCR8ri) {
    uint8_t byteArr[] = { 0xc0, 0xdd, 0x2 };
    IN_OUT_TEST("RCR8ri", byteArr);
}

TEST_F(ModuleTest, ROL16r1) {
    uint8_t byteArr[] = { 0x66, 0xd1, 0xc2 };
    IN_OUT_TEST("ROL16r1", byteArr);
}

TEST_F(ModuleTest, ROL16rCL) {
    uint8_t byteArr[] = { 0x66, 0xd3, 0xc3 };
    IN_OUT_TEST("ROL16rCL", byteArr);
}

TEST_F(ModuleTest, ROL16ri) {
    uint8_t byteArr[] = { 0x66, 0xc1, 0xc1, 0x8 };
    IN_OUT_TEST("ROL16ri", byteArr);
}

TEST_F(ModuleTest, ROL32r1) {
    uint8_t byteArr[] = { 0xd1, 0xc0 };
    IN_OUT_TEST("ROL32r1", byteArr);
}

TEST_F(ModuleTest, ROL32rCL) {
    uint8_t byteArr[] = { 0xd3, 0xc3 };
    IN_OUT_TEST("ROL32rCL", byteArr);
}

TEST_F(ModuleTest, ROL32ri) {
    uint8_t byteArr[] = { 0xc1, 0xc1, 0x8 };
    IN_OUT_TEST("ROL32ri", byteArr);
}

TEST_F(ModuleTest, ROL8r1) {
    uint8_t byteArr[] = { 0xd0, 0xc4 };
    IN_OUT_TEST("ROL8r1", byteArr);
}

TEST_F(ModuleTest, ROL8rCL) {
    uint8_t byteArr[] = { 0xd2, 0xc7 };
    IN_OUT_TEST("ROL8rCL", byteArr);
}

TEST_F(ModuleTest, ROL8ri) {
    uint8_t byteArr[] = { 0xc0, 0xc5, 0x2 };
    IN_OUT_TEST("ROL8ri", byteArr);
}

TEST_F(ModuleTest, ROR16r1) {
    uint8_t byteArr[] = { 0x66, 0xd1, 0xca };
    IN_OUT_TEST("ROR16r1", byteArr);
}

TEST_F(ModuleTest, ROR16rCL) {
    uint8_t byteArr[] = { 0x66, 0xd3, 0xcb };
    IN_OUT_TEST("ROR16rCL", byteArr);
}

TEST_F(ModuleTest, ROR16ri) {
    uint8_t byteArr[] = { 0x66, 0xc1, 0xc9, 0x8 };
    IN_OUT_TEST("ROR16ri", byteArr);
}

TEST_F(ModuleTest, ROR32r1) {
    uint8_t byteArr[] = { 0xd1, 0xc8 };
    IN_OUT_TEST("ROR32r1", byteArr);
}

TEST_F(ModuleTest, ROR32rCL) {
    uint8_t byteArr[] = { 0xd3, 0xcb };
    IN_OUT_TEST("ROR32rCL", byteArr);
}

TEST_F(ModuleTest, ROR32ri) {
    uint8_t byteArr[] = { 0xc1, 0xc9, 0x8 };
    IN_OUT_TEST("ROR32ri", byteArr);
}

TEST_F(ModuleTest, ROR8r1) {
    uint8_t byteArr[] = { 0xd0, 0xcc };
    IN_OUT_TEST("ROR8r1", byteArr);
}

TEST_F(ModuleTest, ROR8rCL) {
    uint8_t byteArr[] = { 0xd2, 0xcf };
    IN_OUT_TEST("ROR8rCL", byteArr);
}

TEST_F(ModuleTest, ROR8ri) {
    uint8_t byteArr[] = { 0xc0, 0xcd, 0x2 };
    IN_OUT_TEST("ROR8ri", byteArr);
}

TEST_F(ModuleTest, SAHF) {
    uint8_t byteArr[] = { 0x9e };
    IN_OUT_TEST("SAHF", byteArr);
}

TEST_F(ModuleTest, SBB16i16) {
    uint8_t byteArr[] = { 0x66, 0x1d, 0xee, 0xee };
    IN_OUT_TEST("SBB16i16", byteArr);
}

TEST_F(ModuleTest, SBB16ri) {
    uint8_t byteArr[] = { 0x66, 0x81, 0xdb, 0x44, 0x4 };
    IN_OUT_TEST("SBB16ri", byteArr);
}

TEST_F(ModuleTest, SBB16rr) {
    uint8_t byteArr[] = { 0x66, 0x19, 0xd1 };
    IN_OUT_TEST("SBB16rr", byteArr);
}

TEST_F(ModuleTest, SBB32i32) {
    uint8_t byteArr[] = { 0x1d, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("SBB32i32", byteArr);
}

TEST_F(ModuleTest, SBB32mr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xc7, 0x7, 0x21, 0x43, 0xcd, 0xab, 0xb8, 0x34, 0x12, 0x78, 0x56, 0x19, 0x7, 0x8b, 0x17, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("SBB32mr", byteArr);
}

TEST_F(ModuleTest, SBB32ri) {
    uint8_t byteArr[] = { 0x83, 0xd8, 0x44, 0x83, 0xd9, 0x43 };
    IN_OUT_TEST("SBB32ri", byteArr);
}

TEST_F(ModuleTest, SBB32rm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xc7, 0x7, 0xcd, 0xab, 0x34, 0x12, 0xb8, 0x34, 0x12, 0x78, 0x56, 0x1b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("SBB32rm", byteArr);
}

TEST_F(ModuleTest, SBB32rr) {
    uint8_t byteArr[] = { 0x19, 0xd1 };
    IN_OUT_TEST("SBB32rr", byteArr);
}

TEST_F(ModuleTest, SBB8i8) {
    uint8_t byteArr[] = { 0x1c, 0x5 };
    IN_OUT_TEST("SBB8i8", byteArr);
}

TEST_F(ModuleTest, SBB8ri) {
    uint8_t byteArr[] = { 0x80, 0xdc, 0x3 };
    IN_OUT_TEST("SBB8ri", byteArr);
}

TEST_F(ModuleTest, SBB8rr) {
    uint8_t byteArr[] = { 0x18, 0xf5 };
    IN_OUT_TEST("SBB8rr", byteArr);
}

TEST_F(ModuleTest, SETAr) {
    uint8_t byteArr[] = { 0xf, 0x97, 0xc0 };
    IN_OUT_TEST("SETAr", byteArr);
}

TEST_F(ModuleTest, SETBr) {
    uint8_t byteArr[] = { 0xf, 0x92, 0xc0 };
    IN_OUT_TEST("SETBr", byteArr);
}

TEST_F(ModuleTest, SETEr) {
    uint8_t byteArr[] = { 0xf, 0x94, 0xc0 };
    IN_OUT_TEST("SETEr", byteArr);
}

TEST_F(ModuleTest, SETGEr) {
    uint8_t byteArr[] = { 0xf, 0x9d, 0xc0 };
    IN_OUT_TEST("SETGEr", byteArr);
}

TEST_F(ModuleTest, SETGr) {
    uint8_t byteArr[] = { 0xf, 0x9f, 0xc0 };
    IN_OUT_TEST("SETGr", byteArr);
}

TEST_F(ModuleTest, SETLEr) {
    uint8_t byteArr[] = { 0xf, 0x9e, 0xc0 };
    IN_OUT_TEST("SETLEr", byteArr);
}

TEST_F(ModuleTest, SETLr) {
    uint8_t byteArr[] = { 0xf, 0x9c, 0xc0 };
    IN_OUT_TEST("SETLr", byteArr);
}

TEST_F(ModuleTest, SETNEm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xc7, 0x7, 0xc, 0x0, 0x0, 0x0, 0xf, 0x95, 0x7, 0x8b, 0x7, 0x31, 0xff };
    IN_OUT_TEST("SETNEm", byteArr);
}

TEST_F(ModuleTest, SETNEr) {
    uint8_t byteArr[] = { 0xf, 0x95, 0xc0 };
    IN_OUT_TEST("SETNEr", byteArr);
}

TEST_F(ModuleTest, SETSr) {
    uint8_t byteArr[] = { 0xf, 0x98, 0xc0 };
    IN_OUT_TEST("SETSr", byteArr);
}

TEST_F(ModuleTest, SHL16r1) {
    uint8_t byteArr[] = { 0x66, 0xd1, 0xe0 };
    IN_OUT_TEST("SHL16r1", byteArr);
}

TEST_F(ModuleTest, SHL16rCL) {
    uint8_t byteArr[] = { 0x66, 0xd3, 0xe0 };
    IN_OUT_TEST("SHL16rCL", byteArr);
}

TEST_F(ModuleTest, SHL16ri) {
    uint8_t byteArr[] = { 0x66, 0xc1, 0xe1, 0x8 };
    IN_OUT_TEST("SHL16ri", byteArr);
}

TEST_F(ModuleTest, SHL32r1) {
    uint8_t byteArr[] = { 0xd1, 0xe0 };
    IN_OUT_TEST("SHL32r1", byteArr);
}

TEST_F(ModuleTest, SHL32rCL) {
    uint8_t byteArr[] = { 0xd3, 0xe3 };
    IN_OUT_TEST("SHL32rCL", byteArr);
}

TEST_F(ModuleTest, SHL32ri) {
    uint8_t byteArr[] = { 0xc1, 0xe0, 0xa };
    IN_OUT_TEST("SHL32ri", byteArr);
}

TEST_F(ModuleTest, SHL8r1) {
    uint8_t byteArr[] = { 0xd0, 0xe4 };
    IN_OUT_TEST("SHL8r1", byteArr);
}

TEST_F(ModuleTest, SHL8rCL) {
    uint8_t byteArr[] = { 0xd2, 0xe7 };
    IN_OUT_TEST("SHL8rCL", byteArr);
}

TEST_F(ModuleTest, SHL8ri) {
    uint8_t byteArr[] = { 0xc0, 0xe5, 0x2 };
    IN_OUT_TEST("SHL8ri", byteArr);
}

TEST_F(ModuleTest, SHR16r1) {
    uint8_t byteArr[] = { 0x66, 0xd1, 0xe8 };
    IN_OUT_TEST("SHR16r1", byteArr);
}

TEST_F(ModuleTest, SHR16rCL) {
    uint8_t byteArr[] = { 0x66, 0xd3, 0xe8 };
    IN_OUT_TEST("SHR16rCL", byteArr);
}

TEST_F(ModuleTest, SHR16ri) {
    uint8_t byteArr[] = { 0x66, 0xc1, 0xe9, 0x8 };
    IN_OUT_TEST("SHR16ri", byteArr);
}

TEST_F(ModuleTest, SHR32r1) {
    uint8_t byteArr[] = { 0xd1, 0xe8 };
    IN_OUT_TEST("SHR32r1", byteArr);
}

TEST_F(ModuleTest, SHR32rCL) {
    uint8_t byteArr[] = { 0xd3, 0xeb };
    IN_OUT_TEST("SHR32rCL", byteArr);
}

TEST_F(ModuleTest, SHR32ri) {
    uint8_t byteArr[] = { 0xc1, 0xe8, 0x6 };
    IN_OUT_TEST("SHR32ri", byteArr);
}

TEST_F(ModuleTest, SHR8r1) {
    uint8_t byteArr[] = { 0xd0, 0xe8 };
    IN_OUT_TEST("SHR8r1", byteArr);
}

TEST_F(ModuleTest, SHR8rCL) {
    uint8_t byteArr[] = { 0xd2, 0xef };
    IN_OUT_TEST("SHR8rCL", byteArr);
}

TEST_F(ModuleTest, SHR8ri) {
    uint8_t byteArr[] = { 0xc0, 0xed, 0x2 };
    IN_OUT_TEST("SHR8ri", byteArr);
}

TEST_F(ModuleTest, SHRD32rri8) {
    uint8_t byteArr[] = { 0xf, 0xac, 0xd8, 0x10 };
    IN_OUT_TEST("SHRD32rri8", byteArr);
}

TEST_F(ModuleTest, STC) {
    uint8_t byteArr[] = { 0xf9 };
    IN_OUT_TEST("STC", byteArr);
}

TEST_F(ModuleTest, STD) {
    uint8_t byteArr[] = { 0xfd };
    IN_OUT_TEST("STD", byteArr);
}

TEST_F(ModuleTest, ST_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xd9, 0x17, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ST_F32m", byteArr);
}

TEST_F(ModuleTest, ST_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf0, 0xdd, 0x17, 0x8b, 0x7, 0x8b, 0x5f, 0x4, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ST_F64m", byteArr);
}

TEST_F(ModuleTest, ST_Frr) {
    uint8_t byteArr[] = { 0xdd, 0xd2 };
    IN_OUT_TEST("ST_Frr", byteArr);
}

TEST_F(ModuleTest, ST_PF32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0xd9, 0x1f, 0x8b, 0x7, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ST_PF32m", byteArr);
}

TEST_F(ModuleTest, ST_PF64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0xdd, 0x1f, 0x8b, 0x7, 0x8b, 0x5f, 0x4, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ST_PF64m", byteArr);
}

TEST_F(ModuleTest, ST_PF80m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf0, 0xc7, 0x7, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x47, 0x4, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x47, 0x8, 0x0, 0x0, 0x0, 0x0, 0xdb, 0x3f, 0x8b, 0x7, 0x8b, 0x5f, 0x4, 0x8b, 0x4f, 0x8, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("ST_PF80m", byteArr);
}

TEST_F(ModuleTest, ST_PFr) {
    uint8_t byteArr[] = { 0xdd, 0xda };
    IN_OUT_TEST("ST_PFr", byteArr);
}

TEST_F(ModuleTest, SUB16i16) {
    uint8_t byteArr[] = { 0x66, 0x2d, 0xee, 0xee };
    IN_OUT_TEST("SUB16i16", byteArr);
}

TEST_F(ModuleTest, SUB16mr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x5c, 0x24, 0xfc, 0xc7, 0x3, 0xc8, 0x0, 0x0, 0x0, 0xb9, 0x3, 0x0, 0x0, 0x0, 0x66, 0x29, 0xb, 0x8b, 0x1b };
    IN_OUT_TEST("SUB16mr", byteArr);
}

TEST_F(ModuleTest, SUB16ri) {
    uint8_t byteArr[] = { 0x66, 0x81, 0xeb, 0x44, 0x4 };
    IN_OUT_TEST("SUB16ri", byteArr);
}

TEST_F(ModuleTest, SUB16rm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0xc7, 0x1, 0xc8, 0x0, 0x0, 0x0, 0xba, 0x3, 0x0, 0x0, 0x0, 0x66, 0x2b, 0x11, 0x8b, 0x11, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("SUB16rm", byteArr);
}

TEST_F(ModuleTest, SUB32i32) {
    uint8_t byteArr[] = { 0x2d, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("SUB32i32", byteArr);
}

TEST_F(ModuleTest, SUB32ri) {
    uint8_t byteArr[] = { 0x81, 0xeb, 0x44, 0x44, 0x4, 0x0 };
    IN_OUT_TEST("SUB32ri", byteArr);
}

TEST_F(ModuleTest, SUB32rr) {
    uint8_t byteArr[] = { 0x29, 0xc3 };
    IN_OUT_TEST("SUB32rr", byteArr);
}

TEST_F(ModuleTest, SUB8i8) {
    uint8_t byteArr[] = { 0x2c, 0x5 };
    IN_OUT_TEST("SUB8i8", byteArr);
}

TEST_F(ModuleTest, SUB8mr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xfc, 0xc7, 0x0, 0xc8, 0x0, 0x0, 0x0, 0xbb, 0x2, 0x0, 0x0, 0x0, 0x28, 0x18, 0x8b, 0x0 };
    IN_OUT_TEST("SUB8mr", byteArr);
}

TEST_F(ModuleTest, SUB8ri) {
    uint8_t byteArr[] = { 0x80, 0xec, 0x3 };
    IN_OUT_TEST("SUB8ri", byteArr);
}

TEST_F(ModuleTest, SUB8rm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x44, 0x24, 0xfc, 0xc7, 0x0, 0xc8, 0x0, 0x0, 0x0, 0xbb, 0x2, 0x0, 0x0, 0x0, 0x2a, 0x18, 0x8b, 0x0 };
    IN_OUT_TEST("SUB8rm", byteArr);
}

TEST_F(ModuleTest, SUBR_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xd9, 0x17, 0xd8, 0x2f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("SUBR_F32m", byteArr);
}

TEST_F(ModuleTest, SUBR_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf8, 0xc7, 0x7, 0x18, 0x2d, 0x44, 0x54, 0xc7, 0x47, 0x4, 0xfb, 0x21, 0x9, 0x40, 0xdc, 0x2f, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("SUBR_F64m", byteArr);
}

TEST_F(ModuleTest, SUBR_FST0r) {
    uint8_t byteArr[] = { 0xd8, 0xe9 };
    IN_OUT_TEST("SUBR_FST0r", byteArr);
}

TEST_F(ModuleTest, SUBR_FrST0) {
    uint8_t byteArr[] = { 0xdc, 0xe1 };
    IN_OUT_TEST("SUBR_FrST0", byteArr);
}

TEST_F(ModuleTest, SUBSDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xc7, 0x1, 0x0, 0x0, 0x0, 0x0, 0xc7, 0x41, 0x4, 0x0, 0x0, 0x4, 0x40, 0xf2, 0xf, 0x5c, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("SUBSDrm", byteArr);
}

TEST_F(ModuleTest, SUBSDrr) {
    uint8_t byteArr[] = { 0xf2, 0xf, 0x5c, 0xc1 };
    IN_OUT_TEST("SUBSDrr", byteArr);
}

TEST_F(ModuleTest, SUBSSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0xc7, 0x1, 0x0, 0x0, 0xc0, 0x3f, 0xf3, 0xf, 0x5c, 0x1, 0x8b, 0x9 };
    IN_OUT_TEST("SUBSSrm", byteArr);
}

TEST_F(ModuleTest, SUBSSrr) {
    uint8_t byteArr[] = { 0xf3, 0xf, 0x5c, 0xc1 };
    IN_OUT_TEST("SUBSSrr", byteArr);
}

TEST_F(ModuleTest, SUB_F32m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xd9, 0x17, 0xd8, 0x27, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("SUB_F32m", byteArr);
}

TEST_F(ModuleTest, SUB_F64m) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xf4, 0xdd, 0x1f, 0xdc, 0x27, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("SUB_F64m", byteArr);
}

TEST_F(ModuleTest, SUB_FST0r) {
    uint8_t byteArr[] = { 0xd8, 0xe1 };
    IN_OUT_TEST("SUB_FST0r", byteArr);
}

TEST_F(ModuleTest, SUB_FrST0) {
    uint8_t byteArr[] = { 0xdc, 0xe9 };
    IN_OUT_TEST("SUB_FrST0", byteArr);
}

TEST_F(ModuleTest, Sar32RI1) {
    uint8_t byteArr[] = { 0xc1, 0xfb, 0x3 };
    IN_OUT_TEST("Sar32RI1", byteArr);
}

TEST_F(ModuleTest, Sar32RI2) {
    uint8_t byteArr[] = { 0xc1, 0xfb, 0x0 };
    IN_OUT_TEST("Sar32RI2", byteArr);
}

TEST_F(ModuleTest, Sbb32RR1) {
    uint8_t byteArr[] = { 0x19, 0xca };
    IN_OUT_TEST("Sbb32RR1", byteArr);
}

TEST_F(ModuleTest, Sbb32RR2) {
    uint8_t byteArr[] = { 0x19, 0xca };
    IN_OUT_TEST("Sbb32RR2", byteArr);
}

TEST_F(ModuleTest, TEST16i16) {
    uint8_t byteArr[] = { 0x66, 0xa9, 0xee, 0xee };
    IN_OUT_TEST("TEST16i16", byteArr);
}

TEST_F(ModuleTest, TEST16ri) {
    uint8_t byteArr[] = { 0x66, 0xf7, 0xc3, 0x44, 0x4 };
    IN_OUT_TEST("TEST16ri", byteArr);
}

TEST_F(ModuleTest, TEST16rr) {
    uint8_t byteArr[] = { 0x66, 0x85, 0xd1 };
    IN_OUT_TEST("TEST16rr", byteArr);
}

TEST_F(ModuleTest, TEST32i32) {
    uint8_t byteArr[] = { 0xa9, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("TEST32i32", byteArr);
}

TEST_F(ModuleTest, TEST32ri) {
    uint8_t byteArr[] = { 0xf7, 0xc3, 0x44, 0x44, 0x4, 0x0 };
    IN_OUT_TEST("TEST32ri", byteArr);
}

TEST_F(ModuleTest, TEST32rr) {
    uint8_t byteArr[] = { 0x85, 0xd1 };
    IN_OUT_TEST("TEST32rr", byteArr);
}

TEST_F(ModuleTest, TEST8i8) {
    uint8_t byteArr[] = { 0xa8, 0x5 };
    IN_OUT_TEST("TEST8i8", byteArr);
}

TEST_F(ModuleTest, TEST8ri) {
    uint8_t byteArr[] = { 0xf6, 0xc4, 0x3 };
    IN_OUT_TEST("TEST8ri", byteArr);
}

TEST_F(ModuleTest, TEST8rr) {
    uint8_t byteArr[] = { 0x84, 0xf5 };
    IN_OUT_TEST("TEST8rr", byteArr);
}

TEST_F(ModuleTest, Test32RR1) {
    uint8_t byteArr[] = { 0x85, 0xdb };
    IN_OUT_TEST("Test32RR1", byteArr);
}

TEST_F(ModuleTest, Test32RR2) {
    uint8_t byteArr[] = { 0x85, 0xc7 };
    IN_OUT_TEST("Test32RR2", byteArr);
}

TEST_F(ModuleTest, UCOMISDrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xf8, 0xf2, 0xf, 0x11, 0x9, 0xf, 0x2e, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("UCOMISDrm", byteArr);
}

TEST_F(ModuleTest, UCOMISDrr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0x2e, 0xc1 };
    IN_OUT_TEST("UCOMISDrr", byteArr);
}

TEST_F(ModuleTest, UCOMISSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xfc, 0xf3, 0xf, 0x11, 0x9, 0xf, 0x2e, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("UCOMISSrm", byteArr);
}

TEST_F(ModuleTest, UCOMISSrr) {
    uint8_t byteArr[] = { 0xf, 0x2e, 0xc1 };
    IN_OUT_TEST("UCOMISSrr", byteArr);
}

TEST_F(ModuleTest, UNPCKLPSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0xf, 0x14, 0x1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("UNPCKLPSrm", byteArr);
}

TEST_F(ModuleTest, UNPCKLPSrr) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xd0, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0xdd, 0xcc, 0xbb, 0xaa, 0xc7, 0x41, 0x4, 0x22, 0x11, 0xff, 0xee, 0xc7, 0x41, 0x8, 0x66, 0x55, 0x44, 0x33, 0xc7, 0x41, 0xc, 0x0, 0x99, 0x88, 0x77, 0xf3, 0xf, 0x6f, 0x1, 0xc7, 0x1, 0x33, 0x22, 0x11, 0x0, 0xc7, 0x41, 0x4, 0x77, 0x66, 0x55, 0x44, 0xc7, 0x41, 0x8, 0xbb, 0xaa, 0x99, 0x88, 0xc7, 0x41, 0xc, 0xff, 0xee, 0xdd, 0xcc, 0xf3, 0xf, 0x6f, 0x9, 0xf, 0x14, 0xc1, 0xb9, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("UNPCKLPSrr", byteArr);
}

TEST_F(ModuleTest, XADD16rr) {
    uint8_t byteArr[] = { 0x66, 0xf, 0xc1, 0xd0 };
    IN_OUT_TEST("XADD16rr", byteArr);
}

TEST_F(ModuleTest, XADD32rm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x7c, 0x24, 0xfc, 0xc7, 0x7, 0x21, 0x43, 0xcd, 0xab, 0xb8, 0x34, 0x12, 0x78, 0x56, 0xf, 0xc1, 0x7, 0x8b, 0x17, 0xbf, 0x0, 0x0, 0x0, 0x0 };
    IN_OUT_TEST("XADD32rm", byteArr);
}

TEST_F(ModuleTest, XADD32rr) {
    uint8_t byteArr[] = { 0xf, 0xc1, 0xcb };
    IN_OUT_TEST("XADD32rr", byteArr);
}

TEST_F(ModuleTest, XADD8rr) {
    uint8_t byteArr[] = { 0xf, 0xc0, 0xd8 };
    IN_OUT_TEST("XADD8rr", byteArr);
}

TEST_F(ModuleTest, XCHG16ar) {
    uint8_t byteArr[] = { 0x66, 0x93 };
    IN_OUT_TEST("XCHG16ar", byteArr);
}

TEST_F(ModuleTest, XCHG16rr) {
    uint8_t byteArr[] = { 0x66, 0x87, 0xda };
    IN_OUT_TEST("XCHG16rr", byteArr);
}

TEST_F(ModuleTest, XCHG32ar) {
    uint8_t byteArr[] = { 0x93 };
    IN_OUT_TEST("XCHG32ar", byteArr);
}

TEST_F(ModuleTest, XCHG32rr) {
    uint8_t byteArr[] = { 0x87, 0xd9 };
    IN_OUT_TEST("XCHG32rr", byteArr);
}

TEST_F(ModuleTest, XCHG8rr) {
    uint8_t byteArr[] = { 0x86, 0xd9 };
    IN_OUT_TEST("XCHG8rr", byteArr);
}

TEST_F(ModuleTest, XOR16i16) {
    uint8_t byteArr[] = { 0x66, 0x35, 0xee, 0xee };
    IN_OUT_TEST("XOR16i16", byteArr);
}

TEST_F(ModuleTest, XOR16ri) {
    uint8_t byteArr[] = { 0x66, 0x81, 0xf3, 0x44, 0x4 };
    IN_OUT_TEST("XOR16ri", byteArr);
}

TEST_F(ModuleTest, XOR16rr) {
    uint8_t byteArr[] = { 0x66, 0x31, 0xd1 };
    IN_OUT_TEST("XOR16rr", byteArr);
}

TEST_F(ModuleTest, XOR32i32) {
    uint8_t byteArr[] = { 0x35, 0xff, 0xff, 0xff, 0x6f };
    IN_OUT_TEST("XOR32i32", byteArr);
}

TEST_F(ModuleTest, XOR32ri) {
    uint8_t byteArr[] = { 0x81, 0xf3, 0x45, 0x23, 0x1, 0x0 };
    IN_OUT_TEST("XOR32ri", byteArr);
}

TEST_F(ModuleTest, XOR32rr) {
    uint8_t byteArr[] = { 0x31, 0xc0 };
    IN_OUT_TEST("XOR32rr", byteArr);
}

TEST_F(ModuleTest, XOR8i8) {
    uint8_t byteArr[] = { 0x34, 0x5 };
    IN_OUT_TEST("XOR8i8", byteArr);
}

TEST_F(ModuleTest, XOR8ri) {
    uint8_t byteArr[] = { 0x80, 0xf4, 0x3 };
    IN_OUT_TEST("XOR8ri", byteArr);
}

TEST_F(ModuleTest, XOR8rr) {
    uint8_t byteArr[] = { 0x30, 0xf5 };
    IN_OUT_TEST("XOR8rr", byteArr);
}

TEST_F(ModuleTest, XORPSrm) {
    uint8_t byteArr[] = { 0x48, 0x8d, 0x4c, 0x24, 0xef, 0x48, 0x83, 0xe1, 0xf0, 0xc7, 0x1, 0x12, 0xef, 0xcd, 0xab, 0xc7, 0x41, 0x4, 0xaa, 0xaa, 0xaa, 0xaa, 0xc7, 0x41, 0x8, 0xef, 0xbe, 0xad, 0xde, 0xc7, 0x41, 0xc, 0x1, 0x1e, 0xeb, 0xfe, 0xf, 0x57, 0x1, 0x8b, 0x9, 0x31, 0xc9 };
    IN_OUT_TEST("XORPSrm", byteArr);
}

TEST_F(ModuleTest, XORPSrr) {
    uint8_t byteArr[] = { 0xf, 0x57, 0xc1 };
    IN_OUT_TEST("XORPSrr", byteArr);
}
// End Definitions


TEST_F(ModuleTest, StructureLayout) {
  //test and make sure that the layout of the RegState matches between
  //our EE and our structure definition
  FunctionType  *FT = getBaseFunctionType(this->M);
  Constant      *FC = this->M->getOrInsertFunction(("aligntest"), FT);
  Function      *F = dyn_cast<Function>(FC);
  Value         *arg = F->arg_begin(); 

  assert(F != NULL);

  BasicBlock  *block = BasicBlock::Create(F->getContext(), "B", F);

  //write patterns we recognize into the structure
  
#define PATTERN_TO_OFF(p, b, o) { \
  Value *gepV[] =  \
    { ConstantInt::get(Type::getInt64Ty(block->getContext()), 0), \
      ConstantInt::get(Type::getInt32Ty(block->getContext()), o)}; \
  Instruction *vgep = GetElementPtrInst::CreateInBounds(arg, gepV, "", block);\
  Value *c = ConstantInt::get(IntegerType::get(block->getContext(), b), p);\
  Value *st = new StoreInst(c, vgep, block);\
  assert(st != NULL); }

#define PATTERN_TO_OFF2(p, o1, o2) { \
  Value *gepV[] =  \
    { ConstantInt::get(Type::getInt64Ty(block->getContext()), 0), \
      ConstantInt::get(Type::getInt32Ty(block->getContext()), o1), \
      ConstantInt::get(Type::getInt64Ty(block->getContext()), o2)}; \
  Instruction *vgep = GetElementPtrInst::CreateInBounds(arg, gepV, "", block);\
  Value *c = ConstantInt::get(Type::getInt64Ty(block->getContext()), p);\
  Value *st = new StoreInst(c, vgep, block);\
  assert(st != NULL); }


  PATTERN_TO_OFF(6543, 64, 0);
  PATTERN_TO_OFF(6540, 64, 1);
  PATTERN_TO_OFF(6530, 64, 2);
  PATTERN_TO_OFF(6528, 64, 3);
  PATTERN_TO_OFF(6400, 64, 4);
  PATTERN_TO_OFF(6129, 64, 5);
  PATTERN_TO_OFF(5981, 64, 6);
  PATTERN_TO_OFF(4129, 64, 7);

  PATTERN_TO_OFF(1, 1, 17);
  PATTERN_TO_OFF(0, 1, 18);
  PATTERN_TO_OFF(1, 1, 19);
  PATTERN_TO_OFF(0, 1, 20);
  PATTERN_TO_OFF(1, 1, 21);
  PATTERN_TO_OFF(0, 1, 22);
  PATTERN_TO_OFF(1, 1, 23);

  PATTERN_TO_OFF(0, 1, 25);

  ReturnInst::Create(block->getContext(), block);

#undef PATTERN_TO_OFF
#undef PATTERN_TO_OFF2

  //make a context that is 0-filled
  mcsema::RegState  inState;
  mcsema::RegState  outState;

  memset(&inState, 0, sizeof(mcsema::RegState));
  memset(&outState, 0, sizeof(mcsema::RegState));
#ifdef __x86_64__
  outState.RAX = 6543;
  outState.RBX = 6540;
  outState.RCX = 6530;
  outState.RDX = 6528;
  outState.RSI = 6400;
  outState.RDI = 6129;
  outState.RSP = 5981;
  outState.RBP = 4129;
#else
  outState.EAX = 6543;
  outState.EBX = 6540;
  outState.ECX = 6530;
  outState.EDX = 6528;
  outState.ESI = 6400;
  outState.EDI = 6129;
  outState.ESP = 5981;
  outState.EBP = 4129;
#endif

  outState.CF = 1;
  outState.PF = 0;
  outState.AF = 1;
  outState.ZF = 0;
  outState.SF = 1;
  outState.OF = 0;
  outState.DF = 1;

  outState.FPU_FLAGS.BUSY = 0;

  //evaluate the funciton in an EE
  this->runFunctionOnState(&inState, F);

  //check and see if the register effects match up
  EXPECT_EQ(inState, outState);

}


