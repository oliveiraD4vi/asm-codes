%include "io.inc"

extern scanf
extern printf

SECTION .data
fms     db "%lu"  , 0        ; formato do printf/scanf de 32 bits, '0'
fmt     db "%llu" , 0        ; formato do printf/scanf de 64 bits, '0'
aux     db "exemplo"    , 0        ; texto a ser auterado


SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debug
    
    mov eax, [aux]
    and eax, 11011111b
    mov [aux], eax
    
    PRINT_STRING aux
    
    mov esp, ebp
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	