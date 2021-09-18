%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 20
    mov ebx, 30
    sub eax, ebx
    jb negativo
    
    fim:
    xor eax, eax
    ret
    
    negativo:
    nop
    jmp fim