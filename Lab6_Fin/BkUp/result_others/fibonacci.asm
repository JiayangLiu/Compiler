.486
 .model flat, stdcall
 option casemap:none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib
include \masm32\macros\macros.asm
include    \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib





.data
 WaitKeyCrt PROTO 
 put db '%d',0
i dd 0,0
a dd 0,0
n dd 0,0
t dd 0,0
b dd 0,0
temp1 dd 0,0
temp2 dd 0,0
temp3 dd 0,0





.code
 start:


;giving value to a
push ebx
mov ebx,0
mov a,ebx
pop ebx

;giving value to b
push ebx
mov ebx,1
mov b,ebx
pop ebx

;giving value to i
push ebx
mov ebx,1
mov i,ebx
pop ebx

;input n
invoke crt_scanf,offset put,offset n

;print a
push eax
mov eax,a
invoke crt_printf,SADD('a=%d',13,10),eax
pop eax

;print b
push eax
mov eax,b
invoke crt_printf,SADD('b=%d',13,10),eax
pop eax

;comparing of while
mov ecx,i
mov edx,n
cmp ecx,edx
jb loop1
jmp loop1end

loop1:

;giving value to t
push ebx
mov ebx,b
mov t,ebx
pop ebx

;adding
push eax
push ebx
mov eax,a
mov ebx,b
add ebx,eax
mov temp1,ebx
pop ebx
pop eax

;giving value to b
push ebx
mov ebx,temp1
mov b,ebx
pop ebx

;print b
push eax
mov eax,b
invoke crt_printf,SADD('b=%d',13,10),eax
pop eax

;giving value to a
push ebx
mov ebx,t
mov a,ebx
pop ebx

;adding
push eax
push ebx
mov eax,i
mov ebx,1
add ebx,eax
mov temp1,ebx
pop ebx
pop eax

;giving value to i
push ebx
mov ebx,temp1
mov i,ebx
pop ebx

;comparing of while
mov ecx,i
mov edx,n
cmp ecx,edx
jb loop1

loop1end:

;comparing of while
mov ecx,i
mov edx,n
cmp ecx,edx
jb loop2
jmp loop2end

loop2:

;comparing of while
mov ecx,i
mov edx,n
cmp ecx,edx
jb loop2

loop2end:




invoke WaitKeyCrt
invoke ExitProcess, NULL
WaitKeyCrt PROC
invoke crt_printf, SADD(13,10,"Press any key to continue...")
invoke crt__getch
.if (eax == 0) || (eax == 0E0h)
invoke crt__getch
.endif
 ret
WaitKeyCrt ENDP
end start