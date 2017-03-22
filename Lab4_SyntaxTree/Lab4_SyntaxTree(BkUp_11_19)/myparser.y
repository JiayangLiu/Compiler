
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
int i;
// extern int yylval;
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
							// $$->parseName = "program";
							// $$->attr.name = " ";
							savedTree = $$;
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
							// $$->parseName = "declaration_list";
							// $$->attr.name = " ";					
						}
					| declaration
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration_list   ");
							$$ = $1;
							// $$->parseName = "declaration_list";
							// $$->attr.name = " ";
						}
					;

declaration			: var_declaration
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							$$ = $1;
							// $$->parseName = "declaration";
							// $$->attr.name = " ";
						}
					| fun_declaration
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							$$ = $1;
							// $$->parseName = "declaration";
							// $$->attr.name = " ";
						}
					| fun_defination
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							$$ = $1;
							// $$->parseName = "declaration";
							// $$->attr.name = " ";
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
							$$->parseName = "var_declaration";
							$$->attr.name = " ";
							
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
							$$->parseName = "type_specifier";
							$$->attr.name = "int";
						}
					| CHAR
						{
							// $$ = (TreeNode*) malloc(4);
							printf("CHAR   ");
							$$ = newExprNode(TypeK);
							p->type = Charactor;
							$$->parseName = "type_specifier";
							$$->attr.name = "char";
						}
					| FLOAT
						{
							// $$ = (TreeNode*) malloc(4);
							printf("FLOAT   ");
							$$ = newExprNode(TypeK);
							p->type = Float;
							$$->parseName = "type_specifier";
							$$->attr.name = "float";
						}
					| BOOL
						{
							// $$ = (TreeNode*) malloc(4);
							printf("BOOL   ");
							$$ = newExprNode(TypeK);
							p->type = Bool;
							$$->parseName = "type_specifier";
							$$->attr.name = "bool";
						}
					| VOID
						{
							// $$ = (TreeNode*) malloc(4);
							printf("VOID   ");
							$$ = newExprNode(TypeK);
							p->type = Void;
							$$->parseName = "type_specifier";
							$$->attr.name = "void";
						}
					| /* empty */
						{
							printf("NULL   ");
							$$ = newExprNode(TypeK);
							p->type = Void;
							$$->parseName = "type_specifier";
							$$->attr.name = "empty";
						}
					;

ID_list				: ID_list COMMA ID_get
						{
							// $$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list   ");
							$$ = newStmtNode(CompK);
							p = $1;
							if (p)
							{
								while (p->sibling)
								{
									$$->child[i] = p;
									i++;
									p = p->sibling;
								}
								$$->child[i] = p;
								p->sibling = $3;
								$$->child[i+1] = $3;
							}
							else {
								$$->child[0] = $3;
							}
							$$->parseName = "ID_list";
							$$->attr.name = " ";
						}
					| ID_list COMMA assign_decl
						{
							// $$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list(assign)   ");
							$$ = newStmtNode(CompK);
							p = $1;
							if (p)
							{
								while (p->sibling)
								{
									$$->child[i] = p;
									i++;
									p = p->sibling;
								}
								$$->child[i] = p;
								p->sibling = $3;
								$$->child[i+1] = $3;
							}
							else {
								$$->child[0] = $3;
							}
							$$->parseName = "ID_list";
							$$->attr.name = " ";					
						}
					| assign_decl
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list(assign)   ");
							$$ = $1;
							// $$->parseName = "ID_list";
							// $$->attr.name = " ";
						}
					| ID_get
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list   ");
							$1->sibling = NULL;
							$$ = $1;
							// $$->parseName = "ID_list";
							// $$->attr.name = " ";
						}
					;

assign_decl			: ID_get ASSIGN expression 
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("assign_decl   ");
							$$ = newStmtNode(AssignK);
							$$->child[0] = $1;
							$$->child[1] = $3;
							$$->parseName = "assign_decl";
							$$->attr.name = "=";
						}
					;


