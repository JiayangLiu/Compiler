%{
/****************************************************************************
mylexer.l
ParserWizard generated Lex file.

Date: 2016年11月8日
****************************************************************************/

#include "myparser.h"
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

// extern YYSTYPE yylval;

//%option yylineno;

int line = 0;

// extern YYSTYPE	yylval;

// int LOCATION = -1;

// struct word{	//为符号表定义指针变量，记录符号名
// 	char *word_name;
// 	int location;
//     struct word *next;
// } *word_list; 
   
// extern void *malloc();

// int installID();
// int installNum();

%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
ws		[ \t]+
newline	\n
letter	[A-Za-z]
digit	[0-9]
id		{letter}({letter}|{digit})*
number_int	{digit}+
number_float	{digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%

/////////////////////////////////////////////////////////////////////////////
// rules section
{ws}	{ /*no action and no return*/ }
{newline}	{ line++; }
// "/*"	{ comment(); }
// "//"[^/n]*	{ /* one line comment */ }

if		{ return IF; }
else	{ return ELSE; }
while	{ return WHILE; }
for		{ return FOR; }
switch	{ return SWITCH; }
case	{ return CASE; }
break	{ return BREAK; }
default	{ return DEFAULT; }
return	{ return RETURN; }

int		{ return INT; }
float	{ return FLOAT; }
double	{ return DOUBLE; }
char	{ return CHAR; }
bool	{ return BOOL; }
void	{ return VOID; }

"("		{ return LP; }
")"		{ return RP; }
"["		{ return LS; }
"]"		{ return RS; }
"{"		{ return LB; }
"}"		{ return RB; }
":"		{ return COLON; }
";"		{ return SEMICOLON; }
","		{ return COMMA; }
"="		{ return ASSIGN; }
"=="	{ return EQ; }
"!="	{ return NE; }
"<<"	{ return L_SHIFT; }
">>"	{ return R_SHIFT; }
"&&"	{ return AND; }
"||"	{ return OR; }
"^"		{ return XOR; }
"!"		{ return NOT; }
"<="	{ return LE; }	// less than or equal to
">="	{ return GE; }	// greater than or equal to
"<"		{ return LT; }
">"		{ return GT; }
"+"		{ return ADD; }
"-"		{ return SUB; }
"*"		{ return MUL; }
"/"		{ return DIV; }

{id}	{ return ID; }
{number_int}	{ return NUM_Int; }
{number_float}	{ return NUM_Float; }

%%

/////////////////////////////////////////////////////////////////////////////
// programs section
int yywrap(void)
{
	return 1;
}