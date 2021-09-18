extern scanf
extern printf

SECTION .data
scanfString     DB "%f"     , 0x00
printfString    DB "%.2lf"  , 0x0D, 0x0A,

SECTION .bss
valorRaio   RESD 1
valorVolume RESQ 1

SECTION .text
    global main
main:
    mov ebp, esp
    
    push valorRaio
    push scanfString
    call scanf
    add  esp, 8
    
    push DWORD[valorRaio]
    call _volumeCalc
    fstp QWORD[valorVolume]
    
    push DWORD[valorVolume + 4]
    push DWORD[valorVolume]
    push printfString
    call printf
    add  esp, 12
        
    mov esp, ebp
    xor eax, eax
    ret
    
    global _volumeCalc
_volumeCalc:
    push ebp 
    mov  ebp, esp
    sub  esp, 4
    
    finit
    mov   DWORD[esp - 4], 4    
    fild  DWORD[esp - 4]
    mov   DWORD[esp - 4], 3    
    fidiv DWORD[esp - 4]
  
    fld  DWORD[ebp + 8]
    fmul ST0, ST0            
    fmul DWORD[ebp + 8]
    fldpi
    fmul ST0, ST1
    fmul ST0, ST2
    
    mov esp, ebp
    pop ebp
    ret 4	