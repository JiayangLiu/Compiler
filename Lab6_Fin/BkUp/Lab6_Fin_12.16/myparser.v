#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 50 of your 30 day trial period.
# 
# This file was produced by an UNREGISTERED COPY of Parser Generator. It is
# for evaluation purposes only. If you continue to use Parser Generator 30
# days after installation then you are required to purchase a license. For
# more information see the online help or go to the Bumble-Bee Software
# homepage at:
# 
# http://www.bumblebeesoftware.com
# 
# This notice must remain present in the file. It cannot be removed.
#############################################################################

#############################################################################
# myparser.v
# YACC verbose file generated from myparser.y.
# 
# Date: 12/06/16
# Time: 13:09:48
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : program $end

    1  program : declaration_list

    2  declaration_list : declaration_list declaration
    3                   |

    4  declaration : var_declaration
    5              | fun_declaration
    6              | fun_defination

    7  var_declaration : type_specifier ID_list SEMICOLON
    8                  | type_specifier ID LS NUM_Int RS SEMICOLON

    9  type_specifier : INT
   10                 | CHAR
   11                 | DOUBLE
   12                 | BOOL
   13                 | VOID
   14                 |

   15  ID_list : ID_list COMMA ID_lookup
   16          | ID_list COMMA assign_decl
   17          | assign_decl
   18          | ID_lookup

   19  assign_decl : ID_lookup ASSIGN expression

   20  ID_lookup : ID

   21  ID_get : ID

   22  fun_declaration : type_specifier ID_lookup LP params RP SEMICOLON

   23  fun_defination : type_specifier ID_lookup LP params RP compound_stmt

   24  params : params param_list
   25         |

   26  param_list : param_list COMMA param
   27             | param

   28  param : type_specifier ID_lookup
   29        | type_specifier ID_lookup LS RS

   30  local_declaration : local_declaration var_declaration
   31                    |

   32  statement_list : statement_list statement
   33                 |

   34  statement : expression_stmt
   35            | compound_stmt
   36            | if_stmt
   37            | while_stmt
   38            | for_stmt
   39            | assign_stmt
   40            | return_stmt
   41            | fun_call

   42  expression_stmt : expression SEMICOLON
   43                  | SEMICOLON

   44  compound_stmt : LB local_declaration statement_list RB

   45  if_stmt : IF LP expression RP statement
   46          | IF LP expression RP statement ELSE statement

   47  while_stmt : WHILE LP expression RP LB statement_list RB

   48  for_stmt : FOR LP expression_list SEMICOLON expression_list SEMICOLON expression_list RP statement_list

   49  expression_list : expression
   50                  |

   51  assign_stmt : ID_get ASSIGN expression

   52  return_stmt : RETURN SEMICOLON
   53              | RETURN expression SEMICOLON

   54  expression : expression relop expression
   55             | NOT expression
   56             | expression addop expression
   57             | expression mulop expression
   58             | expression
   59             | LP expression RP
   60             | factor

   61  relop : EQ
   62        | NE
   63        | LE
   64        | GE
   65        | LT
   66        | GT
   67        | AND
   68        | OR
   69        | XOR
   70        | L_SHIFT
   71        | R_SHIFT

   72  addop : ADD
   73        | SUB

   74  mulop : MUL
   75        | DIV

   76  factor : LP expression RP
   77         | ID_get
   78         | NUM_Int
   79         | NUM_Double
   80         | Char

   81  fun_call : ID_get LP args RP

   82  args : arg_list
   83       |

   84  arg_list : arg_list COMMA expression
   85           | expression


##############################################################################
# States
##############################################################################

state 0
	$accept : . program $end
	declaration_list : .  (3)

	.  reduce 3

	program  goto 1
	declaration_list  goto 2


state 1
	$accept : program . $end  (0)

	$end  accept


state 2
	program : declaration_list .  (1)
	declaration_list : declaration_list . declaration
	type_specifier : .  (14)

	INT  shift 3
	DOUBLE  shift 4
	CHAR  shift 5
	BOOL  shift 6
	VOID  shift 7
	ID  reduce 14
	.  reduce 1

	type_specifier  goto 8
	fun_declaration  goto 9
	declaration  goto 10
	var_declaration  goto 11
	fun_defination  goto 12


state 3
	type_specifier : INT .  (9)

	.  reduce 9


state 4
	type_specifier : DOUBLE .  (11)

	.  reduce 11


state 5
	type_specifier : CHAR .  (10)

	.  reduce 10


state 6
	type_specifier : BOOL .  (12)

	.  reduce 12


state 7
	type_specifier : VOID .  (13)

	.  reduce 13


state 8
	var_declaration : type_specifier . ID_list SEMICOLON
	var_declaration : type_specifier . ID LS NUM_Int RS SEMICOLON
	fun_defination : type_specifier . ID_lookup LP params RP compound_stmt
	fun_declaration : type_specifier . ID_lookup LP params RP SEMICOLON

	ID  shift 13

	ID_list  goto 14
	ID_lookup  goto 15
	assign_decl  goto 16


state 9
	declaration : fun_declaration .  (5)

	.  reduce 5


state 10
	declaration_list : declaration_list declaration .  (2)

	.  reduce 2


state 11
	declaration : var_declaration .  (4)

	.  reduce 4


state 12
	declaration : fun_defination .  (6)

	.  reduce 6


state 13
	var_declaration : type_specifier ID . LS NUM_Int RS SEMICOLON
	ID_lookup : ID .  (20)

	LS  shift 17
	.  reduce 20


state 14
	var_declaration : type_specifier ID_list . SEMICOLON
	ID_list : ID_list . COMMA ID_lookup
	ID_list : ID_list . COMMA assign_decl

	SEMICOLON  shift 18
	COMMA  shift 19


state 15
	fun_defination : type_specifier ID_lookup . LP params RP compound_stmt
	assign_decl : ID_lookup . ASSIGN expression
	ID_list : ID_lookup .  (18)
	fun_declaration : type_specifier ID_lookup . LP params RP SEMICOLON

	LP  shift 20
	ASSIGN  shift 21
	.  reduce 18


state 16
	ID_list : assign_decl .  (17)

	.  reduce 17


state 17
	var_declaration : type_specifier ID LS . NUM_Int RS SEMICOLON

	NUM_Int  shift 22


state 18
	var_declaration : type_specifier ID_list SEMICOLON .  (7)

	.  reduce 7


state 19
	ID_list : ID_list COMMA . ID_lookup
	ID_list : ID_list COMMA . assign_decl

	ID  shift 23

	ID_lookup  goto 24
	assign_decl  goto 25


