BITS 64
section .text

global doTest
doTest:
mov qword [internal_saveregs+0x00], rax
mov qword [internal_saveregs+0x08], rcx
mov qword [internal_saveregs+0x10], rdx
mov qword [internal_saveregs+0x18], rbx
mov qword [internal_saveregs+0x20], rsp
mov qword [internal_saveregs+0x28], rbp
mov qword [internal_saveregs+0x30], rsi
mov qword [internal_saveregs+0x38], rdi
push rax
PUSHF 
pop rax
mov qword [internal_saveregs+0x40], rax
pop rax
FNSAVE [internal_savefpu_precall]

    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT

    ;TEST: ADC16i16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC16i16
mov ax, 0x55
mov rsi, 0x18230300
adc ax, 0xeee
mov rsi, 0x18230300


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Adc16RI
mov ax, 0xf012
mov rsi, 0x18230301
adc ax, 0x1234
mov rsi, 0x18230301


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC16rr
mov cx, 0xabc
mov dx, 0xdef
mov rsi, 0x18230302
adc cx, dx
mov rsi, 0x18230302


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC32i32
mov eax, 0x778
mov rsi, 0x18230303
adc eax, 0x6fffffff
mov rsi, 0x18230303


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC32ri
mov ebx, 0x6789
mov rsi, 0x18230304
adc ebx, 0x44444
mov rsi, 0x18230304


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Adc32RR
mov eax, 0x1234abcd
mov edx, 0x2345bcde
mov rsi, 0x18230305
adc eax, edx
mov rsi, 0x18230305


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC64i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC32i32
mov rax, 0x778
mov rsi, 0x18230306
adc rax, 0x6fffffff
mov rsi, 0x18230306


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC64ri32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC64ri32
mov rbx, 0x6789
mov rsi, 0x18230307
adc rbx, 0x44444
mov rsi, 0x18230307


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC64rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Adc64RR
mov rax, 0xdead1234abcd
mov rdx, 0xdead2345bcde
mov rsi, 0x18230308
adc rax, rdx
mov rsi, 0x18230308


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC8i8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC8i8
mov al, 0xbb
mov rsi, 0x18230309
adc al, 0x5
mov rsi, 0x18230309


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC8ri
mov ah, 0xaa
mov rsi, 0x1823030a
adc ah, 0x3
mov rsi, 0x1823030a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADC8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADC8rr
mov ch, 0xc
mov dh, 0x10
mov rsi, 0x1823030b
adc ch, dh
mov rsi, 0x1823030b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD16i16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD16i16
mov ax, 0x4
mov rsi, 0x1823030c
add ax, 0xeeee
mov rsi, 0x1823030c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD16ri
mov bx, 0x4
mov rsi, 0x1823030d
add bx, 0x444
mov rsi, 0x1823030d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD16rm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD16rm
mov rsi, 0x1823030e
lea rax, [rsp-0x10]
mov DWORD [rax], 0x1000
mov bx, 0x2
add bx, [rax]
mov eax, [rax]
mov rsi, 0x1823030e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD16rr
mov cx, 0x4
mov dx, 0x5
mov rsi, 0x1823030f
add cx, dx
mov rsi, 0x1823030f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD32i32
mov eax, 0x4
mov rsi, 0x18230310
add eax, 0x6fffffff
mov rsi, 0x18230310


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Add32RI
mov eax, 0x2
mov rsi, 0x18230311
add eax, 0x11111
mov rsi, 0x18230311


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD32rr
mov ecx, 0x7fffffff
mov edx, 0x6ffeeeee
mov rsi, 0x18230312
add ecx, edx
mov rsi, 0x18230312


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD64i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD64i32
mov rax, 0x4
mov rsi, 0x18230313
add rax, 0x6fffffff
mov rsi, 0x18230313


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD64ri32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Add64RI32
mov rax, 0x2
mov rsi, 0x18230314
add rax, 0x7f1111
mov rsi, 0x18230314


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD64ri8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Add64RI8
mov rax, 0x2
mov rsi, 0x18230315
add rax, 0x7
mov rsi, 0x18230315


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD64rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD64rr
mov rcx, 0x7fffffff
mov rdx, 0x6ffeeeeee
mov rsi, 0x18230316
add rcx, rdx
mov rsi, 0x18230316


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD64rr_DB
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD64rr_DB
mov rcx, 0x7fffffff
mov rdx, 0x6ffeeeeee
mov rsi, 0x18230317
add rcx, rdx
mov rsi, 0x18230317


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD8i8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD8i8
mov al, 0x4
mov rsi, 0x18230318
add al, 0x5
mov rsi, 0x18230318


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD8ri
mov ah, 0x20
mov rsi, 0x18230319
add ah, 0x3
mov rsi, 0x18230319


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ADD8rr
mov ch, 0x2
mov dh, 0x3
mov rsi, 0x1823031a
add ch, dh
mov rsi, 0x1823031a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADDSDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a double precision float and store in xmm0
mov ecx, 1
cvtsi2sd xmm0, ecx

mov rsi, 0x1823031b
; load 2.5 (in double precision float form)
lea rcx, [rsp-8]
mov DWORD [rcx], 0
mov DWORD [rcx+4], 0x40040000

addsd xmm0, [rcx]
mov ecx, [rcx]
mov rsi, 0x1823031b

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADDSDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a double precision float and store in xmm0
mov ecx, 1
cvtsi2sd xmm0, ecx

; convert 2 to a double precision float and store in xmm1
mov ecx, 2
cvtsi2sd xmm1, ecx

mov rsi, 0x1823031c
addsd xmm0, xmm1
mov rsi, 0x1823031c

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADDSSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a double precision float and store in xmm0
mov ecx, 1
cvtsi2ss xmm0, ecx

mov rsi, 0x1823031d
; load 1.5 (in double precision float form)
lea rcx, [rsp-4]
mov DWORD [rcx], 0x3fc00000

addss xmm0, [rcx]
mov ecx, [rcx]
mov rsi, 0x1823031d

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADDSSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 3 to a double precision float and store in xmm0
mov ecx, 3
cvtsi2ss xmm0, ecx

; convert 1 to a double precision float and store in xmm1
mov ecx, 1
cvtsi2ss xmm1, ecx

mov rsi, 0x1823031e
addss xmm0, xmm1
mov rsi, 0x1823031e

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
lea rdi, [rsp-0x8]
mov qword [rdi], 0x40490fdb
fld qword [rdi]
mov rsi, 0x1823031f
lea rdi, [rsp-0x8]
mov qword [rdi], 0x40490fdb
FADD qword [rdi]
mov rdi, 0
mov rsi, 0x1823031f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ADD_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 1.0
FLD1
mov rsi, 0x18230320
lea rdi, [rsp-08]
; 3.1415926 or there about
mov dword [rdi+00], 0x54442d18
mov dword [rdi+04], 0x400921fb
FADD qword [rdi]
mov rdi, 0
mov rsi, 0x18230320

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND16i16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND16i16
mov ax, 0x7
mov rsi, 0x18230321
and ax, 0xeeee
mov rsi, 0x18230321


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND16mi
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND16mi
mov rsi, 0x18230322
lea rax, [rsp-0x4]
mov DWORD [rax], 0x44
and WORD [rax], 0x44
mov eax, 0x0
mov rsi, 0x18230322


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND16mr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND16mr
mov rsi, 0x18230323
lea rax, [rsp-0x4]
mov DWORD [rax], 0x5555
mov ebx, 0x7777
and WORD [rax], bx
mov eax, 0x0
mov rsi, 0x18230323


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND16ri
mov bx, 0x7
mov rsi, 0x18230324
and bx, 0x444
mov rsi, 0x18230324


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND16rr
mov cx, 0x0
mov dx, 0x1
mov rsi, 0x18230325
and cx, dx
mov rsi, 0x18230325


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND32i32
mov eax, 0x7
mov rsi, 0x18230326
and eax, 0x6fffffff
mov rsi, 0x18230326


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND32mr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND32mr
mov rsi, 0x18230327
lea rax, [rsp-0x4]
mov DWORD [rax], 0x55555
mov ebx, 0x77777
and DWORD [rax], ebx
mov eax, 0x0
mov rsi, 0x18230327


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND32ri
mov ebx, 0x7
mov rsi, 0x18230328
and ebx, 0x44444
mov rsi, 0x18230328


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND32rr
mov ecx, 0x0
mov edx, 0x1
mov rsi, 0x18230329
and ecx, edx
mov rsi, 0x18230329


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND8i8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND8i8
mov al, 0xa
mov rsi, 0x1823032a
and al, 0x5
mov rsi, 0x1823032a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND8mi
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND8mi
mov rsi, 0x1823032b
lea rbx, [rsp-0x4]
mov DWORD [rbx], 0x55
and BYTE [rbx], 0x44
mov ebx, 0x0
mov rsi, 0x1823032b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND8mr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND8mr
mov rsi, 0x1823032c
lea rax, [rsp-0x4]
mov DWORD [rax], 0x55
mov ebx, 0x77
and BYTE [rax], bl
mov eax, 0x0
mov rsi, 0x1823032c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND8ri
mov ah, 0xcd
mov rsi, 0x1823032d
and ah, 0x3
mov rsi, 0x1823032d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: AND8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; AND8rr
mov ch, 0xa
mov dh, 0xe8
mov rsi, 0x1823032e
and ch, dh
mov rsi, 0x1823032e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: BSR16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_CF|FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF
;TEST_FILE_META_END
; BSR16rr
mov ax, 0x0800
mov rsi, 0x1823032f
bsr bx, ax
mov rsi, 0x1823032f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: BSR32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_CF|FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF
;TEST_FILE_META_END
; BSR32rr
mov eax, 0x08000000
mov rsi, 0x18230330
bsr ebx, eax
mov rsi, 0x18230330

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: BSR32rr_2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_CF|FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF
;TEST_FILE_META_END
; BSR32rr; test special case zero source op
mov eax, 0x00000000
mov rsi, 0x18230331
bsr ebx, eax
mov rsi, 0x18230331


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: BSWAP32r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Bswap32R
mov eax, 0x56781234
mov rsi, 0x18230332
bswap eax
mov rsi, 0x18230332


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: BT16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF
;TEST_FILE_META_END
; BT16rr
mov ax, 0x0800
mov bx, 11
clc ; clear carry since we will set it
mov rsi, 0x18230333
bt ax, bx
mov rsi, 0x18230333



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: BT32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_PF|FLAG_SF|FLAG_AF
;TEST_FILE_META_END
; BT32rr
mov eax, 0x08000000
mov ebx, 27
clc ; clear carry since we will set it
mov rsi, 0x18230334
bt eax, ebx
mov rsi, 0x18230334


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CDQ
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CDQ
mov rsi, 0x18230335
cdq
mov rsi, 0x18230335


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CLC
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Clc
mov rsi, 0x18230336
clc
mov rsi, 0x18230336


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CLD
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Cld
mov rsi, 0x18230337
cld
mov rsi, 0x18230337


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVA16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Cmova16RR
mov ax, 0x33
mov dx, 0x44
mov rsi, 0x18230338
cmova ax, dx
mov rsi, 0x18230338


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVA32rm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVA32rm
mov rsi, 0x18230339
lea rdi, [rsp-0x4]
mov DWORD [rdi], 0x3
cmova eax, [rdi]
mov rdi, 0x0
mov rsi, 0x18230339


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVA32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Cmova32RR
mov eax, 0x3333
mov ecx, 0x4444
mov rsi, 0x1823033a
cmova eax, ecx
mov rsi, 0x1823033a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVAE16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVAE16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x1823033b
cmovae ax, bx
mov rsi, 0x1823033b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVAE32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVAE32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x1823033c
cmovae ecx, edx
mov rsi, 0x1823033c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVB16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVB16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x1823033d
cmovb ax, bx
mov rsi, 0x1823033d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVB32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVB32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x1823033e
cmovb ecx, edx
mov rsi, 0x1823033e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVBE16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVBE16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x1823033f
cmovbe ax, bx
mov rsi, 0x1823033f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVBE32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVBE32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230340
cmovbe ecx, edx
mov rsi, 0x18230340


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVE16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVE16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230341
cmove ax, bx
mov rsi, 0x18230341


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVE32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVE32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230342
cmove ecx, edx
mov rsi, 0x18230342


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVG16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVG16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230343
cmovg ax, bx
mov rsi, 0x18230343


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVG32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVG32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230344
cmovg ecx, edx
mov rsi, 0x18230344


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVGE16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVGE16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230345
cmovge ax, bx
mov rsi, 0x18230345


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVGE32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVGE32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230346
cmovge ecx, edx
mov rsi, 0x18230346


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVL16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVL16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230347
cmovl ax, bx
mov rsi, 0x18230347


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVL32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVL32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230348
cmovl ecx, edx
mov rsi, 0x18230348


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVLE16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVLE16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230349
cmovle ax, bx
mov rsi, 0x18230349


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVLE32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVLE32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x1823034a
cmovle ecx, edx
mov rsi, 0x1823034a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVNE16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVNE16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x1823034b
cmovne ax, bx
mov rsi, 0x1823034b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVNE32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVNE32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x1823034c
cmovne ecx, edx
mov rsi, 0x1823034c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVNO16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVNO16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x1823034d
cmovno ax, bx
mov rsi, 0x1823034d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVNO32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVNO32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x1823034e
cmovno ecx, edx
mov rsi, 0x1823034e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVNP16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVNP16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x1823034f
cmovnp ax, bx
mov rsi, 0x1823034f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVNP32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVNP32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230350
cmovnp ecx, edx
mov rsi, 0x18230350


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVNS16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVNS16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230351
cmovns ax, bx
mov rsi, 0x18230351


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVNS32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVNS32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230352
cmovns ecx, edx
mov rsi, 0x18230352


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVO16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVO16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230353
cmovo ax, bx
mov rsi, 0x18230353


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVO32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVO32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230354
cmovo ecx, edx
mov rsi, 0x18230354


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVP16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVP16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230355
cmovp ax, bx
mov rsi, 0x18230355


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVP32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVP32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230356
cmovp ecx, edx
mov rsi, 0x18230356


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVS16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVS16rr
mov ax, 0x2
mov bx, 0x4
mov rsi, 0x18230357
cmovs ax, bx
mov rsi, 0x18230357


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMOVS32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMOVS32rr
mov ecx, 0x44
mov edx, 0x88
mov rsi, 0x18230358
cmovs ecx, edx
mov rsi, 0x18230358


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMP16mi
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMP16mi
mov rsi, 0x18230359
lea rax, [rsp-0x4]
mov DWORD [rax], 0x200
cmp WORD [rax], 0x222
mov eax, 0x0
mov rsi, 0x18230359


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMP16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMP16rr
mov cx, 0x4
mov dx, 0x7
mov rsi, 0x1823035a
cmp cx, dx
mov rsi, 0x1823035a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMP32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMP32i32
mov eax, 0x6ffffffe
mov rsi, 0x1823035b
cmp eax, 0x6fffffff
mov rsi, 0x1823035b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMP32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMP32ri
mov ebx, 0x44
mov rsi, 0x1823035c
cmp ebx, 0x44444
mov rsi, 0x1823035c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMP32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMP32rr
mov ecx, 0x4
mov edx, 0x2
mov rsi, 0x1823035d
cmp ecx, edx
mov rsi, 0x1823035d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMP8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMP8rr
mov ch, 0x2
mov dh, 0x3
mov rsi, 0x1823035e
cmp ch, dh
mov rsi, 0x1823035e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMPXCHG16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMPXCHG16r
mov bx, 0x667
mov bp, 0x888
mov rsi, 0x1823035f
cmpxchg bx, bp
mov rsi, 0x1823035f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMPXCHG32rm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMPXCHG32rm
mov rsi, 0x18230360
lea rdi, [rsp-0x10]
mov DWORD [rdi], 0xabcd4321
mov eax, 0xabcd4321
cmpxchg [rdi], ecx
mov edx, [rdi]
mov rdi, 0x0
mov rsi, 0x18230360


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMPXCHG32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Cmpxchg32RR
mov eax, 0x68244256
mov edx, 0x54316785
mov ecx, 0x23423423
mov rsi, 0x18230361
cmpxchg edx, ecx
mov rsi, 0x18230361


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CMPXCHG8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; CMPXCHG8rr
mov bh, 0x66
mov ch, 0x88
mov rsi, 0x18230362
cmpxchg bh, ch
mov rsi, 0x18230362


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTPS2PDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov ecx, 2
cvtsi2ss xmm0, ecx

