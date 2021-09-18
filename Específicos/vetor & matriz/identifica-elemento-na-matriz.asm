extern scanf
extern printf

SECTION .data
fmsin    DB "%lu"                , 0dh, 0ah, 0       ; formato do printf/scanf de 32 bits, '0'
fmsot    DB "O elemento é %lu"   , 0dh, 0ah, 0       ; formato do printf/scanf de 32 bits, '0'

paddingC DD 4
paddingL DD 12

matrix   DD 1, 2, 3, 
         DD 4, 5, 6,
         DD 7, 8, 9, 
         DD 4, 5, 6,
         DD 1, 2, 3, 
         DD 4, 5, 6
         
SECTION .bss
line     RESD 1
colu     RESD 1

SECTION .text              ; secao de codigo
    global main            ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debug
    
    push line
    push fmsin
    call scanf
    add esp, 8
    
    push colu
    push fmsin
    call scanf
    add esp, 8
    
    mov esi, [line]         ; linhas
    mov edi, [colu]         ; colunas
    
    mov eax, esi
    mul DWORD[paddingL]
    mov esi, eax
    
    mov eax, edi
    mul DWORD[paddingC]
    mov edi, eax
    
    mov edx, matrix
    add edx, esi
    add edx, edi
    
    mov eax, [edx]
    
    push eax
    push fmsot
    call printf
    add esp, 8
    
    mov esp, ebp
    xor eax, eax            ; valor de retorno normal, retorno sem erro 
    ret	