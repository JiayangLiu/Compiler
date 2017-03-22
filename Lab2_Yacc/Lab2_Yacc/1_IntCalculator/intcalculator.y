// copy to .c later
%{
/****************************************************************************
intcalculator.y
ParserWizard generated YACC file.

Date: 2016,10,19
****************************************************************************/
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
// copy to .h later
%include {
#ifndef YYSTYPE
#define YYSTYPE double
#endif
}

// declare token
%token NUMBER

%token ADD
%token SUBTRACT
%token MULTIPLY
%token DIVISION

%token L_BRACE
%token R_BRACE

%token VARIABLE
%token ASSIGN

// set priority
%right ASSIGN
%left ADD SUBTRACT
%left MULTIPLY DIVISION 
%right UMINUS
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

lines	:	lines expr '\n'	{ printf("%g\n", $2); }
		|	lines '\n'
		|
		;

// "$$": the attribute of parent node
expr	:	expr ADD expr	{ $$ = $1 + $3; }
		|	expr SUBTRACT expr	{ $$ = $1 - $3; }
		|	expr MULTIPLY expr	{ $$ = $1 * $3; }
		|	expr DIVISION expr	{ $$ = $1 / $3; }
		|	L_BRACE expr R_BRACE	{ $$ = $2; }
		|	'-' expr %prec UMINUS	{ $$ = -$2; }
		|	NUMBER
		;

%%

/////////////////////////////////////////////////////////////////////////////
// token retrieving code
int yygettoken(void)
{
	int c;
	int num;
	c = getchar();
	if (isdigit(c)) {
		num = c - '0';
		c = getchar();
		while (isdigit(c)) {
			num = num*10 + c - '0';
			c = getchar();
		}
		yylval = num;
		ungetc(c,stdin);
		return NUMBER;
	} else if (c=='+') {
		return ADD;
	} else if (c=='-') {
		return SUBTRACT;
	} else if (c=='*') {
		return MULTIPLY;
	} else if (c=='/') {
		return DIVISION;
	} else if (c=='(') {
		return L_BRACE;
	} else if (c==')') {
		return R_BRACE;
	} else {
		// yygettoken(); // other white space situation
		return c;
	}

	// yytext: contant the string of lexmime
	// return c;
}

int main(void)
{
	return yyparse();
}
