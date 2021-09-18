extern scanf
extern printf

SECTION .data
fms db "%lu", 0              ; formato do printf/scanf de 32 bits, '0'
fmt db "%llu", 0             ; formato do printf/scanf de 64 bits, '0'

SECTION .bss
num resd 1
num1 resd 1

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging
 
    push num1
    push fms
    call scanf
    add esp, 8
    
    mov ecx, [num1]
    mov eax, 1          ; move 1 (elemento neutro da multiplicação) para EAX
    
L1:                     ; define o ponto de retorno da instrução LOOP
    mul ecx             ; multiplica o conteúdo de ECX pelo de EAX e guarda em EAX
    loop L1             ; retorna para a linha de codigo definida pela label

    push eax
    push fms
    call printf
    add esp, 8
                          
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret	