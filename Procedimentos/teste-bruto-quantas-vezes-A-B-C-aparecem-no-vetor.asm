extern scanf
extern printf

SECTION .data
scanfStringTre    DB "%d %d %d"                         , 0x00
scanfStringVar    DB "%d %d %d %d %d %d %d %d %d %d"    , 0x00
printfString      DB "%d"                               , 0x0D, 0x0A, 0x00,

SECTION .bss 
valor0           RESD 1
valor1           RESD 1
valor2           RESD 1
valor3           RESD 1
valor4           RESD 1
valor5           RESD 1
valor6           RESD 1
valor7           RESD 1
valor8           RESD 1
valor9           RESD 1

valorA           RESD 1
valorB           RESD 1
valorC           RESD 1

quntdA           RESD 1
quntdB           RESD 1
quntdC           RESD 1

SECTION .text               ; secao de codigo
    global main             ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging
    
    mov DWORD[quntdA], 0
    mov DWORD[quntdB], 0
    mov DWORD[quntdC], 0
    
    push valor9
    push valor8
    push valor7
    push valor6
    push valor5
    push valor4
    push valor3
    push valor2
    push valor1
    push valor0
    push scanfStringVar
    call scanf
    add  esp, 40
    
    push valorC
    push valorB
    push valorA
    push scanfStringTre
    call scanf
    add  esp, 16
    
    .valor9:
        mov eax, DWORD[valor9]
        cmp eax, DWORD[valorA]
        jne .b9
        inc BYTE[quntdA]
        
        .b9:
        mov eax, DWORD[valor9]
        cmp eax, DWORD[valorB]
        jne .c9
        inc BYTE[quntdB]
        
        .c9:
        mov eax, DWORD[valor9]
        cmp eax, DWORD[valorC]
        jne .valor8
        inc BYTE[quntdC]
    
    .valor8:
        mov eax, DWORD[valor8]
        cmp eax, DWORD[valorA]
        jne .b8
        inc BYTE[quntdA]
        
        .b8:
        mov eax, DWORD[valor8]
        cmp eax, DWORD[valorB]
        jne .c8
        inc BYTE[quntdB]
        
        .c8:
        mov eax, DWORD[valor8]
        cmp eax, DWORD[valorC]
        jne .valor7
        inc BYTE[quntdC]
    
    .valor7:
        mov eax, DWORD[valor7]
        cmp eax, DWORD[valorA]
        jne .b7
        inc BYTE[quntdA]
        
        .b7:
        mov eax, DWORD[valor7]
        cmp eax, DWORD[valorB]
        jne .c7
        inc BYTE[quntdB]
        
        .c7:
        mov eax, DWORD[valor7]
        cmp eax, DWORD[valorC]
        jne .valor6
        inc BYTE[quntdC]
    
    .valor6:
        mov eax, DWORD[valor6]
        cmp eax, DWORD[valorA]
        jne .b6
        inc BYTE[quntdA]
        
        .b6:
        mov eax, DWORD[valor6]
        cmp eax, DWORD[valorB]
        jne .c6
        inc BYTE[quntdB]
        
        .c6:
        mov eax, DWORD[valor6]
        cmp eax, DWORD[valorC]
        jne .valor5
        inc BYTE[quntdC]
    
    .valor5:
        mov eax, DWORD[valor5]
        cmp eax, DWORD[valorA]
        jne .b5
        inc BYTE[quntdA]
        
        .b5:
        mov eax, DWORD[valor5]
        cmp eax, DWORD[valorB]
        jne .c5
        inc BYTE[quntdB]
        
        .c5:
        mov eax, DWORD[valor5]
        cmp eax, DWORD[valorC]
        jne .valor4
        inc BYTE[quntdC]
    
    .valor4:
        mov eax, DWORD[valor4]
        cmp eax, DWORD[valorA]
        jne .b4
        inc BYTE[quntdA]
        
        .b4:
        mov eax, DWORD[valor4]
        cmp eax, DWORD[valorB]
        jne .c4
        inc BYTE[quntdB]
        
        .c4:
        mov eax, DWORD[valor4]
        cmp eax, DWORD[valorC]
        jne .valor3
        inc BYTE[quntdC]
    
    .valor3:
        mov eax, DWORD[valor3]
        cmp eax, DWORD[valorA]
        jne .b3
        inc BYTE[quntdA]
        
        .b3:
        mov eax, DWORD[valor3]
        cmp eax, DWORD[valorB]
        jne .c3
        inc BYTE[quntdB]
        
        .c3:
        mov eax, DWORD[valor3]
        cmp eax, DWORD[valorC]
        jne .valor2
        inc BYTE[quntdC]
    
    .valor2:
        mov eax, DWORD[valor2]
        cmp eax, DWORD[valorA]
        jne .b2
        inc BYTE[quntdA]
        
        .b2:
        mov eax, DWORD[valor2]
        cmp eax, DWORD[valorB]
        jne .c2
        inc BYTE[quntdB]
        
        .c2:
        mov eax, DWORD[valor2]
        cmp eax, DWORD[valorC]
        jne .valor1
        inc BYTE[quntdC]
    
    .valor1:
        mov eax, DWORD[valor1]
        cmp eax, DWORD[valorA]
        jne .b1
        inc BYTE[quntdA]
        
        .b1:
        mov eax, DWORD[valor1]
        cmp eax, DWORD[valorB]
        jne .c1
        inc BYTE[quntdB]
        
        .c1:
        mov eax, DWORD[valor1]
        cmp eax, DWORD[valorC]
        jne .valor0
        inc BYTE[quntdC]
    
    .valor0:
        mov eax, DWORD[valor0]
        cmp eax, DWORD[valorA]
        jne .b0
        inc BYTE[quntdA]
        
        .b0:
        mov eax, DWORD[valor0]
        cmp eax, DWORD[valorB]
        jne .c0
        inc BYTE[quntdB]
        
        .c0:
        mov eax, DWORD[valor0]
        cmp eax, DWORD[valorC]
        jne _imprime
        inc BYTE[quntdC]
       
    _imprime:
        push DWORD[quntdA]
        push printfString
        call printf
        add  esp, 8
        
        push DWORD[quntdB]
        push printfString
        call printf
        add  esp, 8
        
        push DWORD[quntdC]
        push printfString
        call printf
        add  esp, 8
    
    mov esp, ebp
    xor eax, eax            ; valor de retorno normal, retorno sem erro
    ret