mov rax, rsp
sub rax, 16
and rax, -16
xchg rax, rsp
movaps [rsp], xmm0

mov rsi, 0x18230363
cvtps2pd xmm0, xmm0
mov rsi, 0x18230363

xchg rax, rsp
xor ecx, ecx
xor eax, eax
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTPS2PDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2ss xmm0, ecx

mov rsi, 0x18230364
cvtps2pd xmm0, xmm0
mov rsi, 0x18230364

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTSD2SSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2sd xmm0, ecx

mov rsi, 0x18230365
lea rcx, [rsp-8]
movsd [rcx], xmm0
cvtsd2ss xmm1, [rcx]
mov eax, 0
mov ecx, 2
mov rsi, 0x18230365

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTSD2SSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2sd xmm0, ecx

mov rsi, 0x18230366
cvtsd2ss xmm1, xmm0
mov rsi, 0x18230366

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTSI2SDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into eax for future load into xmm0
mov eax, 2

mov rsi, 0x18230367
lea rcx, [rsp-4]
mov [rcx], eax
cvtsi2sd xmm0, [rcx]
mov ecx, 0
mov rsi, 0x18230367

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTSI2SDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2

mov rsi, 0x18230368
cvtsi2sd xmm0, ecx
mov rsi, 0x18230368

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTSI2SSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into eax for future load into xmm0
mov eax, 2

mov rsi, 0x18230369
lea rcx, [rsp-4]
mov [rcx], eax
cvtsi2ss xmm0, [rcx]
mov ecx, 0
mov rsi, 0x18230369

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTSI2SSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2

mov rsi, 0x1823036a
cvtsi2ss xmm0, ecx
mov rsi, 0x1823036a

xor ecx, ecx
cvtsi2ss xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTSS2SDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x1823036b
lea rcx, [rsp-4]
mov DWORD [rcx], 0x3fc00000

cvtss2sd xmm0, [rcx]

mov ecx, [rcx]
mov rsi, 0x1823036b

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTSS2SDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2sd xmm0, ecx

mov rsi, 0x1823036c
cvtss2sd xmm1, xmm0
mov rsi, 0x1823036c

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTTSD2SIrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2sd xmm0, ecx

mov rsi, 0x1823036d
lea rcx, [rsp-8]
movsd [rcx], xmm0
cvttsd2si ecx, [rcx]
mov rsi, 0x1823036d

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTTSD2SIrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2sd xmm0, ecx

mov rsi, 0x1823036e
cvttsd2si ecx, xmm0
mov rsi, 0x1823036e

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTTSS2SIrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2ss xmm0, ecx

mov rsi, 0x1823036f
lea rcx, [rsp-8]
movss [rcx], xmm0
cvttss2si ecx, [rcx]
mov rsi, 0x1823036f

xor ecx, ecx
cvtsi2ss xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: CVTTSS2SIrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2ss xmm0, ecx

mov rsi, 0x18230370
cvttss2si ecx, xmm0
mov rsi, 0x18230370

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Cmp32RR1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Cmp32RR1
mov eax, 0x4
mov ebx, 0x2
mov rsi, 0x18230371
cmp eax, ebx
mov rsi, 0x18230371


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Cmp32RR2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Cmp32RR2
mov eax, 0x17
mov ebx, 0x3
mov rsi, 0x18230372
cmp eax, ebx
mov rsi, 0x18230372


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Cmpxch16RR
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Cmpxch16RR
mov ax, 0x6824
mov dx, 0x6824
mov cx, 0x1479
mov rsi, 0x18230373
cmpxchg dx, cx
mov rsi, 0x18230373


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Composite1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Composite1
mov eax, 0x18
mov rsi, 0x18230374
mov ecx, eax
xor eax, eax
xor ebx, ebx
cmp ebx, ecx
mov rsi, 0x18230374


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Composite2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Composite2
mov ecx, 0x18
xor ebx, ebx
xor eax, eax
inc eax
mov rsi, 0x18230375
again:
cmp ebx, ecx
je done
inc ebx
add eax, eax
jmp again
done:
inc eax
mov rsi, 0x18230375


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DEC16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; DEC16r
mov dx, 0x30
mov rsi, 0x18230376
dec dx
mov rsi, 0x18230376


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DEC32r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; DEC32r
mov eax, 0x31
mov rsi, 0x18230377
dec eax
mov rsi, 0x18230377


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DEC64r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; DEC64r
mov rax, 0x31
mov rsi, 0x18230378
dec rax
mov rsi, 0x18230378


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DEC8r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; DEC8r
mov cl, 0x32
mov rsi, 0x18230379
dec cl
mov rsi, 0x18230379


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIV64r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; DIV64r
mov rsi, 0x1823037a
mov rdx, 0x0
mov rax, 0x100
mov rbx, 10
div rbx
mov rsi, 0x1823037a

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIVSDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 10 to a double precision float and store in xmm0
mov ecx, 10
cvtsi2sd xmm0, ecx

mov rsi, 0x1823037b
; load 2.5 (in double precision float form)
lea rcx, [rsp-8]
mov DWORD [rcx], 0
mov DWORD [rcx+4], 0x40040000

divsd xmm0, [rcx]
mov ecx, [rcx]
mov rsi, 0x1823037b

xor ecx, ecx
cvtsi2sd xmm0, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIVSDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 3 to a double precision float and store in xmm0
mov ecx, 3
cvtsi2sd xmm0, ecx

; convert 7 to a double precision float and store in xmm1
mov ecx, 7
cvtsi2sd xmm1, ecx

mov rsi, 0x1823037c
divsd xmm0, xmm1
mov rsi, 0x1823037c

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIVSSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 7 to a double precision float and store in xmm0
mov ecx, 7
cvtsi2ss xmm0, ecx

mov rsi, 0x1823037d
; load 1.5 (in double precision float form)
lea rcx, [rsp-4]
mov DWORD [rcx], 0x3fc00000

divss xmm0, [rcx]
mov ecx, [rcx]
mov rsi, 0x1823037d

xor ecx, ecx
cvtsi2sd xmm0, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIVSSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 3 to a double precision float and store in xmm0
mov ecx, 3
cvtsi2ss xmm0, ecx

; convert 2 to a double precision float and store in xmm1
mov ecx, 2
cvtsi2ss xmm1, ecx

mov rsi, 0x1823037e
divss xmm0, xmm1
mov rsi, 0x1823037e

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIV_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
mov rsi, 0x1823037f
lea rdi, [rsp-08]
FSTP dword [rdi]
FDIV dword [rdi]
mov edi, 0
mov rsi, 0x1823037f

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIV_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
mov rsi, 0x18230380
lea rdi, [rsp-08]
FSTP qword [rdi]
FDIV qword [rdi]
mov edi, 0
mov rsi, 0x18230380


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIV_PFrST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
FLD1
mov rsi, 0x18230381
FDIVP st2, st0
mov edi, 0
mov rsi, 0x18230381

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: DIV_ST0Fr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1
FLDPI
mov rsi, 0x18230382
FDIV st0, st1
mov edi, 0
mov rsi, 0x18230382



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ENTER
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ENTER
mov rax, rsp
mov rdi, rbp
mov rbx, rsp
sub rbx, 0x8
mov rsi, 0x18230383
enter 0x8, 0x0
cmp rbp, rbx
mov rbp, 0x0
mov rsi, 0x18230383
mov rsp, rax
mov rbp, rdi


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FABS
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FADDP
lea rdi, [rsp-0x8]
; load -1.25 in st0
mov DWORD [rdi], 0xbfa00000
fld DWORD [rdi]
mov rsi, 0x18230384
fabs
mov rdi, 0x0
mov rsi, 0x18230384


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FADDP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FADDP
lea rdi, [rsp-0x10]
mov DWORD [rdi], 0x2168c000
mov DWORD [rdi+0x4], 0xc90fdaa2
mov DWORD [rdi+0x8], 0x00004000
fld TWORD [rdi]
fld TWORD [rdi]
mov rsi, 0x18230385
faddp
mov rdi, 0x0
mov rsi, 0x18230385


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FADDP_rST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FADDP
FLDPI
FLDPI
FLDPI
mov rsi, 0x18230386
faddp st2, st0
mov rsi, 0x18230386


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FBLD
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x18230387
lea rdi, [rsp-0x10]
mov dword [rdi], 0x12345678
mov dword [rdi+04], 0x12345678
mov dword [rdi+08], 0x00001234
FBLD tword [rdi]
mov edi, 0
mov rsi, 0x18230387


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FBSTP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLDPI
mov rsi, 0x18230388
lea rdi, [rsp-0x10]
mov dword [rdi+00], 0x0
mov dword [rdi+04], 0x0
mov dword [rdi+08], 0x0
FBSTP tword [rdi]
mov eax, [rdi+00]
mov ebx, [rdi+04]
mov ecx, [rdi+08]
mov edi, 0

mov rsi, 0x18230388


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCHS
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLDPI
mov rsi, 0x18230389
FCHS
mov rsi, 0x18230389


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCLEX
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x1823038a
FCLEX
mov rsi, 0x1823038a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCMOVB
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
FLDPI
FLD1
STC ;ensure the mov
mov rsi, 0x1823038b
fcmovb st0, st1
mov rsi, 0x1823038b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCMOVBE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
FLDPI
FLD1
CMP EAX, EAX
mov rsi, 0x1823038c
fcmovbe st0, st1
mov rsi, 0x1823038c



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCMOVE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
FLDPI
FLD1
CMP EAX, EAX
mov rsi, 0x1823038d
fcmove st0, st1
mov rsi, 0x1823038d



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCMOVNB
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
FLDPI
FLD1
; Clear CF
CLC
mov rsi, 0x1823038e
fcmovnb st0, st1
mov rsi, 0x1823038e



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCMOVNBE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
FLDPI
FLD1
MOV EAX, 0
CMP EAX, 1
CLC
mov rsi, 0x1823038f
fcmovnbe st0, st1
mov rsi, 0x1823038f





    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCMOVNE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
