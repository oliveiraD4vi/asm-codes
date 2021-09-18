%include "io.inc"

section .data
msg_sucesso db 'Email reconhecido com sucesso', 0
msg_insucesso db 'Email nao reconhecido', 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    
    call le_caractere
    call valida_caractere
    cmp bl, 1
    je s0
    jmp imprime_nok
    
    fim:
    xor eax, eax
    ret
    
    s0:
    call le_caractere
    call valida_caractere
    cmp bl, 1
    je s0
    call valida_arroba
    cmp bl, 1
    je s1
    jmp erro
    
    s1:
    call le_caractere
    call valida_caractere
    cmp bl, 1
    je s2
    jmp erro
    
    s2:
    call le_caractere
    call valida_caractere
    cmp bl, 1
    je s2
    call valida_ponto
    cmp bl, 1
    je s3
    jmp erro
    
    s3:
    call le_caractere
    call valida_caractere
    cmp bl, 1
    je s4
    jmp erro
    
    s4:
    call le_caractere
    call valida_caractere
    cmp bl, 1
    je s5
    jmp erro
    
    s5:
    call le_caractere
    call valida_caractere
    cmp bl, 1
    je s5
    call valida_ponto
    cmp bl, 1
    je s3
    cmp al, 0ah
    je imprime_ok
    jmp imprime_nok
    jmp fim
;---------------------------------
le_caractere:
;Receives: -
;Returns: proximo caractere em al
;         0 em al para fim de string
;---------------------------------
enter 0,0
GET_CHAR AL
leave
ret    

;---------------------------------
valida_caractere:
;Receives: caractere em al
;Returns: bl=1 se for cartere e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp al, 'a'
jb fim_valida_caractere
cmp al, 'z'
ja fim_valida_caractere
mov bl, 1
fim_valida_caractere:
leave
ret 



;---------------------------------
valida_arroba:
;Receives: caractere em al
;Returns: bl=1 se for cartere e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp al, '@'
jne fim_arroba
mov bl, 1
fim_arroba:
leave
ret 

;---------------------------------
valida_ponto:
;Receives: caractere em al
;Returns: bl=1 se for cartere e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp al, '.'
jne fim_ponto
mov bl, 1
fim_ponto:
leave
ret

imprime_ok:
PRINT_STRING msg_sucesso
jmp fim

imprime_nok:
PRINT_STRING msg_insucesso
jmp fim

erro:
jmp imprime_nok
