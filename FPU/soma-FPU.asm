extern scanf
extern printf

SECTION .data
scanfString   DB "%f %f"       ,   0x00
printfString  DB "%.2lf"       ,   0x0D, 0x0A, 0x00

SECTION .bss
x             resd 1
y             resd 1
z             resq 1

SECTION .text               ; secao de codigo
    global main             ; ponto de entrada padrao do GCC
main:
    mov ebp, esp            ; for correct debug
    
    push y
    push x
    push scanfString
    call scanf
    add  esp, 12
    
    finit                   ; zera a FPU
    fld  DWORD[x]           ; ST(0) = x
    fadd DWORD[y]           ; ST(0) = x + y
    fstp QWORD[z]           ; guarda em z/ pilha vazia
    
    push DWORD[z + 4]
    push DWORD[z]
    push printfString
    call printf
    add  esp , 12
    
    mov esp, ebp
    xor eax, eax            ; valor de retorno normal, retorno sem erro 
    ret	