FLDPI
FLD1
MOV EAX, 0
CMP EAX, 1
mov rsi, 0x18230390
fcmovne st0, st1
mov rsi, 0x18230390




    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCMOVNU
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
FLDPI
FLD1
MOV EAX, 2
CMP EAX, 0
mov rsi, 0x18230391
fcmovnu st0, st1
mov rsi, 0x18230391





    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCMOVU
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
FLDPI
FLD1
;SET PF
MOV EAX, 0x3
CMP EAX, 0
mov rsi, 0x18230392
fcmovu st0, st1
mov rsi, 0x18230392



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOM
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI

mov rsi, 0x18230393
FCOM
mov edi, 0
mov rsi, 0x18230393





    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOMIP_STFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI

mov rsi, 0x18230394
FCOMIP st0, st1
mov rsi, 0x18230394



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOMI_STFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI

mov rsi, 0x18230395
FCOMI st0, st1
mov rsi, 0x18230395


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOMP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI

mov rsi, 0x18230396
FCOMP
mov edi, 0
mov rsi, 0x18230396





    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOMPP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI

mov rsi, 0x18230397
FCOMPP
mov edi, 0
mov rsi, 0x18230397





    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOMP_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI

mov rsi, 0x18230398
lea rdi, [rsp-08]
FST dword [rdi+00]
FCOMP dword [rdi+00]
mov edi, 0
mov rsi, 0x18230398


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOMP_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI

mov rsi, 0x18230399
lea rdi, [rsp-0x0C]
FST qword [rdi+00]
FCOMP qword [rdi+00]
mov edi, 0
mov rsi, 0x18230399



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOMP_STFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI
FLDPI

mov rsi, 0x1823039a
FCOMP st2
mov edi, 0
mov rsi, 0x1823039a




    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOM_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI

mov rsi, 0x1823039b
lea rdi, [rsp-08]
FST dword [rdi+00]
FCOM dword [rdi+00]
mov edi, 0
mov rsi, 0x1823039b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOM_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI

mov rsi, 0x1823039c
lea rdi, [rsp-0x0C]
FST qword [rdi+00]
FCOM qword [rdi+00]
mov edi, 0
mov rsi, 0x1823039c



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FCOM_STFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI
FLDPI

mov rsi, 0x1823039d
FCOM st2
mov edi, 0
mov rsi, 0x1823039d




    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FDECSTP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1

mov rsi, 0x1823039e
FDECSTP
mov rsi, 0x1823039e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FDIVP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
mov rsi, 0x1823039f
FDIVP
mov edi, 0
mov rsi, 0x1823039f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FDIVRP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
mov rsi, 0x182303a0
FDIVRP
mov edi, 0
mov rsi, 0x182303a0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FDIVR_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
mov rsi, 0x182303a1
lea rdi, [rsp-08]
FSTP dword [rdi]
FDIVR dword [rdi]
mov edi, 0
mov rsi, 0x182303a1

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FDIVR_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
mov rsi, 0x182303a2
lea rdi, [rsp-08]
FSTP qword [rdi]
FDIVR qword [rdi]
mov edi, 0
mov rsi, 0x182303a2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FDIVR_FrST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
FLD1
mov rsi, 0x182303a3
FDIVR st2, st0
mov edi, 0
mov rsi, 0x182303a3




    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FDIVR_PFrST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
FLD1
mov rsi, 0x182303a4
FDIVRP st2, st0
mov edi, 0
mov rsi, 0x182303a4

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FDIVR_ST0Fr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLD1
FLD1
mov rsi, 0x182303a5
FDIVR st0, st2
mov edi, 0
mov rsi, 0x182303a5




    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FFREE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLDPI
mov rsi, 0x182303a6
FFREE st0
mov rsi, 0x182303a6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIADDm16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END
; set up st0 to be PI

FLDPI
mov rsi, 0x182303a7
lea rdi, [rsp-08]
mov word [rdi], 0x0001
FIADD word [rdi]
mov edi, 0x0
mov rsi, 0x182303a7

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIADDm32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END
; set up st0 to be PI
FLDPI
mov rsi, 0x182303a8
lea rdi, [rsp-08]
mov dword [rdi], 0x10000

FIADD dword [rdi]
mov edi, 0x0
mov rsi, 0x182303a8

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FICOMP_16m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1

mov rsi, 0x182303a9
lea rdi, [rsp-08]
mov word [rdi], 0x0001
FICOMP word [rdi]
mov rsi, 0x182303a9


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FICOMP_32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1

mov rsi, 0x182303aa
lea rdi, [rsp-08]
mov dword [rdi], 0x1
FICOMP dword [rdi]
mov rsi, 0x182303aa


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FICOM_16m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1

mov rsi, 0x182303ab
lea rdi, [rsp-08]
mov word [rdi], 0x0001
FICOM word [rdi]
mov rsi, 0x182303ab


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FICOM_32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1

mov rsi, 0x182303ac
lea rdi, [rsp-08]
mov dword [rdi], 0x1
FICOM dword [rdi]
mov rsi, 0x182303ac


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIDIVR_32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x182303ad
lea rdi, [rsp-08]
mov dword [rdi], 0x00000001
FIDIVR dword [rdi]
mov edi, 0
mov rsi, 0x182303ad


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIDIVR_64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x182303ae
lea rdi, [rsp-08]
mov word [rdi], 0x0001
FIDIVR word [rdi]
mov edi, 0
mov rsi, 0x182303ae



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIDIV_32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x182303af
lea rdi, [rsp-08]
mov dword [rdi], 0x00000001
FIDIV dword [rdi]
mov edi, 0
mov rsi, 0x182303af


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIDIV_64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x182303b0
lea rdi, [rsp-08]
mov word [rdi], 0x0001
FIDIV word [rdi]
mov edi, 0
mov rsi, 0x182303b0



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FILD_16m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303b1
lea rdi, [rsp-0x08]
mov word [rdi], 0x0001
FILD word [rdi]
mov edi, 0
mov rsi, 0x182303b1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FILD_32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303b2

lea rdi, [rsp-0x08]
mov dword [rdi], 0x1
FILD dword [rdi]
mov edi, 0
mov rsi, 0x182303b2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FILD_64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303b3

lea rdi, [rsp-0x0c]
mov dword [rdi+00], 0x0000
mov dword [rdi+04], 0x0001
FILD qword [rdi]
mov edi, 0
mov rsi, 0x182303b3


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIMUL_m16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x182303b4
lea rdi, [rsp-0xC]
mov word [rdi], 0x2
FIMUL word [rdi]
mov edi, 0
mov rsi, 0x182303b4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIMUL_m32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x182303b5
lea rdi, [rsp-0xC]
mov dword [rdi], 0x2
FIMUL dword [rdi]
mov edi, 0
mov rsi, 0x182303b5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FINCSTP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLDZ
mov rsi, 0x182303b6
FINCSTP
mov rsi, 0x182303b6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FINIT
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLDZ
mov rsi, 0x182303b7
FINIT
mov rsi, 0x182303b7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISTP_16m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLD1
mov rsi, 0x182303b8
lea rdi, [rsp-0xC]
fistp word [rdi]
mov ax, word [rdi]
mov edi, 0x0
mov rsi, 0x182303b8



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISTP_32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLD1
mov rsi, 0x182303b9
lea rdi, [rsp-0xC]
fistp dword [rdi]
mov eax, dword [rdi]
mov edi, 0x0
mov rsi, 0x182303b9



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISTP_64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLD1
mov rsi, 0x182303ba
lea rdi, [rsp-0xC]
fistp qword [rdi]
mov eax, dword [rdi+00]
mov ebx, dword [rdi+04]
mov edi, 0x0
mov rsi, 0x182303ba



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISTTP_16m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLDPI
mov rsi, 0x182303bb
lea rdi, [rsp-0xC]
fisttp word [rdi]
mov ax, word [rdi]
mov edi, 0x0
mov rsi, 0x182303bb



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISTTP_32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLDPI
mov rsi, 0x182303bc
lea rdi, [rsp-0xC]
fisttp dword [rdi]
mov eax, dword [rdi]
mov edi, 0x0
mov rsi, 0x182303bc



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISTTP_64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLDPI
mov rsi, 0x182303bd
lea rdi, [rsp-0xC]
fisttp qword [rdi]
mov eax, dword [rdi+00]
mov ebx, dword [rdi+04]
mov edi, 0x0
mov rsi, 0x182303bd



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIST_16m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLD1
mov rsi, 0x182303be
lea rdi, [rsp-0xC]
fist word [rdi]
mov eax, dword [rdi]
mov edi, 0x0
mov rsi, 0x182303be


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FIST_32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLD1
mov rsi, 0x182303bf
lea rdi, [rsp-0xC]
fist dword [rdi]
mov eax, dword [rdi]
mov edi, 0x0
mov rsi, 0x182303bf


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISUBRm16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END
; set up st0 to be PI

FLDPI
mov rsi, 0x182303c0
lea rdi, [rsp-08]
mov word [rdi], 0x0001
FISUBR word [rdi]
mov edi, 0x0
mov rsi, 0x182303c0

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISUBRm32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END
; set up st0 to be PI
FLDPI
mov rsi, 0x182303c1
lea rdi, [rsp-08]
mov dword [rdi], 0x1

FISUBR dword [rdi]
mov edi, 0x0
mov rsi, 0x182303c1

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISUBm16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END
; set up st0 to be PI

FLDPI
mov rsi, 0x182303c2
lea rdi, [rsp-08]
mov word [rdi], 0x0001
FISUB word [rdi]
mov edi, 0x0
mov rsi, 0x182303c2

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FISUBm32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END
; set up st0 to be PI
FLDPI
mov rsi, 0x182303c3
lea rdi, [rsp-08]
mov dword [rdi], 0x1

