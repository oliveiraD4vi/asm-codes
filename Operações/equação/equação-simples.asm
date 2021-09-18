; Expressão -> (15 - 5) + (9 + 2) + 4 = 25

%include "io.inc"

SECTION .data
    a DD 15
    b DD 5
    c DD 9
    d DD 2
    e DD 4
    
SECTION .bss
    r RESD 1

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp        ; for correct debugging
    
    mov eax, [a]
    mov ebx, [b]
    neg ebx
    add eax, ebx
    
    mov ebx, [c]
    add ebx, [d]
    
    add eax, ebx
    add eax, [e]
    mov [r], eax
    
    PRINT_UDEC 4, [r]
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	