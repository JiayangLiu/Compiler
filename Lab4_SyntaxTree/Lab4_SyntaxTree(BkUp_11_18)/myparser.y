
%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2016年11月8日
****************************************************************************/

#include "mylexer.h"
#include "tree.h"
#include "symtab.h"
#include <ctype.h>
#include <stdio.h>

extern int yylex(void);

static TreeNode* savedTree;
static TreeNode* p;
static TreeNode* t;

// extern int yylineno;
extern int line;
extern char* yytext;
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// attribute type
%include {
#ifndef YYSTYPE
#define YYSTYPE TreeNode*
#endif
}

%token IF
%token THEN
%token ELSE
%token WHILE
%token FOR
%token SWITCH
%token CASE
%token BREAK
%token DEFAULT
%token RETURN

%token INT
%token FLOAT
%token DOUBLE
%token CHAR
%token BOOL
%token VOID

%token ID
%token NUM_Int
%token NUM_Float
// %token Char

%token LP
%token RP
%token LS
%token RS
%token LB
%token RB
%token COLON
%token SEMICOLON
%token COMMA
%token ASSIGN
%token L_SHIFT
%token R_SHIFT
%token AND
%token OR
%token XOR
%token NOT
%token EQ
%token NE
%token LE
%token GE
%token LT
%token GT
%token ADD
%token SUB
%token MUL
%token DIV

%right SEMICOLON
%left COMMA
%right ASSIGN
%left OR
%left AND
%left XOR
%left EQ NE
%left LE GE LT GT
%left L_SHIFT R_SHIFT
%left ADD SUB
%left MUL DIV
// %right UMINUS
%left INT FLOAT CHAR VOID
%left NOT
%right RP RS RB
%left LP LS LB

%%

/////////////////////////////////////////////////////////////////////////////
// rules section

program				: declaration_list
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("program   ");
							$$ = $1;
							// savedTree = $1;
						}
					;
			
declaration_list	: declaration_list declaration
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration_list   ");
							p = $1;
							if (p)
							{
								while (p->sibling)
								{
									p = p->sibling;
								}
								p->sibling = $2;
								$$ = $1;
							}						
						}
					| declaration
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration_list   ");
							$$ = $1;
						}
					;

declaration			: var_declaration
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							$$ = $1;
						}
					| fun_declaration
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							$$ = $1;
						}
					| fun_defination
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							$$ = $1;
						}
					;
			
var_declaration		: type_specifier ID_list SEMICOLON
						{
							// $$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("var_declaration   ");
							$$ = newDeclNode(VarK);
							for (t = $2; t!=NULL; t=t->sibling)
							{
								t->type = $1->type;
							}
							$$->child[0] = $1;
							$$->child[1] = $2;
							
							// symbol table
						}
					// | type_specifier ID LS NUM RS SEMICOLON
					;

type_specifier		: INT
						{
							// $$ = (TreeNode*) malloc(4);
							printf("INT   ");
							$$ = newExprNode(TypeK);
							p->type = Integer;
						}
					| CHAR
						{
							// $$ = (TreeNode*) malloc(4);
							printf("CHAR   ");
							$$ = newExprNode(TypeK);
							p->type = Charactor;
						}
					| FLOAT
						{
							// $$ = (TreeNode*) malloc(4);
							printf("FLOAT   ");
							$$ = newExprNode(TypeK);
							p->type = Float;
						}
					| BOOL
						{
							// $$ = (TreeNode*) malloc(4);
							printf("BOOL   ");
							$$ = newExprNode(TypeK);
							p->type = Bool;
						}
					| VOID
						{
							// $$ = (TreeNode*) malloc(4);
							printf("VOID   ");
							$$ = newExprNode(TypeK);
							p->type = Void;
						}
					| /* empty */
						{
							printf("NULL   ");
							$$ = newExprNode(TypeK);
							p->type = Void;
						}
					;

ID_list				: ID_list COMMA ID_get
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list   ");
							p = $1;
							if (p)
							{
								while (p->sibling)
								{
									p = p->sibling;
								}
								p->sibling = $3;
							}
							$$ = $1;
						}
					| ID_list COMMA assign_decl
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list(assign)   ");
							p = $1;
							if (p)
							{
								while (p->sibling)
								{
									p = p->sibling;
								}
								p->sibling = $3;
							}
							$$ = $1;							
						}
					| assign_decl
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list(assign)   ");
							$$ = $1;
						}
					| ID_get
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list   ");
							$1->sibling = NULL;
							$$ = $1;
						}
					;
assign_decl			: ID_get ASSIGN expression 
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("assign_decl   ");
							$$ = newStmtNode(AssignK);
							$$->child[0] = $1;
							$$->child[1] = $3;
						}
					;


ID_get				: ID
						{
							// $$ = (TreeNode*) malloc(4);
							// $1 = (struct TreeNode*) malloc(4);
							printf("ID_get   ");
							$$ = newExprNode(IdK);

							// symbol table
							// if (st_lookup(curr_token) != -1)
							// {
								
							// }
							// else {
							// 	insert(curr_token);
							// }
						}
					;

ID_lookup			: ID
						{
							printf("ID_lookup   ");
							$$ = newExprNode(IdK);
						}
					;

fun_declaration		: type_specifier ID_get LP params RP SEMICOLON
						{
							// $$ = (TreeNode*) malloc(4);
							printf("fun_declaration   ");
							$$ = newDeclNode(FunK);
							t = $2;
							t->type = $1->type;
							$$->child[0] = $1;
							$$->child[1] = $2;
							$$->child[2] = $4;
						}
					;

fun_defination		: type_specifier ID_get LP params RP compound_stmt
						{
							// $$ = (TreeNode*) malloc(4);
							printf("fun_defination   ");
							$$ = newDeclNode(FunK);
							t = $2;
							t->type = $1->type;
							$$->child[0] = $1;
							$$->child[1] = $2;
							$$->child[2] = $4;
							$$->child[3] = $6;							
						}
					;
					
params				: params param_list
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("params   ");
							$$ = $2;
						}
					| /* empty */
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							$$ = NULL;
							printf("params(NULL)   ");

							// symbol table
						}
					;

param_list			: param_list COMMA param
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("param_list   ");
							p = $1;
							while (p->sibling)
							{
								p = p->sibling;
							}
							p->sibling = $2;
							$$ = $1;
						}
					| param
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("param_list   ");
							$$ = $1;							
						}
					;

param				: type_specifier ID_get
						{
							// $$ = (TreeNode*) malloc(4);
							printf("param   ");
							$$ = newExprNode(ParamK);
							$$->child[0] = $1;
							$$->child[1] = $2;
							$$->type = $1->type;
							$2->type = $1->type;
						}
					| type_specifier ID_get LS RS
						{
							// $$ = (TreeNode*) malloc(4);
							printf("param   ");
							$$ = newExprNode(ParamK);
							$$->child[0] = $1;
							$$->child[1] = $2;
							$$->type = $1->type;
							$2->type = $1->type;
						}
					;

local_declaration	: local_declaration var_declaration
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("local_declaration   ");
							p = $1;
							if (p != NULL)
							{
								while (p->sibling)
								{
									p = p->sibling;
								}
								p->sibling = $2;
								$$ = $1;
							}
							else {
								$$ = $2;
							}
						}
					| /* empty */
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("local_declaration   ");
							$$ = NULL;

							// symbol table
						}
					;

statement_list		: statement_list statement
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement_list   ");
							p = $1;
							if (p)
							{
								while (p->sibling)
								{
									p = p->sibling;
								}
								p->sibling = $2;
								$$ = $1;
							}
							else {
								$$ = $2;
							}
						}
					| /* empty */
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement_list   ");
							$$ = NULL;
						}
					;

statement			: expression_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
						}
					| compound_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
						}
					| if_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
						}
					| while_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
						}
					| for_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
						}
					// | scanf_stmt // not done
					// | printf_stmt // not done
					| assign_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
						}
					| return_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
						}
					;

expression_stmt		: expression SEMICOLON
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression_stmt   ");
							$$ = $1;
						}
					| SEMICOLON
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression_stmt   ");
							$$ = $1;
						}
					;

compound_stmt		: LB local_declaration statement_list RB
						{
							// $$ = (TreeNode*) malloc(4);
							printf("compound_stmt   ");
							$$ = newStmtNode(StmtK);
							$$->child[0] = $2;
							$$->child[1] = $3;

							// symbol table
						}
					;

