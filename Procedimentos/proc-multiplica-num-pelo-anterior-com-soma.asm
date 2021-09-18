%include "io.inc"

SECTION .text           ; secao de codigo
    global main         ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging
    
    GET_UDEC 4, ecx     ; recebe valor a ser multiplicado
    
    mov eax, ecx        ; guarda o valor de ECX em EAX
    sub ecx, 2          ; subtrai o valor de ECX em 2
    
    mov ebx, eax        ; guarda o valor original de EAX em EBX
    call soma
    
    PRINT_UDEC 4, eax   ; imprime o resultado
              
    xor eax, eax        ; valor de retorno normal, retorno sem erro 
    ret

    global soma
soma:
        add eax, ebx        ; soma EBX (valor original) com EAX e guarda em EAX
        loop soma             ; volta para o ponto definido
    	
    ret