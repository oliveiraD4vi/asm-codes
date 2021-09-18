extern scanf
extern printf

SECTION .data
scanfString   DB "%f %f %f"                              , 0x00

msgPassou     DW "Aprovado! Sua nota foi %.2lf."         , 0x0D, 0x0A, 0x00
msgAFinal     DW "Avaliação Final! Sua nota foi %.2lf."  , 0x0D, 0x0A, 0x00
msgNaoPassou  DW "Reprovado! Sua nota foi %.2lf."        , 0x0D, 0x0A, 0x00
msgInvalida   DW "Nota inválida! Reveja as entradas."    , 0x0D, 0x0A, 0x00

qntd          DD 3.0
mediaF        DD 4.0
mediaM        DD 7.0
invalida      DD 10.0

SECTION .bss
nota1         RESD 1
nota2         RESD 1
nota3         RESD 1
mediaA        RESQ 1

SECTION .text               ; secao de codigo
    global main             ; ponto de entrada padrao do GCC
main:
    mov ebp, esp            ; for correct debug
    
    ; recebe as notas
    push nota3
    push nota2
    push nota1
    push scanfString
    call scanf
    add  esp, 16
    
    ; chama função que calcula a média
    push  DWORD[qntd]
    push  DWORD[nota3]
    push  DWORD[nota2]
    push  DWORD[nota1]
    call  _calcMedia
    fstp  QWORD[mediaA]
    
    ; verifica se os valores inseridos são inválidos
    finit
    fld   DWORD[invalida]
    fld   QWORD[mediaA]
    fcomi 
    ja    _imprimeInvalida
    
    ; verifica se passou ou não
    finit
    fld   DWORD[mediaM]
    fld   QWORD[mediaA]
    fcomi 
    jnb   _imprimeAprovado
    
    finit
    fld   DWORD[mediaF]
    fld   QWORD[mediaA]
    fcomi
    jnb   _imprimeAFinal
    
    jmp   _imprimeReprovado
    
    exit:
        mov esp, ebp
        xor eax, eax            ; valor de retorno normal, retorno sem erro 
        ret
    
_calcMedia:
    push ebp
    mov  ebp, esp      
    
    finit                       ; "zera" os registradores
    fld  DWORD[ebp + 08]        ; ST(0) = (nota 1)
    fadd DWORD[ebp + 12]        ; ST(0) = (nota 1 + nota 2)
    fadd DWORD[ebp + 16]        ; ST(0) = (nota 1 + nota 2 + nota 3)
    fdiv DWORD[ebp + 20]        ; ST(0) = (nota 1 + nota 2 + nota 3)/3
    
    mov esp, ebp
    pop ebp
    ret
    
_imprimeAprovado:
    ; imprime mensagem Aprovado!
    push DWORD[mediaA + 4]
    push DWORD[mediaA]
    push msgPassou
    call printf
    add  esp, 12
    jmp  exit
    
_imprimeAFinal:
    ; imprime mensagem Avaliação Final!
    push DWORD[mediaA + 4]
    push DWORD[mediaA]
    push msgAFinal
    call printf
    add  esp, 12
    jmp  exit
    
_imprimeReprovado:
    ; imprime mensagem Reprovado!
    push DWORD[mediaA + 4]
    push DWORD[mediaA]
    push msgNaoPassou
    call printf
    add  esp, 12
    jmp  exit
    
_imprimeInvalida:
    ; imprime mensagem Nota inválida!
    push msgInvalida
    call printf
    add  esp, 8
    jmp  exit