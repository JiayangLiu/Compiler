/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 50 of your 30 day trial period.
* 
* This file was produced by an UNREGISTERED COPY of Parser Generator. It is
* for evaluation purposes only. If you continue to use Parser Generator 30
* days after installation then you are required to purchase a license. For
* more information see the online help or go to the Bumble-Bee Software
* homepage at:
* 
* http://www.bumblebeesoftware.com
* 
* This notice must remain present in the file. It cannot be removed.
****************************************************************************/

/****************************************************************************
* mylexer.c
* C source file generated from mylexer.l.
* 
* Date: 12/06/16
* Time: 13:09:48
* 
* ALex Version: 2.07
****************************************************************************/

#include <yylex.h>

/* namespaces */
#if defined(__cplusplus) && defined(YYSTDCPPLIB)
using namespace std;
#endif
#if defined(__cplusplus) && defined(YYNAMESPACE)
using namespace yl;
#endif

#define YYFASTLEXER

#line 1 ".\\mylexer.l"

/****************************************************************************
mylexer.l
ParserWizard generated Lex file.

Date: 2016Äê11ÔÂ24ÈÕ
****************************************************************************/

#include "myparser.h"
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "tree.h"

int line = 1;
TreeNode* yylval;


#line 60 "mylexer.c"
/* repeated because of possible precompiled header */
#include <yylex.h>

/* namespaces */
#if defined(__cplusplus) && defined(YYSTDCPPLIB)
using namespace std;
#endif
#if defined(__cplusplus) && defined(YYNAMESPACE)
using namespace yl;
#endif

#define YYFASTLEXER

#include ".\mylexer.h"

#ifndef YYTEXT_SIZE
#define YYTEXT_SIZE 100
#endif
#ifndef YYUNPUT_SIZE
#define YYUNPUT_SIZE YYTEXT_SIZE
#endif
#ifndef YYTEXT_MAX
#define YYTEXT_MAX 0
#endif
#ifndef YYUNPUT_MAX
#define YYUNPUT_MAX YYTEXT_MAX
#endif

/* yytext */
static char YYNEAR yysatext[(YYTEXT_SIZE) + 1];		/* extra char for \0 */
char YYFAR *YYNEAR YYDCDECL yystext = yysatext;
char YYFAR *YYNEAR YYDCDECL yytext = yysatext;
int YYNEAR YYDCDECL yystext_size = (YYTEXT_SIZE);
int YYNEAR YYDCDECL yytext_size = (YYTEXT_SIZE);
int YYNEAR YYDCDECL yytext_max = (YYTEXT_MAX);

/* yystatebuf */
#if (YYTEXT_SIZE) != 0
static int YYNEAR yysastatebuf[(YYTEXT_SIZE)];
int YYFAR *YYNEAR YYDCDECL yysstatebuf = yysastatebuf;
int YYFAR *YYNEAR YYDCDECL yystatebuf = yysastatebuf;
#else
int YYFAR *YYNEAR YYDCDECL yysstatebuf = NULL;
int YYFAR *YYNEAR YYDCDECL yystatebuf = NULL;
#endif

/* yyunputbuf */
#if (YYUNPUT_SIZE) != 0
static int YYNEAR yysaunputbuf[(YYUNPUT_SIZE)];
int YYFAR *YYNEAR YYDCDECL yysunputbufptr = yysaunputbuf;
int YYFAR *YYNEAR YYDCDECL yyunputbufptr = yysaunputbuf;
#else
int YYFAR *YYNEAR YYDCDECL yysunputbufptr = NULL;
int YYFAR *YYNEAR YYDCDECL yyunputbufptr = NULL;
#endif
int YYNEAR YYDCDECL yysunput_size = (YYUNPUT_SIZE);
int YYNEAR YYDCDECL yyunput_size = (YYUNPUT_SIZE);
int YYNEAR YYDCDECL yyunput_max = (YYUNPUT_MAX);

/* backwards compatability with lex */
#ifdef input
#ifdef YYPROTOTYPE
int YYCDECL yyinput(void)
#else
int YYCDECL yyinput()
#endif
{
	return input();
}
#else
#define input yyinput
#endif

