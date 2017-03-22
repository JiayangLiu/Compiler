    .386
    .model flat, stdcall
    option casemap :none
    include c:\masm32\include\msvcrt.inc
    includelib c:\masm32\lib\msvcrt.lib

    .data
        _i   dd   0
        _a   dd   0
        _n   dd   0
        _t   dd   0
        _b   dd   0
        _temp0   dd   0
        _temp1   dd   0
        _temp2   dd   0
        _temp3   dd   0
        _temp4   dd   0
        format     db    '%d', 0

    .code
    start:
        mov eax,0
        mov _a,eax
        mov eax,1
        mov _b,eax
        mov eax,1
        mov _i,eax
        
        push eax
        push ecx
        push ebx
        push edx
        invoke   crt_scanf, addr format, addr _n
        pop edx
        pop ebx
        pop ecx
        pop eax
        
        mov eax,_a
        push eax
        push ecx
        push ebx
        push edx
        invoke   crt_printf,addr format,eax
        pop edx
        pop ebx
        pop ecx
        pop eax

        mov eax,_b
        push eax
        push ecx
        push ebx
        push edx        
        invoke   crt_printf,addr format,eax
        pop edx
        pop ebx
        pop ecx
        pop eax

        mov ecx,_i
        mov edx,_n
        cmp ecx,edx
        jb @0
        jmp @1
    @0:
        mov ebx,_b
        mov _t,ebx
        mov eax,_a
        mov ebx,_b
        add ebx,eax
        mov _temp1,ebx
        mov ebx,_temp1
        mov _b,ebx
        mov eax,_b
        push eax
        push ecx
        push ebx
        push edx        
        invoke   crt_printf,addr format,eax
        pop edx
        pop ebx
        pop ecx
        pop eax
        pop eax
        mov ebx,_t
        mov _a,ebx
        mov eax,_i
        mov ebx,1
        add ebx,eax
        mov _temp2,ebx
        mov ebx,_temp2
        mov _i,ebx
        mov ecx,_i
        mov edx,_n
        cmp ecx,edx
        jb @0
    @1:
        mov ecx,_i
        mov edx,_n
        cmp ecx,edx
        jb @2
        jmp @3
    @2:
        mov ecx,_i
        mov edx,_n
        cmp ecx,edx
        jb @2
    @3:

    ret
    end start