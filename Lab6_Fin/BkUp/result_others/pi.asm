	.386
	.Model Flat, StdCall
	Option CaseMap : None
	include c:\masm32\include\msvcrt.inc
	includelib c:\masm32\LIB\msvcrt.lib

	.data
		i    dd    0
		j    dd    0
		n    dd    0
		r    dd    0
		x    dd    0
		y    dd    0
		pi    dd   0
		ci    dd   97
		temp0   dd   0
		temp1   dd   0
		temp2   dd   0
		temp3   dd   0
		temp4   dd   0
		temp5   dd   0
		temp6   dd   0
		temp7   dd   0
		temp8   dd   0
		temp9   dd   0
		temp10   dd   0
		temp11   dd   0
		temp12   dd   0
		temp13   dd   0
		temp14   dd   0
		temp15   dd   0
		temp16   dd   0
		temp17   dd   0
		temp18   dd   0
		temp19   dd   0
		temp20   dd   0
		temp21   dd   0
		temp22   dd   0
		temp23   dd   0
		temp24   dd   0
		temp25   dd   0
		temp26   dd   0
		temp27   dd   0
		temp28   dd   0
		temp29   dd   0
		temp30   dd   0
		temp31   dd   0
		temp32   dd   0
		temp33   dd   0
		temp34   dd   0
		temp35   dd   0
		temp36   dd   0
		temp37   dd   0
		temp38   dd   0
		temp39   dd   0
		temp40   dd   0
		temp41   dd   0
		temp42   dd   0
		temp43   dd   0
		temp44   dd   0
		temp45   dd   0
		temp46   dd   0
		temp47   dd   0
		temp48   dd   0
		temp49   dd   0
		temp50   dd   0
		temp51   dd   0
		temp52   dd   0
		temp53   dd   0
		temp54   dd   0
		temp55   dd   0
		temp56   dd   0
		temp57   dd   0
		temp58   dd   0
		format     db    '%d', 0


	.code
	start:
		mov eax,0
		mov ebx,0
		mov ecx,0
		mov edx,0
		mov eax, 1
		add eax, 2
		mov temp0, eax
		mov eax, 3
		mov temp1,4
		mul temp1
		mov temp1, eax
		mov eax, temp1
		mov temp2,5
		div temp2
		mov temp2, eax
		mov edx, 0
		mov eax, temp2
		mov temp3,6
		div temp3
		mov temp3, edx
		mov eax, temp0
		sub eax, temp3
		mov temp4, eax
		mov eax, temp4
		and eax, 7
		mov temp5, eax
		mov eax, 9
		shr eax, 1
		mov temp6, eax
		mov eax, 8
		xor eax, temp6
		mov temp7, eax
		mov eax, temp5
		or eax, temp7
		mov temp8, eax

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf,addr format,temp8
		pop edx
		pop ebx
		pop ecx
		pop eax
	$$$0:
		mov eax, 0
		mov i, eax
	$$$2:
		mov eax, i
		cmp eax, 10

		jl $$$3
		jmp $$$1
	$$$3:
		mov eax, ci
		mov temp13, eax
		inc eax
		mov ci,eax
		mov eax, temp13
		sub eax, 97
		mov temp14, eax

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf,addr format,temp14
		pop edx
		pop ebx
		pop ecx
		pop eax
		mov eax, i
		add eax, 1
		mov temp11, eax
		mov eax, temp11
		mov i, eax
		jmp $$$2
	$$$1:

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_scanf, addr format, addr n
		pop edx
		pop ebx
		pop ecx
		pop eax
	$$$4:
		mov eax, n
		cmp eax, 0

		jnl $$$6
		jmp $$$5
	$$$6:
		mov eax, n
		cmp eax, 10

		jnl $$$10
		jmp $$$9
	$$$10 :
		mov eax, n
		cmp eax, 100

		jl $$$8
		jmp $$$9
	$$$8:

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf,addr format,1
		pop edx
		pop ebx
		pop ecx
		pop eax
		jmp $$$7
	$$$9:
		mov eax, 1
		neg eax
		mov temp19, eax
		mov eax, n
		cmp eax, temp19

		jng $$$12
		jmp $$$14
	$$$14 :
		mov eax, n
		cmp eax, 4

		jg $$$12
		jmp $$$13
	$$$12:
		mov eax, 0
		mov r, eax
		jmp $$$11
	$$$13:
		mov eax, 1
		mov r, eax
	$$$16:
		mov eax, n
		cmp eax, 0

		jg $$$17
		jmp $$$15
	$$$17:
		mov eax, r
		sal eax, 3
		mov temp27, eax
		mov eax, r
		sal eax, 1
		mov temp28, eax
		mov eax, temp27
		add eax, temp28
		mov temp29, eax
		mov eax, temp29
		mov r, eax
		mov eax, n
		mov temp26, eax
		dec eax
		mov n,eax
		jmp $$$16
	$$$15:
	$$$11:
	$$$7:
		mov eax, 0
		mov pi, eax
	$$$18:
		mov eax, r
		neg eax
		mov temp32, eax
		mov eax, temp32
		mov i, eax
	$$$20:
		mov eax, i
		cmp eax, r

		jl $$$21
		jmp $$$19
	$$$21:
		mov eax, r
		neg eax
		mov temp37, eax
		mov eax, temp37
		mov j, eax
	$$$23:
		mov eax, j
		cmp eax, r

		jl $$$24
		jmp $$$22
	$$$24:
		mov eax, i
		mov temp42,2
		mul temp42
		mov temp42, eax
		mov eax, temp42
		add eax, 1
		mov temp43, eax
		mov eax, temp43
		mov x, eax
		mov eax, j
		mov temp45,2
		mul temp45
		mov temp45, eax
		mov eax, temp45
		add eax, 1
		mov temp46, eax
		mov eax, temp46
		mov y, eax
		mov eax, x
		mul x
		mov temp48, eax
		mov eax, y
		mul y
		mov temp49, eax
		mov eax, temp48
		add eax, temp49
		mov temp50, eax
		mov eax, 4
		mul r
		mov temp51, eax
		mov eax, temp51
		mul r
		mov temp52, eax
		mov eax, temp50
		cmp eax, temp52

		jl $$$26
		jmp $$$25
	$$$26:
		mov eax, pi
		add eax, 1
		mov temp54, eax
		mov eax, temp54
		mov pi, eax
	$$$25:
		mov eax, j
		add eax, 1
		mov temp40, eax
		mov eax, temp40
		mov j, eax
		jmp $$$23
	$$$22:
		mov eax, i
		add eax, 1
		mov temp35, eax
		mov eax, temp35
		mov i, eax
		jmp $$$20
	$$$19:
		mov eax, r
		cmp eax, 2

		jnl $$$28
		jmp $$$29
	$$$28:
		mov eax, pi
		div r
		mov temp57, eax

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf,addr format,temp57
		pop edx
		pop ebx
		pop ecx
		pop eax
		jmp $$$27
	$$$29:

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_printf,addr format,3
		pop edx
		pop ebx
		pop ecx
		pop eax
	$$$27:
		mov eax, r
		cmp eax, 1

		jnl $$$31
		jmp $$$30
	$$$31:

		push eax
		push ecx
		push ebx
		push edx
		invoke   crt_scanf, addr format, addr n
		pop edx
		pop ebx
		pop ecx
		pop eax
	$$$30:
		jmp $$$4
	$$$5:
	ret
	end start
