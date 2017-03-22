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
# mylexer.v
# Lex verbose file generated from mylexer.l.
# 
# Date: 12/06/16
# Time: 13:09:48
# 
# ALex Version: 2.07
#############################################################################


#############################################################################
# Expressions
#############################################################################

    1  [ \t]+

    2  \n

    3  "/""/"[^\n]*

    4  "/*"([^\*]|(\*)*[^\*/])*(\*)*"*/"

    5  if

    6  else

    7  while

    8  for

    9  switch

   10  case

   11  break

   12  default

   13  return

   14  int

   15  float

   16  double

   17  char

   18  bool

   19  void

   20  "("

   21  ")"

   22  "["

   23  "]"

   24  "{"

   25  "}"

   26  ":"

   27  ";"

   28  ","

   29  "="

   30  "=="

   31  "!="

   32  "<<"

   33  ">>"

   34  "&&"

   35  "||"

   36  "^"

   37  "!"

   38  "<="

   39  ">="

   40  "<"

   41  ">"

   42  "+"

   43  "-"

   44  "*"

   45  "/"

   46  [A-Za-z]([A-Za-z]|[0-9])*

   47  [0-9]+

   48  [0-9]+(\.[0-9]+)?(E[+-]?[0-9]+)?


#############################################################################
# States
#############################################################################

state 1
	INITIAL

	0x09               goto 3
	0x0a               goto 4
	0x20               goto 3
	0x21               goto 5
	0x26               goto 6
	0x28               goto 7
	0x29               goto 8
	0x2a               goto 9
	0x2b               goto 10
	0x2c               goto 11
	0x2d               goto 12
	0x2f               goto 13
	0x30 - 0x39 (10)   goto 14
	0x3a               goto 15
	0x3b               goto 16
	0x3c               goto 17
	0x3d               goto 18
	0x3e               goto 19
	0x41 - 0x5a (26)   goto 20
	0x5b               goto 21
	0x5d               goto 22
	0x5e               goto 23
	0x61               goto 20
	0x62               goto 24
	0x63               goto 25
	0x64               goto 26
	0x65               goto 27
	0x66               goto 28
	0x67 - 0x68 (2)    goto 20
	0x69               goto 29
	0x6a - 0x71 (8)    goto 20
	0x72               goto 30
	0x73               goto 31
	0x74 - 0x75 (2)    goto 20
	0x76               goto 32
	0x77               goto 33
	0x78 - 0x7a (3)    goto 20
	0x7b               goto 34
	0x7c               goto 35
	0x7d               goto 36


state 2
	^INITIAL

	0x09               goto 3
	0x0a               goto 4
	0x20               goto 3
	0x21               goto 5
	0x26               goto 6
	0x28               goto 7
	0x29               goto 8
	0x2a               goto 9
	0x2b               goto 10
	0x2c               goto 11
	0x2d               goto 12
	0x2f               goto 13
	0x30 - 0x39 (10)   goto 14
	0x3a               goto 15
	0x3b               goto 16
	0x3c               goto 17
	0x3d               goto 18
	0x3e               goto 19
	0x41 - 0x5a (26)   goto 20
	0x5b               goto 21
	0x5d               goto 22
	0x5e               goto 23
	0x61               goto 20
	0x62               goto 24
	0x63               goto 25
	0x64               goto 26
	0x65               goto 27
	0x66               goto 28
	0x67 - 0x68 (2)    goto 20
	0x69               goto 29
	0x6a - 0x71 (8)    goto 20
	0x72               goto 30
	0x73               goto 31
	0x74 - 0x75 (2)    goto 20
	0x76               goto 32
	0x77               goto 33
	0x78 - 0x7a (3)    goto 20
	0x7b               goto 34
	0x7c               goto 35
	0x7d               goto 36


state 3
	0x09               goto 3
	0x20               goto 3

	match 1


state 4
	match 2


state 5
	0x3d               goto 37

	match 37


state 6
	0x26               goto 38


state 7
	match 20


state 8
	match 21


state 9
	match 44


state 10
	match 42


state 11
	match 28


state 12
	match 43


state 13
	0x2a               goto 39
	0x2f               goto 40

	match 45


state 14
	0x2e               goto 41
	0x30 - 0x39 (10)   goto 14
	0x45               goto 42

	match 47


state 15
	match 26