ID_get				: ID
						{
							printf("ID_get   ");
							$$ = newExprNode(IdK);
							// $$->attr.name = yytext;
							$$->parseName = "ID";
							$$->attr.name = "id";

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
							// $$->attr.name = yytext;
							$$->parseName = "ID";
							$$->attr.name = "id";

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
							$$->parseName = "fun_declaration";
							$$->attr.name = " ";
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
							$$->parseName = "fun_defination";
							$$->attr.name = " ";
						}
					;
					
params				: params param_list
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("params   ");
							$$ = $2;
							// $$->parseName = "params";
							// $$->attr.name = " ";
						}
					| /* empty */
						{
							// $$ = (TreeNode*) malloc(sizeof(TreeNode));
							// $$ = NULL;
							$$ = newExprNode(TypeK);
							// p->type = Void;
							printf("params(empty)   ");
							$$->parseName = "params";
							$$->attr.name = "empty";

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
							// $$->parseName = "param_list";
							// $$->attr.name = " ";
						}
					| param
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("param_list   ");
							$$ = $1;
							// $$->parseName = "param_list";
							// $$->attr.name = " ";						
						}
					;

param				: type_specifier ID_get
						{
							// $$ = (TreeNode*) malloc(4);
							printf("param   ");
							$$ = newExprNode(ParamK);
							$$->type = $1->type;
							$2->type = $1->type;
							$$->child[0] = $1;
							$$->child[1] = $2;
							$$->parseName = "param";
							$$->attr.name = " ";
						}
					| type_specifier ID_get LS RS
						{
							// $$ = (TreeNode*) malloc(4);
							printf("param   ");
							$$ = newExprNode(ParamK);
							$$->type = $1->type;
							$2->type = $1->type;
							$$->child[0] = $1;
							$$->child[1] = $2;
							$$->parseName = "param";
							$$->attr.name = " ";
						}
					;

local_declaration	: local_declaration var_declaration
						{
							// $$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("local_declaration   ");
							$$ = newStmtNode(CompK);
							p = $1;
							i = 0;
							if (p)
							{
								while (p->sibling)
								{
									$$->child[i] = p;
									i++;
									p = p->sibling;
								}
								$$->child[i] = p;
								p->sibling = $2;
								$$->child[i+1] = $2;
								// $$ = $1;
							}
							else {
								$$->child[0] = $2;
								// $$ = $2;
							}
							$$->parseName = "local_declaration";
							$$->attr.name = " ";
						}
					| /* empty */
						{
							// $$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("local_declaration_empty   ");
							$$ = newStmtNode(CompK);
							$$->child[0] = NULL;
							$$->parseName = "local_declaration_empty";
							$$->attr.name = " ";
							
							// symbol table
						}
					;

statement_list		: statement_list statement
						{
							// $$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement_list   ");
							$$ = newStmtNode(CompK);
							p = $1;
							i = 0;
							if (p)
							{
								while (p->sibling)
								{
									$$->child[i] = p;
									i++;
									p = p->sibling;
								}
								$$->child[i] = p;
								p->sibling = $2;
								$$->child[i+1] = $2;
								// $$ = $1;
							}
							else {
								$$->child[0] = $2;
								// $$ = $2;
							}
							$$->parseName = "statement_list";
							$$->attr.name = " ";
						}
					| /* empty */
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement_list   ");
							$$ = NULL;
							// $$ = newExprNode(TypeK);
							// p->type = Void;
							// $$->parseName = "statement_list";
							// $$->attr.name = "empty";
						}
					;

statement			: expression_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
							// $$->parseName = "statement";
							// $$->attr.name = " ";
						}
					| compound_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
							// $$->parseName = "statement";
							// $$->attr.name = " ";
						}
					| if_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
							// $$->parseName = "statement";
							// $$->attr.name = " ";
						}
					| while_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
							// $$->parseName = "statement";
							// $$->attr.name = " ";
						}
					| for_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
							// $$->parseName = "statement";
							// $$->attr.name = " ";
						}
					// | scanf_stmt // not done
					// | printf_stmt // not done
					| assign_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
							// $$->parseName = "statement";
							// $$->attr.name = " ";
						}
					| return_stmt
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							$$ = $1;
							// $$->parseName = "statement";
							// $$->attr.name = " ";
						}
					;

