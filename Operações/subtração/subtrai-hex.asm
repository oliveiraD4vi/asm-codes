%include "io.inc"

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging

    mov al, 11101001
    sub al, 00010111
    
    PRINT_UDEC 2, al
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	