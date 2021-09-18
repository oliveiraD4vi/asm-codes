%include "io.inc"

section .data
val1 db 00110000b
msgyes db 'O bit 1 do referido byte é 1', 0
msgno db 'O bit 1 do referido byte é 0', 0


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    movzx eax, BYTE[val1]
    ;AND al, 00000010b
    bt eax, 1
    jc imprimesim
    jmp imprimenao
    fim:
    xor eax, eax
    ret
    
    
imprimesim:
push msgyes
call printf
add esp, 4
jmp fim



imprimenao:  
    push msgno
    call printf
    add esp, 4
    jmp fim