expression_stmt		: expression SEMICOLON
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression_stmt   ");
							$$ = $1;
							// $$->parseName = "expression_stmt";
							// $$->attr.name = " ";
						}
					| SEMICOLON
						{
							printf("expression_stmt   ");
							$$ = newStmtNode(CompK);
							$$->child[0] = NULL;
							$$->parseName = "expression_list_empty";
							$$->attr.name = "empty";
						}
					;

compound_stmt		: LB local_declaration statement_list RB
						{
							// $$ = (TreeNode*) malloc(4);
							printf("compound_stmt   ");
							$$ = newStmtNode(CompK);
							$$->child[0] = $2;
							$$->child[1] = $3;
							$$->parseName = "compound_stmt";
							$$->attr.name = " ";

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
							$$->parseName = "if_stmt";
							$$->attr.name = " ";
						}
					| IF LP expression RP statement ELSE statement
						{
							// $$ = (TreeNode*) malloc(4);
							printf("if_else   ");
							$$ = newStmtNode(IfK);
							$$->child[0] = $3;
							$$->child[1] = $5;
							$$->child[2] = $7;
							$$->parseName = "if_else";
							$$->attr.name = " ";
						}
					;

while_stmt			: WHILE LP expression RP LB statement_list RB
						{
							// $$ = (TreeNode*) malloc(4);
							printf("while_stmt   ");
							$$ = newStmtNode(WhileK);
							$$->child[0] = $3;
							$$->child[1] = $6;
							$$->parseName = "while_stmt";
							$$->attr.name = " ";
						}
					;

for_stmt			: FOR LP expression_list SEMICOLON expression_list SEMICOLON expression_list RP statement_list // "{}" ?????
						{
							// $$ = (TreeNode*) malloc(4);
							printf("for_stmt   ");
							$$ = newStmtNode(ForK);
							$$->child[0] = $3;
							$$->child[1] = $5;
							$$->child[2] = $7;
							$$->child[3] = $9;
							$$->parseName = "for_stmt";
							$$->attr.name = " ";
						}
					;

expression_list		:expression
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression_list   ");
							$$ = $1;
							// $$->parseName = "expression_list";
							// $$->attr.name = " ";
						}
					| /* empty */
						{
							printf("expression_list   ");
							$$ = newStmtNode(CompK);
							$$->child[0] = NULL;
							$$->parseName = "expression_list_empty";
							$$->attr.name = "empty";
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
							$$->parseName = "assign_stmt";
							$$->attr.op = "=";

							// .op							
							// $$ = $1;
						}
					;

return_stmt			: RETURN SEMICOLON
						{
							// $$ = (TreeNode*) malloc(4);
							printf("return_stmt   ");
							$$ = newStmtNode(ReturnK);
							// $$->parseName = "return_stmt";
							// $$->attr.name = " ";
						}
					| RETURN expression SEMICOLON
						{
							// $$ = (TreeNode*) malloc(4);
							printf("return_stmt   ");
							$$ = newStmtNode(ReturnK);
							$$->child[0] = $2;
							$$->parseName = "return_stmt";
							$$->attr.name = " ";
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
							$$->attr.op = $2->attr.op;
							$$->parseName = "expression";
							// $$->attr.name = " ";
						}
					| NOT expression
						{
							printf("NOT   ");
							$$ = newExprNode(OpK);
							$$->child[0] = $2;
							$$->attr.op = $2->attr.op;
							$$->parseName = "expression";
							// $$->attr.name = " ";
						}
					| expression addop expression
						{
							// $$ = (TreeNode*) malloc(4);
							printf("expression   ");
							$$ = newExprNode(OpK);
							$$->child[0] = $1;
							$$->child[1] = $3;
							$$->attr.op = $2->attr.op;
							$$->parseName = "expression";
							// $$->attr.name = " ";
						}
					|  expression mulop expression
						{
							// $$ = (TreeNode*) malloc(4);
							printf("expression   ");
							$$ = newExprNode(OpK);
							$$->child[0] = $1;
							$$->child[1] = $3;
							$$->attr.op = $2->attr.op;
							$$->parseName = "expression";
							// $$->attr.name = " ";
						}
					| expression
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression   ");
							$$ = $1;
							// $$->parseName = "expression";
							// $$->attr.name = " ";
						}
					| LP expression RP
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression   ");
							$$ = $2;
							// $$->parseName = "expression";
							// $$->attr.name = " ";
						}
					| factor
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("term   ");
							$$ = $1;
							// $$->parseName = "factor";
							// $$->attr.name = " ";
						}
					;
					
