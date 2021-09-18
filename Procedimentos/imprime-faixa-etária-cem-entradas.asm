extern scanf
extern printf

SECTION .bss
num     resd 1               ; variavel do primeiro valor, quantidade
aux     resd 1               ; variavel auxiliar que guarda ECX para contagem no loop

SECTION .data
fms     db "%lu"         , 0 ; formato do printf/scanf de 32 bits, '0'
newline db 0Dh, 0Ah      , 0 ; nova linha

qtd1    dd 0                 ; guarda quantidade de vezes que a faixa etária 1 aparece
qtd2    dd 0                 ; guarda quantidade de vezes que a faixa etária 2 aparece
qtd3    dd 0                 ; guarda quantidade de vezes que a faixa etária 3 aparece
qtd4    dd 0                 ; guarda quantidade de vezes que a faixa etária 4 aparece
qtd5    dd 0                 ; guarda quantidade de vezes que a faixa etária 5 aparece

SECTION .text                ; secao de codigo
    global main              ; ponto de entrada padrao do GCC
main:
    mov ebp, esp             ; for correct debug
    
    mov ecx      , 100       ; move a quantidade itens recebidos para ECX
    mov BYTE[aux], 100       ; move o mesmo valor para a variável auxiliar
    
    l1: 
        push num             ; 
        push fms             ; 
        call scanf           ; recebe valores do usuario
        add esp, 8           ; 
                             ; 
        mov  ecx, [aux]      ; retoma o valor perdido de ECX
                             ; 
        push ecx             ; 
        call func            ; chama a função que testa os valores
                             ; 
        dec BYTE[aux]        ; decresce o valor do aux para uso de controle
                             ; 
        loop l1              ; retorna para o início de L1
                             ; 
    call imprime             ; chama a função que imprime os valores
    
    mov esp, ebp             ; 
    xor eax, eax             ; valor de retorno normal, retorno sem erro 
    ret	
    
   global func
func:
    mov ecx, [esp + 4]       ; 
    mov edx, ecx             ; 
                             ; 
    mov eax, [num]           ; 
    cmp eax, 60              ; 
    JG  number5              ; pula para NUMBER5 se NUM for maior que 60
                             ; 
    mov eax, [num]           ; 
    cmp eax, 45              ; 
    JG  number4              ; pula para NUMBER4 se NUM for maior que 45
                             ; 
    mov eax, [num]           ; 
    cmp eax, 30              ; 
    JG  number3              ; pula para NUMBER3 se NUM for maior que 30
                             ; 
    mov eax, [num]           ; 
    cmp eax, 15              ; 
    JG  number2              ; pula para NUMBER2 se NUM for maior que 15
                             ; 
    mov eax, [num]           ; 
    cmp eax, 0               ; 
    JG  number1              ; pula para NUMBER1 se NUM for maior que 0
    
number5:                     ; 
    inc  BYTE[qtd5]          ; incrementa variável que guarda a quantidade da faixa etária 5
    ret                      ; 
                             ; 
number4:                     ; 
    inc  BYTE[qtd4]          ; incrementa variável que guarda a quantidade da faixa etária 4
    ret                      ; 
                             ; 
number3:                     ; 
    inc  BYTE[qtd3]          ; incrementa variável que guarda a quantidade da faixa etária 3
    ret                      ; 
                             ; 
number2:                     ; 
    inc  BYTE[qtd2]          ; incrementa variável que guarda a quantidade da faixa etária 2
    ret                      ; 
                             ; 
number1:                     ; 
    inc  BYTE[qtd1]          ; incrementa variável que guarda a quantidade da faixa etária 1
    ret                      ; 
    
   global imprime
imprime:
    ; imprime 1ª faixa etária + linha
    mov eax, [qtd1]
    
    push eax
    push fms
    call printf
    add  esp, 8
    
    push eax
    push newline
    call printf
    add  esp, 8
    
    ; imprime 2ª faixa etária + linha
    mov eax, [qtd2]
    
    push eax
    push fms
    call printf
    add  esp, 8
    
    push eax
    push newline
    call printf
    add  esp, 8
    
    ; imprime 3ª faixa etária + linha
    mov eax, [qtd3]
    
    push eax
    push fms
    call printf
    add  esp, 8
    
    push eax
    push newline
    call printf
    add  esp, 8
    
    ; imprime 4ª faixa etária + linha
    mov eax, [qtd4]
    
    push eax
    push fms
    call printf
    add  esp, 8
    
    push eax
    push newline
    call printf
    add  esp, 8
    
    ; imprime 5ª faixa etária
    mov eax, [qtd5]
    
    push eax
    push fms
    call printf
    add  esp, 8
    
    ret
        