state 16
	match 27


state 17
	0x3c               goto 43
	0x3d               goto 44

	match 40


state 18
	0x3d               goto 45

	match 29


state 19
	0x3d               goto 46
	0x3e               goto 47

	match 41


state 20
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 46


state 21
	match 22


state 22
	match 23


state 23
	match 36


state 24
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6e (14)   goto 20
	0x6f               goto 48
	0x70 - 0x71 (2)    goto 20
	0x72               goto 49
	0x73 - 0x7a (8)    goto 20

	match 46


state 25
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61               goto 50
	0x62 - 0x67 (6)    goto 20
	0x68               goto 51
	0x69 - 0x7a (18)   goto 20

	match 46


state 26
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x64 (4)    goto 20
	0x65               goto 52
	0x66 - 0x6e (9)    goto 20
	0x6f               goto 53
	0x70 - 0x7a (11)   goto 20

	match 46


state 27
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6b (11)   goto 20
	0x6c               goto 54
	0x6d - 0x7a (14)   goto 20

	match 46


state 28
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6b (11)   goto 20
	0x6c               goto 55
	0x6d - 0x6e (2)    goto 20
	0x6f               goto 56
	0x70 - 0x7a (11)   goto 20

	match 46


state 29
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x65 (5)    goto 20
	0x66               goto 57
	0x67 - 0x6d (7)    goto 20
	0x6e               goto 58
	0x6f - 0x7a (12)   goto 20

	match 46


state 30
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x64 (4)    goto 20
	0x65               goto 59
	0x66 - 0x7a (21)   goto 20

	match 46


state 31
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x76 (22)   goto 20
	0x77               goto 60
	0x78 - 0x7a (3)    goto 20

	match 46


state 32
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6e (14)   goto 20
	0x6f               goto 61
	0x70 - 0x7a (11)   goto 20

	match 46


state 33
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x67 (7)    goto 20
	0x68               goto 62
	0x69 - 0x7a (18)   goto 20

	match 46


state 34
	match 24


state 35
	0x7c               goto 63


state 36
	match 25


state 37
	match 31


state 38
	match 34


state 39
	0x00 - 0x29 (42)   goto 39
	0x2a               goto 64
	0x2b - 0x2e (4)    goto 39
	0x2f               goto 39
	0x30 - 0xff (208)  goto 39


state 40
	0x00 - 0x09 (10)   goto 40
	0x0b - 0xff (245)  goto 40

	match 3


state 41
	0x30 - 0x39 (10)   goto 65


state 42
	0x2b               goto 66
	0x2d               goto 66
	0x30 - 0x39 (10)   goto 67


state 43
	match 32


state 44
	match 38


state 45
	match 30


state 46
	match 39


state 47
	match 33


state 48
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6e (14)   goto 20
	0x6f               goto 68
	0x70 - 0x7a (11)   goto 20

	match 46


state 49
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x64 (4)    goto 20
	0x65               goto 69
	0x66 - 0x7a (21)   goto 20

	match 46


state 50
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x72 (18)   goto 20
	0x73               goto 70
	0x74 - 0x7a (7)    goto 20

	match 46


state 51
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61               goto 71
	0x62 - 0x7a (25)   goto 20

	match 46


state 52
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x65 (5)    goto 20
	0x66               goto 72
	0x67 - 0x7a (20)   goto 20

	match 46


state 53
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x74 (20)   goto 20
	0x75               goto 73
	0x76 - 0x7a (5)    goto 20

	match 46


state 54
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x72 (18)   goto 20
	0x73               goto 74
	0x74 - 0x7a (7)    goto 20

	match 46


state 55
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6e (14)   goto 20
	0x6f               goto 75
	0x70 - 0x7a (11)   goto 20

	match 46


state 56
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x71 (17)   goto 20
	0x72               goto 76
	0x73 - 0x7a (8)    goto 20

	match 46


state 57
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 5


state 58
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x73 (19)   goto 20
	0x74               goto 77
	0x75 - 0x7a (6)    goto 20

	match 46


state 59
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x73 (19)   goto 20
	0x74               goto 78
	0x75 - 0x7a (6)    goto 20

	match 46


state 60
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x68 (8)    goto 20
	0x69               goto 79
	0x6a - 0x7a (17)   goto 20

	match 46