relop				: EQ
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("==   ");
//							$$->attr.name = yytext;
							$$->parseName = "relop";
							$$->attr.op = "==";
						}
					| NE
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("!=   ");
							$$->parseName = "relop";
							$$->attr.op = "!=";
						}
					| LE
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<=   ");
							$$->parseName = "relop";
							$$->attr.op = "<=";
						}
					| GE
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">=   ");
							$$->parseName = "relop";
							$$->attr.op = ">=";
						}
					| LT
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<   ");
							$$->parseName = "relop";
							$$->attr.op = ">";
						}
					| GT
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">   ");
							$$->parseName = "relop";
							$$->attr.op = "<";
						}
					| AND
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("&&   ");
							$$->parseName = "relop";
							$$->attr.op = "&&";
						}
					| OR
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("||   ");
							$$->parseName = "relop";
							$$->attr.op = "||";
						}
					| XOR
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("^   ");
							$$->parseName = "relop";
							$$->attr.op = "^";
						}
					| L_SHIFT
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<<   ");
							$$->parseName = "relop";
							$$->attr.op = "<<";
						}
					| R_SHIFT
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">>   ");
							$$->parseName = "relop";
							$$->attr.op = ">>";
						}
					;

addop				: ADD
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("+   ");
							$$->parseName = "addop";
							$$->attr.op = "+";
						}
					| SUB
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("-   ");
							$$->parseName = "addop";
							$$->attr.op = "-";
						}
					;
					
mulop				: MUL
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("*   ");
							$$->parseName = "mulop";
							$$->attr.op = "*";
						}
					| DIV
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("/   ");
							$$->parseName = "mulop";
							$$->attr.op = "/";
						}
					;

factor				: LP expression RP
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							$$ = $2;
							// $$->parseName = "factor";
							// $$->attr.name = " ";
						}
					| ID_get
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							$$ = $1;
							// $$->parseName = "factor";
							// $$->attr.name = " ";
						}
					| fun_call
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							$$ = $1;
							// $$->parseName = "factor";
							// $$->attr.name = " ";
						}
					| NUM_Int
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							$1 = newExprNode(ConstK); // ?????
							$1->type = Integer;
							$1->parseName = "NUM_Int";
							$1->attr.name = "1";
							$$ = $1;
						}
					| NUM_Float
						{
							$$ = (TreeNode*) malloc(4);
							printf("factor   ");
							$1 = newExprNode(ConstK);
							$1->type = Float;
							$1->parseName = "NUM_Float";
							$1->attr.name = "0";
							$$ = $1;
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
							$$->parseName = "fun_call";
							$$->attr.name = " ";
						}
					;

args				: arg_list
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("args   ");
							$$ = $1;
							// $$->parseName = "args";
							// $$->attr.name = " ";
						}
					| /* empty */
						{
							// $$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("args   ");
							// $$ = NULL;
							$$ = newExprNode(TypeK);
							p->type = Void;
							$$->parseName = "args";
							$$->attr.name = "empty";
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
							// $$->parseName = "arg_list";
							// $$->attr.name = " ";
						}
					| expression
						{
							$$ = (TreeNode*) malloc(sizeof(TreeNode));
							printf("arg_list   ");
							$$ = $1;
							// $$->parseName = "arg_list";
							// $$->attr.name = " ";
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
	
	printf("Trace parse step: \n");

//	savedTree = (TreeNode*) malloc(sizeof(TreeNode));
	p = (TreeNode*) malloc(sizeof(TreeNode));
	t = (TreeNode*) malloc(sizeof(TreeNode));


	yyparse();
	printf("\n\nParse Tree:\n");
	
	// 打印树
	printTree(savedTree);

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
