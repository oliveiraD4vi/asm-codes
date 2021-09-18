%include "io.inc"

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging
    
    mov eax, 10011101A0011101h
    add eax, 00000010D0000010h
    
    PRINT_UDEC 4, eax
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	