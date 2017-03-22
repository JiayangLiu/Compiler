.386
.model flat,stdcall
option casemap : none
include \masm32\include\masm32rt.inc
.data
c_4 db 0
i_4 dd 0
j_4 dd 0
n_4 dd 0
pi_4 dd 0
r_4 dd 0
temp_0_0 dd 0
temp_1_0 db 97
temp_10_0 dd 6
temp_11_0 dd 0
temp_12_0 dd 0
temp_13_0 dd 7
temp_14_0 dd 0
temp_15_0 dd 8
temp_16_0 dd 0
temp_17_0 dd 9
temp_18_0 dd 1
temp_19_0 dd 0
temp_2_0 dd 1
temp_20_0 dd 0
temp_21_0 dd 0
temp_22_0 dd 10
temp_23_0 dd 1
temp_24_0 dd 0
temp_25_0 db 0
temp_26_0 db 97
temp_27_0 db 0
temp_28_0 dd 0
temp_29_0 dd 0
temp_3_0 dd 2
temp_30_0 dd 10
temp_31_0 dd 100
temp_32_0 dd 1
temp_33_0 dd 1
temp_34_0 dd 0
temp_35_0 dd 4
temp_36_0 dd 0
temp_37_0 dd 1
temp_38_0 dd 0
temp_39_0 dd 0
temp_4_0 dd 0
temp_40_0 dd 3
temp_41_0 dd 0
temp_42_0 dd 1
temp_43_0 dd 0
temp_44_0 dd 0
temp_45_0 dd 0
temp_46_0 dd 0
temp_47_0 dd 1
temp_48_0 dd 0
temp_49_0 dd 0
temp_5_0 dd 3
temp_50_0 dd 1
temp_51_0 dd 0
temp_52_0 dd 2
temp_53_0 dd 0
temp_54_0 dd 1
temp_55_0 dd 0
temp_56_0 dd 2
temp_57_0 dd 0
temp_58_0 dd 1
temp_59_0 dd 0
temp_6_0 dd 4
temp_60_0 dd 0
temp_61_0 dd 0
temp_62_0 dd 0
temp_63_0 dd 4
temp_64_0 dd 0
temp_65_0 dd 0
temp_66_0 dd 1
temp_67_0 dd 0
temp_68_0 dd 1
temp_69_0 dd 2
temp_7_0 dd 0
temp_70_0 dd 0
temp_71_0 dd 3
temp_8_0 dd 5
temp_9_0 dd 0
x_4 dd 0
y_4 dd 0
buffer1 dq 0.0
buffer2 dq 0.0
buffer3 dd 0
buffer4 db 0
string1 db '%d',13,10,0
string2 db '%d',13,10,0
string3 db '%d',0
string4 db '%d',13,10,0
string5 db '%d',13,10,0
string6 db '%d',13,10,0
.code
start:
label1: 
label2: 
mov eax,temp_0_0
mov pi_4,eax
label3: 
label4: 
mov al,temp_1_0
mov c_4,al
label5: 
label6: 
label7: 
mov eax,temp_2_0
add eax,temp_3_0
mov temp_4_0,eax
label8: 
label9: 
label10: 
mov eax,temp_5_0
imul eax,temp_6_0
mov temp_7_0,eax
label11: 
label12: 
mov eax,temp_7_0
cdq
idiv temp_8_0
mov temp_9_0,eax
label13: 
label14: 
mov eax,temp_9_0
cdq
idiv temp_10_0
mov temp_11_0,edx
label15: 
mov eax,temp_4_0
sub eax,temp_11_0
mov temp_12_0,eax
label16: 
label17: 
mov eax,temp_12_0
and eax,temp_13_0
mov temp_14_0,eax
label18: 
label19: 
mov eax,temp_14_0
or eax,temp_15_0
mov temp_16_0,eax
label20: 
label21: 
label22: 
mov eax,temp_17_0
mov ecx,temp_18_0
sar eax,cl
mov temp_19_0,eax
label23: 
mov eax,temp_16_0
xor eax,temp_19_0
mov temp_20_0,eax
label24: 
invoke crt_printf,addr string1,temp_20_0
label25: 
label26: 
mov eax,temp_21_0
mov i_4,eax
label27: 
label28: 
mov eax,i_4
cmp eax,temp_22_0
jl label34
label29: 
jmp label40
label30: 
label31: 
mov eax,i_4
add eax,temp_23_0
mov temp_24_0,eax
label32: 
mov eax,temp_24_0
mov i_4,eax
label33: 
jmp label27
label34: 
mov al,c_4
mov temp_25_0,al
label35: 
inc c_4
label36: 
label37: 
mov al,temp_25_0
sub al,temp_26_0
mov temp_27_0,al
label38: 
invoke crt_printf,addr string2,temp_27_0
label39: 
jmp label30
label40: 
label41: 
mov eax,n_4
cmp eax,temp_28_0
jge label43
label42: 
jmp label132
label43: 
lea eax,n_4
mov temp_29_0,eax
label44: 
invoke crt_scanf,addr string3,temp_29_0
label45: 
label46: 
mov eax,n_4
cmp eax,temp_30_0
jge label48
label47: 
jmp label54
label48: 
label49: 
mov eax,n_4
cmp eax,temp_31_0
jl label51
label50: 
jmp label54
label51: 
label52: 
invoke crt_printf,addr string4,temp_32_0
label53: 
jmp label79
label54: 
label55: 
mov eax,0
sub eax,temp_33_0
mov temp_34_0,eax
label56: 
mov eax,n_4
cmp eax,temp_34_0
jle label61
label57: 
jmp label58
label58: 
label59: 
mov eax,n_4
cmp eax,temp_35_0
jg label61
label60: 
jmp label64
label61: 
label62: 
mov eax,temp_36_0
mov r_4,eax
label63: 
jmp label79
label64: 
label65: 
mov eax,temp_37_0
mov r_4,eax
label66: 
label67: 
mov eax,n_4
cmp eax,temp_38_0
jg label72
label68: 
jmp label79
label69: 
mov eax,n_4
mov temp_39_0,eax
label70: 
dec n_4
label71: 
jmp label66
label72: 
label73: 
mov eax,r_4
mov ecx,temp_40_0
sal eax,cl
mov temp_41_0,eax
label74: 
label75: 
mov eax,r_4
mov ecx,temp_42_0
sal eax,cl
mov temp_43_0,eax
label76: 
mov eax,temp_41_0
add eax,temp_43_0
mov temp_44_0,eax
label77: 
mov eax,temp_44_0
mov r_4,eax
label78: 
jmp label69
label79: 
label80: 
mov eax,temp_45_0
mov pi_4,eax
label81: 
mov eax,0
sub eax,r_4
mov temp_46_0,eax
label82: 
mov eax,temp_46_0
mov i_4,eax
label83: 
mov eax,i_4
cmp eax,r_4
jl label89
label84: 
jmp label120
label85: 
label86: 
mov eax,i_4
add eax,temp_47_0
mov temp_48_0,eax
label87: 
mov eax,temp_48_0
mov i_4,eax
label88: 
jmp label83
label89: 
mov eax,0
sub eax,r_4
mov temp_49_0,eax
label90: 
mov eax,temp_49_0
mov j_4,eax
label91: 
mov eax,j_4
cmp eax,r_4
jl label97
label92: 
jmp label85
label93: 
label94: 
mov eax,j_4
add eax,temp_50_0
mov temp_51_0,eax
label95: 
mov eax,temp_51_0
mov j_4,eax
label96: 
jmp label91
label97: 
label98: 
mov eax,i_4
imul eax,temp_52_0
mov temp_53_0,eax
label99: 
label100: 
mov eax,temp_53_0
add eax,temp_54_0
mov temp_55_0,eax
label101: 
mov eax,temp_55_0
mov x_4,eax
label102: 
label103: 
mov eax,j_4
imul eax,temp_56_0
mov temp_57_0,eax
label104: 
label105: 
mov eax,temp_57_0
add eax,temp_58_0
mov temp_59_0,eax
label106: 
mov eax,temp_59_0
mov y_4,eax
label107: 
mov eax,x_4
imul eax,x_4
mov temp_60_0,eax
label108: 
mov eax,y_4
imul eax,y_4
mov temp_61_0,eax
label109: 
mov eax,temp_60_0
add eax,temp_61_0
mov temp_62_0,eax
label110: 
label111: 
mov eax,temp_63_0
imul eax,r_4
mov temp_64_0,eax
label112: 
mov eax,temp_64_0
imul eax,r_4
mov temp_65_0,eax
label113: 
mov eax,temp_62_0
cmp eax,temp_65_0
jl label115
label114: 
jmp label93
label115: 
label116: 
mov eax,pi_4
add eax,temp_66_0
mov temp_67_0,eax
label117: 
mov eax,temp_67_0
mov pi_4,eax
label118: 
jmp label93
label119: 
jmp label85
label120: 
label121: 
mov eax,r_4
cmp eax,temp_68_0
jge label123
label122: 
jmp label40
label123: 
label124: 
mov eax,r_4
cmp eax,temp_69_0
jge label126
label125: 
jmp label129
label126: 
mov eax,pi_4
cdq
idiv r_4
mov temp_70_0,eax
label127: 
invoke crt_printf,addr string5,temp_70_0
label128: 
jmp label40
label129: 
label130: 
invoke crt_printf,addr string6,temp_71_0
label131: 
jmp label40
label132:
jmp label132
end start