state 20
	fun_defination : type_specifier ID_lookup LP . params RP compound_stmt
	fun_declaration : type_specifier ID_lookup LP . params RP SEMICOLON
	params : .  (25)

	.  reduce 25

	params  goto 26


state 21
	assign_decl : ID_lookup ASSIGN . expression

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 33
	ID_get  goto 34
	factor  goto 35


state 22
	var_declaration : type_specifier ID LS NUM_Int . RS SEMICOLON

	RS  shift 36


state 23
	ID_lookup : ID .  (20)

	.  reduce 20


state 24
	ID_list : ID_list COMMA ID_lookup .  (15)
	assign_decl : ID_lookup . ASSIGN expression

	ASSIGN  shift 21
	.  reduce 15


state 25
	ID_list : ID_list COMMA assign_decl .  (16)

	.  reduce 16


state 26
	fun_defination : type_specifier ID_lookup LP params . RP compound_stmt
	params : params . param_list
	fun_declaration : type_specifier ID_lookup LP params . RP SEMICOLON
	type_specifier : .  (14)

	INT  shift 3
	DOUBLE  shift 4
	CHAR  shift 5
	BOOL  shift 6
	VOID  shift 7
	RP  shift 37
	.  reduce 14

	type_specifier  goto 38
	param_list  goto 39
	param  goto 40


state 27
	ID_get : ID .  (21)

	.  reduce 21


state 28
	factor : NUM_Int .  (78)

	.  reduce 78


state 29
	factor : NUM_Double .  (79)

	.  reduce 79


state 30
	factor : Char .  (80)

	.  reduce 80


state 31
	expression : LP . expression RP
	factor : LP . expression RP

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 41
	ID_get  goto 34
	factor  goto 35


state 32
	expression : NOT . expression

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 42
	ID_get  goto 34
	factor  goto 35


33: reduce-reduce conflict (reduce 19, reduce 58) on SEMICOLON
33: reduce-reduce conflict (reduce 19, reduce 58) on COMMA
33: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
33: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
33: shift-reduce conflict (shift 45, reduce 58) on AND
33: shift-reduce conflict (shift 46, reduce 58) on OR
33: shift-reduce conflict (shift 47, reduce 58) on XOR
33: shift-reduce conflict (shift 48, reduce 58) on EQ
33: shift-reduce conflict (shift 49, reduce 58) on NE
33: shift-reduce conflict (shift 50, reduce 58) on LE
33: shift-reduce conflict (shift 51, reduce 58) on GE
33: shift-reduce conflict (shift 52, reduce 58) on LT
33: shift-reduce conflict (shift 53, reduce 58) on GT
33: shift-reduce conflict (shift 54, reduce 58) on ADD
33: shift-reduce conflict (shift 55, reduce 58) on SUB
33: shift-reduce conflict (shift 56, reduce 58) on MUL
33: shift-reduce conflict (shift 57, reduce 58) on DIV
state 33
	assign_decl : ID_lookup ASSIGN expression .  (19)
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression

	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57
	.  reduce 19

	relop  goto 58
	addop  goto 59
	mulop  goto 60


state 34
	factor : ID_get .  (77)

	.  reduce 77


state 35
	expression : factor .  (60)

	.  reduce 60


state 36
	var_declaration : type_specifier ID LS NUM_Int RS . SEMICOLON

	SEMICOLON  shift 61


state 37
	fun_defination : type_specifier ID_lookup LP params RP . compound_stmt
	fun_declaration : type_specifier ID_lookup LP params RP . SEMICOLON

	LB  shift 62
	SEMICOLON  shift 63

	compound_stmt  goto 64


state 38
	param : type_specifier . ID_lookup
	param : type_specifier . ID_lookup LS RS

	ID  shift 23

	ID_lookup  goto 65


state 39
	params : params param_list .  (24)
	param_list : param_list . COMMA param

	COMMA  shift 66
	.  reduce 24


state 40
	param_list : param .  (27)

	.  reduce 27


41: shift-reduce conflict (shift 67, reduce 58) on RP
41: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
41: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
41: shift-reduce conflict (shift 45, reduce 58) on AND
41: shift-reduce conflict (shift 46, reduce 58) on OR
41: shift-reduce conflict (shift 47, reduce 58) on XOR
41: shift-reduce conflict (shift 48, reduce 58) on EQ
41: shift-reduce conflict (shift 49, reduce 58) on NE
41: shift-reduce conflict (shift 50, reduce 58) on LE
41: shift-reduce conflict (shift 51, reduce 58) on GE
41: shift-reduce conflict (shift 52, reduce 58) on LT
41: shift-reduce conflict (shift 53, reduce 58) on GT
41: shift-reduce conflict (shift 54, reduce 58) on ADD
41: shift-reduce conflict (shift 55, reduce 58) on SUB
41: shift-reduce conflict (shift 56, reduce 58) on MUL
41: shift-reduce conflict (shift 57, reduce 58) on DIV
state 41
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression
	expression : LP expression . RP
	factor : LP expression . RP

	RP  shift 67
	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57

	relop  goto 58
	addop  goto 59
	mulop  goto 60


42: reduce-reduce conflict (reduce 55, reduce 58) on IF
42: reduce-reduce conflict (reduce 55, reduce 58) on ELSE
42: reduce-reduce conflict (reduce 55, reduce 58) on WHILE
42: reduce-reduce conflict (reduce 55, reduce 58) on FOR
42: reduce-reduce conflict (reduce 55, reduce 58) on RETURN
42: reduce-reduce conflict (reduce 55, reduce 58) on ID
42: reduce-reduce conflict (reduce 55, reduce 58) on NUM_Int
42: reduce-reduce conflict (reduce 55, reduce 58) on NUM_Double
42: reduce-reduce conflict (reduce 55, reduce 58) on Char
42: reduce-reduce conflict (reduce 55, reduce 58) on LP
42: reduce-reduce conflict (reduce 55, reduce 58) on RP
42: reduce-reduce conflict (reduce 55, reduce 58) on LB
42: reduce-reduce conflict (reduce 55, reduce 58) on RB
42: reduce-reduce conflict (reduce 55, reduce 58) on SEMICOLON
42: reduce-reduce conflict (reduce 55, reduce 58) on COMMA
42: reduce-reduce conflict (reduce 55, reduce 58) on L_SHIFT
42: reduce-reduce conflict (reduce 55, reduce 58) on R_SHIFT
42: reduce-reduce conflict (reduce 55, reduce 58) on AND
42: reduce-reduce conflict (reduce 55, reduce 58) on OR
42: reduce-reduce conflict (reduce 55, reduce 58) on XOR
42: reduce-reduce conflict (reduce 55, reduce 58) on NOT
42: reduce-reduce conflict (reduce 55, reduce 58) on EQ
42: reduce-reduce conflict (reduce 55, reduce 58) on NE
42: reduce-reduce conflict (reduce 55, reduce 58) on LE
42: reduce-reduce conflict (reduce 55, reduce 58) on GE
42: reduce-reduce conflict (reduce 55, reduce 58) on LT
42: reduce-reduce conflict (reduce 55, reduce 58) on GT
42: reduce-reduce conflict (reduce 55, reduce 58) on ADD
42: reduce-reduce conflict (reduce 55, reduce 58) on SUB
42: reduce-reduce conflict (reduce 55, reduce 58) on MUL
42: reduce-reduce conflict (reduce 55, reduce 58) on DIV
state 42
	expression : NOT expression .  (55)
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression

	.  reduce 55

	relop  goto 58
	addop  goto 59
	mulop  goto 60


