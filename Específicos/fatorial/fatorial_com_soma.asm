extern scanf
extern printf

SECTION .data
fms db "%lu", 0         ; formato do printf/scanf de 32 bits, '0'
fmt db "%llu", 0        ; formato do printf/scanf de 64 bits, '0'

SECTION .bss
num resd 1
aux resd 1

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging    
    
    push aux
    push fms
    call scanf
    add esp, 8
    
    mov ecx, [aux]      ; move o valor lido com SCANF para ECX
    
    push ecx            ; empilha ECX
    call fact           ; chama proc fact
    
    mov eax, [num]      ; coloca o resultado do fatorial em EAX para uso do PRINTF
    
    push eax
    push fms
    call printf
    add esp, 8
                          
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret
    
fact:
    mov ecx, [esp + 4]  ; desempilha ECX em ECX              
    mov edx, ecx        ; guarda o valor de ECX em EDX    
    mov ebx, ecx        ; guarda ECX em EBX, pois EDX vai mudar posteriormente
    sub ecx, 1          ; subtrai 1 de ECX de forma a sinalizar a quantidade de somas
    
L1: 
    push edx            ; empilha EDX
    push ecx            ; empilha ECX
    call soma
    
    mov edx, eax        ; põe o valor de retorno da ultima soma em EDX
    mov eax, 1          ; coloca 1 em EAX para comparação da instrução JNE
    sub ebx, 1          ; subtrai 1 de EBX, sinalizando a atual quantidade de somas
    mov ecx, ebx        ; põe o valor de EBX em ECX
    sub ecx, 1          ; subtrai 1 de ECX, sinalizando a pŕoxima quantidade de somas
    JNE L1              ; condicional, testa se ECX != EAX (que possui 1)
    
    ret 4               ; valor de retorno para desempilhar corretamente
    
soma:     
    mov ecx, [esp + 4]  ; desempilha ECX em ECX
    mov edx, [esp + 8]  ; desempilha EDX em EDX
    mov DWORD[num], 0
    
L2:
    add DWORD[num], edx ; soma EDX (valor original) a NUM
    loop L2             ; volta para o ponto definido
    
    mov eax, [num]      ; guarda o valor de NUM em EAX de forma a explicitar o retorno
    
    ret 8               ; valor de retorno para desempilhar corretamente