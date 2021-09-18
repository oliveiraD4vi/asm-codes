extern scanf
extern printf

SECTION .data
scanfString   DB "%c"                       , 0x00
fraseOk       DB "Palavra reconhecida"      , 0x0D, 0x0A, 0x00
fraseErro     DB "Palavra não reconhecida"  , 0x0D, 0x0A, 0x00

SECTION .bss
palavraChave  RESB 3

SECTION .text               ; secao de codigo
    global main             ; ponto de entrada padrao do GCC
main:
    mov ebp, esp            ; for correct debug
    
    mov esi, palavraChave
    
    .aState:
        call _getChar
        cmp BYTE[esi], 'A'
        JB  .errorState
        cmp BYTE[esi], 'Z'
        JBE .bState
        cmp BYTE[esi], 'a'
        JB  .errorState
        cmp BYTE[esi], 'z'
        JBE .bState
        JMP .errorState
    
    .bState:
        inc esi
        call _getChar
        cmp BYTE[esi], '0'
        JB  .errorState
        cmp BYTE[esi], '9'
        JBE .cState
        JMP .errorState
    
    .cState:
        inc esi
        call _getChar
        cmp BYTE[esi], '@'
        JE  .okState
        cmp BYTE[esi], '*'
        JE  .okState
        JMP .errorState
    
    .errorState:
        push fraseErro
        call printf
        add esp, 4
        JMP .exit
    
    .okState:
        push fraseOk
        call printf
        add esp, 4
    
    .exit:
        mov esp, ebp
        xor eax, eax          ; valor de retorno normal, retorno sem erro 
        ret	
        
_getChar:
    push ebp
    mov  ebp, esp
    
    push esi
    push scanfString
    call scanf
    
    mov esp, ebp
    pop ebp
    ret