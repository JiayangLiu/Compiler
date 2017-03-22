%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2016??10??25??
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

// set priority
%left ADD SUBTRACT
%left MULTIPLY DIVISION 
%right UMINUS
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

lines	:	lines expr '\n'	{  }
		|	lines '\n'
		|
		;

expr	:	expr ADD expr { printf( "+" ); }
		|	expr SUBTRACT expr { printf( "-" ); }
		|	expr MULTIPLY expr { printf( "*" ); }
		|	expr DIVISION expr { printf( "/" ); }
		|	L_BRACE expr R_BRACE {  }
		|	SUBTRACT expr %prec UMINUS { $$ = -$2; }
		|	NUMBER { printf("%g", yylval); }
		;

%%

/////////////////////////////////////////////////////////////////////////////
// programs section

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
		return c;
	}
}

int main(void)
{
	return yyparse();
}
