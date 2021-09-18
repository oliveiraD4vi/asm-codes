%include "io.inc"

section .data 
i dd 5
j dd 3

;for(i=0; i < 5; i++){
;    for(j=0; j < 3; j++){
;        eax++
;    }
;}


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov ecx, [i]
    mov eax, 0
l1: 
    mov [i], ecx
    mov ecx, [j]
l2:
    inc eax
    loop l2
   
    mov ecx, [i]
    loop l1    
    
    xor eax, eax
    ret