state 43
	relop : L_SHIFT .  (70)

	.  reduce 70


state 44
	relop : R_SHIFT .  (71)

	.  reduce 71


state 45
	relop : AND .  (67)

	.  reduce 67


state 46
	relop : OR .  (68)

	.  reduce 68


state 47
	relop : XOR .  (69)

	.  reduce 69


state 48
	relop : EQ .  (61)

	.  reduce 61


state 49
	relop : NE .  (62)

	.  reduce 62


state 50
	relop : LE .  (63)

	.  reduce 63


state 51
	relop : GE .  (64)

	.  reduce 64


state 52
	relop : LT .  (65)

	.  reduce 65


state 53
	relop : GT .  (66)

	.  reduce 66


state 54
	addop : ADD .  (72)

	.  reduce 72


state 55
	addop : SUB .  (73)

	.  reduce 73


state 56
	mulop : MUL .  (74)

	.  reduce 74


state 57
	mulop : DIV .  (75)

	.  reduce 75


state 58
	expression : expression relop . expression

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 68
	ID_get  goto 34
	factor  goto 35


state 59
	expression : expression addop . expression

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 69
	ID_get  goto 34
	factor  goto 35


state 60
	expression : expression mulop . expression

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 70
	ID_get  goto 34
	factor  goto 35


state 61
	var_declaration : type_specifier ID LS NUM_Int RS SEMICOLON .  (8)

	.  reduce 8


state 62
	compound_stmt : LB . local_declaration statement_list RB
	local_declaration : .  (31)

	.  reduce 31

	local_declaration  goto 71


state 63
	fun_declaration : type_specifier ID_lookup LP params RP SEMICOLON .  (22)

	.  reduce 22


state 64
	fun_defination : type_specifier ID_lookup LP params RP compound_stmt .  (23)

	.  reduce 23


state 65
	param : type_specifier ID_lookup .  (28)
	param : type_specifier ID_lookup . LS RS

	LS  shift 72
	.  reduce 28


state 66
	param_list : param_list COMMA . param
	type_specifier : .  (14)

	INT  shift 3
	DOUBLE  shift 4
	CHAR  shift 5
	BOOL  shift 6
	VOID  shift 7
	.  reduce 14

	type_specifier  goto 38
	param  goto 73


67: reduce-reduce conflict (reduce 59, reduce 76) on IF
67: reduce-reduce conflict (reduce 59, reduce 76) on ELSE
67: reduce-reduce conflict (reduce 59, reduce 76) on WHILE
67: reduce-reduce conflict (reduce 59, reduce 76) on FOR
67: reduce-reduce conflict (reduce 59, reduce 76) on RETURN
67: reduce-reduce conflict (reduce 59, reduce 76) on ID
67: reduce-reduce conflict (reduce 59, reduce 76) on NUM_Int
67: reduce-reduce conflict (reduce 59, reduce 76) on NUM_Double
67: reduce-reduce conflict (reduce 59, reduce 76) on Char
67: reduce-reduce conflict (reduce 59, reduce 76) on LP
67: reduce-reduce conflict (reduce 59, reduce 76) on RP
67: reduce-reduce conflict (reduce 59, reduce 76) on LB
67: reduce-reduce conflict (reduce 59, reduce 76) on RB
67: reduce-reduce conflict (reduce 59, reduce 76) on SEMICOLON
67: reduce-reduce conflict (reduce 59, reduce 76) on COMMA
67: reduce-reduce conflict (reduce 59, reduce 76) on L_SHIFT
67: reduce-reduce conflict (reduce 59, reduce 76) on R_SHIFT
67: reduce-reduce conflict (reduce 59, reduce 76) on AND
67: reduce-reduce conflict (reduce 59, reduce 76) on OR
67: reduce-reduce conflict (reduce 59, reduce 76) on XOR
67: reduce-reduce conflict (reduce 59, reduce 76) on NOT
67: reduce-reduce conflict (reduce 59, reduce 76) on EQ
67: reduce-reduce conflict (reduce 59, reduce 76) on NE
67: reduce-reduce conflict (reduce 59, reduce 76) on LE
67: reduce-reduce conflict (reduce 59, reduce 76) on GE
67: reduce-reduce conflict (reduce 59, reduce 76) on LT
67: reduce-reduce conflict (reduce 59, reduce 76) on GT
67: reduce-reduce conflict (reduce 59, reduce 76) on ADD
67: reduce-reduce conflict (reduce 59, reduce 76) on SUB
67: reduce-reduce conflict (reduce 59, reduce 76) on MUL
67: reduce-reduce conflict (reduce 59, reduce 76) on DIV
state 67
	expression : LP expression RP .  (59)
	factor : LP expression RP .  (76)

	.  reduce 59


