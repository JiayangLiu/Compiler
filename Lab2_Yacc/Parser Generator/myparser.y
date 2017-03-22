%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2016Äê10ÔÂ18ÈÕ
****************************************************************************/
#include <ctype.h>
#include <stdio.h>
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
%include {
#ifndef YYSTYPE
#define YYSTYPE double
#endif
}

//%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

/////////////////////////////////////////////////////////////////////////////
// rules section

lines	:	lines expr '\n'	{ printf("%g\n", $2); }
		|	lines '\n'
		|
		;

expr	:	expr '+' expr	{ $$ = $1 + $3; }
		|	expr '-' expr	{ $$ = $1 - $3; }
		|	expr '*' expr	{ $$ = $1 * $3; }
		|	expr '/' expr	{ $$ = $1 / $3; }
		|	'(' expr ')'	{ $$ = $2; }
		|	'-' expr %prec UMINUS	{ $$ = -$2; }
		|	NUMBER
		;

NUMBER	:	'0'				{ $$ = 0.0; }
		|	'1'				{ $$ = 1.0; }
		|	'2'				{ $$ = 2.0; }
		|	'3'				{ $$ = 3.0; }
		|	'4'				{ $$ = 4.0; }
		|	'5'				{ $$ = 5.0; }
		|	'6'				{ $$ = 6.0; }
		|	'7'				{ $$ = 7.0; }
		|	'8'				{ $$ = 8.0; }
		|	'9'				{ $$ = 9.0; }
		;

%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int yygettoken(void)
{
	// place your token retrieving code here
	return getchar();
}

int main(void)
{
	return yyparse();
}

