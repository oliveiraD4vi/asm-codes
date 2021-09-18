extern scanf
extern printf

SECTION .data
vetorA times 1000 DB 1
vetorB times 1000 DB 2
vetorC times 1000 DB 0

SECTION .text               ; secao de codigo
    global main             ; ponto de entrada padrao do GCC
main:
    mov ebp, esp            ; for correct debug
    
    mov ecx, 125
    movq  mm0, QWORD[vetorA+ecx*8-8]
    
    .somaVetor:
        PADDB mm0, QWORD[vetorB+ecx*8-8]
        movq  QWORD[vetorC+ecx*8-8], mm0
        loop  .somaVetor
    
    mov esp, ebp
    xor eax, eax            ; valor de retorno normal, retorno sem erro 
    ret	