if_stmt				: IF LP expression RP statement
						{
							// $$ = (TreeNode*) malloc(4);
							printf("if_stmt   ");
							$$ = newStmtNode(IfK);
							$$->child[0] = $3;
							$$->child[1] = $5;
						}
					| IF LP expression RP statement ELSE statement
						{
							// $$ = (TreeNode*) malloc(4);
							printf("if_stmt   ");
							$$ = newStmtNode(IfK);
							$$->child[0] = $3;
							$$->child[1] = $5;
							$$->child[2] = $7;
						}
					;

while_stmt			: WHILE LP expression RP LB statement_list RB
						{
							// $$ = (TreeNode*) malloc(4);
							printf("while_stmt   ");
							$$ = newStmtNode(WhileK);
							$$->child[0] = $3;
							$$->child[1] = $6;
						}
					;

for_stmt			: FOR LP expression_list SEMICOLON expression_list SEMICOLON expression_list RP statement // "{}" ?????
						{
							// $$ = (TreeNode*) malloc(4);
							printf("for_stmt   ");
							$$ = newStmtNode(ForK);
							$$->child[0] = $3;
							$$->child[1] = $5;
							$$->child[2] = $7;
							$$->child[3] = $9;							
						}
					;

expression_list		:expression
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression_list   ");
							$$ = $1;
						}
					| /* empty */
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression_list   ");
							$$ = NULL;
						}
					;
// scanf_stmt			: // not done
// 						// {
// 						// 	$$ = newStmtNode(ReadK);
// 						// 	// $$->child[0] = $ ;
// 						// }
// 					;

// printf_stmt			: // not done
// 						// {
// 						// 	$$ = newStmtNode(WriteK);
// 						// 	// $$->child[0] = $ ;
// 						// }
// 					;

assign_stmt			: ID_lookup ASSIGN expression
						{
							// $$ = (TreeNode*) malloc(4);
							printf("assign_stmt   ");
							$$ = newStmtNode(AssignK);
							$$->child[0] = $1;
							$$->child[1] = $3;

							// .op							
							// $$ = $1;
						}
					;

return_stmt			: RETURN SEMICOLON
						{
							// $$ = (TreeNode*) malloc(4);
							printf("return_stmt   ");
							$$ = newStmtNode(ReturnK);
						}
					| RETURN expression SEMICOLON
						{
							// $$ = (TreeNode*) malloc(4);
							printf("return_stmt   ");
							$$ = newStmtNode(ReturnK);
							$$->child[0] = $2;
						}
					;

// Var_ID				: ID
// 						{
// 							// $$ = (TreeNode*) malloc(4);
// 							printf("Var_ID   ");
// 							$$ = newExprNode(IdK);

// 							// symbol table
// 						}
// 					// | ID LS expression RS
// 					;

expression			: expression relop expression
						{
							// $$ = (TreeNode*) malloc(4);
							printf("expression   ");
							$$ = newExprNode(OpK);
							$$->child[0] = $1;
							$$->child[1] = $3;
							$$->attr.op = $2;
						}
					| NOT expression
						{
							printf("NOT   ");
							$$ = newExprNode(OpK);
							$$->child[0] = $2;
							$$->attr.op = $2;
						}
					| expression addop expression
						{
							// $$ = (TreeNode*) malloc(4);
							printf("expression   ");
							$$ = newExprNode(OpK);
							$$->child[0] = $1;
							$$->child[1] = $3;
							$$->attr.op = $2;
						}
					|  expression mulop expression
						{
							// $$ = (TreeNode*) malloc(4);
							printf("expression   ");
							$$ = newExprNode(OpK);
							$$->child[0] = $1;
							$$->child[1] = $3;
							$$->attr.op = $2;
						}
					| expression
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression   ");
							$$ = $1;
						}
					| factor
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("term   ");
							$$ = $1;
						}
					;
					
relop				: EQ
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("==   ");
//							$$->sttr.name = yytext;
						}
					| NE
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("!=   ");
						}
					| LE
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<=   ");
						}
					| GE
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">=   ");
						}
					| LT
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<   ");
						}
					| GT
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">   ");
						}
					| AND
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("&&   ");
						}
					| OR
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("||   ");
						}
					| XOR
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("^   ");
						}
					| L_SHIFT
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<<   ");
						}
					| R_SHIFT
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">>   ");
						}
					;

