%include "io.inc"

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp       ; for correct debugging
    
    GET_UDEC 2, ax    ; recebe primeiro numero e poe em EAX (2 bytes = 16 bits = DW)
    GET_UDEC 2, bx    ; recebe segundo numero e poe em EBX (2 bytes = 16 bits = DW)
    GET_UDEC 2, cx    ; recebe terceiro numero e poe em ECX (2 bytes = 16 bits = DW)
    
    add ax, bx            ; soma EBX a EAX e guarda em EAX
    add ax, cx            ; soma ECX a EAX e guarda em EAX
    
    PRINT_UDEC 2, ax    ; imprime o resultado da soma guardado em EAX (2 bytes = 16 bits = DW)
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	