FISUB dword [rdi]
mov edi, 0x0
mov rsi, 0x182303c3

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLD1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303c4
FLD1
mov rsi, 0x182303c4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLDCW
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303c5
lea rdi, [rsp-08]
mov dword [rdi], 0
FSTCW [rdi]
FLDCW [rdi]
mov edi, 0
mov rsi, 0x182303c5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLDENV
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303c6
lea rdi, [rsp-0x80]
FSTENV [rdi]
FLDENV [rdi]
mov edi, 0
mov rsi, 0x182303c6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLDL2E
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303c7
FLDL2E
mov rsi, 0x182303c7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLDL2T
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303c8
FLDL2T
mov rsi, 0x182303c8


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLDLG2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303c9
FLDLG2
mov rsi, 0x182303c9



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLDLN2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303ca
FLDLN2
mov rsi, 0x182303ca



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLDPI
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303cb
FLDPI
mov rsi, 0x182303cb


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FLDZ
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303cc
FLDZ
mov rsi, 0x182303cc



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FMULP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END
; FADDP
FLDPI
FLDPI
mov rsi, 0x182303cd
fmulp st1, st0
mov rsi, 0x182303cd


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FMULP_rST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END
; FADDP
FLDPI
FLDPI
FLDPI
mov rsi, 0x182303ce
fmulp st2, st0
mov rsi, 0x182303ce


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FNCLEX
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303cf
FNCLEX
mov rsi, 0x182303cf



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FNINIT
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLDZ
mov rsi, 0x182303d0
FNINIT
mov rsi, 0x182303d0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FNOP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303d1
FNOP
mov rsi, 0x182303d1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FNSAVE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303d2
lea rdi, [rsp-0x200]
; save state
FNSAVE [rdi]
mov edi, 0
mov rsi, 0x182303d2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FNSTCW
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303d3
lea rdi, [rsp-08]
mov dword [rdi], 0
FNSTCW [rdi]
mov eax, dword [rdi]
mov edi, 0
mov rsi, 0x182303d3


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FNSTENVm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FSTENVm
mov rsi, 0x182303d4
lea rdi, [rsp-0x200]
fnstenv [rdi]
mov eax, [rdi] ;control word
mov ebx, [rdi+0x4] ;status word
mov ecx, [rdi+0x8] ;tag word
;mov edx, [edi+0xc] ;EIP - unsupported
;mov esi, [edi+0x10] ;FOPCODE + FPU EIP Segment - unsupported
;mov ebp, [edi+0x14] ;data pointer - unsupported
;mov edi, [edi+0x18] ;data pointer selector - unsupported
mov edi, 0x0
mov rsi, 0x182303d4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FNSTSWa
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303d5
mov eax, 0
FNSTSW ax
mov rsi, 0x182303d5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FNSTSWm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303d6
lea rdi, [rsp-08]
mov dword [rdi], 0
FNSTSW [rdi]
mov eax, dword [rdi]
mov edi, 0
mov rsi, 0x182303d6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FPATAN
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x182303d7
lea rdi, [rsp-0xc]
mov word [rdi], 0x4
FILD word [rdi]
;calc ATAN(pi/4)
FPATAN
mov edi, 0
mov rsi, 0x182303d7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FPREM
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303d8
lea rdi, [rsp-0xc]
mov word [rdi], 0x2
FILD word [rdi]
mov word [rdi], 0x5
FILD word [rdi]
; get remainder of 5/2
FPREM
mov edi, 0
mov rsi, 0x182303d8


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FPREM1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303d9
lea rdi, [rsp-0xc]
mov word [rdi], 0x2
FILD word [rdi]
mov word [rdi], 0x5
FILD word [rdi]
; get the IEEE remainder of 5/2
FPREM1
mov edi, 0
mov rsi, 0x182303d9


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FRSTOR
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303da
lea rdi, [rsp-0x200]
; save state
FNSAVE [rdi]
;reload state
FRSTOR [rdi]
mov edi, 0
mov rsi, 0x182303da


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSAVE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303db
lea rdi, [rsp-0x800]
; save state
FSAVE [rdi]
mov edi, 0
mov rsi, 0x182303db


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSQRT
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303dc
lea rdi, [rsp-0xc]
mov word [rdi], 0x4
fild word [rdi]
mov edi, 0
FSQRT
mov rsi, 0x182303dc


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSTCW
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303dd
lea rdi, [rsp-08]
mov dword [rdi], 0
FSTCW [rdi]
mov eax, dword [rdi]
mov edi, 0
mov rsi, 0x182303dd


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSTENVm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FSTENVm
mov rsi, 0x182303de
lea rdi, [rsp-0x200]
fstenv [rdi]
mov eax, [rdi] ;control word
mov ebx, [rdi+0x4] ;status word
mov ecx, [rdi+0x8] ;tag word
;mov edx, [edi+0xc] ;EIP - unsupported
;mov esi, [edi+0x10] ;FOPCODE + FPU EIP Segment - unsupported
;mov ebp, [edi+0x14] ;data pointer - unsupported
;mov edi, [edi+0x18] ;data pointer selector - unsupported
mov edi, 0x0
mov rsi, 0x182303de


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSTSWa
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303df
mov eax, 0
FSTSW ax
mov rsi, 0x182303df


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSTSWm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov rsi, 0x182303e0
lea rdi, [rsp-08]
mov dword [rdi], 0
FSTSW [rdi]
mov eax, dword [rdi]
mov edi, 0
mov rsi, 0x182303e0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSUBP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FADDP
lea rdi, [rsp-0x10]
mov DWORD [rdi], 0x2168c000
mov DWORD [rdi+0x4], 0xc90fdaa2
mov DWORD [rdi+0x8], 0x00004000
fld TWORD [rdi]
fld TWORD [rdi]
mov rsi, 0x182303e1
fsubp
mov edi, 0x0
mov rsi, 0x182303e1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSUBP_rST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FADDP
FLDPI
FLDPI
FLDPI
mov rsi, 0x182303e2
fsubp st2, st0
mov rsi, 0x182303e2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSUBRP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FADDP
lea rdi, [rsp-0x10]
mov DWORD [rdi], 0x2168c000
mov DWORD [rdi+0x4], 0xc90fdaa2
mov DWORD [rdi+0x8], 0x00004000
fld TWORD [rdi]
fld TWORD [rdi]
mov rsi, 0x182303e3
fsubrp
mov edi, 0x0
mov rsi, 0x182303e3


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FSUBRP_rST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; FADDP
FLDPI
FLDPI
FLDPI
mov rsi, 0x182303e4
fsubrp st2, st0
mov rsi, 0x182303e4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FTST
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLD1
mov rsi, 0x182303e5
FTST
mov rsi, 0x182303e5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FUCOM
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1
FLD1

mov rsi, 0x182303e6
FUCOM
mov rsi, 0x182303e6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FUCOMIP_STFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI

mov rsi, 0x182303e7
FUCOMIP st0, st1
mov rsi, 0x182303e7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FUCOMI_STFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
FLDPI

mov rsi, 0x182303e8
FUCOMI st0, st1
mov rsi, 0x182303e8


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FUCOMP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1
FLD1

mov rsi, 0x182303e9
FUCOMP
mov rsi, 0x182303e9


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FUCOMPP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1
FLD1
FLD1

mov rsi, 0x182303ea
FUCOMPP
mov rsi, 0x182303ea


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FUCOMP_STFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1
FLD1
FLD1

mov rsi, 0x182303eb
FUCOMP st2
mov rsi, 0x182303eb


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FUCOM_STFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLD1
FLD1
FLD1

mov rsi, 0x182303ec
FUCOM st2
mov rsi, 0x182303ec


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FXAM
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLDZ

mov rsi, 0x182303ed
FXAM
mov rsi, 0x182303ed


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FXRSTOR
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303ee
lea rdi, [rsp-0x300]
and rdi, 0xFFFFFFFFFFFFFFF0
FXSAVE  [rdi]
FXRSTOR [rdi]
mov edi, 0
mov rsi, 0x182303ee


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FXSAVE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x182303ef
lea rdi, [rsp-0x300]
and rdi, 0xFFFFFFFFFFFFFFF0
FXSAVE [rdi]
; a simple sanity check that something was written
mov eax, [rdi]
mov edi, 0
mov rsi, 0x182303ef


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FXTRACT
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

FLDPI

mov rsi, 0x182303f0
FXTRACT
mov rsi, 0x182303f0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FYL2X
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE
;TEST_FILE_META_END

lea rdi, [rsp-0xc]
mov word [rdi], 0x10
FILD word [rdi]
FILD word [rdi]

mov rsi, 0x182303f1
FYL2X ;st1 = 16 * log2(16)
mov rsi, 0x182303f1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: FYL2XP1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE
;TEST_FILE_META_END

FLD1
FLDZ
mov rsi, 0x182303f2
FYL2XP1 ;st1 = 1.0 * log2(0 + 1.0)
mov rsi, 0x182303f2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IDIV16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IDIV16r
mov ax, 0xaa
mov bx, 0x4
mov dx, 0x1
mov rsi, 0x182303f3
idiv bx
mov rsi, 0x182303f3


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IDIV32r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IDIV32r
mov eax, 0x4444
mov ebx, 0x4
mov edx, 0x1
mov rsi, 0x182303f4
idiv ebx
mov rsi, 0x182303f4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IDIV64r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IDIV32r
mov rax, 0x4444
mov rbx, 0x4
mov rdx, 0x1
mov rsi, 0x182303f5
idiv rbx
mov rsi, 0x182303f5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IDIV8r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_CF|FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IDIV8r
mov ax, 0xa
mov bl, 0x4
mov rsi, 0x182303f6
idiv bl
mov rsi, 0x182303f6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ILD_F16m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ILD_F16m
mov rsi, 0x182303f7
lea rdi, [rsp-0x4]
mov WORD [rdi], 0x0001
fild WORD [rdi]
mov rdi, 0x0
mov rsi, 0x182303f7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ILD_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ILD_F32m
mov rsi, 0x182303f8
lea rdi, [rsp-0x4]
mov DWORD [rdi], 0x10001
fild DWORD [rdi]
mov rdi, 0x0
mov rsi, 0x182303f8



    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ILD_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ILD_F64m
mov rsi, 0x182303f9
lea rdi, [rsp-0x10]
mov DWORD [rdi], 0x00001
mov DWORD [rdi+4], 0x10001
fild QWORD [rdi]
mov rdi, 0x0
mov rsi, 0x182303f9




    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL16r
mov ax, 0x32
mov bx, 0xb
mov rsi, 0x182303fa
imul bx
mov rsi, 0x182303fa


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL16rr
mov bx, 0x34
mov cx, 0x45
mov rsi, 0x182303fb
imul bx, cx
mov rsi, 0x182303fb


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL16rri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL16rri
mov bx, 0x3
mov cx, 0x4
mov rsi, 0x182303fc
imul bx, cx, 0xbbb
mov rsi, 0x182303fc


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL32r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL32r
mov eax, 0x323
mov ebx, 0xbbb
mov rsi, 0x182303fd
imul ebx
mov rsi, 0x182303fd


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL32rr
mov ebx, 0x20000
mov ecx, 0x34
mov rsi, 0x182303fe
imul ebx, ecx
mov rsi, 0x182303fe


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL32rri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL32rri
mov ebx, 0x20000
mov ecx, 0x34
mov rsi, 0x182303ff
imul ebx, ecx, 0xbbbbb
mov rsi, 0x182303ff


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL64m
mov rax, 0x323
mov rbx, 0xbbbbbbbb
push rbx
pop rbx
mov rsi, 0x18230400
imul rax, [rsp - 8]
mov rsi, 0x18230400


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL64r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL64r
mov rax, 0x323
mov rbx, 0xbbbbbbbb
mov rsi, 0x18230401
imul ebx
mov rsi, 0x18230401


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL64rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL64rr
mov ebx, 0x20000
mov ecx, 0x34
mov rsi, 0x18230402
imul ebx, ecx
mov rsi, 0x18230402


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL64rri32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL64rri32
mov ebx, 0x20000
mov ecx, 0x34343434
mov rsi, 0x18230403
imul ebx, ecx, 0xbbbbb
mov rsi, 0x18230403


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL64rri8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL64rri8
mov ebx, 0x20000
mov ecx, 0x34343434
mov rsi, 0x18230404
imul ebx, ecx, 0xb
mov rsi, 0x18230404


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: IMUL8r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF
;TEST_FILE_META_END
; IMUL8r
mov al, 0x10
mov cl, 0xe
mov rsi, 0x18230405
imul cl
mov rsi, 0x18230405


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: INC16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; INC16r
xor dx, dx
mov dx, 0x30
mov rsi, 0x18230406
inc dx
mov rsi, 0x18230406


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: INC32r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; INC32r
mov eax, 0x31
mov rsi, 0x18230407
inc eax
mov rsi, 0x18230407


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: INC64r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; INC64r
mov rax, 0x31
mov rsi, 0x18230408
inc rax
mov rsi, 0x18230408


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: INC8r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; INC8r
mov cl, 0x32
mov rsi, 0x18230409
inc cl
mov rsi, 0x18230409


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LAHF
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LAHF
mov rsi, 0x1823040a
lahf
mov rsi, 0x1823040a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LD_F0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LD_F0
mov rsi, 0x1823040b
fldz
mov rsi, 0x1823040b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LD_F1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LD_F0
mov rsi, 0x1823040c
fld1
mov rsi, 0x1823040c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LD_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LD_F32m
mov rsi, 0x1823040d
lea rdi, [rsp-0x4]
mov DWORD [rdi], 0x40490fdb
fld DWORD [rdi]
mov edi, 0x0
mov rsi, 0x1823040d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LD_F80m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LD_F80m
mov rsi, 0x1823040e
lea rdi, [rsp-0xc]
mov DWORD [rdi], 0x2168c000
mov DWORD [rdi+0x4], 0xc90fdaa2
mov DWORD [rdi+0x8], 0x00004000
fld TWORD [rdi]
mov edi, 0x0
mov rsi, 0x1823040e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LD_Frr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LD_Frr
FLDPI
FLD1
FLDL2E
mov rsi, 0x1823040f
fld st1
mov rsi, 0x1823040f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LEA16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LEA16r
mov cx, 0x15
mov edx, 0x8
mov rsi, 0x18230410
lea cx, [edx-0x444]
mov rsi, 0x18230410


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LEA32r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LEA32r
mov ecx, 0x15
mov edx, 0x8
mov rsi, 0x18230411
lea ecx, [edx-0x444]
mov rsi, 0x18230411


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LEAVE
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LEAVE
enter 0x8, 0x1
mov rdi, rsp
mov rbx, [rsp]
mov rax, rbp
mov rsi, 0x18230412
leave
mov rsi, 0x18230412
mov rsp, rdi
mov [rsp], rbx
mov rbp, rax


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: LOOP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; LOOP
mov ecx, 0x18
xor eax, eax
inc eax
mov rsi, 0x18230413
again_1:
add eax, eax
loop again_1
inc eax
mov rsi, 0x18230413


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Lea32R1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Lea32R1
mov eax, 0x21
mov edi, 0x8
mov rsi, 0x18230414
lea eax, [eax+edi+0x1]
mov rsi, 0x18230414


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Lea32R2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Lea32R2
mov eax, 0x515
mov edx, 0x30
mov rsi, 0x18230415
lea ecx, [eax+edx*0x4]
mov rsi, 0x18230415


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOV16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOV16ri
mov bx, 0x24
mov rsi, 0x18230416
mov bx, 0xffcc
mov rsi, 0x18230416


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOV16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOV16rr
mov ch, 0x2
mov dh, 0x3
mov rsi, 0x18230417
mov ch, dh
mov rsi, 0x18230417


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOV32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Mov32RI
mov rsi, 0x18230418
mov eax, 0x18111
mov rsi, 0x18230418


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOV32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Mov32RR
mov eax, 0x8
mov ecx, 0x12
mov rsi, 0x18230419
mov ecx, eax
mov rsi, 0x18230419


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOV8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOV8ri
mov ah, 0x2
mov rsi, 0x1823041a
mov ah, 0x3
mov rsi, 0x1823041a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOV8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOV8rr
mov ch, 0x2
mov dh, 0x3
mov rsi, 0x1823041b
mov ch, dh
mov rsi, 0x1823041b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVDI2PDIrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov eax, 2

