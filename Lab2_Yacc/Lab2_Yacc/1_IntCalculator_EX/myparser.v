#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 14 of your 30 day trial period.
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
# Date: 10/31/16
# Time: 19:14:56
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : lines $end

    1  lines : lines expr '\n'
    2        | lines '\n'
    3        |

    4  expr : expr ADD expr
    5       | expr SUB expr
    6       | expr MUL expr
    7       | expr DIV expr
    8       | LP expr RP
    9       | SUB expr
   10       | NUMBER
   11       | IDX AS expr
   12       | ID

   13  IDX : ID


##############################################################################
# States
##############################################################################

state 0
	$accept : . lines $end
	lines : .  (3)

	.  reduce 3

	lines  goto 1


state 1
	$accept : lines . $end  (0)
	lines : lines . expr '\n'
	lines : lines . '\n'

	$end  accept
	'\n'  shift 2
	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5
	ID  shift 6

	IDX  goto 7
	expr  goto 8


state 2
	lines : lines '\n' .  (2)

	.  reduce 2


state 3
	expr : NUMBER .  (10)

	.  reduce 10


state 4
	expr : SUB . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5
	ID  shift 6

	IDX  goto 7
	expr  goto 9


state 5
	expr : LP . expr RP

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5
	ID  shift 6

	IDX  goto 7
	expr  goto 10


state 6
	expr : ID .  (12)
	IDX : ID .  (13)

	AS  reduce 13
	.  reduce 12


state 7
	expr : IDX . AS expr

	AS  shift 11


state 8
	lines : lines expr . '\n'
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	'\n'  shift 12
	ADD  shift 13
	SUB  shift 14
	MUL  shift 15
	DIV  shift 16


state 9
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : SUB expr .  (9)

	.  reduce 9


state 10
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : LP expr . RP

	ADD  shift 13
	SUB  shift 14
	MUL  shift 15
	DIV  shift 16
	RP  shift 17


state 11
	expr : IDX AS . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5
	ID  shift 6

	IDX  goto 7
	expr  goto 18


state 12
	lines : lines expr '\n' .  (1)

	.  reduce 1


state 13
	expr : expr ADD . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5
	ID  shift 6

	IDX  goto 7
	expr  goto 19


state 14
	expr : expr SUB . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5
	ID  shift 6

	IDX  goto 7
	expr  goto 20


state 15
	expr : expr MUL . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5
	ID  shift 6

	IDX  goto 7
	expr  goto 21


state 16
	expr : expr DIV . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5
	ID  shift 6

	IDX  goto 7
	expr  goto 22


state 17
	expr : LP expr RP .  (8)

	.  reduce 8


state 18
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : IDX AS expr .  (11)

	ADD  shift 13
	SUB  shift 14
	MUL  shift 15
	DIV  shift 16
	.  reduce 11


state 19
	expr : expr ADD expr .  (4)
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 15
	DIV  shift 16
	.  reduce 4


state 20
	expr : expr . ADD expr
	expr : expr SUB expr .  (5)
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 15
	DIV  shift 16
	.  reduce 5


state 21
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr MUL expr .  (6)
	expr : expr . MUL expr
	expr : expr . DIV expr

	.  reduce 6


state 22
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr DIV expr .  (7)
	expr : expr . DIV expr

	.  reduce 7


##############################################################################
# Summary
##############################################################################

13 token(s), 4 nonterminal(s)
14 grammar rule(s), 23 state(s)


##############################################################################
# End of File
##############################################################################
