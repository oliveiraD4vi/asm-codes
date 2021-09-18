%include "io.inc"

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp        ; for correct debugging
    
    mov eax, 0  ; move 1 para eax
    mov ebx, 1  ; move 0 para ebx 
    
    inst1: add eax, ebx ; utiliza uma etiqueta para indicar o inicio da memoria e soma eax e ebx
    mov ecx, eax        ; move o resultado de eax para ecx
    PRINT_UDEC 4, ecx   ; imprime o valor da soma
    jmp inst1           ; da um salto para o inst1 (que e o inicio da operacao de soma)
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	