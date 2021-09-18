%include "io.inc"

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp
    
    GET_UDEC 4, eax
    GET_UDEC 4, ebx
    GET_UDEC 4, ecx
    
    mul ebx
    mul ecx
    
    PRINT_UDEC 4, eax
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	