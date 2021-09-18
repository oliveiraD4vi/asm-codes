%include "io.inc"

section .data 
msg db 'Olah mundo', 0

section .text
global CMAIN
CMAIN:
    
    mov ecx, 10
    l1:

    PRINT_STRING msg
    loop l1
    
    xor eax, eax
    ret