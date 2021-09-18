%include "io.inc"

section .text
global main
main:
    mov eax, 11
    mov ebx, 8
    add eax, ebx
    PRINT_UDEC 4, eax
    
    ret