mov rsi, 0x1823041c
lea rcx, [rsp-4]
mov [rcx], eax
movd xmm0, [rcx]
mov ecx, 0
mov rsi, 0x1823041c

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVDI2PDIrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2

mov rsi, 0x1823041d
MOVD xmm0, ecx
mov rsi, 0x1823041d

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVPDI2DImr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov ecx, 2
MOVD xmm0, ecx
mov ecx, 0

mov rsi, 0x1823041e
lea rcx, [rsp-4]
movd [rcx], xmm0
mov eax, [rcx]
mov ecx, 0
mov rsi, 0x1823041e

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVPDI2DIrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
MOVD xmm0, ecx
mov ecx, 0

mov rsi, 0x1823041f
MOVD eax, xmm0
mov rsi, 0x1823041f

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSDmr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 0xbadf00d to a double precision float and store in xmm0
mov ecx, 0xbadf00d
cvtsi2sd xmm0, ecx

mov rsi, 0x18230420
; load badf00d (in double precision float form)
lea rcx, [rsp-8]
movsd [rcx], xmm0

mov eax, [rcx+0]
mov ebx, [rcx+4]
mov rcx, 0
mov rsi, 0x18230420

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a double precision float and store in xmm0
mov ecx, 1
cvtsi2sd xmm0, ecx

mov rsi, 0x18230421
; load 2.5 (in double precision float form)
lea rcx, [rsp-8]
mov DWORD [rcx], 0
mov DWORD [rcx+4], 0x40040000

movsd xmm0, [rcx]
mov rcx, [rcx]
mov rsi, 0x18230421

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a double precision float and store in xmm0
mov ecx, 0
cvtsi2sd xmm0, ecx

; convert 2 to a double precision float and store in xmm1
mov ecx, 2
cvtsi2sd xmm1, ecx

mov rsi, 0x18230422
movsd xmm0, xmm1
mov rsi, 0x18230422
xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSSmr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a single precision float and store in xmm0
mov ecx, 1
cvtsi2ss xmm0, ecx

mov rsi, 0x18230423
; load 1 in single floating point form
lea rcx, [rsp-8]
movss [rcx], xmm0

; value should appear in eax for testing
mov rax, [rcx]
mov ecx, 0
mov rsi, 0x18230423

xor ecx, ecx
cvtsi2ss xmm0, ecx
cvtsi2ss xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a single precision float and store in xmm0
mov ecx, 1
cvtsi2ss xmm0, ecx
; convert 0 to a single precision float and store in xmm1
mov ecx, 0
cvtsi2ss xmm1, ecx

mov rsi, 0x18230424
; load 1 in single floating point form
lea rcx, [rsp-8]
movss [rcx], xmm0

; store 1 in xmm1
movss xmm1, [rcx]
mov ecx, 0
mov rsi, 0x18230424

xor ecx, ecx
cvtsi2ss xmm0, ecx
cvtsi2ss xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a single precision float and store in xmm0
mov ecx, 0
cvtsi2ss xmm0, ecx
mov ecx, 0xFFFFFFFF
cvtsi2ss xmm2, ecx
mov ecx, 0
cvtsi2ss xmm3, ecx

; convert 2 to a single precision float and store in xmm1
mov ecx, 2
cvtsi2ss xmm1, ecx

mov rsi, 0x18230425
movss xmm0, xmm1
movss xmm2, xmm1
movss xmm3, xmm1
mov rsi, 0x18230425
xor ecx, ecx
cvtsi2ss xmm0, ecx
cvtsi2ss xmm1, ecx
cvtsi2ss xmm3, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSX16rr8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOVSX16rr8
mov bx, 0x3000
mov bl, 0x35
mov rsi, 0x18230426
movsx bx, bl
mov rsi, 0x18230426


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSX32rr16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOVSX32rr16
mov eax, 0x55555
mov ax, 0x3333
mov rsi, 0x18230427
movsx eax, ax
mov rsi, 0x18230427


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVSX32rr8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOVSX32rr8
mov eax, 0x55555
mov ah, 0x3
mov rsi, 0x18230428
movsx eax, ah
mov rsi, 0x18230428


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVZX16rr8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOVZX16rr8
mov bx, 0x2
mov bl, 0x3
mov rsi, 0x18230429
movzx bx, bl
mov rsi, 0x18230429


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVZX32rr16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MovZx32RR16
mov eax, 0x18
mov ebx, 0
mov rsi, 0x1823042a
movzx ebx, ax
mov rsi, 0x1823042a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MOVZX32rr8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; MOVZX32rr8
mov edx, 0x12
mov dh, 0x3
mov rsi, 0x1823042b
movzx edx, dh
mov rsi, 0x1823042b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MULSDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 5 to a double precision float and store in xmm0
mov ecx, 5
cvtsi2sd xmm0, ecx

mov rsi, 0x1823042c
; load 2.5 (in double precision float form)
lea rcx, [rsp-8]
mov DWORD [rcx], 0
mov DWORD [rcx+4], 0x40040000

mulsd xmm0, [rcx]
mov ecx, [rcx]
mov rsi, 0x1823042c

xor ecx, ecx
cvtsi2sd xmm0, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MULSDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 3 to a double precision float and store in xmm0
mov ecx, 3
cvtsi2sd xmm0, ecx

; convert 7 to a double precision float and store in xmm1
mov ecx, 7
cvtsi2sd xmm1, ecx

mov rsi, 0x1823042d
mulsd xmm0, xmm1
mov rsi, 0x1823042d

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MULSSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 11 to a double precision float and store in xmm0
mov ecx, 11
cvtsi2ss xmm0, ecx

mov rsi, 0x1823042e
; load 1.5 (in double precision float form)
lea rcx, [rsp-4]
mov DWORD [rcx], 0x3fc00000

mulss xmm0, [rcx]
mov ecx, [rcx]
mov rsi, 0x1823042e

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MULSSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 5 to a double precision float and store in xmm0
mov ecx, 5
cvtsi2ss xmm0, ecx

; convert 11 to a double precision float and store in xmm1
mov ecx, 11
cvtsi2ss xmm1, ecx

mov rsi, 0x1823042f
mulss xmm0, xmm1
mov rsi, 0x1823042f

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MUL_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x18230430
lea rdi, [rsp-0xC]
FST dword [rdi]
FMUL dword [rdi]
mov rdi, 0
mov rsi, 0x18230430


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MUL_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 to be 3.141593
FLDPI
mov rsi, 0x18230431
lea rdi, [rsp-0xC]
FST qword [rdi]
FMUL qword [rdi]
mov rdi, 0
mov rsi, 0x18230431


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MUL_FST0r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 and st1 to be pi
FLDPI
FLDPI
mov rsi, 0x18230432
FMUL st0, st1
mov rsi, 0x18230432


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: MUL_FrST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

; set up st0 and st1 to be pi
FLDPI
FLDPI
mov rsi, 0x18230433
FMUL st1, st0
mov rsi, 0x18230433


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: NEG16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; NEG16r
mov bx, 0x10
mov rsi, 0x18230434
neg bx
mov rsi, 0x18230434


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: NEG32r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Neg32R
mov ebx, 0x26
mov rsi, 0x18230435
neg ebx
mov rsi, 0x18230435


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: NEG8r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; NEG8r
mov dl, 0x1
mov rsi, 0x18230436
neg dl
mov rsi, 0x18230436


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: NOOP
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; NOOP
mov rsi, 0x18230437
nop
mov rsi, 0x18230437

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: NOT16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; NOT16r
mov cx, 0x8
mov rsi, 0x18230438
not cx
mov rsi, 0x18230438


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: NOT32r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Not32R
mov eax, 0x21
mov rsi, 0x18230439
not eax
mov rsi, 0x18230439


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: NOT64r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Not64R
mov rax, 0x21
mov rsi, 0x1823043a
not rax
mov rsi, 0x1823043a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: NOT8r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; NOT8r
mov dl, 0xaa
mov rsi, 0x1823043b
not dl
mov rsi, 0x1823043b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR16i16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR16i16
mov ax, 0x3333
mov rsi, 0x1823043c
or ax, 0xeeee
mov rsi, 0x1823043c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR16ri
mov bx, 0x1212
mov rsi, 0x1823043d
or bx, 0x444
mov rsi, 0x1823043d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR16rm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR16rm
mov rsi, 0x1823043e
lea rdi, [rsp-0x6]
mov WORD [rdi], 0x1234
mov ax, 0x5678
or ax, [rdi]
mov rdi, 0x0
mov rsi, 0x1823043e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR16rr
mov cx, 0x0
mov dx, 0x1
mov rsi, 0x1823043f
or cx, dx
mov rsi, 0x1823043f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR32i32
mov eax, 0x7
mov rsi, 0x18230440
or eax, 0x6fffffff
mov rsi, 0x18230440


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR32mr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR32mr
mov rsi, 0x18230441
lea rdi, [rsp-0x4]
mov DWORD [rdi], 0x1234abcd
mov eax, 0x5678fedc
or [rdi], eax
mov edx, [rdi]
mov rdi, 0x0
mov rsi, 0x18230441


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR32ri
mov ebx, 0x7
mov rsi, 0x18230442
or ebx, 0x44444
mov rsi, 0x18230442


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR32rr
mov ecx, 0x0
mov edx, 0x1
mov rsi, 0x18230443
or ecx, edx
mov rsi, 0x18230443


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR8i8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR8i8
mov al, 0x6
mov rsi, 0x18230444
or al, 0x2
mov rsi, 0x18230444


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; OR8ri
mov bh, 0x45
mov rsi, 0x18230445
or bh, 0x82
mov rsi, 0x18230445


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: OR8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; Or8RR
mov al, 0x5E
mov ah, 0x13
mov rsi, 0x18230446
or al, ah
mov rsi, 0x18230446


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ORPDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230447
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

orpd xmm0, [rcx]
mov rcx, [rcx]
xor rcx, rcx
mov rsi, 0x18230447

xor rcx, rcx
cvtsi2sd xmm0, rcx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ORPDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230448
orpd xmm0, xmm1
mov rsi, 0x18230448

xor rcx, rcx
cvtsi2sd xmm0, rcx
cvtsi2sd xmm1, rcx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ORPSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230449
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

orps xmm0, [rcx]
mov rcx, [rcx]
xor rcx, rcx
mov rsi, 0x18230449

xor rcx, rcx
cvtsi2sd xmm0, rcx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ORPSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x1823044a
orps xmm0, xmm1
mov rsi, 0x1823044a

xor rcx, rcx
cvtsi2sd xmm0, rcx
cvtsi2sd xmm1, rcx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PADDBrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x1823044b
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

paddb xmm0, [rcx]
mov rcx, [rcx]
mov rcx, 0
mov rsi, 0x1823044b

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PADDBrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x1823044c
paddb xmm0, xmm1
mov rsi, 0x1823044c

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PADDDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x1823044d
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

paddd xmm0, [rcx]
mov rcx, [rcx]
mov ecx, 0
mov rsi, 0x1823044d

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PADDDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x1823044e
paddd xmm0, xmm1
mov rsi, 0x1823044e

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PADDQrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea ecx, [rcx+16]

mov rsi, 0x1823044f
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

paddq xmm0, [rcx]
mov rcx, [rcx]
mov rcx, 0
mov rsi, 0x1823044f

cvtsi2sd xmm0, rcx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PADDQrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230450
paddq xmm0, xmm1
mov rsi, 0x18230450

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PADDWrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230451
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

paddw xmm0, [rcx]
mov rcx, [rcx]
mov rcx, 0
mov rsi, 0x18230451

cvtsi2sd xmm0, rcx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PADDWrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230452
paddw xmm0, xmm1
mov rsi, 0x18230452

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PEXTRWmr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov eax, 0
mov ecx, 0
mov rsi, 0x18230453
lea rbx, [rsp-4]
mov dword [rbx], 0

lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAAAAAAAA
mov dword [rcx+0x04], 0xBBBBBBBB
mov dword [rcx+0x08], 0xCCCCCCCC
mov dword [rcx+0x0C], 0xDDDDDDDD
movdqu xmm1, [rcx]

pextrw [rbx], xmm1, 7
mov ebx, [rbx]
mov ecx, 0
mov rsi, 0x18230453

cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PEXTRWri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x18230454
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0
mov eax, 0xFFFFFFFF

mov dword [rcx+0x00], 0xAAAAAAAA
mov dword [rcx+0x04], 0xBBBBBBBB
mov dword [rcx+0x08], 0xCCCCCCCC
mov dword [rcx+0x0C], 0xDDDDDDDD
movdqu xmm1, [rcx]

pextrw eax, xmm1, 5
mov ecx, 0
mov rsi, 0x18230454

cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PINSRWrmi
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rax, 0
mov ecx, 0
mov rsi, 0x18230455
lea rax, [rsp-4]
mov dword [rax], 0x99999999
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAAAAAAAA
mov dword [rcx+0x04], 0xBBBBBBBB
mov dword [rcx+0x08], 0xCCCCCCCC
mov dword [rcx+0x0C], 0xDDDDDDDD
movdqu xmm1, [rcx]

