%include "io.inc"

section .data
vet1 db 'Teste de String', 0
svet1 EQU $-vet1

section .bss
vet2 resb 20


section .text
global CMAIN
CMAIN:
    mov ecx, svet1
    mov esi, vet1
l1:
    PRINT_CHAR [esi]
    inc esi
    loop l1    
    xor eax, eax
    ret