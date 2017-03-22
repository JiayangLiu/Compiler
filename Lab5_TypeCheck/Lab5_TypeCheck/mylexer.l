%{
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

%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
ws		[ \t]+
newline	\n
singleline_comment "/""/"[^\n]*
multipleline_comment "/*"([^\*]|(\*)*[^\*/])*(\*)*"*/"
letter	[A-Za-z]
digit	[0-9]
id		{letter}({letter}|{digit})*
number_int	{digit}+
number_double	{digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%

/////////////////////////////////////////////////////////////////////////////
// rules section
{ws}	{ /*no action and no return*/ }
{newline}	{ line++; }
{singleline_comment}	{ /*no action and no return*/ }
{multipleline_comment}	{ /*no action and no return*/ }

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

// yylval->attr.name = yytext;
// char* content=malloc(0);
// strcpy(yylval->attr.name, yytext);
{id}	{	yylval = (TreeNode*) malloc(sizeof(TreeNode)); 
			int i = 0;
			char* content = malloc(0);
			for (i=0; i<yyleng; i++) { content[i]=yytext[i]; } content[i] = '\0';
			yylval->attr.name = content; 
			return ID;
		}
{number_int}	{	yylval = (TreeNode*) malloc(sizeof(TreeNode));
					int i = 0;
					char* content = malloc(0);
					for (i=0; i<yyleng; i++) { content[i]=yytext[i]; } 
					content[i] = '\0';
					yylval->attr.name = content; 
					return NUM_Int;
				}
{number_double}	{	yylval = (TreeNode*) malloc(sizeof(TreeNode));
					int i = 0;
					char* content = malloc(0);
					for (i=0; i<yyleng; i++) { content[i]=yytext[i]; } 
					content[i] = '\0';
					yylval->attr.name = content; 
					return NUM_Double;
				}

%%

/////////////////////////////////////////////////////////////////////////////
// programs section
int yywrap(void)
{
	return 1;
}