// additive_expression	: additive_expression addop term
// 						{
// 							// $$ = (TreeNode*) malloc(4);
// 							printf("additive_expression   ");
// 							$$ = newExprNode(OpK);
// 							$$->child[0] = $1;
// 							$$->child[1] = $3;
// 							$$->attr.op = $2;
// 						}
// 					| term
// 						{
// 							$$ = (TreeNode*) malloc(sizeof(TreeNode));
// 							printf("additive_expression   ");
// 							$$ = $1;
// 						}
// 					;

// term				: term mulop factor
// 						{
// 							// $$ = (TreeNode*) malloc(4);
// 							printf("term   ");
// 							$$ = newExprNode(OpK);
// 							$$->child[0] = $1;
// 							$$->child[1] = $3;
// 							$$->attr.op = $2;
// 						}
// 					| factor
// 						{
// 							$$ = (TreeNode*) malloc(sizeof(TreeNode));
// 							printf("term   ");
// 							$$ = $1;
// 						}
// 					;

addop				: ADD
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("+   ");
						}
					| SUB
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("-   ");
						}
					;
					
mulop				: MUL
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("*   ");
						}
					| DIV
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("/   ");
						}
					;

factor				: LP expression RP
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							$$ = $2;
						}
					| ID_get
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							$$ = $1;
						}
					| fun_call
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							$$ = $1;
						}
					| NUM_Int
						{
							// $$ = (TreeNode*) malloc(4);
							printf("factor   ");
							$1 = newExprNode(ConstK); // ?????
							$1->type = Integer;
							// $$ = $1;
						}
					| NUM_Float
						{
							// $$ = (TreeNode*) malloc(4);
							printf("factor   ");
							$1 = newExprNode(ConstK);
							$1->type = Float;
							// $$ = $1;
						}
					// | Char
					// 	{
					// 		$1 = newExprNode(ConstK);
					// 		$1->type = Charactor;
					// 		$$ = $1;
					// 	}
					;					

fun_call			: ID_get LP args RP
						{
							// $$ = (TreeNode*) malloc(4);
							printf("fun_call   ");
							$$ = newExprNode(FunK);
							$$->type = $1->type;
							$$->child[0] = $1;
							$$->child[1] = $3;
						}
					;

args				: arg_list
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("args   ");
							$$ = $1;
						}
					| /* empty */
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("args   ");
							$$ = NULL;
						}
					;

arg_list			: arg_list COMMA expression
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("arg_list   ");
							p = $1;
							while (t->sibling)
							{
								t = t->sibling;
							}
							t->sibling = $2;
							$$ = $1;
						}
					| expression
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("arg_list   ");
							$$ = $1;
						}
					;

%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int main(void)
{
	char* filename;	// 打开要读取的文本文件
	filename = (char*) malloc(40);
	// FILE* fp;
	printf("Please input the file name: ");
	scanf("%s", filename);
    yyin = fopen(filename, "r");
    if (yyin == NULL) //打开文件，并判断是否有打开错误
	{
        printf("Error occurs when open file: %s\n", filename);
        return 0;
    }
    printf("File is opened successfully.\n");
	// int ch;
	// while((ch = getc(yyin)) != EOF)
    //    putchar(ch);
	printf("-----------------------------------------\n\n");
	
	printf("Begin\n");

//	savedTree = (TreeNode*) malloc(sizeof(TreeNode));
	p = (TreeNode*) malloc(sizeof(TreeNode));
	t = (TreeNode*) malloc(sizeof(TreeNode));


	yyparse();
	printf("\nFinish\n");
	
	// 打印树
	// printTree(savedTree);

	fclose(yyin);
	free(filename);

	return 0;
}

void yyerror(char* s, int state)
{
	fprintf(stderr, "%s ", s);    
	if (state != -1)
	{
		fprintf(stderr, ": line %d, ", line);
		fprintf(stderr, "before %s \n", yytext);
	}
}


// static int yylex(void)
// {
// 	curr_token = getToken();
// 	return curr_token;
// }