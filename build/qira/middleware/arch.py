# (regname, regsize, is_big_endian, arch_name, branches)

# PowerPC CPU REGS
PPCREGS = [[], 4, True, "ppc", ["bl "]]
for i in range(32):
  PPCREGS[0].append("r"+str(i))
for i in range(32):
  PPCREGS[0].append(None)
PPCREGS[0].append("lr")
PPCREGS[0].append("ctr")
for i in range(8):
  PPCREGS[0].append("cr"+str(i))

# Aarch64 CPU REGS
AARCH64REGS = [[], 8, False, "aarch64", ["bl ", "blx "]]
for i in range(8):
  AARCH64REGS[0].append(None)
for i in range(32):
  AARCH64REGS[0].append("x"+str(i))
#AARCH64REGS[0][8+29] = "fp"
AARCH64REGS[0][8+31] = "sp"
AARCH64REGS[0].append("pc")

# MIPS CPU REGS
MIPSREGLIST = ['$zero', '$at', '$v0', '$v1', '$a0', '$a1', '$a2', '$a3']
for i in range(8):
  MIPSREGLIST.append('$t'+str(i))
for i in range(8):
  MIPSREGLIST.append('$s'+str(i))
MIPSREGLIST.append('$t8')
MIPSREGLIST.append('$t9')
MIPSREGLIST.append('$k0')
MIPSREGLIST.append('$k1')
MIPSREGLIST.append('$gp')
MIPSREGLIST.append('$sp')
MIPSREGLIST.append('$fp')
MIPSREGLIST.append('$ra')
MIPSREGLIST.append('$pc')
MIPSREGS = [MIPSREGLIST, 4, True, "mips", ["jal\t","jr\t","jal","jr"]]

# ARM CPU REGS
ARMREGS = [['R0','R1','R2','R3','R4','R5','R6','R7','R8','R9','R10','R11','IP','SP','LR','PC'], 4, False, "arm"] # FP = R7 If THUMB2 Mode enabled, & R11 If not.

# Intel x86 CPU REGS
X86REGS = [['EAX', 'ECX', 'EDX', 'EBX', 'ESP', 'EBP', 'ESI', 'EDI', 'EIP'], 4, False, "i386"]

# x86_64 CPU REGS
X64REGS = [['RAX', 'RCX', 'RDX', 'RBX', 'RSP', 'RBP', 'RSI', 'RDI', "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15", 'RIP'], 8, False, "x86-64"]

