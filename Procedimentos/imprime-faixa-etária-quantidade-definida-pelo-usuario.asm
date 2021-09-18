extern scanf
extern printf

SECTION .bss
qtd  resd 1                  ; variavel do primeiro valor, quantidade
aux  resd 1                  ; variavel auxiliar que guarda ECX para contagem
vet  resd 1                  ; variavel que recebe valores

SECTION .data
fms  db "%lu"            , 0 ; formato do printf/scanf de 32 bits, '0'

msgI db 'Idoso'          , 0 ; mensagem Idoso
msgJ db 'Jovem'          , 0 ; mensagem Jovem
msgA db 'Adulto'         , 0 ; mensagem Adulto
msgV db 'Idade Inválida' , 0 ; mensagem Idade Inválida

newline db 0Dh, 0Ah, 0       ; nova linha

SECTION .text                ; secao de codigo
    global main              ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging
                             ; 
    push qtd                 ; 
    push fms                 ; 
    call scanf               ; recebe o primeiro valor do usuario
    add esp, 8               ; 
                             ; 
    mov ecx, [qtd]           ; 
    mov [aux], ecx           ; guarda valor de ECX para contagem
    
    l1:
        mov eax, [aux]       ; 
        cmp eax, 0           ; 
        JE fim               ; testa se AUX chegou ao fim e pula para o fim da execução
                             ; 
        push vet             ; 
        push fms             ; 
        call scanf           ; recebe cada valor seperadamente
        add  esp, 8          ; 
                             ; 
        mov  ecx, [aux]      ; guarda o valor perdido de ECX
                             ; 
        push ecx             ; 
        call func            ; chama a função da quantidade de vezes definida
                             ; 
        mov  ebx, [aux]      ; 
        dec  ebx             ; 
        mov  [aux], ebx      ; 
                             ; 
        loop l1              ; 
    
    fim:
        mov esp, ebp         ; 
        xor eax, eax         ; valor de retorno normal, retorno sem erro 
        ret
    
    global func
func:
    mov ecx, [esp + 4]       ; 
    mov edx, ecx             ; 
                             ; 
    mov eax, [vet]           ; 
    cmp eax, 0               ; 
    JNG invalido             ; pula para INVALIDO se VET não for maior que 0
                             ; 
    mov eax, [vet]           ; 
    cmp eax, 19              ; 
    JNG jovem                ; pula para JOVEM se VET não for maior que 19
                             ; 
    mov eax, [vet]           ; 
    cmp eax, 59              ; 
    JNG adulto               ; pula para ADULTO se VET não for maior que 59
                             ; 
    mov eax, [vet]           ; 
    cmp eax, 59              ; 
    JG  idoso                ; pula para IDOSO se VET for maior que 59
    
invalido:
    ; PRINT_STRING msgV
    ; função imprime mensagem correspondente + nova linha
    
    push eax
    push msgV
    call printf
    add  esp, 8
    
    push eax
    push newline
    call printf
    add  esp, 8
    
    ret
    
jovem:
    ; PRINT_STRING msgJ
    ; função imprime mensagem correspondente + nova linha
    
    push eax
    push msgJ
    call printf
    add  esp, 8

    push eax
    push newline
    call printf
    add  esp, 8
    
    ret
 
adulto:
    ; PRINT_STRING msgA
    ; função imprime mensagem correspondente + nova linha
    
    push eax
    push msgA
    call printf
    add  esp, 8
    
    push eax
    push newline
    call printf
    add  esp, 8
    
    ret
 
idoso:
    ; PRINT_STRING msgI
    ; função imprime mensagem correspondente + nova linha
    
    push eax
    push msgI
    call printf
    add  esp, 8
    
    push eax
    push newline
    call printf
    add  esp, 8
    
    ret