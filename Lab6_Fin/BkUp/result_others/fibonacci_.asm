.386
.model flat,stdcall
option casemap : none
include \masm32\include\masm32rt.inc
.data
a_4 dd 0
b_4 dd 0
i_4 dd 0
n_4 dd 0
t_4 dd 0
temp_0_0 dd 0
temp_1_0 dd 1
temp_2_0 dd 1
temp_3_0 dd 0
temp_4_0 dd 0
temp_5_0 dd 1
temp_6_0 dd 0
buffer1 dq 0.0
buffer2 dq 0.0
buffer3 dd 0
buffer4 db 0
string1 db '%d',0
string2 db '%d',13,10,0
string3 db '%d',13,10,0
string4 db '%d',13,10,0
.code
start:
label1: 
label2: 
mov eax,temp_0_0
mov a_4,eax
label3: 
label4: 
mov eax,temp_1_0
mov b_4,eax
label5: 
label6: 
mov eax,temp_2_0
mov i_4,eax
label7: 
lea eax,n_4
mov temp_3_0,eax
label8: 
invoke crt_scanf,addr string1,temp_3_0
label9: 
invoke crt_printf,addr string2,a_4
label10: 
invoke crt_printf,addr string3,b_4
label11: 
mov eax,i_4
cmp eax,n_4
jl label13
label12: 
jmp label22
label13: 
mov eax,b_4
mov t_4,eax
label14: 
mov eax,a_4
add eax,b_4
mov temp_4_0,eax
label15: 
mov eax,temp_4_0
mov b_4,eax
label16: 
invoke crt_printf,addr string4,b_4
label17: 
mov eax,t_4
mov a_4,eax
label18: 
label19: 
mov eax,i_4
add eax,temp_5_0
mov temp_6_0,eax
label20: 
mov eax,temp_6_0
mov i_4,eax
label21: 
jmp label11
label22:
jmp label22
end start