pinsrw xmm1, [rax], 7
mov ecx, 0
mov eax, 0
mov rsi, 0x18230455

cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PINSRWrri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov eax, 0xEE
mov rsi, 0x18230456
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAAAAAAAA
mov dword [rcx+0x04], 0xBBBBBBBB
mov dword [rcx+0x08], 0xCCCCCCCC
mov dword [rcx+0x0C], 0xDDDDDDDD
movdqu xmm1, [rcx]

pinsrw xmm1, ax, 5
mov ecx, 0
mov rsi, 0x18230456

cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: POP16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; POP16r
mov cx, 0x77
xor di, di
mov rsi, 0x18230457
push cx
pop di
mov rsi, 0x18230457


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PORrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230458
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

por xmm0, [rcx]
mov ecx, [rcx]
xor ecx, ecx
mov rsi, 0x18230458

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PORrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230459
por xmm0, xmm1
mov rsi, 0x18230459

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSHUFDmi
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x1823045a
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAAAAAAAA
mov dword [rcx+0x04], 0xBBBBBBBB
mov dword [rcx+0x08], 0xCCCCCCCC
mov dword [rcx+0x0C], 0xDDDDDDDD

pshufd xmm0, [rcx], 0x4E
mov ecx, 0
mov rsi, 0x1823045a

cvtsi2sd xmm0, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSHUFDri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x1823045b
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAAAAAAAA
mov dword [rcx+0x04], 0xBBBBBBBB
mov dword [rcx+0x08], 0xCCCCCCCC
mov dword [rcx+0x0C], 0xDDDDDDDD
movdqu xmm1, [rcx]

pshufd xmm0, xmm1, 0x4E
mov ecx, 0
mov rsi, 0x1823045b

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSLLDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x1823045c
lea rcx, [rsp-0x10]
mov dword [rcx+0x00], 0x0
mov dword [rcx+0x04], 0x0
mov dword [rcx+0x08], 0x0
mov dword [rcx+0x0C], 0x10
;set up ecx to be 8
movdqu xmm1, [rcx]

mov dword [rcx+0x00], 0x00FFF000
mov dword [rcx+0x04], 0x00FFF000
mov dword [rcx+0x08], 0x00FFF000
mov dword [rcx+0x0C], 0x00FFF000
movdqu xmm0, [rcx]

pslld xmm0, xmm1
mov ecx, 0
mov rsi, 0x1823045c

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSLLDrr2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x1823045d
lea rcx, [rsp-0x10]
mov dword [rcx+0x00], 0x0
mov dword [rcx+0x04], 0x0
mov dword [rcx+0x08], 0x0
mov dword [rcx+0x0C], 0xFF
;set up ecx to be 8
movdqu xmm1, [rcx]

mov dword [rcx+0x00], 0xF0FFF000
mov dword [rcx+0x04], 0xF0FFF000
mov dword [rcx+0x08], 0xF0FFF000
mov dword [rcx+0x0C], 0xF0FFF000
movdqu xmm0, [rcx]

pslld xmm0, xmm1
mov ecx, 0
mov rsi, 0x1823045d

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSLLWrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x1823045e
lea rcx, [rsp-0x10]
mov dword [rcx+0x00], 0x0
mov dword [rcx+0x04], 0x0
mov dword [rcx+0x08], 0x0
mov dword [rcx+0x0C], 0x4
;set up ecx to be 8
movdqu xmm1, [rcx]

mov dword [rcx+0x00], 0xF0F0F0F0
mov dword [rcx+0x04], 0xF0F0F0F0
mov dword [rcx+0x08], 0xF0F0F0F0
mov dword [rcx+0x0C], 0xF0F0F0F0
movdqu xmm0, [rcx]

psllw xmm0, xmm1
mov ecx, 0
mov rsi, 0x1823045e

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSRADrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x1823045f
lea rcx, [rsp-0x10]
mov dword [rcx+0x00], 0x0
mov dword [rcx+0x04], 0x0
mov dword [rcx+0x08], 0x0
mov dword [rcx+0x0C], 0x10
;set up ecx to be 8
movdqu xmm1, [rcx]

mov dword [rcx+0x00], 0x00FFF000
mov dword [rcx+0x04], 0x00FFF000
mov dword [rcx+0x08], 0x00FFF000
mov dword [rcx+0x0C], 0x00FFF000
movdqu xmm0, [rcx]

psrad xmm0, xmm1
mov ecx, 0
mov rsi, 0x1823045f

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSRADrr2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x18230460
lea rcx, [rsp-0x10]
mov dword [rcx+0x00], 0x0
mov dword [rcx+0x04], 0x0
mov dword [rcx+0x08], 0x0
mov dword [rcx+0x0C], 0xFF
;set up ecx to be 8
movdqu xmm1, [rcx]

mov dword [rcx+0x00], 0xF0FFF000
mov dword [rcx+0x04], 0xF0FFF000
mov dword [rcx+0x08], 0xF0FFF000
mov dword [rcx+0x0C], 0xF0FFF000
movdqu xmm0, [rcx]

psraw xmm0, xmm1
mov ecx, 0
mov rsi, 0x18230460

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSRAWrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

mov rsi, 0x18230461
lea rcx, [rsp-0x10]
mov dword [rcx+0x00], 0x0
mov dword [rcx+0x04], 0x0
mov dword [rcx+0x08], 0x0
mov dword [rcx+0x0C], 0x8
;set up ecx to be 8
movdqu xmm1, [rcx]

mov dword [rcx+0x00], 0xF0F0F0F0
mov dword [rcx+0x04], 0xF0F0F0F0
mov dword [rcx+0x08], 0xF0F0F0F0
mov dword [rcx+0x0C], 0xF0F0F0F0
movdqu xmm0, [rcx]

psraw xmm0, xmm1
mov ecx, 0
mov rsi, 0x18230461

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSUBBrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230462
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

psubb xmm0, [rcx]
mov ecx, [rcx]
mov ecx, 0
mov rsi, 0x18230462

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSUBBrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230463
psubb xmm0, xmm1
mov rsi, 0x18230463

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSUBDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230464
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

psubd xmm0, [rcx]
mov ecx, [rcx]
mov ecx, 0
mov rsi, 0x18230464

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSUBDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230465
psubd xmm0, xmm1
mov rsi, 0x18230465

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSUBQrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230466
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

psubq xmm0, [rcx]
mov ecx, [rcx]
mov ecx, 0
mov rsi, 0x18230466

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSUBQrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230467
psubq xmm0, xmm1
mov rsi, 0x18230467

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSUBWrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230468
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

psubw xmm0, [rcx]
mov ecx, [rcx]
mov ecx, 0
mov rsi, 0x18230468

cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PSUBWrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230469
psubw xmm0, xmm1
mov rsi, 0x18230469

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUNPCKLBWrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x1823046a
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF

punpcklbw xmm0, [rcx]
mov rcx, 0
mov rsi, 0x1823046a

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUNPCKLBWrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x1823046b
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF
movdqu xmm1, [rcx]

punpcklbw xmm0, xmm1
mov ecx, 0
mov rsi, 0x1823046b

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUNPCKLDQrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x1823046c
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF

punpckldq xmm0, [rcx]
mov ecx, 0
mov rsi, 0x1823046c

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUNPCKLDQrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x1823046d
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF
movdqu xmm1, [rcx]

punpckldq xmm0, xmm1
mov ecx, 0
mov rsi, 0x1823046d

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUNPCKLQDQrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x1823046e
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF

punpcklqdq xmm0, [rcx]
mov ecx, 0
mov rsi, 0x1823046e

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUNPCKLQDQrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x1823046f
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF
movdqu xmm1, [rcx]

punpcklqdq xmm0, xmm1
mov ecx, 0
mov rsi, 0x1823046f

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUNPCKLWDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x18230470
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF

punpcklwd xmm0, [rcx]
mov ecx, 0
mov rsi, 0x18230470

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUNPCKLWDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x18230471
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF
movdqu xmm1, [rcx]

