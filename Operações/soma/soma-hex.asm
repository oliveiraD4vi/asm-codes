%include "io.inc"

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging

    mov ax, 1001110110011101b
    add ax, 0000111100011010b   
    
    PRINT_UDEC 2, ax
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	