68: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
68: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
68: shift-reduce conflict (shift 45, reduce 58) on AND
68: shift-reduce conflict (shift 46, reduce 58) on OR
68: shift-reduce conflict (shift 47, reduce 58) on XOR
68: shift-reduce conflict (shift 48, reduce 58) on EQ
68: shift-reduce conflict (shift 49, reduce 58) on NE
68: shift-reduce conflict (shift 50, reduce 58) on LE
68: shift-reduce conflict (shift 51, reduce 58) on GE
68: shift-reduce conflict (shift 52, reduce 58) on LT
68: shift-reduce conflict (shift 53, reduce 58) on GT
68: shift-reduce conflict (shift 54, reduce 58) on ADD
68: shift-reduce conflict (shift 55, reduce 58) on SUB
68: shift-reduce conflict (shift 56, reduce 58) on MUL
68: shift-reduce conflict (shift 57, reduce 58) on DIV
68: reduce-reduce conflict (reduce 54, reduce 58) on IF
68: reduce-reduce conflict (reduce 54, reduce 58) on ELSE
68: reduce-reduce conflict (reduce 54, reduce 58) on WHILE
68: reduce-reduce conflict (reduce 54, reduce 58) on FOR
68: reduce-reduce conflict (reduce 54, reduce 58) on RETURN
68: reduce-reduce conflict (reduce 54, reduce 58) on ID
68: reduce-reduce conflict (reduce 54, reduce 58) on NUM_Int
68: reduce-reduce conflict (reduce 54, reduce 58) on NUM_Double
68: reduce-reduce conflict (reduce 54, reduce 58) on Char
68: reduce-reduce conflict (reduce 54, reduce 58) on LP
68: reduce-reduce conflict (reduce 54, reduce 58) on RP
68: reduce-reduce conflict (reduce 54, reduce 58) on LB
68: reduce-reduce conflict (reduce 54, reduce 58) on RB
68: reduce-reduce conflict (reduce 54, reduce 58) on SEMICOLON
68: reduce-reduce conflict (reduce 54, reduce 58) on COMMA
68: shift-reduce conflict (shift 43, reduce 54) on L_SHIFT
68: shift-reduce conflict (shift 44, reduce 54) on R_SHIFT
68: shift-reduce conflict (shift 45, reduce 54) on AND
68: shift-reduce conflict (shift 46, reduce 54) on OR
68: shift-reduce conflict (shift 47, reduce 54) on XOR
68: reduce-reduce conflict (reduce 54, reduce 58) on NOT
68: shift-reduce conflict (shift 48, reduce 54) on EQ
68: shift-reduce conflict (shift 49, reduce 54) on NE
68: shift-reduce conflict (shift 50, reduce 54) on LE
68: shift-reduce conflict (shift 51, reduce 54) on GE
68: shift-reduce conflict (shift 52, reduce 54) on LT
68: shift-reduce conflict (shift 53, reduce 54) on GT
68: shift-reduce conflict (shift 54, reduce 54) on ADD
68: shift-reduce conflict (shift 55, reduce 54) on SUB
68: shift-reduce conflict (shift 56, reduce 54) on MUL
68: shift-reduce conflict (shift 57, reduce 54) on DIV
state 68
	expression : expression .  (58)
	expression : expression relop expression .  (54)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression

	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57
	.  reduce 54

	relop  goto 58
	addop  goto 59
	mulop  goto 60


69: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
69: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
69: shift-reduce conflict (shift 45, reduce 58) on AND
69: shift-reduce conflict (shift 46, reduce 58) on OR
69: shift-reduce conflict (shift 47, reduce 58) on XOR
69: shift-reduce conflict (shift 48, reduce 58) on EQ
69: shift-reduce conflict (shift 49, reduce 58) on NE
69: shift-reduce conflict (shift 50, reduce 58) on LE
69: shift-reduce conflict (shift 51, reduce 58) on GE
69: shift-reduce conflict (shift 52, reduce 58) on LT
69: shift-reduce conflict (shift 53, reduce 58) on GT
69: shift-reduce conflict (shift 54, reduce 58) on ADD
69: shift-reduce conflict (shift 55, reduce 58) on SUB
69: shift-reduce conflict (shift 56, reduce 58) on MUL
69: shift-reduce conflict (shift 57, reduce 58) on DIV
69: reduce-reduce conflict (reduce 56, reduce 58) on IF
69: reduce-reduce conflict (reduce 56, reduce 58) on ELSE
69: reduce-reduce conflict (reduce 56, reduce 58) on WHILE
69: reduce-reduce conflict (reduce 56, reduce 58) on FOR
69: reduce-reduce conflict (reduce 56, reduce 58) on RETURN
69: reduce-reduce conflict (reduce 56, reduce 58) on ID
69: reduce-reduce conflict (reduce 56, reduce 58) on NUM_Int
69: reduce-reduce conflict (reduce 56, reduce 58) on NUM_Double
69: reduce-reduce conflict (reduce 56, reduce 58) on Char
69: reduce-reduce conflict (reduce 56, reduce 58) on LP
69: reduce-reduce conflict (reduce 56, reduce 58) on RP
69: reduce-reduce conflict (reduce 56, reduce 58) on LB
69: reduce-reduce conflict (reduce 56, reduce 58) on RB
69: reduce-reduce conflict (reduce 56, reduce 58) on SEMICOLON
69: reduce-reduce conflict (reduce 56, reduce 58) on COMMA
69: shift-reduce conflict (shift 43, reduce 56) on L_SHIFT
69: shift-reduce conflict (shift 44, reduce 56) on R_SHIFT
69: shift-reduce conflict (shift 45, reduce 56) on AND
69: shift-reduce conflict (shift 46, reduce 56) on OR
69: shift-reduce conflict (shift 47, reduce 56) on XOR
69: reduce-reduce conflict (reduce 56, reduce 58) on NOT
69: shift-reduce conflict (shift 48, reduce 56) on EQ
69: shift-reduce conflict (shift 49, reduce 56) on NE
69: shift-reduce conflict (shift 50, reduce 56) on LE
69: shift-reduce conflict (shift 51, reduce 56) on GE
69: shift-reduce conflict (shift 52, reduce 56) on LT
69: shift-reduce conflict (shift 53, reduce 56) on GT
69: shift-reduce conflict (shift 54, reduce 56) on ADD
69: shift-reduce conflict (shift 55, reduce 56) on SUB
69: shift-reduce conflict (shift 56, reduce 56) on MUL
69: shift-reduce conflict (shift 57, reduce 56) on DIV
state 69
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression addop expression .  (56)
	expression : expression . addop expression
	expression : expression . mulop expression

	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57
	.  reduce 56

	relop  goto 58
	addop  goto 59
	mulop  goto 60


