%include "io.inc"
extern  printf		         ; funcao C a ser chamada
extern  scanf                ; funcao C a ser chamada


section .data
 msgin db '%d', 0
 msgout db 'O resultado da operacao eh: %d', 0

section .bss
valin RESD 1
minhavariavel RESD 5

section .text
global CMAIN
CMAIN:
    push valin           ; argumentos sao empilhados da direita para a esquerda
    push msgin           ; endereco do inteiro sem sinal de 32 bits num1
    call scanf           ; scanf("%d", &valin);
    add  esp, 8          ; remove parametros
   
    mov eax, [valin]
    add eax, [valin]
        
        
    push eax             ; valor do resultado salvo em eax
    push msgout	     ; endereco da string de controle do printf/scanf
    call printf		; chamada da funcao C printf    printf("O resultado da operacao eh: %d", valout);
    add  esp, 8		; desempilha 2 valores de 4 bytes empilhados pela instrução push
    
    xor eax, eax
    ret