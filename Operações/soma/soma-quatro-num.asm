%include "io.inc"

SECTION .data
a dd 5
b dd 3

SECTION .bss
c resd 1
d resd 1

SECTION .text           ; seção de código
    global main         ; ponto de entrada padrão do GCC
main:
    
    mov eax, [a]
    mov ebx, [b]
    add eax, ebx
    
    GET_UDEC 4, c
    GET_UDEC 4, d
    
    mov ecx, [c]
    add ecx, [d]
    mov [c], ecx
    
    add eax, [c]
    
    PRINT_UDEC 4, eax
    
    xor eax, eax
    ret	