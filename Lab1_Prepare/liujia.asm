.386
.model flat,stdcall
option casemap:none

include     \masm32\include\msvcrt.inc
includelib  \masm32\lib\msvcrt.lib

.data
    input1 db "%d", 0
    outputa db "%d", 13, 10, 0
    outputb db "%d", 13, 10, 0
    n dd ?
    a dd ?
    b dd ?

.code

start:
    invoke crt_scanf, addr input1, addr n
    mov eax, 1 ;i
    mov ebx, 0 ;a
    mov edx, 1 ;b
    mov ecx, 0 ;t
    mov a, ebx
    mov b, edx

    push eax
    push ebx
    push ecx
    push edx
    invoke crt_printf, addr outputa, a, 13
    invoke crt_printf, addr outputb, b, 13
    pop edx
    pop ecx
    pop ebx
    pop eax

L1:
    cmp eax,n
    jnl L2
    mov ecx, edx
    add edx, ebx
    mov b, edx
    push eax
    push ebx
    push ecx
    push edx
    invoke crt_printf, addr outputb, b
    pop edx
    pop ecx
    pop ebx
    pop eax
    mov ebx, ecx
    add eax,1
    jmp L1

L2:
    ret

end start