punpcklwd xmm0, xmm1
mov ecx, 0
mov rsi, 0x18230471

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: PUSH16r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; PUSH16r
mov cx, 0x99
mov rsi, 0x18230472
push cx
mov rsi, 0x18230472
pop cx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL16r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; RCL16r1
mov dx, 0x414
mov rsi, 0x18230473
rcl dx, 0x1
mov rsi, 0x18230473


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL16rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCL16rCL
mov bx, 0x414
mov cl, 0x3
mov rsi, 0x18230474
rcl bx, cl
mov rsi, 0x18230474


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCL16ri
mov cx, 0x545
mov rsi, 0x18230475
rcl cx, 0x8
mov rsi, 0x18230475


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL32r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; RCL32r1
mov eax, 0x56789
mov rsi, 0x18230476
rcl eax, 0x1
mov rsi, 0x18230476


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL32rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCL32rCL
mov ebx, 0x4141
mov cl, 0x2
mov rsi, 0x18230477
rcl ebx, cl
mov rsi, 0x18230477


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCL32ri
mov ecx, 0x6789
mov rsi, 0x18230478
rcl ecx, 0x8
mov rsi, 0x18230478


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL8r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; RCL8r1
mov ah, 0xa2
mov rsi, 0x18230479
rcl ah, 0x1
mov rsi, 0x18230479


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL8rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCL8rCL
mov bh, 0x41
mov cl, 0x4
mov rsi, 0x1823047a
rcl bh, cl
mov rsi, 0x1823047a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCL8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCL8ri
mov ch, 0x56
mov rsi, 0x1823047b
rcl ch, 0x2
mov rsi, 0x1823047b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR16r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; RCR16r1
mov dx, 0x414
mov rsi, 0x1823047c
rcr dx, 0x1
mov rsi, 0x1823047c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR16rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCR16rCL
mov bx, 0x414
mov cl, 0x3
mov rsi, 0x1823047d
rcr bx, cl
mov rsi, 0x1823047d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCR16ri
mov cx, 0x545
mov rsi, 0x1823047e
rcr cx, 0x8
mov rsi, 0x1823047e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR32r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; RCR32r1
mov eax, 0x56789
mov rsi, 0x1823047f
rcr eax, 0x1
mov rsi, 0x1823047f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR32rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCR32rCL
mov ebx, 0x4141
mov cl, 0x2
mov rsi, 0x18230480
rcr ebx, cl
mov rsi, 0x18230480


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCR32ri
mov ecx, 0x6789
mov rsi, 0x18230481
rcr ecx, 0x8
mov rsi, 0x18230481


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR8r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCR8r1
mov ah, 0xa2
mov rsi, 0x18230482
rcr ah, 0x1
mov rsi, 0x18230482


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR8rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCR8rCL
mov bh, 0x41
mov cl, 0x4
mov rsi, 0x18230483
rcr bh, cl
mov rsi, 0x18230483


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: RCR8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; RCR8ri
mov ch, 0x56
mov rsi, 0x18230484
rcr ch, 0x2
mov rsi, 0x18230484


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL16r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROL16r1
mov dx, 0x414
mov rsi, 0x18230485
rol dx, 0x1
mov rsi, 0x18230485


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL16rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROL16rCL
mov bx, 0x414
mov cl, 0x3
mov rsi, 0x18230486
rol bx, cl
mov rsi, 0x18230486


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROL16ri
mov cx, 0x545
mov rsi, 0x18230487
rol cx, 0x8
mov rsi, 0x18230487


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL32r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ROL32r1
mov eax, 0x56789
mov rsi, 0x18230488
rol eax, 0x1
mov rsi, 0x18230488


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL32rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROL32rCL
mov ebx, 0x4141
mov cl, 0x2
mov rsi, 0x18230489
rol ebx, cl
mov rsi, 0x18230489


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROL32ri
mov ecx, 0x6789
mov rsi, 0x1823048a
rol ecx, 0x8
mov rsi, 0x1823048a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL8r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; ROL8r1
mov ah, 0xa2
mov rsi, 0x1823048b
rol ah, 0x1
mov rsi, 0x1823048b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL8rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROL8rCL
mov bh, 0x41
mov cl, 0x4
mov rsi, 0x1823048c
rol bh, cl
mov rsi, 0x1823048c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROL8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROL8ri
mov ch, 0x56
mov rsi, 0x1823048d
rol ch, 0x2
mov rsi, 0x1823048d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR16r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR16r1
mov dx, 0x414
mov rsi, 0x1823048e
ror dx, 0x1
mov rsi, 0x1823048e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR16rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR16rCL
mov bx, 0x414
mov cl, 0x3
mov rsi, 0x1823048f
ror bx, cl
mov rsi, 0x1823048f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR16ri
mov cx, 0x545
mov rsi, 0x18230490
ror cx, 0x8
mov rsi, 0x18230490


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR32r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR32r1
mov eax, 0x56789
mov rsi, 0x18230491
ror eax, 0x1
mov rsi, 0x18230491


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR32rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR32rCL
mov ebx, 0x4141
mov cl, 0x2
mov rsi, 0x18230492
ror ebx, cl
mov rsi, 0x18230492


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR32ri
mov ecx, 0x6789
mov rsi, 0x18230493
ror ecx, 0x8
mov rsi, 0x18230493


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR8r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR8r1
mov ah, 0xa2
mov rsi, 0x18230494
ror ah, 0x1
mov rsi, 0x18230494


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR8rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR8rCL
mov bh, 0x41
mov cl, 0x4
mov rsi, 0x18230495
ror bh, cl
mov rsi, 0x18230495


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ROR8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; ROR8ri
mov ch, 0x56
mov rsi, 0x18230496
ror ch, 0x2
mov rsi, 0x18230496


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SAHF
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SAHF
mov ah, 0xD5
mov rsi, 0x18230497
sahf
mov rsi, 0x18230497


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB16i16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB16i16
mov ax, 0x7
mov rsi, 0x18230498
sbb ax, 0xeeee
mov rsi, 0x18230498


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB16ri
mov bx, 0x7
mov rsi, 0x18230499
sbb bx, 0x444
mov rsi, 0x18230499


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB16rr
mov cx, 0x0
mov dx, 0x1
mov rsi, 0x1823049a
sbb cx, dx
mov rsi, 0x1823049a


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB32i32
mov eax, 0x7
mov rsi, 0x1823049b
sbb eax, 0x6fffffff
mov rsi, 0x1823049b


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB32mr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB32mr
mov rsi, 0x1823049c
lea rdi, [rsp-0x4]
mov DWORD [rdi], 0xabcd4321
mov eax, 0x56781234
sbb [rdi], eax
mov edx, [rdi]
mov rdi, 0x0
mov rsi, 0x1823049c


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Sbb32RI
mov rsi, 0x1823049d
sbb eax, 0x44
sbb ecx, 0x43
mov rsi, 0x1823049d


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB32rm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB32rm
mov rsi, 0x1823049e
lea rdi, [rsp-0x4]
mov DWORD [rdi], 0x1234abcd
mov eax, 0x56781234
sbb eax, [rdi]
mov rdi, 0x0
mov rsi, 0x1823049e


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB32rr
mov ecx, 0x0
mov edx, 0x1
mov rsi, 0x1823049f
sbb ecx, edx
mov rsi, 0x1823049f


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB8i8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB8i8
mov al, 0x7
mov rsi, 0x182304a0
sbb al, 0x5
mov rsi, 0x182304a0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB8ri
mov ah, 0x99
mov rsi, 0x182304a1
sbb ah, 0x3
mov rsi, 0x182304a1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SBB8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SBB8rr
mov ch, 0x2
mov dh, 0x3
mov rsi, 0x182304a2
sbb ch, dh
mov rsi, 0x182304a2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETAr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SETA
mov ecx, 0x100
mov ebx, 0x0F0
cmp ecx, ebx
mov rsi, 0x182304a3
seta al
mov rsi, 0x182304a3

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETBr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SETB
mov ecx, 0x010
mov ebx, 0x0F0
cmp ecx, ebx
mov rsi, 0x182304a4
setb al
mov rsi, 0x182304a4

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETEr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SETE
mov ecx, 0x010
mov ebx, 0x010
cmp ecx, ebx
mov rsi, 0x182304a5
sete al
mov rsi, 0x182304a5

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETGEr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SETGE
mov ecx, 0x010
mov ebx, 0x010
cmp ecx, ebx
mov rsi, 0x182304a6
setge al
mov rsi, 0x182304a6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETGr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov ecx, 0x111
mov ebx, 0x222
cmp ecx, ebx
mov rsi, 0x182304a7
setg al
mov rsi, 0x182304a7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETLEr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SETLE
mov ecx, 0x111
mov ebx, 0x111
cmp ecx, ebx
mov rsi, 0x182304a8
setle al
mov rsi, 0x182304a8

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETLr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SETL
mov ecx, 0x111
mov ebx, 0x010
cmp ecx, ebx
mov rsi, 0x182304a9
setl al
mov rsi, 0x182304a9

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETNEm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; SETNEm
mov ecx, 0x5
mov ebx, 0xa
cmp ecx, ebx
mov rsi, 0x182304aa
lea rdi, [rsp-0x4]
mov DWORD [rdi], 0xc
setne [rdi]
mov eax, [rdi]
xor edi, edi
mov rsi, 0x182304aa


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETNEr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SETNEr
mov ecx, 0x5
mov ebx, 0xa
cmp ecx, ebx
mov rsi, 0x182304ab
setne al
mov rsi, 0x182304ab

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SETSr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
mov ecx, 0x0
mov ebx, 0x222
cmp ecx, ebx
mov rsi, 0x182304ac
sets al
mov rsi, 0x182304ac

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL16r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHL16r1
mov ax, 0x7
mov rsi, 0x182304ad
shl ax, 0x1
mov rsi, 0x182304ad


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL16rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; Shl16RCL
mov ax, 0x14fc
mov cl, 0x5
mov rsi, 0x182304ae
shl ax, cl
mov rsi, 0x182304ae


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHL16ri
mov cx, 0x78
mov rsi, 0x182304af
shl cx, 0x8
mov rsi, 0x182304af


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL32r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHL32r1
mov eax, 0x888
mov rsi, 0x182304b0
shl eax, 0x1
mov rsi, 0x182304b0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL32rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHL32rCL
mov ebx, 0xbfe
mov cl, 0x1
mov rsi, 0x182304b1
shl ebx, cl
mov rsi, 0x182304b1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; Shl32RI
mov eax, 0x1
mov rsi, 0x182304b2
shl eax, 0xa
mov rsi, 0x182304b2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL8r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHL8r1
mov ah, 0xd
mov rsi, 0x182304b3
shl ah, 0x1
mov rsi, 0x182304b3


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL8rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHL8rCL
mov bh, 0xa
mov cl, 0x3
mov rsi, 0x182304b4
shl bh, cl
mov rsi, 0x182304b4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHL8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHL8ri
mov ch, 0xa
mov rsi, 0x182304b5
shl ch, 0x2
mov rsi, 0x182304b5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR16r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHR16r1
mov ax, 0xe45
mov rsi, 0x182304b6
shr ax, 0x1
mov rsi, 0x182304b6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR16rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; Shr16RCL
mov ax, 0x14FC
mov cl, 0x5
mov rsi, 0x182304b7
shr ax, cl
mov rsi, 0x182304b7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHR16ri
mov cx, 0x987
mov rsi, 0x182304b8
shr cx, 0x8
mov rsi, 0x182304b8


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR32r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHR32r1
mov eax, 0x444444
mov rsi, 0x182304b9
shr eax, 0x1
mov rsi, 0x182304b9


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR32rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHR32rCL
mov ebx, 0x654
mov cl, 0x5
mov rsi, 0x182304ba
shr ebx, cl
mov rsi, 0x182304ba


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; Shr32RI
mov eax, 0x4096
mov rsi, 0x182304bb
shr eax, 0x6
mov rsi, 0x182304bb


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR8r1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; Shr8R1
mov al, 0x4F
mov rsi, 0x182304bc
shr al, 0x1
mov rsi, 0x182304bc


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR8rCL
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHR8rCL
mov bh, 0xe
mov cl, 0x2
mov rsi, 0x182304bd
shr bh, cl
mov rsi, 0x182304bd


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHR8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; SHR8ri
mov ch, 0x8
mov rsi, 0x182304be
shr ch, 0x2
mov rsi, 0x182304be


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SHRD32rri8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; Shr32RI
mov ebx, 0x00000010
mov eax, 0x00001000
mov rsi, 0x182304bf
shrd eax,ebx,16
mov rsi, 0x182304bf


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: STC
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Stc
mov rsi, 0x182304c0
stc
mov rsi, 0x182304c0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: STD
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Std
mov rsi, 0x182304c1
std
mov rsi, 0x182304c1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ST_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
; ST_F32m
FLD1
mov rsi, 0x182304c2
lea rdi, [rsp-0x4]
fst DWORD [rdi]
mov eax, [rdi]
mov edi, 0x0
mov rsi, 0x182304c2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ST_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
; ST_F64m
FLD1
mov rsi, 0x182304c3
lea rdi, [rsp-0x10]
fst QWORD [rdi]
mov eax, [rdi+0x00]
mov ebx, [rdi+0x04]
mov edi, 0x0
mov rsi, 0x182304c3


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ST_Frr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
; ST_Frr
fldpi
fldpi
mov rsi, 0x182304c4
fst st2
mov rsi, 0x182304c4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ST_PF32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLD1
mov rsi, 0x182304c5
lea rdi, [rsp-0xc]
mov dword [rdi], 0
fstp dword [rdi]
mov eax, dword [rdi]
mov edi, 0x0
mov rsi, 0x182304c5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ST_PF64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLD1
mov rsi, 0x182304c6
lea rdi, [rsp-0xc]
mov dword [rdi], 0
fstp qword [rdi]
mov eax, dword [rdi+00]
mov ebx, dword [rdi+04]
mov edi, 0x0
mov rsi, 0x182304c6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ST_PF80m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
FLD1
mov rsi, 0x182304c7
lea rdi, [rsp-0x10]
mov dword [rdi+0x00], 0
mov dword [rdi+0x04], 0
mov dword [rdi+0x08], 0
fstp tword [rdi]
mov eax, dword [rdi+00]
mov ebx, dword [rdi+04]
mov ecx, dword [rdi+08]
mov edi, 0x0
mov rsi, 0x182304c7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: ST_PFr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_IE
;TEST_FILE_META_END
; ST_Frr
fldpi
mov rsi, 0x182304c8
fstp st2
mov rsi, 0x182304c8


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB16i16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB16i16
mov ax, 0xa123
mov rsi, 0x182304c9
sub ax, 0xeeee
mov rsi, 0x182304c9


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB16mr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB16mr
mov rsi, 0x182304ca
lea rbx, [rsp-0x4]
mov DWORD [rbx], 0xc8
mov ecx, 0x3
sub WORD [rbx], cx
mov ebx, [rbx]
mov rsi, 0x182304ca


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB16ri
mov bx, 0x2
mov rsi, 0x182304cb
sub bx, 0x444
mov rsi, 0x182304cb


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB16rm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF
;TEST_FILE_META_END
; SUB16rm
mov rsi, 0x182304cc
lea rcx, [rsp-0x4]
mov DWORD [rcx], 0xc8
mov rdx, 0x3
sub dx, WORD [rcx]
mov edx, DWORD [rcx]
mov rcx, 0
mov rsi, 0x182304cc

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB32i32
mov eax, 0x8
mov rsi, 0x182304cd
sub eax, 0x6fffffff
mov rsi, 0x182304cd


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB32ri
mov ebx, 0xc
mov rsi, 0x182304ce
sub ebx, 0x44444
mov rsi, 0x182304ce


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Sub32RR
mov eax, 0x1
mov ebx, 0x2
mov rsi, 0x182304cf
sub ebx, eax
mov rsi, 0x182304cf


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB8i8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB8i8
mov al, 0xa1
mov rsi, 0x182304d0
sub al, 0x5
mov rsi, 0x182304d0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB8mr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB8mr
mov rsi, 0x182304d1
lea rax, [rsp-0x4]
mov DWORD [rax], 0xc8
mov ebx, 0x2
sub BYTE [rax], bl
mov eax, [rax]
mov rsi, 0x182304d1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB8ri
mov ah, 0xdd
mov rsi, 0x182304d2
sub ah, 0x3
mov rsi, 0x182304d2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB8rm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; SUB8rm
mov rsi, 0x182304d3
lea rax, [rsp-0x4]
mov DWORD [rax], 0xc8
mov ebx, 0x2
sub bl, BYTE [rax]
mov eax, [rax]
mov rsi, 0x182304d3


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUBR_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END

FLDPI
mov rsi, 0x182304d4
lea rdi, [rsp-0xc]
FST dword [rdi]
FSUBR dword [rdi]
mov edi, 0
mov rsi, 0x182304d4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUBR_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 to be 1.0
FLD1
mov rsi, 0x182304d5
lea rdi, [rsp-08]
; 3.1415926 or there about
mov dword [rdi+00], 0x54442d18
mov dword [rdi+04], 0x400921fb
FSUBR qword [rdi]
mov edi, 0
mov rsi, 0x182304d5

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUBR_FST0r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 and st1 to be pi
FLDPI
FLDPI
mov rsi, 0x182304d6
FSUBR st0, st1
mov rsi, 0x182304d6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUBR_FrST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 and st1 to be pi
FLDPI
FLDPI
mov rsi, 0x182304d7
FSUBR st1, st0
mov rsi, 0x182304d7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUBSDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a double precision float and store in xmm0
mov ecx, 1
cvtsi2sd xmm0, ecx

mov rsi, 0x182304d8
; load 2.5 (in double precision float form)
lea rcx, [rsp-8]
mov DWORD [rcx], 0
mov DWORD [rcx+4], 0x40040000

subsd xmm0, [rcx]
mov ecx, [rcx]
mov rsi, 0x182304d8

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUBSDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 3 to a double precision float and store in xmm0
mov ecx, 3
cvtsi2sd xmm0, ecx

