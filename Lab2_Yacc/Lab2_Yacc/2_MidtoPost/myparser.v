#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 9 of your 30 day trial period.
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
# Date: 10/26/16
# Time: 20:53:02
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
    5       | expr SUBTRACT expr
    6       | expr MULTIPLY expr
    7       | expr DIVISION expr
    8       | L_BRACE expr R_BRACE
    9       | SUBTRACT expr
   10       | NUMBER


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
	SUBTRACT  shift 4
	L_BRACE  shift 5

	expr  goto 6


state 2
	lines : lines '\n' .  (2)

	.  reduce 2


state 3
	expr : NUMBER .  (10)

	.  reduce 10


state 4
	expr : SUBTRACT . expr

	NUMBER  shift 3
	SUBTRACT  shift 4
	L_BRACE  shift 5

	expr  goto 7


state 5
	expr : L_BRACE . expr R_BRACE

	NUMBER  shift 3
	SUBTRACT  shift 4
	L_BRACE  shift 5

	expr  goto 8


state 6
	lines : lines expr . '\n'
	expr : expr . ADD expr
	expr : expr . SUBTRACT expr
	expr : expr . MULTIPLY expr
	expr : expr . DIVISION expr

	'\n'  shift 9
	ADD  shift 10
	SUBTRACT  shift 11
	MULTIPLY  shift 12
	DIVISION  shift 13


state 7
	expr : expr . ADD expr
	expr : expr . SUBTRACT expr
	expr : expr . MULTIPLY expr
	expr : expr . DIVISION expr
	expr : SUBTRACT expr .  (9)

	.  reduce 9


state 8
	expr : expr . ADD expr
	expr : expr . SUBTRACT expr
	expr : expr . MULTIPLY expr
	expr : expr . DIVISION expr
	expr : L_BRACE expr . R_BRACE

	ADD  shift 10
	SUBTRACT  shift 11
	MULTIPLY  shift 12
	DIVISION  shift 13
	R_BRACE  shift 14


state 9
	lines : lines expr '\n' .  (1)

	.  reduce 1


state 10
	expr : expr ADD . expr

	NUMBER  shift 3
	SUBTRACT  shift 4
	L_BRACE  shift 5

	expr  goto 15


state 11
	expr : expr SUBTRACT . expr

	NUMBER  shift 3
	SUBTRACT  shift 4
	L_BRACE  shift 5

	expr  goto 16


state 12
	expr : expr MULTIPLY . expr

	NUMBER  shift 3
	SUBTRACT  shift 4
	L_BRACE  shift 5

	expr  goto 17


state 13
	expr : expr DIVISION . expr

	NUMBER  shift 3
	SUBTRACT  shift 4
	L_BRACE  shift 5

	expr  goto 18


state 14
	expr : L_BRACE expr R_BRACE .  (8)

	.  reduce 8


state 15
	expr : expr ADD expr .  (4)
	expr : expr . ADD expr
	expr : expr . SUBTRACT expr
	expr : expr . MULTIPLY expr
	expr : expr . DIVISION expr

	MULTIPLY  shift 12
	DIVISION  shift 13
	.  reduce 4


state 16
	expr : expr . ADD expr
	expr : expr SUBTRACT expr .  (5)
	expr : expr . SUBTRACT expr
	expr : expr . MULTIPLY expr
	expr : expr . DIVISION expr

	MULTIPLY  shift 12
	DIVISION  shift 13
	.  reduce 5


state 17
	expr : expr . ADD expr
	expr : expr . SUBTRACT expr
	expr : expr MULTIPLY expr .  (6)
	expr : expr . MULTIPLY expr
	expr : expr . DIVISION expr

	.  reduce 6


state 18
	expr : expr . ADD expr
	expr : expr . SUBTRACT expr
	expr : expr . MULTIPLY expr
	expr : expr DIVISION expr .  (7)
	expr : expr . DIVISION expr

	.  reduce 7


##############################################################################
# Summary
##############################################################################

11 token(s), 3 nonterminal(s)
11 grammar rule(s), 19 state(s)


##############################################################################
# End of File
##############################################################################