#ifdef output
#ifdef YYPROTOTYPE
void YYCDECL yyoutput(int ch)
#else
void YYCDECL yyoutput(ch)
int ch;
#endif
{
	output(ch);
}
#else
#define output yyoutput
#endif

#ifdef unput
#ifdef YYPROTOTYPE
void YYCDECL yyunput(int ch)
#else
void YYCDECL yyunput(ch)
int ch;
#endif
{
	unput(ch);
}
#else
#define unput yyunput
#endif

#ifndef YYNBORLANDWARN
#ifdef __BORLANDC__
#pragma warn -rch		/* <warning: unreachable code> off */
#endif
#endif

#ifdef YYPROTOTYPE
int YYCDECL yylexeraction(int action)
#else
int YYCDECL yylexeraction(action)
int action;
#endif
{
	yyreturnflg = YYTRUE;
	switch (action) {
	case 1:
		{
#line 37 ".\\mylexer.l"
 /*no action and no return*/ 
#line 181 "mylexer.c"
		}
		break;
	case 2:
		{
#line 38 ".\\mylexer.l"
 line++; 
#line 188 "mylexer.c"
		}
		break;
	case 3:
		{
#line 39 ".\\mylexer.l"
 /*no action and no return*/ 
#line 195 "mylexer.c"
		}
		break;
	case 4:
		{
#line 40 ".\\mylexer.l"
 /*no action and no return*/ 
#line 202 "mylexer.c"
		}
		break;
	case 5:
		{
#line 42 ".\\mylexer.l"
 return IF; 
#line 209 "mylexer.c"
		}
		break;
	case 6:
		{
#line 43 ".\\mylexer.l"
 return ELSE; 
#line 216 "mylexer.c"
		}
		break;
	case 7:
		{
#line 44 ".\\mylexer.l"
 return WHILE; 
#line 223 "mylexer.c"
		}
		break;
	case 8:
		{
#line 45 ".\\mylexer.l"
 return FOR; 
#line 230 "mylexer.c"
		}
		break;
	case 9:
		{
#line 46 ".\\mylexer.l"
 return SWITCH; 
#line 237 "mylexer.c"
		}
		break;
	case 10:
		{
#line 47 ".\\mylexer.l"
 return CASE; 
#line 244 "mylexer.c"
		}
		break;
	case 11:
		{
#line 48 ".\\mylexer.l"
 return BREAK; 
#line 251 "mylexer.c"
		}
		break;
	case 12:
		{
#line 49 ".\\mylexer.l"
 return DEFAULT; 
#line 258 "mylexer.c"
		}
		break;
	case 13:
		{
#line 50 ".\\mylexer.l"
 return RETURN; 
#line 265 "mylexer.c"
		}
		break;
	case 14:
		{
#line 52 ".\\mylexer.l"
 return INT; 
#line 272 "mylexer.c"
		}
		break;
	case 15:
		{
#line 53 ".\\mylexer.l"
 return FLOAT; 
#line 279 "mylexer.c"
		}
		break;
	case 16:
		{
#line 54 ".\\mylexer.l"
 return DOUBLE; 
#line 286 "mylexer.c"
		}
		break;
	case 17:
		{
#line 55 ".\\mylexer.l"
 return CHAR; 
#line 293 "mylexer.c"
		}
		break;
	case 18:
		{
#line 56 ".\\mylexer.l"
 return BOOL; 
#line 300 "mylexer.c"
		}
		break;
	case 19:
		{
#line 57 ".\\mylexer.l"
 return VOID; 
#line 307 "mylexer.c"
		}
		break;
	case 20:
		{
#line 59 ".\\mylexer.l"
 return LP; 
#line 314 "mylexer.c"
		}
		break;
	case 21:
		{
#line 60 ".\\mylexer.l"
 return RP; 
#line 321 "mylexer.c"
		}
		break;
	case 22:
		{
#line 61 ".\\mylexer.l"
 return LS; 
#line 328 "mylexer.c"
		}
		break;
	case 23:
		{
#line 62 ".\\mylexer.l"
 return RS; 
#line 335 "mylexer.c"
		}
		break;
	case 24:
		{
#line 63 ".\\mylexer.l"
 return LB; 
#line 342 "mylexer.c"
		}
		break;
	case 25:
		{
#line 64 ".\\mylexer.l"
 return RB; 
#line 349 "mylexer.c"
		}
		break;
	case 26:
		{
#line 65 ".\\mylexer.l"
 return COLON; 
#line 356 "mylexer.c"
		}
		break;
	case 27:
		{
#line 66 ".\\mylexer.l"
 return SEMICOLON; 
#line 363 "mylexer.c"
		}
		break;
	case 28:
		{
#line 67 ".\\mylexer.l"
 return COMMA; 
#line 370 "mylexer.c"
		}
		break;
	case 29:
		{
#line 68 ".\\mylexer.l"
 return ASSIGN; 
#line 377 "mylexer.c"
		}
		break;
	case 30:
		{
#line 69 ".\\mylexer.l"
 return EQ; 
#line 384 "mylexer.c"
		}
		break;
	case 31:
		{
#line 70 ".\\mylexer.l"
 return NE; 
#line 391 "mylexer.c"
		}
		break;
	case 32:
		{
#line 71 ".\\mylexer.l"
 return L_SHIFT; 
#line 398 "mylexer.c"
		}
		break;
	case 33:
		{
#line 72 ".\\mylexer.l"
 return R_SHIFT; 
#line 405 "mylexer.c"
		}
		break;
	case 34:
		{
#line 73 ".\\mylexer.l"
 return AND; 
#line 412 "mylexer.c"
		}
		break;
	case 35:
		{
#line 74 ".\\mylexer.l"
 return OR; 
#line 419 "mylexer.c"
		}
		break;
	case 36:
		{
#line 75 ".\\mylexer.l"
 return XOR; 
#line 426 "mylexer.c"
		}
		break;
	case 37:
		{
#line 76 ".\\mylexer.l"
 return NOT; 
#line 433 "mylexer.c"
		}
		break;
	case 38:
		{
#line 77 ".\\mylexer.l"
 return LE; 
#line 440 "mylexer.c"
		}
		break;
	case 39:
		{
#line 78 ".\\mylexer.l"
 return GE; 
#line 447 "mylexer.c"
		}
		break;
	case 40:
		{
#line 79 ".\\mylexer.l"
 return LT; 
#line 454 "mylexer.c"
		}
		break;
	case 41:
		{
#line 80 ".\\mylexer.l"
 return GT; 
#line 461 "mylexer.c"
		}
		break;
	case 42:
		{
#line 81 ".\\mylexer.l"
 return ADD; 
#line 468 "mylexer.c"
		}
		break;
	case 43:
		{
#line 82 ".\\mylexer.l"
 return SUB; 
#line 475 "mylexer.c"
		}
		break;
	case 44:
		{
#line 83 ".\\mylexer.l"
 return MUL; 
#line 482 "mylexer.c"
		}
		break;
	case 45:
		{
#line 84 ".\\mylexer.l"
 return DIV; 
#line 489 "mylexer.c"
		}
		break;
	case 46:
		{
#line 89 ".\\mylexer.l"
	yylval = (TreeNode*) malloc(sizeof(TreeNode)); 
			int i = 0;
			char* content = malloc(0);
			for (i=0; i<yyleng; i++) { content[i]=yytext[i]; } content[i] = '\0';
			yylval->attr.name = content; 
			return ID;
		
#line 502 "mylexer.c"
		}
		break;
	case 47:
		{
#line 96 ".\\mylexer.l"
	yylval = (TreeNode*) malloc(sizeof(TreeNode));
					int i = 0;
					char* content = malloc(0);
					for (i=0; i<yyleng; i++) { content[i]=yytext[i]; } 
					content[i] = '\0';
					yylval->attr.name = content; 
					return NUM_Int;
				
#line 516 "mylexer.c"
		}
		break;
	case 48:
		{
#line 104 ".\\mylexer.l"
	yylval = (TreeNode*) malloc(sizeof(TreeNode));
					int i = 0;
					char* content = malloc(0);
					for (i=0; i<yyleng; i++) { content[i]=yytext[i]; } 
					content[i] = '\0';
					yylval->attr.name = content; 
					return NUM_Double;
				
#line 530 "mylexer.c"
		}
		break;
	default:
		yyassert(0);
		break;
	}
	yyreturnflg = YYFALSE;
	return 0;
}