state 61
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x68 (8)    goto 20
	0x69               goto 80
	0x6a - 0x7a (17)   goto 20

	match 46


state 62
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x68 (8)    goto 20
	0x69               goto 81
	0x6a - 0x7a (17)   goto 20

	match 46


state 63
	match 35


state 64
	0x00 - 0x29 (42)   goto 39
	0x2a               goto 64
	0x2b - 0x2e (4)    goto 39
	0x2f               goto 82
	0x30 - 0xff (208)  goto 39


state 65
	0x30 - 0x39 (10)   goto 65
	0x45               goto 42

	match 48


state 66
	0x30 - 0x39 (10)   goto 67


state 67
	0x30 - 0x39 (10)   goto 67

	match 48


state 68
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6b (11)   goto 20
	0x6c               goto 83
	0x6d - 0x7a (14)   goto 20

	match 46


state 69
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61               goto 84
	0x62 - 0x7a (25)   goto 20

	match 46


state 70
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x64 (4)    goto 20
	0x65               goto 85
	0x66 - 0x7a (21)   goto 20

	match 46


state 71
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x71 (17)   goto 20
	0x72               goto 86
	0x73 - 0x7a (8)    goto 20

	match 46


state 72
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61               goto 87
	0x62 - 0x7a (25)   goto 20

	match 46


state 73
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61               goto 20
	0x62               goto 88
	0x63 - 0x7a (24)   goto 20

	match 46


state 74
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x64 (4)    goto 20
	0x65               goto 89
	0x66 - 0x7a (21)   goto 20

	match 46


state 75
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61               goto 90
	0x62 - 0x7a (25)   goto 20

	match 46


state 76
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 8


state 77
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 14


state 78
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x74 (20)   goto 20
	0x75               goto 91
	0x76 - 0x7a (5)    goto 20

	match 46


state 79
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x73 (19)   goto 20
	0x74               goto 92
	0x75 - 0x7a (6)    goto 20

	match 46


state 80
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x63 (3)    goto 20
	0x64               goto 93
	0x65 - 0x7a (22)   goto 20

	match 46


state 81
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6b (11)   goto 20
	0x6c               goto 94
	0x6d - 0x7a (14)   goto 20

	match 46


state 82
	match 4


state 83
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 18


state 84
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6a (10)   goto 20
	0x6b               goto 95
	0x6c - 0x7a (15)   goto 20

	match 46


state 85
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 10


state 86
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 17


state 87
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x74 (20)   goto 20
	0x75               goto 96
	0x76 - 0x7a (5)    goto 20

	match 46


state 88
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6b (11)   goto 20
	0x6c               goto 97
	0x6d - 0x7a (14)   goto 20

	match 46


state 89
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 6


state 90
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x73 (19)   goto 20
	0x74               goto 98
	0x75 - 0x7a (6)    goto 20

	match 46


state 91
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x71 (17)   goto 20
	0x72               goto 99
	0x73 - 0x7a (8)    goto 20

	match 46


state 92
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x62 (2)    goto 20
	0x63               goto 100
	0x64 - 0x7a (23)   goto 20

	match 46


state 93
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 19


state 94
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x64 (4)    goto 20
	0x65               goto 101
	0x66 - 0x7a (21)   goto 20

	match 46


state 95
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 11


state 96
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6b (11)   goto 20
	0x6c               goto 102
	0x6d - 0x7a (14)   goto 20

	match 46


state 97
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x64 (4)    goto 20
	0x65               goto 103
	0x66 - 0x7a (21)   goto 20

	match 46


state 98
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 15


state 99
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x6d (13)   goto 20
	0x6e               goto 104
	0x6f - 0x7a (12)   goto 20

	match 46


state 100
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x67 (7)    goto 20
	0x68               goto 105
	0x69 - 0x7a (18)   goto 20

	match 46


state 101
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 7


state 102
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x73 (19)   goto 20
	0x74               goto 106
	0x75 - 0x7a (6)    goto 20

	match 46


state 103
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 16


state 104
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 13


state 105
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 9


state 106
	0x30 - 0x39 (10)   goto 20
	0x41 - 0x5a (26)   goto 20
	0x61 - 0x7a (26)   goto 20

	match 12


#############################################################################
# Summary
#############################################################################

1 start state(s)
48 expression(s), 106 state(s)


#############################################################################
# End of File
#############################################################################
