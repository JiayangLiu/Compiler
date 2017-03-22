%{
/****************************************************************************
mylexer.l
ParserWizard generated Lex file.

Date: 2016Äê11ÔÂ8ÈÕ
****************************************************************************/

#include "myparser.h"
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "tree.h"

int line = 0;
int currToken;
// currToken = (char*) malloc(sizeof(char));
TreeNode* yylval;

// int yylval;
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

if		{ printf("\n %s\n", yytext); return IF; }
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

{id}	{ printf("\n yytext: %s\n", yytext); yylval = (TreeNode*) malloc(sizeof(TreeNode)); char* temp = (char*)malloc(sizeof(char)); temp = yytext; yylval->attr.name = temp; printf("\n yylval: %s\n", yylval->attr.name); return ID; } // ->attr.name // (TreeNode*) malloc(sizeof(TreeNode));
{number_int}	{ printf("\n %s\n", yytext); yylval = (TreeNode*) malloc(sizeof(TreeNode)); yylval->attr.name = "12"; return NUM_Int; }
{number_float}	{ printf("\n %s\n", yytext); yylval = (TreeNode*) malloc(sizeof(TreeNode)); yylval->attr.name = atoi(yytext); return NUM_Float; }

%%

/////////////////////////////////////////////////////////////////////////////
// programs section
int yywrap(void)
{
	return 1;
}