	.386
	.model flat, stdcall
	option casemap :none
	include c:\masm32\include\msvcrt.inc
	includelib c:\masm32\lib\msvcrt.lib

	.data
		_i    dd    0
		_j    dd    0
		_n    dd    0
		_r    dd    0
		_x    dd    0
		_y    dd    0
		_pi    dd   0
		_c    dd   97
		_temp0   dd   0
		_temp1   dd   0
		_temp2   dd   0
		_temp3   dd   0
		_temp4   dd   0
		_temp5   dd   0
		_temp6   dd   0
		_temp7   dd   0
		_temp8   dd   0
		_temp9   dd   0
		_temp10   dd   0
		_temp11   dd   0
		_temp12   dd   0
		_temp13   dd   0
		_temp14   dd   0
		_temp15   dd   0
		_temp16   dd   0
		_temp17   dd   0
		_temp18   dd   0
		_temp19   dd   0
		_temp20   dd   0
		_temp21   dd   0
		_temp22   dd   0
		_temp23   dd   0
		_temp24   dd   0
		_temp25   dd   0
		_temp26   dd   0
		_temp27   dd   0
		_temp28   dd   0
		_temp29   dd   0
		_temp30   dd   0
		_temp31   dd   0
		_temp32   dd   0
		_temp33   dd   0
		_temp34   dd   0
		_temp35   dd   0
		_temp36   dd   0
		_temp37   dd   0
		_temp38   dd   0
		_temp39   dd   0
		_temp40   dd   0
		_temp41   dd   0
		_temp42   dd   0
		_temp43   dd   0
		_temp44   dd   0
		_temp45   dd   0
		_temp46   dd   0
		_temp47   dd   0
		_temp48   dd   0
		_temp49   dd   0
		_temp50   dd   0
		_temp51   dd   0
		_temp52   dd   0
		_temp53   dd   0
		_temp54   dd   0
		_temp55   dd   0
		_temp56   dd   0
		_temp57   dd   0
		_temp58   dd   0
		format     db    '%d', 0


	.code
	start:
		mov eax,0
		mov ebx,0
		mov ecx,0
		mov edx,0
		mov eax, 1
		add eax, 2
		mov _temp0, eax
		mov eax, 3
		mov _temp1,4
		mul _temp1
		mov _temp1, eax
		mov eax, _temp1
		mov _temp2,5
		div _temp2
		mov _temp2, eax
		mov edx, 0
		mov eax, _temp2
		mov _temp3,6
		div _temp3
		mov _temp3, edx
		mov eax, _temp0
		sub eax, _temp3
		mov _temp4, eax
		mov eax, _temp4
		and eax, 7
		mov _temp5, eax
		mov eax, 9
		shr eax, 1
		mov _temp6, eax
		mov eax, 8
		xor eax, _temp6
		mov _temp7, eax
		mov eax, _temp5
		or eax, _temp7
		mov _temp8, eax

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf,addr format,_temp8
		pop edx
		pop ebx
		pop ecx
		pop eax
	@0:
		mov eax, 0
		mov _i, eax
	@2:
		mov eax, _i
		cmp eax, 10

		jl @3
		jmp @1
	@3:
		mov eax, _c
		mov _temp13, eax
		inc eax
		mov _c,eax
		mov eax, _temp13
		sub eax, 97
		mov _temp14, eax

		push eax
		push ecx
		push ebx
		push edx
        inc _temp14
		invoke   crt_printf,addr format,_temp14
		pop edx
		pop ebx
		pop ecx
		pop eax
		mov eax, _i
		add eax, 1
		mov _temp11, eax
		mov eax, _temp11
		mov _i, eax
		jmp @2
	@1:

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_scanf, addr format, addr _n
		pop edx
		pop ebx
		pop ecx
		pop eax
	@4:
		mov eax, _n
		cmp eax, 0

		jnl @6
		jmp @5
	@6:
		mov eax, _n
		cmp eax, 10

		jnl @10
		jmp @9
	@10:
		mov eax, _n
		cmp eax, 100

		jl @8
		jmp @9
	@8:

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf,addr format,1
		pop edx
		pop ebx
		pop ecx
		pop eax
		jmp @7
	@9:
		mov eax, 1
		neg eax
		mov _temp19, eax
		mov eax, _n
		cmp eax, _temp19

		jng @12
		jmp @14
	@14 :
		mov eax, _n
		cmp eax, 4

		jg @12
		jmp @13
	@12:
		mov eax, 0
		mov _r, eax
		jmp @11
	@13:
		mov eax, 1
		mov _r, eax
	@16:
		mov eax, _n
		cmp eax, 0

		jg @17
		jmp @15
	@17:
		mov eax, _r
		sal eax, 3
		mov _temp27, eax
		mov eax, _r
		sal eax, 1
		mov _temp28, eax
		mov eax, _temp27
		add eax, _temp28
		mov _temp29, eax
		mov eax, _temp29
		mov _r, eax
		mov eax, _n
		mov _temp26, eax
		dec eax
		mov _n,eax
		jmp @16
	@15:
	@11:
	@7:
		mov eax, 0
		mov _pi, eax
	@18:
		mov eax, _r
		neg eax
		mov _temp32, eax
		mov eax, _temp32
		mov _i, eax
	@20:
		mov eax, _i
		cmp eax, _r

		jl @21
		jmp @19
	@21:
		mov eax, _r
		neg eax
		mov _temp37, eax
		mov eax, _temp37
		mov _j, eax
	@23:
		mov eax, _j
		cmp eax, _r

		jl @24
		jmp @22
	@24:
		mov eax, _i
		mov _temp42, 2
		mul _temp42
		mov _temp42, eax
		mov eax, _temp42
		add eax, 1
		mov _temp43, eax
		mov eax, _temp43
		mov _x, eax
		mov eax, _j
		mov _temp45,2
		mul _temp45
		mov _temp45, eax
		mov eax, _temp45
		add eax, 1
		mov _temp46, eax
		mov eax, _temp46
		mov _y, eax
		mov eax, _x
		mul _x
		mov _temp48, eax
		mov eax, _y
		mul _y
		mov _temp49, eax
		mov eax, _temp48
		add eax, _temp49
		mov _temp50, eax
		mov eax, 4
		mul _r
		mov _temp51, eax
		mov eax, _temp51
		mul _r
		mov _temp52, eax
		mov eax, _temp50
		cmp eax, _temp52

		jl @26
		jmp @25
	@26:
		mov eax, _pi
		add eax, 1
		mov _temp54, eax
		mov eax, _temp54
		mov _pi, eax
	@25:
		mov eax, _j
		add eax, 1
		mov _temp40, eax
		mov eax, _temp40
		mov _j, eax
		jmp @23
	@22:
		mov eax, _i
		add eax, 1
		mov _temp35, eax
		mov eax, _temp35
		mov _i, eax
		jmp @20
	@19:
		mov eax, _r
		cmp eax, 2

		jnl @28
		jmp @29
	@28:
		mov eax, _pi
		div _r
		mov _temp57, eax

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf, addr format, _temp57
		pop edx
		pop ebx
		pop ecx
		pop eax
		jmp @27
	@29:

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf, addr format, 3
		pop edx
		pop ebx
		pop ecx
		pop eax
	@27:
		mov eax, _r
		cmp eax, 1

		jnl @31
		jmp @30
	@31:

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_scanf, addr format, addr _n
		pop edx
		pop ebx
		pop ecx
		pop eax
	@30:
		jmp @4
	@5:
	ret
	end start
