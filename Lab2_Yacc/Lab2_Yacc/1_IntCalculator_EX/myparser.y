%{
/****************************************************************************
expr.y
ParserWizard generated YACC file.

Date: 2016,10,24
****************************************************************************/
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int num;
char id[100];
int index=0;
int i;

struct{
	char s_name[100];
	double s_value;
} symbal_table[100];

typedef struct{
	char n[100];
	double v;
} newType;
%}

%include {
#ifndef YYSTYPE
#define YYSTYPE newType
#endif
}

%token NUMBER
%token ADD
%token SUB
%token MUL
%token DIV
%token LP
%token RP
%token ID
%token AS

%nonassoc AS
%left ADD SUB
%left MUL DIV
%right UMINUS

%%
lines	:	lines expr '\n'			{ printf("%s\n%g\n", $2.n, $2.v); }	// %s: 字符数组 %g: 根据实数大小选择f或e
		|	lines '\n'
		|
		;

expr	:	expr ADD expr			{ sprintf($$.n, "%s %s + ", $1.n, $3.n); $$.v=$1.v+$3.v; }
		|	expr SUB expr			{ sprintf($$.n, "%s %s - ", $1.n, $3.n); $$.v=$1.v-$3.v; }
		|	expr MUL expr			{ sprintf($$.n, "%s %s * ", $1.n, $3.n); $$.v=$1.v*$3.v; }
		|	expr DIV expr			{ sprintf($$.n, "%s %s / ", $1.n, $3.n); $$.v=$1.v/$3.v; }
		|	LP expr RP				{ sprintf($$.n, "%s", $2.n); $$.v=$2.v; }
		|	SUB expr %prec UMINUS	{ sprintf($$.n, "%s -", $2.n); $$.v=-$2.v; }
		|	NUMBER					{ $$.v=num; _itoa(num,$$.n,10);}	// itoa(欲转换数据, 目标字符串地址, 转换后进制数)
		|	IDX AS expr				{ for (i=0; i<index; i++) {
										if (strcmp($1.n,symbal_table[i].s_name)==0) {	// 如果符号表中存在该变量名，则更新其值
											symbal_table[i].s_value = $3.v;
											$$.v = $3.v;
											break;
										}
									  }
									  if (i==index) {	// 如果符号表中没有该变量，则添加入表
										strcpy(symbal_table[index].s_name,$1.n);
										symbal_table[index].s_value=$3.v;
										$$.v = $3.v;
										index++;
									  }
									}
		|	ID						{ for (i=0; i<index; i++) {	// 相当于LookUp，从符号表中取对应值
										if (strcmp(id,symbal_table[i].s_name)==0) {
											$$.v=symbal_table[i].s_value;
											strcpy(symbal_table[index].s_name,id);
											strcpy($$.n,symbal_table[index].s_name);
											break;
										}
									  } 
									  if(i==index){
										$$.v=0;
										strcpy($$.n,id);
									  }
									}
		
		;
		
IDX		:	ID						{ strcpy($$.n,id); }
		;
		
%%
int yygettoken(void)
{	
	int c;
	int tempnum;
	c = getchar();
	while (c==' ' || c=='\t')	// 处理换行符
		c=getchar();
	switch(c){					// 处理六个运算相关符号
		case '+':
			return ADD;
			break;
		case '-':
			return SUB;
			break;
		case '*':
			return MUL;
			break;
		case '/':
			return DIV;
			break;
		case '(':
			return LP;
			break;
		case ')':
			return RP;
			break;
	}
	
	// 处理变量参与相关
	if (c=='=')
		return AS;
	else if (c>='0' && c<='9') {
		ungetc(c, stdin);	// ungetc()函数用于将一个字符退回到输入流中，这个退回的字符会由下一个读取文件流的函数取得
		scanf("%d", &tempnum);
		num = tempnum;
		return NUMBER;
	}
	else if (c>='a' && c<='z') {
		char symbal[100];
		symbal[0] = c;
		symbal[1] = '\0';
		c=getchar();
		while ((c>='0' && c<='9') || (c>='a' && c<='z')) {
			int i = strlen(symbal);
			symbal[i] = c;
			symbal[i+1] = '\0';
			c = getchar();
		}
		ungetc(c, stdin);
		strcpy(id, symbal);
		memset(symbal, 0, sizeof(symbal));
		return ID;
	}
	
	return c;
}

int main(void)
{
	return yyparse();
}
