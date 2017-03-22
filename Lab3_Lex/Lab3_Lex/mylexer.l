%{
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

%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
delim	[ \t\n]
ws		{delim}+
letter	[A-Za-z]
digit	[0-9]
id		{letter}({letter}|{digit})*
number	{digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%

/////////////////////////////////////////////////////////////////////////////
// rules section
{ws}	{ /*no action and no return*/ }

if		{ printf("IF\t\t %s\n", yytext); }
then	{ printf("THEN\t\t %s\n", yytext); }
else	{ printf("ELSE\t\t %s\n", yytext); }
switch	{ printf("SWITCH\t\t %s\n", yytext); }
case	{ printf("CASE\t\t %s\n", yytext); }
while	{ printf("WHILE\t\t %s\n", yytext); }

int		{ printf("INT\t\t %s\n", yytext); }
float	{ printf("FLOAT\t\t %s\n", yytext); }
double	{ printf("DOUBLE\t\t %s\n", yytext); }
char	{ printf("CHAR\t\t %s\n", yytext); }

{id}	{ yylval=(int)installID(); printf("ID\t\t %s\t %d\t\n", yytext, yylval); }
{number} { yylval=(int)installNum(); yylval=yytext; printf("NUMBER\t\t %s\t %s\t\n", yytext, yylval); }

"("		{ printf("LPAREN\t\t %s\n", yytext); }
")"		{ printf("RPAREN\t\t %s\n", yytext); }
"["		{ printf("LSQUAR\t\t %s\n", yytext); }
"]"		{ printf("RSQUAR\t\t %s\n", yytext); }
"{"		{ printf("LBRACE\t\t %s\n", yytext); }
"}"		{ printf("RBRACE\t\t %s\n", yytext); }
":"		{ printf("COLON\t\t %s\n", yytext); }
";"		{ printf("SEMICOLON\t %s\n", yytext); }
"="		{ printf("ASSIGN\t\t %s\n", yytext); }
"=="	{ printf("EQUAL\t\t %s\n", yytext); }
"+"		{ printf("PLUS\t\t %s\n", yytext); }
"-"		{ printf("SUB\t\t %s\n", yytext); }
"*"		{ printf("MUL\t\t %s\n", yytext); }
"/"		{ printf("DIV\t\t %s\n", yytext); }

%%

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
