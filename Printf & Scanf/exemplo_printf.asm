extern add
extern printf

section .data
texto db 'O resultado eh : ', "%d", 0Ah, 0

section .text

global main
main:
    mov ebp, esp; for correct debugging

push eax             ; print("O resultado eh: %d", 15);
push texto
call printf          ; printf(format, eax)
add esp, 8           ; 8 bytes relativos a 2 push

xor eax, eax
ret 4
