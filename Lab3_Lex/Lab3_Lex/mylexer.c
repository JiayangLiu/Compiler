/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 21 of your 30 day trial period.
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
* Date: 11/07/16
* Time: 11:50:00
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

Date: 2016年11月2日
****************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <windows.h>

int yylval;
// int LOOKUP = -1;
int LOCATION = -1;
// int mode;

struct word{	//为符号表定义指针变量，记录符号名
	char *word_name;
	int location;
    struct word *next;
} *word_list; 
   
extern void *malloc();

int installID();
int installNum();


#line 72 "mylexer.c"
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
#line 46 ".\\mylexer.l"
 /*no action and no return*/ 
#line 193 "mylexer.c"
		}
		break;
	case 2:
		{
#line 48 ".\\mylexer.l"
 printf("IF\t\t %s\n", yytext); 
#line 200 "mylexer.c"
		}
		break;
	case 3:
		{
#line 49 ".\\mylexer.l"
 printf("THEN\t\t %s\n", yytext); 
#line 207 "mylexer.c"
		}
		break;
	case 4:
		{
#line 50 ".\\mylexer.l"
 printf("ELSE\t\t %s\n", yytext); 
#line 214 "mylexer.c"
		}
		break;
	case 5:
		{
#line 51 ".\\mylexer.l"
 printf("SWITCH\t\t %s\n", yytext); 
#line 221 "mylexer.c"
		}
		break;
	case 6:
		{
#line 52 ".\\mylexer.l"
 printf("CASE\t\t %s\n", yytext); 
#line 228 "mylexer.c"
		}
		break;
	case 7:
		{
#line 53 ".\\mylexer.l"
 printf("WHILE\t\t %s\n", yytext); 
#line 235 "mylexer.c"
		}
		break;
	case 8:
		{
#line 55 ".\\mylexer.l"
 printf("INT\t\t %s\n", yytext); 
#line 242 "mylexer.c"
		}
		break;
	case 9:
		{
#line 56 ".\\mylexer.l"
 printf("FLOAT\t\t %s\n", yytext); 
#line 249 "mylexer.c"
		}
		break;
	case 10:
		{
#line 57 ".\\mylexer.l"
 printf("DOUBLE\t\t %s\n", yytext); 
#line 256 "mylexer.c"
		}
		break;
	case 11:
		{
#line 58 ".\\mylexer.l"
 printf("CHAR\t\t %s\n", yytext); 
#line 263 "mylexer.c"
		}
		break;
	case 12:
		{
#line 60 ".\\mylexer.l"
 yylval=(int)installID(); printf("ID\t\t %s\t %d\t\n", yytext, yylval); 
#line 270 "mylexer.c"
		}
		break;
	case 13:
		{
#line 61 ".\\mylexer.l"
 yylval=(int)installNum(); yylval=yytext; printf("NUMBER\t\t %s\t %s\t\n", yytext, yylval); 
#line 277 "mylexer.c"
		}
		break;
	case 14:
		{
#line 63 ".\\mylexer.l"
 printf("LPAREN\t\t %s\n", yytext); 
#line 284 "mylexer.c"
		}
		break;
	case 15:
		{
#line 64 ".\\mylexer.l"
 printf("RPAREN\t\t %s\n", yytext); 
#line 291 "mylexer.c"
		}
		break;
	case 16:
		{
#line 65 ".\\mylexer.l"
 printf("LSQUAR\t\t %s\n", yytext); 
#line 298 "mylexer.c"
		}
		break;
	case 17:
		{
#line 66 ".\\mylexer.l"
 printf("RSQUAR\t\t %s\n", yytext); 
#line 305 "mylexer.c"
		}
		break;
	case 18:
		{
#line 67 ".\\mylexer.l"
 printf("LBRACE\t\t %s\n", yytext); 
#line 312 "mylexer.c"
		}
		break;
	case 19:
		{
#line 68 ".\\mylexer.l"
 printf("RBRACE\t\t %s\n", yytext); 
#line 319 "mylexer.c"
		}
		break;
	case 20:
		{
#line 69 ".\\mylexer.l"
 printf("COLON\t\t %s\n", yytext); 
#line 326 "mylexer.c"
		}
		break;
	case 21:
		{
#line 70 ".\\mylexer.l"
 printf("SEMICOLON\t %s\n", yytext); 
#line 333 "mylexer.c"
		}
		break;
	case 22:
		{
#line 71 ".\\mylexer.l"
 printf("ASSIGN\t\t %s\n", yytext); 
#line 340 "mylexer.c"
		}
		break;
	case 23:
		{
#line 72 ".\\mylexer.l"
 printf("EQUAL\t\t %s\n", yytext); 
#line 347 "mylexer.c"
		}
		break;
	case 24:
		{
#line 73 ".\\mylexer.l"
 printf("PLUS\t\t %s\n", yytext); 
#line 354 "mylexer.c"
		}
		break;
	case 25:
		{
#line 74 ".\\mylexer.l"
 printf("SUB\t\t %s\n", yytext); 
#line 361 "mylexer.c"
		}
		break;
	case 26:
		{
#line 75 ".\\mylexer.l"
 printf("MUL\t\t %s\n", yytext); 
#line 368 "mylexer.c"
		}
		break;
	case 27:
		{
#line 76 ".\\mylexer.l"
 printf("DIV\t\t %s\n", yytext); 
#line 375 "mylexer.c"
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

int YYNEAR YYDCDECL yytransitionmax = 193;
YYCONST yytransition_t YYNEARFAR YYBASED_CODE YYDCDECL yytransition[] = {
	{ 0, 0 },
	{ 3, 1 },
	{ 3, 1 },
	{ 3, 3 },
	{ 3, 3 },
	{ 37, 22 },
	{ 40, 40 },
	{ 40, 40 },
	{ 40, 40 },
	{ 40, 40 },
	{ 40, 40 },
	{ 40, 40 },
	{ 40, 40 },
	{ 40, 40 },
	{ 40, 40 },
	{ 40, 40 },
	{ 30, 17 },
	{ 35, 21 },
	{ 41, 28 },
	{ 38, 23 },
	{ 41, 28 },
	{ 39, 24 },
	{ 0, 27 },
	{ 31, 17 },
	{ 3, 1 },
	{ 36, 21 },
	{ 3, 3 },
	{ 28, 40 },
	{ 32, 18 },
	{ 43, 30 },
	{ 44, 31 },
	{ 45, 32 },
	{ 4, 1 },
	{ 5, 1 },
	{ 6, 1 },
	{ 7, 1 },
	{ 46, 33 },
	{ 8, 1 },
	{ 47, 34 },
	{ 9, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 10, 1 },
	{ 11, 1 },
	{ 12, 1 },
	{ 27, 10 },
	{ 13, 1 },
	{ 10, 10 },
	{ 10, 10 },
	{ 10, 10 },
	{ 10, 10 },
	{ 10, 10 },
	{ 10, 10 },
	{ 10, 10 },
	{ 10, 10 },
	{ 10, 10 },
	{ 10, 10 },
	{ 42, 42 },
	{ 42, 42 },
	{ 42, 42 },
	{ 42, 42 },
	{ 42, 42 },
	{ 42, 42 },
	{ 42, 42 },
	{ 42, 42 },
	{ 42, 42 },
	{ 42, 42 },
	{ 48, 36 },
	{ 49, 37 },
	{ 50, 38 },
	{ 51, 39 },
	{ 33, 19 },
	{ 34, 20 },
	{ 52, 43 },
	{ 53, 44 },
	{ 54, 45 },
	{ 15, 1 },
	{ 55, 46 },
	{ 16, 1 },
	{ 56, 47 },
	{ 57, 49 },
	{ 58, 50 },
	{ 59, 51 },
	{ 60, 54 },
	{ 17, 1 },
	{ 18, 1 },
	{ 19, 1 },
	{ 20, 1 },
	{ 61, 56 },
	{ 62, 57 },
	{ 21, 1 },
	{ 63, 59 },
	{ 64, 60 },
	{ 65, 62 },
	{ 29, 13 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 22, 1 },
	{ 23, 1 },
	{ 0, 0 },
	{ 0, 0 },
	{ 24, 1 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 25, 1 },
	{ 0, 0 },
	{ 26, 1 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 },
	{ 14, 65 }
};

YYCONST yystate_t YYNEARFAR YYBASED_CODE YYDCDECL yystate[] = {
	{ 0, 0, 0 },
	{ 65, -8, 0 },
	{ 1, 0, 0 },
	{ 0, -6, 1 },
	{ 0, 0, 14 },
	{ 0, 0, 15 },
	{ 0, 0, 26 },
	{ 0, 0, 24 },
	{ 0, 0, 25 },
	{ 0, 0, 27 },
	{ 40, 6, 13 },
	{ 0, 0, 20 },
	{ 0, 0, 21 },
	{ 0, 40, 22 },
	{ 65, 0, 12 },
	{ 0, 0, 16 },
	{ 0, 0, 17 },
	{ 65, -81, 12 },
	{ 65, -83, 12 },
	{ 65, -30, 12 },
	{ 65, -29, 12 },
	{ 65, -85, 12 },
	{ 65, -114, 12 },
	{ 65, -85, 12 },
	{ 65, -83, 12 },
	{ 0, 0, 18 },
	{ 0, 0, 19 },
	{ 40, -47, 0 },
	{ 42, -25, 0 },
	{ 0, 0, 23 },
	{ 65, -86, 12 },
	{ 65, -67, 12 },
	{ 65, -86, 12 },
	{ 65, -79, 12 },
	{ 65, -73, 12 },
	{ 65, 0, 2 },
	{ 65, -42, 12 },
	{ 65, -30, 12 },
	{ 65, -25, 12 },
	{ 65, -28, 12 },
	{ 0, -42, 13 },
	{ 42, 0, 0 },
	{ 0, 16, 13 },
	{ 65, -21, 12 },
	{ 65, -33, 12 },
	{ 65, -16, 12 },
	{ 65, -17, 12 },
	{ 65, -11, 12 },
	{ 65, 0, 8 },
	{ 65, -29, 12 },
	{ 65, -22, 12 },
	{ 65, -19, 12 },
	{ 65, 0, 6 },
	{ 65, 0, 11 },
	{ 65, -18, 12 },
	{ 65, 0, 4 },
	{ 65, -21, 12 },
	{ 65, -3, 12 },
	{ 65, 0, 3 },
	{ 65, -3, 12 },
	{ 65, -2, 12 },
	{ 65, 0, 9 },
	{ 65, -4, 12 },
	{ 65, 0, 7 },
	{ 65, 0, 10 },
	{ 0, 70, 5 }
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
	0
};

#line 78 ".\\mylexer.l"


/////////////////////////////////////////////////////////////////////////////
// programs section

int main(void)
{
    char* filename;	// 打开要读取的文本文件  
	filename = (char*)malloc(40);
	printf("Please input the file name: ");
	scanf("%s", filename);
    freopen(filename, "r", yyin);

  	printf("单词\t\t 词素\t 属性\n");
	yylex();
	
	fclose(yyin);
	free(filename);
	
	// getch();
    // system("pause");
    
    return 0;
}

// 当词法分析程序遇到文件结尾时，它调用例程yywrap()来找出下一步要做什么
// 如果返回0，扫描程序继续扫描
// 如果返回1，扫描程序停止解析
int yywrap(void)
{
	return 1;
}

int installID()
{
	int index;
	index = lookup_wordID(yytext);
	if(index == -1)
		return add_word(yytext);
	else
		return index;	
}

int installNum()
{
	int index;
	index = lookup_wordNum(yytext);
	if(index == -1)
		return add_word(yytext);
	else
		return index;
}

int lookup_wordID(char *word)
{
	struct word *wp = word_list;
	// 向下搜索链表寻找单词
	for( ; wp; wp=wp->next)
	{
		if(strcmp(wp->word_name,word) == 0)
			return wp->location;
	}
	return -1;
}

int lookup_wordNum(char *word)
{
	struct word *wp = word_list;
	for( ; wp; wp=wp->next)
	{
		if(strcmp(wp->word_name,word) == 0)
			return wp->word_name-'0';
	}
	return -1;
}

int add_word(char *word)
{
	struct word *wp;
	LOCATION++;
	wp = (struct word*)malloc(sizeof(struct word));	// 在链表上开辟新空间
	wp->next = word_list;
	wp->word_name = (char *)malloc(strlen(word));
	wp->location = LOCATION;
	strcpy(wp->word_name,word);
	word_list = wp;
	return LOCATION;
}