#ifndef YYNBORLANDWARN
#ifdef __BORLANDC__
#pragma warn .rch		/* <warning: unreachable code> to the old state */
#endif
#endif
YYCONST yymatch_t YYNEARFAR YYBASED_CODE YYDCDECL yymatch[] = {
	0
};

int YYNEAR YYDCDECL yytransitionmax = 210;
YYCONST yytransition_t YYNEARFAR YYBASED_CODE YYDCDECL yytransition[] = {
	{ 0, 0 },
	{ 3, 1 },
	{ 4, 1 },
	{ 3, 3 },
	{ 43, 17 },
	{ 44, 17 },
	{ 65, 65 },
	{ 65, 65 },
	{ 65, 65 },
	{ 65, 65 },
	{ 65, 65 },
	{ 65, 65 },
	{ 65, 65 },
	{ 65, 65 },
	{ 65, 65 },
	{ 65, 65 },
	{ 50, 25 },
	{ 64, 64 },
	{ 52, 26 },
	{ 46, 19 },
	{ 47, 19 },
	{ 57, 29 },
	{ 82, 64 },
	{ 51, 25 },
	{ 3, 1 },
	{ 5, 1 },
	{ 3, 3 },
	{ 42, 65 },
	{ 53, 26 },
	{ 58, 29 },
	{ 6, 1 },
	{ 60, 31 },
	{ 7, 1 },
	{ 8, 1 },
	{ 9, 1 },
	{ 10, 1 },
	{ 11, 1 },
	{ 12, 1 },
	{ 61, 32 },
	{ 13, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 14, 1 },
	{ 15, 1 },
	{ 16, 1 },
	{ 17, 1 },
	{ 18, 1 },
	{ 19, 1 },
	{ 41, 14 },
	{ 62, 33 },
	{ 14, 14 },
	{ 14, 14 },
	{ 14, 14 },
	{ 14, 14 },
	{ 14, 14 },
	{ 14, 14 },
	{ 14, 14 },
	{ 14, 14 },
	{ 14, 14 },
	{ 14, 14 },
	{ 67, 67 },
	{ 67, 67 },
	{ 67, 67 },
	{ 67, 67 },
	{ 67, 67 },
	{ 67, 67 },
	{ 67, 67 },
	{ 67, 67 },
	{ 67, 67 },
	{ 67, 67 },
	{ 39, 13 },
	{ 55, 28 },
	{ 63, 35 },
	{ 64, 39 },
	{ 56, 28 },
	{ 40, 13 },
	{ 21, 1 },
	{ 48, 24 },
	{ 22, 1 },
	{ 23, 1 },
	{ 49, 24 },
	{ 0, 40 },
	{ 0, 41 },
	{ 24, 1 },
	{ 25, 1 },
	{ 26, 1 },
	{ 27, 1 },
	{ 28, 1 },
	{ 38, 6 },
	{ 66, 42 },
	{ 29, 1 },
	{ 66, 42 },
	{ 68, 48 },
	{ 69, 49 },
	{ 70, 50 },
	{ 71, 51 },
	{ 72, 52 },
	{ 73, 53 },
	{ 74, 54 },
	{ 30, 1 },
	{ 31, 1 },
	{ 75, 55 },
	{ 76, 56 },
	{ 32, 1 },
	{ 33, 1 },
	{ 77, 58 },
	{ 78, 59 },
	{ 79, 60 },
	{ 34, 1 },
	{ 35, 1 },
	{ 36, 1 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 80, 61 },
	{ 81, 62 },
	{ 54, 27 },
	{ 37, 5 },
	{ 45, 18 },
	{ 83, 68 },
	{ 84, 69 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 85, 70 },
	{ 86, 71 },
	{ 87, 72 },
	{ 88, 73 },
	{ 89, 74 },
	{ 90, 75 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 20, 106 },
	{ 91, 78 },
	{ 92, 79 },
	{ 93, 80 },
	{ 94, 81 },
	{ 95, 84 },
	{ 96, 87 },
	{ 97, 88 },
	{ 98, 90 },
	{ 99, 91 },
	{ 100, 92 },
	{ 101, 94 },
	{ 102, 96 },
	{ 103, 97 },
	{ 104, 99 },
	{ 105, 100 },
	{ 106, 102 },
	{ 59, 30 }
};