70: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
70: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
70: shift-reduce conflict (shift 45, reduce 58) on AND
70: shift-reduce conflict (shift 46, reduce 58) on OR
70: shift-reduce conflict (shift 47, reduce 58) on XOR
70: shift-reduce conflict (shift 48, reduce 58) on EQ
70: shift-reduce conflict (shift 49, reduce 58) on NE
70: shift-reduce conflict (shift 50, reduce 58) on LE
70: shift-reduce conflict (shift 51, reduce 58) on GE
70: shift-reduce conflict (shift 52, reduce 58) on LT
70: shift-reduce conflict (shift 53, reduce 58) on GT
70: shift-reduce conflict (shift 54, reduce 58) on ADD
70: shift-reduce conflict (shift 55, reduce 58) on SUB
70: shift-reduce conflict (shift 56, reduce 58) on MUL
70: shift-reduce conflict (shift 57, reduce 58) on DIV
70: reduce-reduce conflict (reduce 57, reduce 58) on IF
70: reduce-reduce conflict (reduce 57, reduce 58) on ELSE
70: reduce-reduce conflict (reduce 57, reduce 58) on WHILE
70: reduce-reduce conflict (reduce 57, reduce 58) on FOR
70: reduce-reduce conflict (reduce 57, reduce 58) on RETURN
70: reduce-reduce conflict (reduce 57, reduce 58) on ID
70: reduce-reduce conflict (reduce 57, reduce 58) on NUM_Int
70: reduce-reduce conflict (reduce 57, reduce 58) on NUM_Double
70: reduce-reduce conflict (reduce 57, reduce 58) on Char
70: reduce-reduce conflict (reduce 57, reduce 58) on LP
70: reduce-reduce conflict (reduce 57, reduce 58) on RP
70: reduce-reduce conflict (reduce 57, reduce 58) on LB
70: reduce-reduce conflict (reduce 57, reduce 58) on RB
70: reduce-reduce conflict (reduce 57, reduce 58) on SEMICOLON
70: reduce-reduce conflict (reduce 57, reduce 58) on COMMA
70: shift-reduce conflict (shift 43, reduce 57) on L_SHIFT
70: shift-reduce conflict (shift 44, reduce 57) on R_SHIFT
70: shift-reduce conflict (shift 45, reduce 57) on AND
70: shift-reduce conflict (shift 46, reduce 57) on OR
70: shift-reduce conflict (shift 47, reduce 57) on XOR
70: reduce-reduce conflict (reduce 57, reduce 58) on NOT
70: shift-reduce conflict (shift 48, reduce 57) on EQ
70: shift-reduce conflict (shift 49, reduce 57) on NE
70: shift-reduce conflict (shift 50, reduce 57) on LE
70: shift-reduce conflict (shift 51, reduce 57) on GE
70: shift-reduce conflict (shift 52, reduce 57) on LT
70: shift-reduce conflict (shift 53, reduce 57) on GT
70: shift-reduce conflict (shift 54, reduce 57) on ADD
70: shift-reduce conflict (shift 55, reduce 57) on SUB
70: shift-reduce conflict (shift 56, reduce 57) on MUL
70: shift-reduce conflict (shift 57, reduce 57) on DIV
state 70
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression mulop expression .  (57)
	expression : expression . mulop expression

	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57
	.  reduce 57

	relop  goto 58
	addop  goto 59
	mulop  goto 60


71: reduce-reduce conflict (reduce 14, reduce 33) on ID
state 71
	local_declaration : local_declaration . var_declaration
	compound_stmt : LB local_declaration . statement_list RB
	type_specifier : .  (14)
	statement_list : .  (33)

	INT  shift 3
	DOUBLE  shift 4
	CHAR  shift 5
	BOOL  shift 6
	VOID  shift 7
	ID  reduce 14
	.  reduce 33

	type_specifier  goto 74
	var_declaration  goto 75
	statement_list  goto 76


state 72
	param : type_specifier ID_lookup LS . RS

	RS  shift 77


state 73
	param_list : param_list COMMA param .  (26)

	.  reduce 26


state 74
	var_declaration : type_specifier . ID_list SEMICOLON
	var_declaration : type_specifier . ID LS NUM_Int RS SEMICOLON

	ID  shift 13

	ID_list  goto 14
	ID_lookup  goto 78
	assign_decl  goto 16


state 75
	local_declaration : local_declaration var_declaration .  (30)

	.  reduce 30


state 76
	statement_list : statement_list . statement
	compound_stmt : LB local_declaration statement_list . RB

	IF  shift 79
	WHILE  shift 80
	FOR  shift 81
	RETURN  shift 82
	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	LB  shift 62
	RB  shift 83
	SEMICOLON  shift 84
	NOT  shift 32

	statement  goto 85
	fun_call  goto 86
	if_stmt  goto 87
	expression  goto 88
	for_stmt  goto 89
	ID_get  goto 90
	compound_stmt  goto 91
	expression_stmt  goto 92
	assign_stmt  goto 93
	return_stmt  goto 94
	while_stmt  goto 95
	factor  goto 35


state 77
	param : type_specifier ID_lookup LS RS .  (29)

	.  reduce 29


state 78
	assign_decl : ID_lookup . ASSIGN expression
	ID_list : ID_lookup .  (18)

	ASSIGN  shift 21
	.  reduce 18


state 79
	if_stmt : IF . LP expression RP statement ELSE statement
	if_stmt : IF . LP expression RP statement

	LP  shift 96


state 80
	while_stmt : WHILE . LP expression RP LB statement_list RB

	LP  shift 97


state 81
	for_stmt : FOR . LP expression_list SEMICOLON expression_list SEMICOLON expression_list RP statement_list

	LP  shift 98


state 82
	return_stmt : RETURN . expression SEMICOLON
	return_stmt : RETURN . SEMICOLON

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	SEMICOLON  shift 99
	NOT  shift 32

	expression  goto 100
	ID_get  goto 34
	factor  goto 35


state 83
	compound_stmt : LB local_declaration statement_list RB .  (44)

	.  reduce 44


state 84
	expression_stmt : SEMICOLON .  (43)

	.  reduce 43


state 85
	statement_list : statement_list statement .  (32)

	.  reduce 32


state 86
	statement : fun_call .  (41)

	.  reduce 41


state 87
	statement : if_stmt .  (36)

	.  reduce 36


88: shift-reduce conflict (shift 101, reduce 58) on SEMICOLON
88: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
88: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
88: shift-reduce conflict (shift 45, reduce 58) on AND
88: shift-reduce conflict (shift 46, reduce 58) on OR
88: shift-reduce conflict (shift 47, reduce 58) on XOR
88: shift-reduce conflict (shift 48, reduce 58) on EQ
88: shift-reduce conflict (shift 49, reduce 58) on NE
88: shift-reduce conflict (shift 50, reduce 58) on LE
88: shift-reduce conflict (shift 51, reduce 58) on GE
88: shift-reduce conflict (shift 52, reduce 58) on LT
88: shift-reduce conflict (shift 53, reduce 58) on GT
88: shift-reduce conflict (shift 54, reduce 58) on ADD
88: shift-reduce conflict (shift 55, reduce 58) on SUB
88: shift-reduce conflict (shift 56, reduce 58) on MUL
88: shift-reduce conflict (shift 57, reduce 58) on DIV
state 88
	expression_stmt : expression . SEMICOLON
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression

	SEMICOLON  shift 101
	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57

	relop  goto 58
	addop  goto 59
	mulop  goto 60


