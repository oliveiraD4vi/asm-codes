%include "io.inc"

section .data
vet1 db 'Teste de String', 0
svet1 EQU $-vet1

section .text
global CMAIN
CMAIN:
    mov ecx, svet1
    mov edi, 0
l1:
    PRINT_CHAR [vet1+edi]
    inc edi
    loop l1    
    xor eax, eax
    ret