; convert 1 to a double precision float and store in xmm1
mov ecx, 1
cvtsi2sd xmm1, ecx

mov rsi, 0x182304d9
subsd xmm0, xmm1
mov rsi, 0x182304d9

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUBSSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 1 to a double precision float and store in xmm0
mov ecx, 1
cvtsi2ss xmm0, ecx

mov rsi, 0x182304da
; load 1.5 (in double precision float form)
lea rcx, [rsp-4]
mov DWORD [rcx], 0x3fc00000

subss xmm0, [rcx]
mov ecx, [rcx]
mov rsi, 0x182304da

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUBSSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; convert 3 to a double precision float and store in xmm0
mov ecx, 3
cvtsi2ss xmm0, ecx

; convert 1 to a double precision float and store in xmm1
mov ecx, 1
cvtsi2ss xmm1, ecx

mov rsi, 0x182304db
subss xmm0, xmm1
mov rsi, 0x182304db

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB_F32m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_C1|FLAG_FPU_PE
;TEST_FILE_META_END

FLDPI
mov rsi, 0x182304dc
lea rdi, [rsp-0xc]
FST dword [rdi]
FSUB dword [rdi]
mov edi, 0
mov rsi, 0x182304dc


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB_F64m
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_FPU_PE|FLAG_FPU_C1
;TEST_FILE_META_END

; set up st0 to be 1.0
FLD1
FLDPI
mov rsi, 0x182304dd
lea rdi, [rsp-0xc]
FSTP qword [rdi]
FSUB qword [rdi]
mov edi, 0
mov rsi, 0x182304dd

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB_FST0r
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 and st1 to be pi
FLDPI
FLDPI
mov rsi, 0x182304de
FSUB st0, st1
mov rsi, 0x182304de


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: SUB_FrST0
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; set up st0 and st1 to be pi
FLDPI
FLDPI
mov rsi, 0x182304df
FSUB st1, st0
mov rsi, 0x182304df


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Sar32RI1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; Sar32RI1
mov ebx, 0x56
mov rsi, 0x182304e0
sar ebx, 0x3
mov rsi, 0x182304e0


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Sar32RI2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF|FLAG_OF
;TEST_FILE_META_END
; Sar32RI2
mov rsi, 0x182304e1
sar ebx, 0x0
mov rsi, 0x182304e1


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Sbb32RR1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Sbb32RR1
mov ecx, 0x1892
mov edx, 0x4
mov rsi, 0x182304e2
sbb edx, ecx
mov rsi, 0x182304e2


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Sbb32RR2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Sbb32RR2
clc
mov ecx, 0xffffff67
mov edx, 0x19
mov rsi, 0x182304e3
sbb edx, ecx
mov rsi, 0x182304e3


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST16i16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST16i16
mov ax, 0x7
mov rsi, 0x182304e4
test ax, 0xeeee
mov rsi, 0x182304e4


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST16ri
mov bx, 0x7
mov rsi, 0x182304e5
test bx, 0x444
mov rsi, 0x182304e5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST16rr
mov cx, 0x0
mov dx, 0x1
mov rsi, 0x182304e6
test cx, dx
mov rsi, 0x182304e6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST32i32
mov eax, 0x7
mov rsi, 0x182304e7
test eax, 0x6fffffff
mov rsi, 0x182304e7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST32ri
mov ebx, 0x7
mov rsi, 0x182304e8
test ebx, 0x44444
mov rsi, 0x182304e8


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST32rr
mov ecx, 0x0
mov edx, 0x1
mov rsi, 0x182304e9
test ecx, edx
mov rsi, 0x182304e9


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST8i8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST8i8
mov al, 0x7
mov rsi, 0x182304ea
test al, 0x5
mov rsi, 0x182304ea


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST8ri
mov ah, 0x2
mov rsi, 0x182304eb
test ah, 0x3
mov rsi, 0x182304eb


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: TEST8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; TEST8rr
mov ch, 0x2
mov dh, 0x3
mov rsi, 0x182304ec
test ch, dh
mov rsi, 0x182304ec


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Test32RR1
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; Test32RR1
mov ebx, 0x0
mov rsi, 0x182304ed
test ebx, ebx
mov rsi, 0x182304ed


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: Test32RR2
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; Test32RR2
mov edi, 0x8
mov eax, 0x12
mov rsi, 0x182304ee
test edi, eax
mov rsi, 0x182304ee


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: UCOMISDrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2sd xmm0, ecx
mov ecx, 0
cvtsi2sd xmm1, ecx
mov rsi, 0x182304ef
lea rcx, [rsp-8]
movsd [rcx], xmm1
ucomiss xmm0, [rcx]
mov ecx, 0
mov rsi, 0x182304ef
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: UCOMISDrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2sd xmm0, ecx
mov ecx, 0
cvtsi2sd xmm1, ecx

mov rsi, 0x182304f0
ucomisd xmm0, xmm1
mov rsi, 0x182304f0

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: UCOMISSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2ss xmm0, ecx
mov ecx, 0
cvtsi2ss xmm1, ecx
mov rsi, 0x182304f1
lea rcx, [rsp-4]
movss [rcx], xmm1
ucomiss xmm0, [rcx]
mov ecx, 0
mov rsi, 0x182304f1
cvtsi2ss xmm0, ecx
cvtsi2ss xmm1, ecx


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: UCOMISSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; put 2 into ecx for future load into xmm0
mov ecx, 2
cvtsi2ss xmm0, ecx
mov ecx, 0
cvtsi2ss xmm1, ecx

mov rsi, 0x182304f2
ucomiss xmm0, xmm1
mov rsi, 0x182304f2

xor ecx, ecx
cvtsi2ss xmm0, ecx
cvtsi2ss xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: UNPCKLPSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x182304f3
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF

unpcklps xmm0, [rcx]
mov ecx, 0
mov rsi, 0x182304f3

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: UNPCKLPSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_SF|FLAG_PF
;TEST_FILE_META_END

mov rsi, 0x182304f4
lea rcx, [rsp-0x30]
and rcx, 0xFFFFFFFFFFFFFFF0

mov dword [rcx+0x00], 0xAABBCCDD
mov dword [rcx+0x04], 0xEEFF1122
mov dword [rcx+0x08], 0x33445566
mov dword [rcx+0x0C], 0x77889900
movdqu xmm0, [rcx]
mov dword [rcx+0x00], 0x00112233
mov dword [rcx+0x04], 0x44556677
mov dword [rcx+0x08], 0x8899AABB
mov dword [rcx+0x0C], 0xCCDDEEFF
movdqu xmm1, [rcx]

unpcklps xmm0, xmm1
mov ecx, 0
mov rsi, 0x182304f4

cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XADD16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; Xadd16RR
mov ax, 0x6824
mov dx, 0x1479
mov rsi, 0x182304f5
xadd ax, dx
mov rsi, 0x182304f5


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XADD32rm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; XADD32rm
mov rsi, 0x182304f6
lea rdi, [rsp-0x4]
mov DWORD [rdi], 0xabcd4321
mov eax, 0x56781234
xadd [rdi], eax
mov edx, [rdi]
mov edi, 0x0
mov rsi, 0x182304f6


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XADD32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; XADD32rr
mov ebx, 0xb46767
mov ecx, 0xa57877
mov rsi, 0x182304f7
xadd ebx, ecx
mov rsi, 0x182304f7


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XADD8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; XADD8rr
mov al, 0x45
mov bl, 0x56
mov rsi, 0x182304f8
xadd al, bl
mov rsi, 0x182304f8


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XCHG16ar
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; XCHG16ar
mov ax, 0x6
mov bx, 0x7
mov rsi, 0x182304f9
xchg ax, bx
mov rsi, 0x182304f9


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XCHG16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; XCHG16rr
mov bx, 0xc
mov dx, 0xd
mov rsi, 0x182304fa
xchg bx, dx
mov rsi, 0x182304fa


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XCHG32ar
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; XCHG32ar
mov eax, 0x20
mov ebx, 0x30
mov rsi, 0x182304fb
xchg eax, ebx
mov rsi, 0x182304fb


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XCHG32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; XCHG32rr
mov ebx, 0x120
mov ecx, 0x122
mov rsi, 0x182304fc
xchg ebx, ecx
mov rsi, 0x182304fc


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XCHG8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
; XCHG8rr
mov bl, 0x4
mov cl, 0x6
mov rsi, 0x182304fd
xchg bl, cl
mov rsi, 0x182304fd


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR16i16
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; XOR16i16
mov ax, 0x2
mov rsi, 0x182304fe
xor ax, 0xeeee
mov rsi, 0x182304fe


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR16ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; XOR16ri
mov bx, 0x2
mov rsi, 0x182304ff
xor bx, 0x444
mov rsi, 0x182304ff


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR16rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; XOR16rr
mov cx, 0x2
mov dx, 0x3
mov rsi, 0x18230500
xor cx, dx
mov rsi, 0x18230500


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR32i32
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; XOR32i32
mov eax, 0x12
mov rsi, 0x18230501
xor eax, 0x6fffffff
mov rsi, 0x18230501


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR32ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; Xor32RI
mov ebx, 0x12345
mov rsi, 0x18230502
xor ebx, 0x12345
mov rsi, 0x18230502


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR32rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; Xor32RR
mov rsi, 0x18230503
xor eax, eax
mov rsi, 0x18230503


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR8i8
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; XOR8i8
mov al, 0x12
mov rsi, 0x18230504
xor al, 0x5
mov rsi, 0x18230504


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR8ri
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; XOR8ri
mov ah, 0x12
mov rsi, 0x18230505
xor ah, 0x3
mov rsi, 0x18230505


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XOR8rr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
; XOR8rr
mov ch, 0x2
mov dh, 0x3
mov rsi, 0x18230506
xor ch, dh
mov rsi, 0x18230506


    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XORPSrm
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_OF|FLAG_SF|FLAG_ZF|FLAG_AF|FLAG_PF|FLAG_CF
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0

; load 128 bit value into xmm0
mov DWORD [rcx], 0x12345678
mov DWORD [rcx+4], 0x55555555
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0x1f311c47
movaps xmm0, [rcx]
lea rcx, [rcx+16]

mov rsi, 0x18230507
lea rcx, [rsp-17]
and rcx, 0xfffffffffffffff0 ; using this requires us to ignore ALU flags

mov DWORD [rcx], 0xabcdef12
mov DWORD [rcx+4], 0xaaaaaaaa
mov DWORD [rcx+8], 0xdeadbeef
mov DWORD [rcx+12], 0xfeeb1e01

xorps xmm0, [rcx]
mov ecx, [rcx]
xor ecx, ecx
mov rsi, 0x18230507

xor ecx, ecx
cvtsi2sd xmm0, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
    ;TEST: XORPSrr
    ;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END

; allocate 16 byte aligned stack space for the packed values
lea rcx, [rsp-33]
and rcx, 0xfffffffffffffff0

; load a 128 bit value into xmm0
mov DWORD [rcx], 0x55555555
mov DWORD [rcx+4], 0x14530451
mov DWORD [rcx+8], 0x1badb002
mov DWORD [rcx+12], 0xf0f0f0f0
movaps xmm0, [rcx]
lea rcx, [rcx+16]

; load a 128 bit value into xmm1
mov DWORD [rcx], 0xaaaaaaaa
mov DWORD [rcx+4], 0xcafebabe
mov DWORD [rcx+8], 0x2badb002
mov DWORD [rcx+12], 0x0e0e0e0e
movaps xmm1, [rcx]

mov rsi, 0x18230508
xorps xmm0, xmm1
mov rsi, 0x18230508

xor ecx, ecx
cvtsi2sd xmm0, ecx
cvtsi2sd xmm1, ecx

    ; pre-test clear to zeros
    mov  rax, 0
    mov  rcx, 0
    mov  rdx, 0
    mov  rbx, 0
    mov  rsi, 0
    mov  rdi, 0

    ; end pre-test clear
    ; restore stack
    mov  rsp, qword [internal_saveregs+0x20]
    mov  rbp, qword [internal_saveregs+0x28]
    ; add some stack slack
    sub rsp, 0x200
    mov rax, qword [internal_saveregs+0x40]
    push rax
    POPF
    FLDZ ;ST0
    FLDZ ;ST1
    FLDZ ;ST2
    FLDZ ;ST3
    FLDZ ;ST4
    FLDZ ;ST5
    FLDZ ;ST6
    FLDZ ;ST7
    FNINIT
    
mov  rax, qword [internal_saveregs+0x00]
mov  rcx, qword [internal_saveregs+0x08]
mov  rdx, qword [internal_saveregs+0x10]
mov  rbx, qword [internal_saveregs+0x18]
mov  rsp, qword [internal_saveregs+0x20]
mov  rbp, qword [internal_saveregs+0x28]
mov  rsi, qword [internal_saveregs+0x30]
mov  rdi, qword [internal_saveregs+0x38]
push qword [internal_saveregs+0x40]
POPF
FRSTOR [internal_savefpu_precall]
RET

SECTION .bss
internal_saveregs: RESD 10
internal_savefpu: RESB 108
internal_savefpu_precall: RESB 108