state 89
	statement : for_stmt .  (38)

	.  reduce 38


state 90
	assign_stmt : ID_get . ASSIGN expression
	factor : ID_get .  (77)
	fun_call : ID_get . LP args RP

	LP  shift 102
	ASSIGN  shift 103
	.  reduce 77


state 91
	statement : compound_stmt .  (35)

	.  reduce 35


state 92
	statement : expression_stmt .  (34)

	.  reduce 34


state 93
	statement : assign_stmt .  (39)

	.  reduce 39


state 94
	statement : return_stmt .  (40)

	.  reduce 40


state 95
	statement : while_stmt .  (37)

	.  reduce 37


state 96
	if_stmt : IF LP . expression RP statement ELSE statement
	if_stmt : IF LP . expression RP statement

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 104
	ID_get  goto 34
	factor  goto 35


state 97
	while_stmt : WHILE LP . expression RP LB statement_list RB

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 105
	ID_get  goto 34
	factor  goto 35


state 98
	for_stmt : FOR LP . expression_list SEMICOLON expression_list SEMICOLON expression_list RP statement_list
	expression_list : .  (50)

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32
	.  reduce 50

	expression  goto 106
	ID_get  goto 34
	factor  goto 35
	expression_list  goto 107


state 99
	return_stmt : RETURN SEMICOLON .  (52)

	.  reduce 52


100: shift-reduce conflict (shift 108, reduce 58) on SEMICOLON
100: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
100: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
100: shift-reduce conflict (shift 45, reduce 58) on AND
100: shift-reduce conflict (shift 46, reduce 58) on OR
100: shift-reduce conflict (shift 47, reduce 58) on XOR
100: shift-reduce conflict (shift 48, reduce 58) on EQ
100: shift-reduce conflict (shift 49, reduce 58) on NE
100: shift-reduce conflict (shift 50, reduce 58) on LE
100: shift-reduce conflict (shift 51, reduce 58) on GE
100: shift-reduce conflict (shift 52, reduce 58) on LT
100: shift-reduce conflict (shift 53, reduce 58) on GT
100: shift-reduce conflict (shift 54, reduce 58) on ADD
100: shift-reduce conflict (shift 55, reduce 58) on SUB
100: shift-reduce conflict (shift 56, reduce 58) on MUL
100: shift-reduce conflict (shift 57, reduce 58) on DIV
state 100
	expression : expression .  (58)
	return_stmt : RETURN expression . SEMICOLON
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression

	SEMICOLON  shift 108
	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57

	relop  goto 58
	addop  goto 59
	mulop  goto 60


state 101
	expression_stmt : expression SEMICOLON .  (42)

	.  reduce 42


state 102
	fun_call : ID_get LP . args RP
	args : .  (83)

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32
	.  reduce 83

	expression  goto 109
	ID_get  goto 34
	arg_list  goto 110
	factor  goto 35
	args  goto 111


state 103
	assign_stmt : ID_get ASSIGN . expression

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 112
	ID_get  goto 34
	factor  goto 35


104: shift-reduce conflict (shift 113, reduce 58) on RP
104: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
104: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
104: shift-reduce conflict (shift 45, reduce 58) on AND
104: shift-reduce conflict (shift 46, reduce 58) on OR
104: shift-reduce conflict (shift 47, reduce 58) on XOR
104: shift-reduce conflict (shift 48, reduce 58) on EQ
104: shift-reduce conflict (shift 49, reduce 58) on NE
104: shift-reduce conflict (shift 50, reduce 58) on LE
104: shift-reduce conflict (shift 51, reduce 58) on GE
104: shift-reduce conflict (shift 52, reduce 58) on LT
104: shift-reduce conflict (shift 53, reduce 58) on GT
104: shift-reduce conflict (shift 54, reduce 58) on ADD
104: shift-reduce conflict (shift 55, reduce 58) on SUB
104: shift-reduce conflict (shift 56, reduce 58) on MUL
104: shift-reduce conflict (shift 57, reduce 58) on DIV
state 104
	if_stmt : IF LP expression . RP statement ELSE statement
	if_stmt : IF LP expression . RP statement
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression

	RP  shift 113
	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57

	relop  goto 58
	addop  goto 59
	mulop  goto 60


105: shift-reduce conflict (shift 114, reduce 58) on RP
105: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
105: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
105: shift-reduce conflict (shift 45, reduce 58) on AND
105: shift-reduce conflict (shift 46, reduce 58) on OR
105: shift-reduce conflict (shift 47, reduce 58) on XOR
105: shift-reduce conflict (shift 48, reduce 58) on EQ
105: shift-reduce conflict (shift 49, reduce 58) on NE
105: shift-reduce conflict (shift 50, reduce 58) on LE
105: shift-reduce conflict (shift 51, reduce 58) on GE
105: shift-reduce conflict (shift 52, reduce 58) on LT
105: shift-reduce conflict (shift 53, reduce 58) on GT
105: shift-reduce conflict (shift 54, reduce 58) on ADD
105: shift-reduce conflict (shift 55, reduce 58) on SUB
105: shift-reduce conflict (shift 56, reduce 58) on MUL
105: shift-reduce conflict (shift 57, reduce 58) on DIV
state 105
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression
	while_stmt : WHILE LP expression . RP LB statement_list RB

	RP  shift 114
	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57

	relop  goto 58
	addop  goto 59
	mulop  goto 60


106: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
106: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
106: shift-reduce conflict (shift 45, reduce 58) on AND
106: shift-reduce conflict (shift 46, reduce 58) on OR
106: shift-reduce conflict (shift 47, reduce 58) on XOR
106: shift-reduce conflict (shift 48, reduce 58) on EQ
106: shift-reduce conflict (shift 49, reduce 58) on NE
106: shift-reduce conflict (shift 50, reduce 58) on LE
106: shift-reduce conflict (shift 51, reduce 58) on GE
106: shift-reduce conflict (shift 52, reduce 58) on LT
106: shift-reduce conflict (shift 53, reduce 58) on GT
106: shift-reduce conflict (shift 54, reduce 58) on ADD
106: shift-reduce conflict (shift 55, reduce 58) on SUB
106: shift-reduce conflict (shift 56, reduce 58) on MUL
106: shift-reduce conflict (shift 57, reduce 58) on DIV
106: reduce-reduce conflict (reduce 49, reduce 58) on RP
106: reduce-reduce conflict (reduce 49, reduce 58) on SEMICOLON
state 106
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression
	expression_list : expression .  (49)

	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57
	.  reduce 49

	relop  goto 58
	addop  goto 59
	mulop  goto 60


