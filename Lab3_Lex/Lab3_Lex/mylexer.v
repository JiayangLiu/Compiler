#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 21 of your 30 day trial period.
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
# mylexer.v
# Lex verbose file generated from mylexer.l.
# 
# Date: 11/07/16
# Time: 11:50:00
# 
# ALex Version: 2.07
#############################################################################


#############################################################################
# Expressions
#############################################################################

    1  [ \t\n]+

    2  if

    3  then

    4  else

    5  switch

    6  case

    7  while

    8  int

    9  float

   10  double

   11  char

   12  [A-Za-z]([A-Za-z]|[0-9])*

   13  [0-9]+(\.[0-9]+)?(E[+-]?[0-9]+)?

   14  "("

   15  ")"

   16  "["

   17  "]"

   18  "{"

   19  "}"

   20  ":"

   21  ";"

   22  "="

   23  "=="

   24  "+"

   25  "-"

   26  "*"

   27  "/"


#############################################################################
# States
#############################################################################

state 1
	INITIAL

	0x09 - 0x0a (2)    goto 3
	0x20               goto 3
	0x28               goto 4
	0x29               goto 5
	0x2a               goto 6
	0x2b               goto 7
	0x2d               goto 8
	0x2f               goto 9
	0x30 - 0x39 (10)   goto 10
	0x3a               goto 11
	0x3b               goto 12
	0x3d               goto 13
	0x41 - 0x5a (26)   goto 14
	0x5b               goto 15
	0x5d               goto 16
	0x61 - 0x62 (2)    goto 14
	0x63               goto 17
	0x64               goto 18
	0x65               goto 19
	0x66               goto 20
	0x67 - 0x68 (2)    goto 14
	0x69               goto 21
	0x6a - 0x72 (9)    goto 14
	0x73               goto 22
	0x74               goto 23
	0x75 - 0x76 (2)    goto 14
	0x77               goto 24
	0x78 - 0x7a (3)    goto 14
	0x7b               goto 25
	0x7d               goto 26


state 2
	^INITIAL

	0x09 - 0x0a (2)    goto 3
	0x20               goto 3
	0x28               goto 4
	0x29               goto 5
	0x2a               goto 6
	0x2b               goto 7
	0x2d               goto 8
	0x2f               goto 9
	0x30 - 0x39 (10)   goto 10
	0x3a               goto 11
	0x3b               goto 12
	0x3d               goto 13
	0x41 - 0x5a (26)   goto 14
	0x5b               goto 15
	0x5d               goto 16
	0x61 - 0x62 (2)    goto 14
	0x63               goto 17
	0x64               goto 18
	0x65               goto 19
	0x66               goto 20
	0x67 - 0x68 (2)    goto 14
	0x69               goto 21
	0x6a - 0x72 (9)    goto 14
	0x73               goto 22
	0x74               goto 23
	0x75 - 0x76 (2)    goto 14
	0x77               goto 24
	0x78 - 0x7a (3)    goto 14
	0x7b               goto 25
	0x7d               goto 26


state 3
	0x09 - 0x0a (2)    goto 3
	0x20               goto 3

	match 1


state 4
	match 14


state 5
	match 15


state 6
	match 26


state 7
	match 24


state 8
	match 25


state 9
	match 27


state 10
	0x2e               goto 27
	0x30 - 0x39 (10)   goto 10
	0x45               goto 28

	match 13


state 11
	match 20


state 12
	match 21


state 13
	0x3d               goto 29

	match 22


state 14
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 12


state 15
	match 16


state 16
	match 17


state 17
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61               goto 30
	0x62 - 0x67 (6)    goto 14
	0x68               goto 31
	0x69 - 0x7a (18)   goto 14

	match 12


state 18
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x6e (14)   goto 14
	0x6f               goto 32
	0x70 - 0x7a (11)   goto 14

	match 12


state 19
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x6b (11)   goto 14
	0x6c               goto 33
	0x6d - 0x7a (14)   goto 14

	match 12


state 20
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x6b (11)   goto 14
	0x6c               goto 34
	0x6d - 0x7a (14)   goto 14

	match 12


state 21
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x65 (5)    goto 14
	0x66               goto 35
	0x67 - 0x6d (7)    goto 14
	0x6e               goto 36
	0x6f - 0x7a (12)   goto 14

	match 12