YYCONST yystate_t YYNEARFAR YYBASED_CODE YYDCDECL yystate[] = {
	{ 0, 0, 0 },
	{ 106, -8, 0 },
	{ 1, 0, 0 },
	{ 0, -6, 1 },
	{ 0, 0, 2 },
	{ 0, 70, 37 },
	{ 0, 57, 0 },
	{ 0, 0, 20 },
	{ 0, 0, 21 },
	{ 0, 0, 44 },
	{ 0, 0, 42 },
	{ 0, 0, 28 },
	{ 0, 0, 43 },
	{ 0, 35, 45 },
	{ 65, 9, 47 },
	{ 0, 0, 26 },
	{ 0, 0, 27 },
	{ 0, -56, 40 },
	{ 0, 71, 29 },
	{ 0, -42, 41 },
	{ 106, 0, 46 },
	{ 0, 0, 22 },
	{ 0, 0, 23 },
	{ 0, 0, 36 },
	{ 106, -27, 46 },
	{ 106, -81, 46 },
	{ 106, -83, 46 },
	{ 106, 22, 46 },
	{ 106, -30, 46 },
	{ 106, -81, 46 },
	{ 106, 108, 46 },
	{ 106, -88, 46 },
	{ 106, -73, 46 },
	{ 106, -48, 46 },
	{ 0, 0, 24 },
	{ 0, -45, 0 },
	{ 0, 0, 25 },
	{ 0, 0, 31 },
	{ 0, 0, 34 },
	{ -39, 38, 0 },
	{ -40, 78, 3 },
	{ 65, 20, 0 },
	{ 67, 53, 0 },
	{ 0, 0, 32 },
	{ 0, 0, 38 },
	{ 0, 0, 30 },
	{ 0, 0, 39 },
	{ 0, 0, 33 },
	{ 106, -12, 46 },
	{ 106, -1, 46 },
	{ 106, -14, 46 },
	{ 106, 5, 46 },
	{ 106, 1, 46 },
	{ 106, -13, 46 },
	{ 106, -10, 46 },
	{ 106, -3, 46 },
	{ 106, -5, 46 },
	{ 106, 0, 5 },
	{ 106, -4, 46 },
	{ 106, -3, 46 },
	{ 106, 9, 46 },
	{ 106, 23, 46 },
	{ 106, 24, 46 },
	{ 0, 0, 35 },
	{ -39, -25, 0 },
	{ 0, -42, 48 },
	{ 67, 0, 0 },
	{ 0, 19, 48 },
	{ 106, 25, 46 },
	{ 106, 37, 46 },
	{ 106, 60, 46 },
	{ 106, 48, 46 },
	{ 106, 66, 46 },
	{ 106, 66, 46 },
	{ 106, 64, 46 },
	{ 106, 69, 46 },
	{ 106, 0, 8 },
	{ 106, 0, 14 },
	{ 106, 76, 46 },
	{ 106, 78, 46 },
	{ 106, 95, 46 },
	{ 106, 88, 46 },
	{ 0, 0, 4 },
	{ 106, 0, 18 },
	{ 106, 90, 46 },
	{ 106, 0, 10 },
	{ 106, 0, 17 },
	{ 106, 81, 46 },
	{ 106, 91, 46 },
	{ 106, 0, 6 },
	{ 106, 84, 46 },
	{ 106, 87, 46 },
	{ 106, 103, 46 },
	{ 106, 0, 19 },
	{ 106, 102, 46 },
	{ 106, 0, 11 },
	{ 106, 96, 46 },
	{ 106, 104, 46 },
	{ 106, 0, 15 },
	{ 106, 96, 46 },
	{ 106, 103, 46 },
	{ 106, 0, 7 },
	{ 106, 92, 46 },
	{ 106, 0, 16 },
	{ 106, 0, 13 },
	{ 106, 0, 9 },
	{ 0, 70, 12 }
};

YYCONST yybackup_t YYNEARFAR YYBASED_CODE YYDCDECL yybackup[] = {
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
};

#line 113 ".\\mylexer.l"


/////////////////////////////////////////////////////////////////////////////
// programs section
int yywrap(void)
{
	return 1;
}