state 107
	for_stmt : FOR LP expression_list . SEMICOLON expression_list SEMICOLON expression_list RP statement_list

	SEMICOLON  shift 115


state 108
	return_stmt : RETURN expression SEMICOLON .  (53)

	.  reduce 53


109: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
109: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
109: shift-reduce conflict (shift 45, reduce 58) on AND
109: shift-reduce conflict (shift 46, reduce 58) on OR
109: shift-reduce conflict (shift 47, reduce 58) on XOR
109: shift-reduce conflict (shift 48, reduce 58) on EQ
109: shift-reduce conflict (shift 49, reduce 58) on NE
109: shift-reduce conflict (shift 50, reduce 58) on LE
109: shift-reduce conflict (shift 51, reduce 58) on GE
109: shift-reduce conflict (shift 52, reduce 58) on LT
109: shift-reduce conflict (shift 53, reduce 58) on GT
109: shift-reduce conflict (shift 54, reduce 58) on ADD
109: shift-reduce conflict (shift 55, reduce 58) on SUB
109: shift-reduce conflict (shift 56, reduce 58) on MUL
109: shift-reduce conflict (shift 57, reduce 58) on DIV
109: reduce-reduce conflict (reduce 58, reduce 85) on RP
109: reduce-reduce conflict (reduce 58, reduce 85) on COMMA
state 109
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression
	arg_list : expression .  (85)

	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57
	.  reduce 58

	relop  goto 58
	addop  goto 59
	mulop  goto 60


state 110
	args : arg_list .  (82)
	arg_list : arg_list . COMMA expression

	COMMA  shift 116
	.  reduce 82


state 111
	fun_call : ID_get LP args . RP

	RP  shift 117


112: reduce-reduce conflict (reduce 51, reduce 58) on IF
112: reduce-reduce conflict (reduce 51, reduce 58) on ELSE
112: reduce-reduce conflict (reduce 51, reduce 58) on WHILE
112: reduce-reduce conflict (reduce 51, reduce 58) on FOR
112: reduce-reduce conflict (reduce 51, reduce 58) on RETURN
112: reduce-reduce conflict (reduce 51, reduce 58) on ID
112: reduce-reduce conflict (reduce 51, reduce 58) on NUM_Int
112: reduce-reduce conflict (reduce 51, reduce 58) on NUM_Double
112: reduce-reduce conflict (reduce 51, reduce 58) on Char
112: reduce-reduce conflict (reduce 51, reduce 58) on LP
112: reduce-reduce conflict (reduce 51, reduce 58) on LB
112: reduce-reduce conflict (reduce 51, reduce 58) on RB
112: reduce-reduce conflict (reduce 51, reduce 58) on SEMICOLON
112: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
112: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
112: shift-reduce conflict (shift 45, reduce 58) on AND
112: shift-reduce conflict (shift 46, reduce 58) on OR
112: shift-reduce conflict (shift 47, reduce 58) on XOR
112: reduce-reduce conflict (reduce 51, reduce 58) on NOT
112: shift-reduce conflict (shift 48, reduce 58) on EQ
112: shift-reduce conflict (shift 49, reduce 58) on NE
112: shift-reduce conflict (shift 50, reduce 58) on LE
112: shift-reduce conflict (shift 51, reduce 58) on GE
112: shift-reduce conflict (shift 52, reduce 58) on LT
112: shift-reduce conflict (shift 53, reduce 58) on GT
112: shift-reduce conflict (shift 54, reduce 58) on ADD
112: shift-reduce conflict (shift 55, reduce 58) on SUB
112: shift-reduce conflict (shift 56, reduce 58) on MUL
112: shift-reduce conflict (shift 57, reduce 58) on DIV
state 112
	assign_stmt : ID_get ASSIGN expression .  (51)
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression

	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57
	.  reduce 51

	relop  goto 58
	addop  goto 59
	mulop  goto 60


state 113
	if_stmt : IF LP expression RP . statement ELSE statement
	if_stmt : IF LP expression RP . statement

	IF  shift 79
	WHILE  shift 80
	FOR  shift 81
	RETURN  shift 82
	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	LB  shift 62
	SEMICOLON  shift 84
	NOT  shift 32

	statement  goto 118
	fun_call  goto 86
	if_stmt  goto 87
	expression  goto 88
	for_stmt  goto 89
	ID_get  goto 90
	compound_stmt  goto 91
	expression_stmt  goto 92
	assign_stmt  goto 93
	return_stmt  goto 94
	while_stmt  goto 95
	factor  goto 35


state 114
	while_stmt : WHILE LP expression RP . LB statement_list RB

	LB  shift 119


state 115
	for_stmt : FOR LP expression_list SEMICOLON . expression_list SEMICOLON expression_list RP statement_list
	expression_list : .  (50)

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32
	.  reduce 50

	expression  goto 106
	ID_get  goto 34
	factor  goto 35
	expression_list  goto 120


state 116
	arg_list : arg_list COMMA . expression

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32

	expression  goto 121
	ID_get  goto 34
	factor  goto 35


state 117
	fun_call : ID_get LP args RP .  (81)

	.  reduce 81


118: shift-reduce conflict (shift 122, reduce 45) on ELSE
state 118
	if_stmt : IF LP expression RP statement . ELSE statement
	if_stmt : IF LP expression RP statement .  (45)

	ELSE  shift 122
	.  reduce 45


state 119
	while_stmt : WHILE LP expression RP LB . statement_list RB
	statement_list : .  (33)

	.  reduce 33

	statement_list  goto 123


state 120
	for_stmt : FOR LP expression_list SEMICOLON expression_list . SEMICOLON expression_list RP statement_list

	SEMICOLON  shift 124


