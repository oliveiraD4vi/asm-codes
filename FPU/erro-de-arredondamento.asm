extern printf

SECTION .data
printfString  DB "%.55lf"       ,   0x0D, 0x0A, 0x00
x             DQ 3.17

SECTION .text               ; secao de codigo
    global main             ; ponto de entrada padrao do GCC
main:
    mov ebp, esp            ; for correct debug
    
    push DWORD[x + 4]
    push DWORD[x]
    push printfString
    call printf
    add  esp , 8
    
    mov esp, ebp
    xor eax, eax            ; valor de retorno normal, retorno sem erro 
    ret