state 22
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x76 (22)   goto 14
	0x77               goto 37
	0x78 - 0x7a (3)    goto 14

	match 12


state 23
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x67 (7)    goto 14
	0x68               goto 38
	0x69 - 0x7a (18)   goto 14

	match 12


state 24
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x67 (7)    goto 14
	0x68               goto 39
	0x69 - 0x7a (18)   goto 14

	match 12


state 25
	match 18


state 26
	match 19


state 27
	0x30 - 0x39 (10)   goto 40


state 28
	0x2b               goto 41
	0x2d               goto 41
	0x30 - 0x39 (10)   goto 42


state 29
	match 23


state 30
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x72 (18)   goto 14
	0x73               goto 43
	0x74 - 0x7a (7)    goto 14

	match 12


state 31
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61               goto 44
	0x62 - 0x7a (25)   goto 14

	match 12


state 32
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x74 (20)   goto 14
	0x75               goto 45
	0x76 - 0x7a (5)    goto 14

	match 12


state 33
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x72 (18)   goto 14
	0x73               goto 46
	0x74 - 0x7a (7)    goto 14

	match 12


state 34
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x6e (14)   goto 14
	0x6f               goto 47
	0x70 - 0x7a (11)   goto 14

	match 12


state 35
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 2


state 36
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x73 (19)   goto 14
	0x74               goto 48
	0x75 - 0x7a (6)    goto 14

	match 12


state 37
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x68 (8)    goto 14
	0x69               goto 49
	0x6a - 0x7a (17)   goto 14

	match 12


state 38
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x64 (4)    goto 14
	0x65               goto 50
	0x66 - 0x7a (21)   goto 14

	match 12


state 39
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x68 (8)    goto 14
	0x69               goto 51
	0x6a - 0x7a (17)   goto 14

	match 12


state 40
	0x30 - 0x39 (10)   goto 40
	0x45               goto 28

	match 13


state 41
	0x30 - 0x39 (10)   goto 42


state 42
	0x30 - 0x39 (10)   goto 42

	match 13


state 43
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x64 (4)    goto 14
	0x65               goto 52
	0x66 - 0x7a (21)   goto 14

	match 12


state 44
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x71 (17)   goto 14
	0x72               goto 53
	0x73 - 0x7a (8)    goto 14

	match 12


state 45
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61               goto 14
	0x62               goto 54
	0x63 - 0x7a (24)   goto 14

	match 12


state 46
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x64 (4)    goto 14
	0x65               goto 55
	0x66 - 0x7a (21)   goto 14

	match 12


state 47
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61               goto 56
	0x62 - 0x7a (25)   goto 14

	match 12


state 48
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 8


state 49
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x73 (19)   goto 14
	0x74               goto 57
	0x75 - 0x7a (6)    goto 14

	match 12


state 50
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x6d (13)   goto 14
	0x6e               goto 58
	0x6f - 0x7a (12)   goto 14

	match 12


state 51
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x6b (11)   goto 14
	0x6c               goto 59
	0x6d - 0x7a (14)   goto 14

	match 12


state 52
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 6


state 53
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 11


state 54
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x6b (11)   goto 14
	0x6c               goto 60
	0x6d - 0x7a (14)   goto 14

	match 12


state 55
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 4


state 56
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x73 (19)   goto 14
	0x74               goto 61
	0x75 - 0x7a (6)    goto 14

	match 12


state 57
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x62 (2)    goto 14
	0x63               goto 62
	0x64 - 0x7a (23)   goto 14

	match 12


state 58
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 3


state 59
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x64 (4)    goto 14
	0x65               goto 63
	0x66 - 0x7a (21)   goto 14

	match 12


state 60
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x64 (4)    goto 14
	0x65               goto 64
	0x66 - 0x7a (21)   goto 14

	match 12


state 61
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 9


state 62
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x67 (7)    goto 14
	0x68               goto 65
	0x69 - 0x7a (18)   goto 14

	match 12


state 63
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 7


state 64
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 10


state 65
	0x30 - 0x39 (10)   goto 14
	0x41 - 0x5a (26)   goto 14
	0x61 - 0x7a (26)   goto 14

	match 5


#############################################################################
# Summary
#############################################################################

1 start state(s)
27 expression(s), 65 state(s)


#############################################################################
# End of File
#############################################################################