121: shift-reduce conflict (shift 43, reduce 58) on L_SHIFT
121: shift-reduce conflict (shift 44, reduce 58) on R_SHIFT
121: shift-reduce conflict (shift 45, reduce 58) on AND
121: shift-reduce conflict (shift 46, reduce 58) on OR
121: shift-reduce conflict (shift 47, reduce 58) on XOR
121: shift-reduce conflict (shift 48, reduce 58) on EQ
121: shift-reduce conflict (shift 49, reduce 58) on NE
121: shift-reduce conflict (shift 50, reduce 58) on LE
121: shift-reduce conflict (shift 51, reduce 58) on GE
121: shift-reduce conflict (shift 52, reduce 58) on LT
121: shift-reduce conflict (shift 53, reduce 58) on GT
121: shift-reduce conflict (shift 54, reduce 58) on ADD
121: shift-reduce conflict (shift 55, reduce 58) on SUB
121: shift-reduce conflict (shift 56, reduce 58) on MUL
121: shift-reduce conflict (shift 57, reduce 58) on DIV
121: reduce-reduce conflict (reduce 58, reduce 84) on RP
121: reduce-reduce conflict (reduce 58, reduce 84) on COMMA
state 121
	expression : expression .  (58)
	expression : expression . relop expression
	expression : expression . addop expression
	expression : expression . mulop expression
	arg_list : arg_list COMMA expression .  (84)

	L_SHIFT  shift 43
	R_SHIFT  shift 44
	AND  shift 45
	OR  shift 46
	XOR  shift 47
	EQ  shift 48
	NE  shift 49
	LE  shift 50
	GE  shift 51
	LT  shift 52
	GT  shift 53
	ADD  shift 54
	SUB  shift 55
	MUL  shift 56
	DIV  shift 57
	.  reduce 58

	relop  goto 58
	addop  goto 59
	mulop  goto 60


state 122
	if_stmt : IF LP expression RP statement ELSE . statement

	IF  shift 79
	WHILE  shift 80
	FOR  shift 81
	RETURN  shift 82
	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	LB  shift 62
	SEMICOLON  shift 84
	NOT  shift 32

	statement  goto 125
	fun_call  goto 86
	if_stmt  goto 87
	expression  goto 88
	for_stmt  goto 89
	ID_get  goto 90
	compound_stmt  goto 91
	expression_stmt  goto 92
	assign_stmt  goto 93
	return_stmt  goto 94
	while_stmt  goto 95
	factor  goto 35


state 123
	statement_list : statement_list . statement
	while_stmt : WHILE LP expression RP LB statement_list . RB

	IF  shift 79
	WHILE  shift 80
	FOR  shift 81
	RETURN  shift 82
	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	LB  shift 62
	RB  shift 126
	SEMICOLON  shift 84
	NOT  shift 32

	statement  goto 85
	fun_call  goto 86
	if_stmt  goto 87
	expression  goto 88
	for_stmt  goto 89
	ID_get  goto 90
	compound_stmt  goto 91
	expression_stmt  goto 92
	assign_stmt  goto 93
	return_stmt  goto 94
	while_stmt  goto 95
	factor  goto 35


state 124
	for_stmt : FOR LP expression_list SEMICOLON expression_list SEMICOLON . expression_list RP statement_list
	expression_list : .  (50)

	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	NOT  shift 32
	.  reduce 50

	expression  goto 106
	ID_get  goto 34
	factor  goto 35
	expression_list  goto 127


state 125
	if_stmt : IF LP expression RP statement ELSE statement .  (46)

	.  reduce 46


state 126
	while_stmt : WHILE LP expression RP LB statement_list RB .  (47)

	.  reduce 47


state 127
	for_stmt : FOR LP expression_list SEMICOLON expression_list SEMICOLON expression_list . RP statement_list

	RP  shift 128


state 128
	for_stmt : FOR LP expression_list SEMICOLON expression_list SEMICOLON expression_list RP . statement_list
	statement_list : .  (33)

	.  reduce 33

	statement_list  goto 129


129: shift-reduce conflict (shift 79, reduce 48) on IF
129: shift-reduce conflict (shift 80, reduce 48) on WHILE
129: shift-reduce conflict (shift 81, reduce 48) on FOR
129: shift-reduce conflict (shift 82, reduce 48) on RETURN
129: shift-reduce conflict (shift 27, reduce 48) on ID
129: shift-reduce conflict (shift 28, reduce 48) on NUM_Int
129: shift-reduce conflict (shift 29, reduce 48) on NUM_Double
129: shift-reduce conflict (shift 30, reduce 48) on Char
state 129
	statement_list : statement_list . statement
	for_stmt : FOR LP expression_list SEMICOLON expression_list SEMICOLON expression_list RP statement_list .  (48)

	IF  shift 79
	WHILE  shift 80
	FOR  shift 81
	RETURN  shift 82
	ID  shift 27
	NUM_Int  shift 28
	NUM_Double  shift 29
	Char  shift 30
	LP  shift 31
	LB  shift 62
	.  reduce 48

	statement  goto 85
	fun_call  goto 86
	if_stmt  goto 87
	expression  goto 88
	for_stmt  goto 89
	ID_get  goto 90
	compound_stmt  goto 91
	expression_stmt  goto 92
	assign_stmt  goto 93
	return_stmt  goto 94
	while_stmt  goto 95
	factor  goto 35


Rules never reduced
	factor : LP expression RP  (76)
	arg_list : arg_list COMMA expression  (84)
	arg_list : expression  (85)


##############################################################################
# Summary
##############################################################################

State 33 contains 15 shift-reduce conflict(s)
State 33 contains 2 reduce-reduce conflict(s)
State 41 contains 16 shift-reduce conflict(s)
State 42 contains 31 reduce-reduce conflict(s)
State 67 contains 31 reduce-reduce conflict(s)
State 68 contains 30 shift-reduce conflict(s)
State 68 contains 16 reduce-reduce conflict(s)
State 69 contains 30 shift-reduce conflict(s)
State 69 contains 16 reduce-reduce conflict(s)
State 70 contains 30 shift-reduce conflict(s)
State 70 contains 16 reduce-reduce conflict(s)
State 71 contains 1 reduce-reduce conflict(s)
State 88 contains 16 shift-reduce conflict(s)
State 100 contains 16 shift-reduce conflict(s)
State 104 contains 16 shift-reduce conflict(s)
State 105 contains 16 shift-reduce conflict(s)
State 106 contains 15 shift-reduce conflict(s)
State 106 contains 2 reduce-reduce conflict(s)
State 109 contains 15 shift-reduce conflict(s)
State 109 contains 2 reduce-reduce conflict(s)
State 112 contains 15 shift-reduce conflict(s)
State 112 contains 14 reduce-reduce conflict(s)
State 118 contains 1 shift-reduce conflict(s)
State 121 contains 15 shift-reduce conflict(s)
State 121 contains 2 reduce-reduce conflict(s)
State 129 contains 8 shift-reduce conflict(s)


41 token(s), 34 nonterminal(s)
86 grammar rule(s), 130 state(s)


##############################################################################
# End of File
##############################################################################
