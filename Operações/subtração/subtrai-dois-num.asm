%include "io.inc"

SECTION .bss
var1 resd 1             ; declara variavel 1
var2 resd 1             ; declara variavel 2

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp        ; for correct debugging
    
    GET_UDEC 4, [var1]  ; recebe primeiro numero
    GET_UDEC 4, [var2]  ; recebe segundo numero
    
    mov eax, [var2]     ; move o conteúdo da variavel 1 para EAX
    sub eax, [var1]     ; subtrai o valor da variavel 2 de EAX e guarda em EAX
    
    PRINT_UDEC 4, eax   ; imprime o resultado da subtração
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	