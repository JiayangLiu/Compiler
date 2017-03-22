/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 50 of your 30 day trial period.
* 
* This file was produced by an UNREGISTERED COPY of Parser Generator. It is
* for evaluation purposes only. If you continue to use Parser Generator 30
* days after installation then you are required to purchase a license. For
* more information see the online help or go to the Bumble-Bee Software
* homepage at:
* 
* http://www.bumblebeesoftware.com
* 
* This notice must remain present in the file. It cannot be removed.
****************************************************************************/

/****************************************************************************
* myparser.c
* C source file generated from myparser.y.
* 
* Date: 12/06/16
* Time: 13:09:48
* 
* AYACC Version: 2.07
****************************************************************************/

#include <yypars.h>

/* namespaces */
#if defined(__cplusplus) && defined(YYSTDCPPLIB)
using namespace std;
#endif
#if defined(__cplusplus) && defined(YYNAMESPACE)
using namespace yl;
#endif

#define YYFASTPARSER

#line 2 ".\\myparser.y"

/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2016年11月24日
****************************************************************************/

#include "mylexer.h"
// #include "tree.h"
// #include "symtab.h"
#include "typecheck.h"
#include <ctype.h>
#include <stdio.h>

extern int yylex(void);

static TreeNode* savedTree;
static TreeNode* p;
static TreeNode* t;

extern TreeNode* yylval;

static BucketList st;

extern int line;
extern char* yytext;
int i;
int st_location;
ExprType currType;

#line 72 "myparser.c"
/* repeated because of possible precompiled header */
#include <yypars.h>

/* namespaces */
#if defined(__cplusplus) && defined(YYSTDCPPLIB)
using namespace std;
#endif
#if defined(__cplusplus) && defined(YYNAMESPACE)
using namespace yl;
#endif

#define YYFASTPARSER

#include ".\myparser.h"

#ifndef YYSTYPE
#define YYSTYPE int
#endif
#ifndef YYSTACK_SIZE
#define YYSTACK_SIZE 100
#endif
#ifndef YYSTACK_MAX
#define YYSTACK_MAX 0
#endif

/* (state) stack */
#if (YYSTACK_SIZE) != 0
static yystack_t YYNEAR yystack[(YYSTACK_SIZE)];
yystack_t YYFAR *YYNEAR YYDCDECL yysstackptr = yystack;
yystack_t YYFAR *YYNEAR YYDCDECL yystackptr = yystack;
#else
yystack_t YYFAR *YYNEAR YYDCDECL yysstackptr = NULL;
yystack_t YYFAR *YYNEAR YYDCDECL yystackptr = NULL;
#endif

/* attribute stack */
#if (YYSTACK_SIZE) != 0
static YYSTYPE YYNEAR yyattributestack[(YYSTACK_SIZE)];
#ifdef YYPROTOTYPE
void YYFAR *YYNEAR YYDCDECL yysattributestackptr = yyattributestack;
void YYFAR *YYNEAR YYDCDECL yyattributestackptr = yyattributestack;
#else
char YYFAR *YYNEAR YYDCDECL yysattributestackptr = (char YYFAR *) yyattributestack;
char YYFAR *YYNEAR YYDCDECL yyattributestackptr = (char YYFAR *) yyattributestack;
#endif
#else
#ifdef YYPROTOTYPE
void YYFAR *YYNEAR YYDCDECL yysattributestackptr = NULL;
void YYFAR *YYNEAR YYDCDECL yyattributestackptr = NULL;
#else
char YYFAR *YYNEAR YYDCDECL yysattributestackptr = NULL;
char YYFAR *YYNEAR YYDCDECL yyattributestackptr = NULL;
#endif
#endif

int YYNEAR YYDCDECL yysstack_size = (YYSTACK_SIZE);
int YYNEAR YYDCDECL yystack_size = (YYSTACK_SIZE);
int YYNEAR YYDCDECL yystack_max = (YYSTACK_MAX);

/* attributes */
YYSTYPE YYNEAR yyval;
YYSTYPE YYNEAR yylval;
#ifdef YYPROTOTYPE
void YYFAR *YYNEAR YYDCDECL yyvalptr = &yyval;
void YYFAR *YYNEAR YYDCDECL yylvalptr = &yylval;
#else
char YYFAR *YYNEAR YYDCDECL yyvalptr = (char *) &yyval;
char YYFAR *YYNEAR YYDCDECL yylvalptr = (char *) &yylval;
#endif

size_t YYNEAR YYDCDECL yyattribute_size = sizeof(YYSTYPE);

/* yyattribute */
#ifdef YYDEBUG
#ifdef YYPROTOTYPE
static YYSTYPE YYFAR *yyattribute1(int index)
#else
static YYSTYPE YYFAR *yyattribute1(index)
int index;
#endif
{
	YYSTYPE YYFAR *p = &((YYSTYPE YYFAR *) yyattributestackptr)[yytop + index];
	return p;
}
#define yyattribute(index) (*yyattribute1(index))
#else
#define yyattribute(index) (((YYSTYPE YYFAR *) yyattributestackptr)[yytop + (index)])
#endif

#ifdef YYDEBUG
#ifdef YYPROTOTYPE
static void yyinitdebug(YYSTYPE YYFAR **p, int count)
#else
static void yyinitdebug(p, count)
YYSTYPE YYFAR **p;
int count;
#endif
{
	int i;
	yyassert(p != NULL);
	yyassert(count >= 1);

	for (i = 0; i < count; i++) {
		p[i] = &((YYSTYPE YYFAR *) yyattributestackptr)[yytop + i - (count - 1)];
	}
}
#endif

#ifdef YYPROTOTYPE
void YYCDECL yyparseraction(int action)
#else
void YYCDECL yyparseraction(action)
int action;
#endif
{
	switch (action) {
	case 0:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 116 ".\\myparser.y"

							printf("program   ");
							yyval = newStmtNode(CompK);
							yyval->child[0] = yyattribute(1 - 1);
							yyval->parseName = "program";
							yyval->attr.name = " ";
							yyval->type = Void;
							savedTree = yyval;
						
#line 206 "myparser.c"
			}
		}
		break;
	case 1:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[3];
			yyinitdebug(yya, 3);
#endif
			{
#line 128 ".\\myparser.y"

							printf("declaration_list   ");
							yyval = newStmtNode(CompK);
							p = yyattribute(1 - 2);
							i = 0;
							if (p)
							{
								while (p->sibling)
								{
									yyval->child[i] = p;
									i++;
									p = p->sibling;
								}
								yyval->child[i] = p;
								p->sibling = yyattribute(2 - 2);
								yyval->child[i+1] = yyattribute(2 - 2);
							}
							else {
								yyval->child[0] = yyattribute(2 - 2);
							}
							yyval->parseName = "declaration_list";
							yyval->attr.name = " ";			
						
#line 241 "myparser.c"
			}
		}
		break;
	case 2:
		{
#line 152 ".\\myparser.y"

							printf("declaration_list   ");
							yyval = newStmtNode(CompK);
							yyval->child[0] = NULL;
							yyval->parseName = "declaration_list";
							yyval->attr.name = " ";
						
#line 255 "myparser.c"
		}
		break;
	case 3:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 162 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							yyval = yyattribute(1 - 1);
						
#line 271 "myparser.c"
			}
		}
		break;
	case 4:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 168 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							yyval = yyattribute(1 - 1);
						
#line 288 "myparser.c"
			}
		}
		break;
	case 5:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 174 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("declaration   ");
							yyval = yyattribute(1 - 1);
						
#line 305 "myparser.c"
			}
		}
		break;
	case 6:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 182 ".\\myparser.y"

							printf("var_declaration   ");
							yyval = newDeclNode(VarK);
							for (t = yyattribute(2 - 3); t!=NULL; t=t->sibling)
							{
								t->type = yyattribute(1 - 3)->type;
							}
							yyval->child[0] = yyattribute(1 - 3);
							yyval->child[1] = yyattribute(2 - 3);
							yyval->parseName = "var_declaration";
							yyval->attr.name = " ";
							
							// symbol table
						
#line 331 "myparser.c"
			}
		}
		break;
	case 7:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 200 ".\\myparser.y"

							printf("INT   ");
							yyval = newExprNode(TypeK);
							yyval->type = Integer;
							yyval->parseName = "type_specifier";
							yyval->attr.name = "int";
							currType = Integer;
						
#line 351 "myparser.c"
			}
		}
		break;
	case 8:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 209 ".\\myparser.y"

							printf("CHAR   ");
							yyval = newExprNode(TypeK);
							yyval->type = Charactor;
							yyval->parseName = "type_specifier";
							yyval->attr.name = "char";
							currType = Charactor;
						
#line 371 "myparser.c"
			}
		}
		break;
	case 9:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 218 ".\\myparser.y"

							printf("FLOAT   ");
							yyval = newExprNode(TypeK);
							yyval->type = Double;
							yyval->parseName = "type_specifier";
							yyval->attr.name = "double";
							currType = Double;
						
#line 391 "myparser.c"
			}
		}
		break;
	case 10:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 227 ".\\myparser.y"

							printf("BOOL   ");
							yyval = newExprNode(TypeK);
							yyval->type = Boolean;
							yyval->parseName = "type_specifier";
							yyval->attr.name = "bool";
							currType = Boolean;
						
#line 411 "myparser.c"
			}
		}
		break;
	case 11:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 236 ".\\myparser.y"

							printf("VOID   ");
							yyval = newExprNode(TypeK);
							yyval->type = Void;
							yyval->parseName = "type_specifier";
							yyval->attr.name = "void";
							currType = Void;
						
#line 431 "myparser.c"
			}
		}
		break;
	case 12:
		{
#line 245 ".\\myparser.y"

							printf("NULL   ");
							yyval = newExprNode(TypeK);
							yyval->type = Void;
							yyval->parseName = "type_specifier";
							yyval->attr.name = "empty";
							currType = Void;
						
#line 446 "myparser.c"
		}
		break;
	case 13:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 256 ".\\myparser.y"

							printf("ID_list   ");
							yyval = newStmtNode(CompK);
							p = yyattribute(1 - 3);
							if (p)
							{
								while (p->sibling)
								{
									yyval->child[i] = p;
									i++;
									p = p->sibling;
								}
								yyval->child[i] = p;
								p->sibling = yyattribute(3 - 3);
								yyval->child[i+1] = yyattribute(3 - 3);
							}
							else {
								yyval->child[0] = yyattribute(3 - 3);
							}
							yyval->parseName = "ID_list";
							yyval->attr.name = " ";
						
#line 479 "myparser.c"
			}
		}
		break;
	case 14:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 279 ".\\myparser.y"

							printf("ID_list(assign)   ");
							yyval = newStmtNode(CompK);
							p = yyattribute(1 - 3);
							if (p)
							{
								while (p->sibling)
								{
									yyval->child[i] = p;
									i++;
									p = p->sibling;
								}
								yyval->child[i] = p;
								p->sibling = yyattribute(3 - 3);
								yyval->child[i+1] = yyattribute(3 - 3);
							}
							else {
								yyval->child[0] = yyattribute(3 - 3);
							}
							yyval->parseName = "ID_list";
							yyval->attr.name = " ";					
						
#line 513 "myparser.c"
			}
		}
		break;
	case 15:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 302 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list(assign)   ");
							yyval = yyattribute(1 - 1);
						
#line 530 "myparser.c"
			}
		}
		break;
	case 16:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 308 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("ID_list   ");
							yyattribute(1 - 1)->sibling = NULL;
							yyval = yyattribute(1 - 1);
						
#line 548 "myparser.c"
			}
		}
		break;
	case 17:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 317 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("assign_decl   ");
							yyval = newStmtNode(AssignK);
							yyval->child[0] = yyattribute(1 - 3);
							yyval->child[1] = yyattribute(3 - 3);
							yyval->parseName = "assign_decl";
							yyval->attr.name = "=";
						
#line 569 "myparser.c"
			}
		}
		break;
	case 18:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 329 ".\\myparser.y"

							printf("ID_lookup   ");
							yyval = newExprNode(IdK);
							yyval->parseName = "ID";
							yyval->attr.name = yyattribute(1 - 1)->attr.name;
							yyval->type = currType;
							if (st_lookup(yyattribute(1 - 1)->attr.name) == -1)
								/* 未在表中，则视为新的定义，在表中存储于位置+1 */
								st_insert(yyattribute(1 - 1)->attr.name, line, st_location++, currType);
							else
								/* 已在表中，则增加新的位置 */ 
								st_insert(yyattribute(1 - 1)->attr.name, line, 0, currType);
						
#line 594 "myparser.c"
			}
		}
		break;
	case 19:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 345 ".\\myparser.y"

							printf("ID_get   ");
							yyval = newExprNode(IdK);
							yyval->parseName = "ID";
							yyval->attr.name = yyattribute(1 - 1)->attr.name;
							if (st_lookup(yyattribute(1 - 1)->attr.name) == -1)
								/* 未在表中，报“未定义”错误 */
								printf("Error. %s has not been declared yet.\n", yyattribute(1 - 1)->attr.name);
							else
								st = st_get(yyattribute(1 - 1)->attr.name);
								yyval->type = st->type;
						
#line 618 "myparser.c"
			}
		}
		break;
	case 20:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[7];
			yyinitdebug(yya, 7);
#endif
			{
#line 360 ".\\myparser.y"

							printf("fun_declaration   ");
							yyval = newDeclNode(FunK);
							t = yyattribute(2 - 6);
							t->type = yyattribute(1 - 6)->type;
							yyval->child[0] = yyattribute(1 - 6);
							yyval->child[1] = yyattribute(2 - 6);
							yyval->child[2] = yyattribute(4 - 6);
							yyval->parseName = "fun_declaration";
							yyval->attr.name = " ";
						
#line 641 "myparser.c"
			}
		}
		break;
	case 21:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[7];
			yyinitdebug(yya, 7);
#endif
			{
#line 374 ".\\myparser.y"

							printf("fun_defination   ");
							yyval = newDeclNode(FunK);
							t = yyattribute(2 - 6);
							t->type = yyattribute(1 - 6)->type;
							yyval->child[0] = yyattribute(1 - 6);
							yyval->child[1] = yyattribute(2 - 6);
							yyval->child[2] = yyattribute(4 - 6);
							yyval->child[3] = yyattribute(6 - 6);
							yyval->parseName = "fun_defination";
							yyval->attr.name = yyattribute(2 - 6)->attr.name;
						
#line 665 "myparser.c"
			}
		}
		break;
	case 22:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[3];
			yyinitdebug(yya, 3);
#endif
			{
#line 389 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("params   ");
							yyval = yyattribute(2 - 2);
						
#line 682 "myparser.c"
			}
		}
		break;
	case 23:
		{
#line 395 ".\\myparser.y"

							yyval = newExprNode(TypeK);
							printf("params(empty)   ");
							yyval->parseName = "params";
							yyval->attr.name = "empty";

							// symbol table
						
#line 697 "myparser.c"
		}
		break;
	case 24:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 406 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("param_list   ");
							p = yyattribute(1 - 3);
							while (p->sibling)
							{
								p = p->sibling;
							}
							p->sibling = yyattribute(2 - 3);
							yyval = yyattribute(1 - 3);
						
#line 719 "myparser.c"
			}
		}
		break;
	case 25:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 418 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("param_list   ");
							yyval = yyattribute(1 - 1);					
						
#line 736 "myparser.c"
			}
		}
		break;
	case 26:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[3];
			yyinitdebug(yya, 3);
#endif
			{
#line 426 ".\\myparser.y"

							printf("param   ");
							yyval = newExprNode(ParamK);
							yyval->type = yyattribute(1 - 2)->type;
							yyattribute(2 - 2)->type = yyattribute(1 - 2)->type;
							yyval->child[0] = yyattribute(1 - 2);
							yyval->child[1] = yyattribute(2 - 2);
							yyval->parseName = "param";
							yyval->attr.name = " ";
						
#line 758 "myparser.c"
			}
		}
		break;
	case 27:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[5];
			yyinitdebug(yya, 5);
#endif
			{
#line 437 ".\\myparser.y"

							printf("param   ");
							yyval = newExprNode(ParamK);
							yyval->type = yyattribute(1 - 4)->type;
							yyattribute(2 - 4)->type = yyattribute(1 - 4)->type;
							yyval->child[0] = yyattribute(1 - 4);
							yyval->child[1] = yyattribute(2 - 4);
							yyval->parseName = "param";
							yyval->attr.name = " ";
						
#line 780 "myparser.c"
			}
		}
		break;
	case 28:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[3];
			yyinitdebug(yya, 3);
#endif
			{
#line 450 ".\\myparser.y"

							printf("local_declaration   ");
							yyval = newStmtNode(CompK);
							p = yyattribute(1 - 2);
							i = 0;
							if (p)
							{
								while (p->sibling)
								{
									yyval->child[i] = p;
									i++;
									p = p->sibling;
								}
								yyval->child[i] = p;
								p->sibling = yyattribute(2 - 2);
								yyval->child[i+1] = yyattribute(2 - 2);
							}
							else {
								yyval->child[0] = yyattribute(2 - 2);
							}
							yyval->parseName = "local_declaration";
							yyval->attr.name = " ";
						
#line 815 "myparser.c"
			}
		}
		break;
	case 29:
		{
#line 474 ".\\myparser.y"

							printf("local_declaration_empty   ");
							yyval = newStmtNode(CompK);
							yyval->child[0] = NULL;
							yyval->parseName = "local_declaration_empty";
							yyval->attr.name = " ";
							
							// symbol table
						
#line 831 "myparser.c"
		}
		break;
	case 30:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[3];
			yyinitdebug(yya, 3);
#endif
			{
#line 486 ".\\myparser.y"

							printf("statement_list   ");
							yyval = newStmtNode(CompK);
							p = yyattribute(1 - 2);
							i = 0;
							if (p)
							{
								while (p->sibling)
								{
									yyval->child[i] = p;
									i++;
									p = p->sibling;
								}
								yyval->child[i] = p;
								p->sibling = yyattribute(2 - 2);
								yyval->child[i+1] = yyattribute(2 - 2);
							}
							else {
								yyval->child[0] = yyattribute(2 - 2);
							}
							yyval->parseName = "statement_list";
							yyval->attr.name = " ";
						
#line 865 "myparser.c"
			}
		}
		break;
	case 31:
		{
#line 510 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement_list   ");
							yyval = NULL;
						
#line 877 "myparser.c"
		}
		break;
	case 32:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 518 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							yyval = yyattribute(1 - 1);
						
#line 893 "myparser.c"
			}
		}
		break;
	case 33:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 524 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							yyval = yyattribute(1 - 1);
						
#line 910 "myparser.c"
			}
		}
		break;
	case 34:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 530 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							yyval = yyattribute(1 - 1);
						
#line 927 "myparser.c"
			}
		}
		break;
	case 35:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 536 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							yyval = yyattribute(1 - 1);
						
#line 944 "myparser.c"
			}
		}
		break;
	case 36:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 542 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							yyval = yyattribute(1 - 1);
						
#line 961 "myparser.c"
			}
		}
		break;
	case 37:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 550 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							yyval = yyattribute(1 - 1);
						
#line 978 "myparser.c"
			}
		}
		break;
	case 38:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 556 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							yyval = yyattribute(1 - 1);
						
#line 995 "myparser.c"
			}
		}
		break;
	case 39:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 562 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("statement   ");
							yyval = yyattribute(1 - 1);
						
#line 1012 "myparser.c"
			}
		}
		break;
	case 40:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[3];
			yyinitdebug(yya, 3);
#endif
			{
#line 570 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression_stmt   ");
							yyval = yyattribute(1 - 2);
						
#line 1029 "myparser.c"
			}
		}
		break;
	case 41:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 576 ".\\myparser.y"

							printf("expression_stmt   ");
							yyval = newStmtNode(CompK);
							yyval->child[0] = NULL;
							yyval->parseName = "expression_list_empty";
							yyval->attr.name = "empty";
						
#line 1048 "myparser.c"
			}
		}
		break;
	case 42:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[5];
			yyinitdebug(yya, 5);
#endif
			{
#line 586 ".\\myparser.y"

							printf("compound_stmt   ");
							yyval = newStmtNode(CompK);
							yyval->child[0] = yyattribute(2 - 4);
							yyval->child[1] = yyattribute(3 - 4);
							yyval->parseName = "statement";
							yyval->attr.name = "compound";

							// symbol table
						
#line 1070 "myparser.c"
			}
		}
		break;
	case 43:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[6];
			yyinitdebug(yya, 6);
#endif
			{
#line 599 ".\\myparser.y"

							printf("if_stmt   ");
							yyval = newStmtNode(IfK);
							yyval->child[0] = yyattribute(3 - 5);
							yyval->child[1] = yyattribute(5 - 5);
							yyval->parseName = "statement";
							yyval->attr.name = "if";
						
#line 1090 "myparser.c"
			}
		}
		break;
	case 44:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[8];
			yyinitdebug(yya, 8);
#endif
			{
#line 608 ".\\myparser.y"

							printf("if_else   ");
							yyval = newStmtNode(IfK);
							yyval->child[0] = yyattribute(3 - 7);
							yyval->child[1] = yyattribute(5 - 7);
							yyval->child[2] = yyattribute(7 - 7);
							yyval->parseName = "statement";
							yyval->attr.name = "if&else";
						
#line 1111 "myparser.c"
			}
		}
		break;
	case 45:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[8];
			yyinitdebug(yya, 8);
#endif
			{
#line 620 ".\\myparser.y"

							printf("while_stmt   ");
							yyval = newStmtNode(WhileK);
							yyval->child[0] = yyattribute(3 - 7);
							yyval->child[1] = yyattribute(6 - 7);
							yyval->parseName = "statement";
							yyval->attr.name = "while";
						
#line 1131 "myparser.c"
			}
		}
		break;
	case 46:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[10];
			yyinitdebug(yya, 10);
#endif
			{
#line 631 ".\\myparser.y"

							printf("for_stmt   ");
							yyval = newStmtNode(ForK);
							yyval->child[0] = yyattribute(3 - 9);
							yyval->child[1] = yyattribute(5 - 9);
							yyval->child[2] = yyattribute(7 - 9);
							yyval->child[3] = yyattribute(9 - 9);
							yyval->parseName = "statement";
							yyval->attr.name = "for";
						
#line 1153 "myparser.c"
			}
		}
		break;
	case 47:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 644 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression_list   ");
							yyval = yyattribute(1 - 1);
						
#line 1170 "myparser.c"
			}
		}
		break;
	case 48:
		{
#line 650 ".\\myparser.y"

							printf("expression_list   ");
							yyval = newStmtNode(CompK);
							yyval->child[0] = NULL;
							yyval->parseName = "expression_list_empty";
							yyval->attr.name = "empty";
						
#line 1184 "myparser.c"
		}
		break;
	case 49:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 673 ".\\myparser.y"

							printf("assign_stmt   ");
							yyval = newStmtNode(AssignK);
							yyval->child[0] = yyattribute(1 - 3);
							yyval->child[1] = yyattribute(3 - 3);
							yyval->parseName = "assign_stmt";
							yyval->attr.op = "=";
						
#line 1203 "myparser.c"
			}
		}
		break;
	case 50:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[3];
			yyinitdebug(yya, 3);
#endif
			{
#line 684 ".\\myparser.y"

							printf("return_stmt   ");
							yyval = newStmtNode(ReturnK);
						
#line 1219 "myparser.c"
			}
		}
		break;
	case 51:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 689 ".\\myparser.y"

							printf("return_stmt   ");
							yyval = newStmtNode(ReturnK);
							yyval->child[0] = yyattribute(2 - 3);
							yyval->parseName = "return_stmt";
							yyval->attr.name = " ";
						
#line 1238 "myparser.c"
			}
		}
		break;
	case 52:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 699 ".\\myparser.y"

							printf("expression   ");
							yyval = newExprNode(OpK);
							yyval->child[0] = yyattribute(1 - 3);
							yyval->child[1] = yyattribute(3 - 3);
							yyval->attr.op = yyattribute(2 - 3)->attr.op;
							yyval->type = yyattribute(2 - 3)->type;
							yyval->parseName = "expression";
						
#line 1259 "myparser.c"
			}
		}
		break;
	case 53:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[3];
			yyinitdebug(yya, 3);
#endif
			{
#line 709 ".\\myparser.y"

							printf("NOT   ");
							yyval = newExprNode(OpK);
							yyval->child[0] = yyattribute(2 - 2);
							yyval->attr.op = yyattribute(2 - 2)->attr.op;
							yyval->parseName = "expression";
						
#line 1278 "myparser.c"
			}
		}
		break;
	case 54:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 717 ".\\myparser.y"

							printf("expression   ");
							yyval = newExprNode(OpK);
							yyval->child[0] = yyattribute(1 - 3);
							yyval->child[1] = yyattribute(3 - 3);
							yyval->attr.op = yyattribute(2 - 3)->attr.op;
							yyval->type = yyattribute(1 - 3)->type;
							yyval->parseName = "expression";
						
#line 1299 "myparser.c"
			}
		}
		break;
	case 55:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 727 ".\\myparser.y"

							printf("expression   ");
							yyval = newExprNode(OpK);
							yyval->child[0] = yyattribute(1 - 3);
							yyval->child[1] = yyattribute(3 - 3);
							yyval->attr.op = yyattribute(2 - 3)->attr.op;
							yyval->type = yyattribute(1 - 3)->type;
							yyval->parseName = "expression";
						
#line 1320 "myparser.c"
			}
		}
		break;
	case 56:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 737 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression   ");
							yyval = yyattribute(1 - 1);
						
#line 1337 "myparser.c"
			}
		}
		break;
	case 57:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 743 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("expression   ");
							yyval = yyattribute(2 - 3);
						
#line 1354 "myparser.c"
			}
		}
		break;
	case 58:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 749 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("term   ");
							yyval = yyattribute(1 - 1);
						
#line 1371 "myparser.c"
			}
		}
		break;
	case 59:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 757 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("==   ");
							yyval->parseName = "relop";
							yyval->attr.op = "==";
						
#line 1389 "myparser.c"
			}
		}
		break;
	case 60:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 764 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("!=   ");
							yyval->parseName = "relop";
							yyval->attr.op = "!=";
						
#line 1407 "myparser.c"
			}
		}
		break;
	case 61:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 771 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<=   ");
							yyval->parseName = "relop";
							yyval->attr.op = "<=";
						
#line 1425 "myparser.c"
			}
		}
		break;
	case 62:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 778 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">=   ");
							yyval->parseName = "relop";
							yyval->attr.op = ">=";
						
#line 1443 "myparser.c"
			}
		}
		break;
	case 63:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 785 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<   ");
							yyval->parseName = "relop";
							yyval->attr.op = ">";
						
#line 1461 "myparser.c"
			}
		}
		break;
	case 64:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 792 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">   ");
							yyval->parseName = "relop";
							yyval->attr.op = "<";
						
#line 1479 "myparser.c"
			}
		}
		break;
	case 65:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 799 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("&&   ");
							yyval->parseName = "relop";
							yyval->attr.op = "&&";
						
#line 1497 "myparser.c"
			}
		}
		break;
	case 66:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 806 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("||   ");
							yyval->parseName = "relop";
							yyval->attr.op = "||";
						
#line 1515 "myparser.c"
			}
		}
		break;
	case 67:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 813 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("^   ");
							yyval->parseName = "relop";
							yyval->attr.op = "^";
						
#line 1533 "myparser.c"
			}
		}
		break;
	case 68:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 820 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("<<   ");
							yyval->parseName = "relop";
							yyval->attr.op = "<<";
						
#line 1551 "myparser.c"
			}
		}
		break;
	case 69:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 827 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf(">>   ");
							yyval->parseName = "relop";
							yyval->attr.op = ">>";
						
#line 1569 "myparser.c"
			}
		}
		break;
	case 70:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 836 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("+   ");
							yyval->parseName = "addop";
							yyval->attr.op = "+";
							// $$->type = ADD;
						
#line 1588 "myparser.c"
			}
		}
		break;
	case 71:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 844 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("-   ");
							yyval->parseName = "addop";
							yyval->attr.op = "-";
						
#line 1606 "myparser.c"
			}
		}
		break;
	case 72:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 853 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("*   ");
							yyval->parseName = "mulop";
							yyval->attr.op = "*";
						
#line 1624 "myparser.c"
			}
		}
		break;
	case 73:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 860 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("/   ");
							yyval->parseName = "mulop";
							yyval->attr.op = "/";
						
#line 1642 "myparser.c"
			}
		}
		break;
	case 74:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 869 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							yyval = yyattribute(2 - 3);
						
#line 1659 "myparser.c"
			}
		}
		break;
	case 75:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 875 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("factor   ");
							yyval = yyattribute(1 - 1);
						
#line 1676 "myparser.c"
			}
		}
		break;
	case 76:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 881 ".\\myparser.y"

							printf("factor   ");
							yyval = newExprNode(ConstK);
							yyval->type = Integer;
							yyval->parseName = "NUM_Int";
							yyval->attr.name = yyattribute(1 - 1)->attr.name;
						
#line 1695 "myparser.c"
			}
		}
		break;
	case 77:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 889 ".\\myparser.y"

							printf("factor   ");
							yyval = newExprNode(ConstK);
							yyval->type = Double;
							yyval->parseName = "NUM_Double";
							yyval->attr.name = yyattribute(1 - 1)->attr.name;
						
#line 1714 "myparser.c"
			}
		}
		break;
	case 78:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 897 ".\\myparser.y"

							printf("factor   ");
							yyval = newExprNode(ConstK);
							yyval->type = Integer;
							yyval->parseName = "Char";
							yyval->attr.name = yyattribute(1 - 1)->attr.name;
						
#line 1733 "myparser.c"
			}
		}
		break;
	case 79:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[5];
			yyinitdebug(yya, 5);
#endif
			{
#line 907 ".\\myparser.y"

							printf("fun_call   ");
							yyval = newExprNode(FunK);
							yyval->child[0] = yyattribute(1 - 4);
							yyval->child[1] = yyattribute(3 - 4);
							yyval->parseName = "fun_call";
							yyval->attr.name = yyattribute(1 - 4)->attr.name;
						
#line 1753 "myparser.c"
			}
		}
		break;
	case 80:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 918 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("args   ");
							yyval = yyattribute(1 - 1);
						
#line 1770 "myparser.c"
			}
		}
		break;
	case 81:
		{
#line 924 ".\\myparser.y"

							printf("args_empty   ");
							yyval = newStmtNode(CompK);
							yyval->parseName = "args";
							yyval->attr.name = "empty";
						
#line 1783 "myparser.c"
		}
		break;
	case 82:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[4];
			yyinitdebug(yya, 4);
#endif
			{
#line 933 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("arg_list   ");
							p = yyattribute(1 - 3);
							while (t->sibling)
							{
								t = t->sibling;
							}
							t->sibling = yyattribute(2 - 3);
							yyval = yyattribute(1 - 3);
						
#line 1805 "myparser.c"
			}
		}
		break;
	case 83:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR *yya[2];
			yyinitdebug(yya, 2);
#endif
			{
#line 945 ".\\myparser.y"

							yyval = (TreeNode*) malloc(sizeof(TreeNode));
							printf("arg_list   ");
							yyval = yyattribute(1 - 1);
						
#line 1822 "myparser.c"
			}
		}
		break;
	default:
		yyassert(0);
		break;
	}
}
#ifdef YYDEBUG
YYCONST yysymbol_t YYNEARFAR YYBASED_CODE YYDCDECL yysymbol[] = {
	{ "$end", 0 },
	{ "error", 256 },
	{ "IF", 257 },
	{ "ELSE", 259 },
	{ "WHILE", 260 },
	{ "FOR", 261 },
	{ "RETURN", 266 },
	{ "INT", 267 },
	{ "DOUBLE", 269 },
	{ "CHAR", 270 },
	{ "BOOL", 271 },
	{ "VOID", 272 },
	{ "ID", 273 },
	{ "NUM_Int", 274 },
	{ "NUM_Double", 275 },
	{ "Char", 276 },
	{ "LP", 277 },
	{ "RP", 278 },
	{ "LS", 279 },
	{ "RS", 280 },
	{ "LB", 281 },
	{ "RB", 282 },
	{ "SEMICOLON", 284 },
	{ "COMMA", 285 },
	{ "ASSIGN", 286 },
	{ "L_SHIFT", 287 },
	{ "R_SHIFT", 288 },
	{ "AND", 289 },
	{ "OR", 290 },
	{ "XOR", 291 },
	{ "NOT", 292 },
	{ "EQ", 293 },
	{ "NE", 294 },
	{ "LE", 295 },
	{ "GE", 296 },
	{ "LT", 297 },
	{ "GT", 298 },
	{ "ADD", 299 },
	{ "SUB", 300 },
	{ "MUL", 301 },
	{ "DIV", 302 },
	{ NULL, 0 }
};

YYCONST char *YYCONST YYNEARFAR YYBASED_CODE YYDCDECL yyrule[] = {
	"$accept: program",
	"program: declaration_list",
	"declaration_list: declaration_list declaration",
	"declaration_list:",
	"declaration: var_declaration",
	"declaration: fun_declaration",
	"declaration: fun_defination",
	"var_declaration: type_specifier ID_list SEMICOLON",
	"var_declaration: type_specifier ID LS NUM_Int RS SEMICOLON",
	"type_specifier: INT",
	"type_specifier: CHAR",
	"type_specifier: DOUBLE",
	"type_specifier: BOOL",
	"type_specifier: VOID",
	"type_specifier:",
	"ID_list: ID_list COMMA ID_lookup",
	"ID_list: ID_list COMMA assign_decl",
	"ID_list: assign_decl",
	"ID_list: ID_lookup",
	"assign_decl: ID_lookup ASSIGN expression",
	"ID_lookup: ID",
	"ID_get: ID",
	"fun_declaration: type_specifier ID_lookup LP params RP SEMICOLON",
	"fun_defination: type_specifier ID_lookup LP params RP compound_stmt",
	"params: params param_list",
	"params:",
	"param_list: param_list COMMA param",
	"param_list: param",
	"param: type_specifier ID_lookup",
	"param: type_specifier ID_lookup LS RS",
	"local_declaration: local_declaration var_declaration",
	"local_declaration:",
	"statement_list: statement_list statement",
	"statement_list:",
	"statement: expression_stmt",
	"statement: compound_stmt",
	"statement: if_stmt",
	"statement: while_stmt",
	"statement: for_stmt",
	"statement: assign_stmt",
	"statement: return_stmt",
	"statement: fun_call",
	"expression_stmt: expression SEMICOLON",
	"expression_stmt: SEMICOLON",
	"compound_stmt: LB local_declaration statement_list RB",
	"if_stmt: IF LP expression RP statement",
	"if_stmt: IF LP expression RP statement ELSE statement",
	"while_stmt: WHILE LP expression RP LB statement_list RB",
	"for_stmt: FOR LP expression_list SEMICOLON expression_list SEMICOLON expression_list RP statement_list",
	"expression_list: expression",
	"expression_list:",
	"assign_stmt: ID_get ASSIGN expression",
	"return_stmt: RETURN SEMICOLON",
	"return_stmt: RETURN expression SEMICOLON",
	"expression: expression relop expression",
	"expression: NOT expression",
	"expression: expression addop expression",
	"expression: expression mulop expression",
	"expression: expression",
	"expression: LP expression RP",
	"expression: factor",
	"relop: EQ",
	"relop: NE",
	"relop: LE",
	"relop: GE",
	"relop: LT",
	"relop: GT",
	"relop: AND",
	"relop: OR",
	"relop: XOR",
	"relop: L_SHIFT",
	"relop: R_SHIFT",
	"addop: ADD",
	"addop: SUB",
	"mulop: MUL",
	"mulop: DIV",
	"factor: LP expression RP",
	"factor: ID_get",
	"factor: NUM_Int",
	"factor: NUM_Double",
	"factor: Char",
	"fun_call: ID_get LP args RP",
	"args: arg_list",
	"args:",
	"arg_list: arg_list COMMA expression",
	"arg_list: expression"
};
#endif

YYCONST yyreduction_t YYNEARFAR YYBASED_CODE YYDCDECL yyreduction[] = {
	{ 0, 1, -1 },
	{ 1, 1, 0 },
	{ 2, 2, 1 },
	{ 2, 0, 2 },
	{ 3, 1, 3 },
	{ 3, 1, 4 },
	{ 3, 1, 5 },
	{ 4, 3, 6 },
	{ 4, 6, -1 },
	{ 5, 1, 7 },
	{ 5, 1, 8 },
	{ 5, 1, 9 },
	{ 5, 1, 10 },
	{ 5, 1, 11 },
	{ 5, 0, 12 },
	{ 6, 3, 13 },
	{ 6, 3, 14 },
	{ 6, 1, 15 },
	{ 6, 1, 16 },
	{ 7, 3, 17 },
	{ 8, 1, 18 },
	{ 9, 1, 19 },
	{ 10, 6, 20 },
	{ 11, 6, 21 },
	{ 12, 2, 22 },
	{ 12, 0, 23 },
	{ 13, 3, 24 },
	{ 13, 1, 25 },
	{ 14, 2, 26 },
	{ 14, 4, 27 },
	{ 15, 2, 28 },
	{ 15, 0, 29 },
	{ 16, 2, 30 },
	{ 16, 0, 31 },
	{ 17, 1, 32 },
	{ 17, 1, 33 },
	{ 17, 1, 34 },
	{ 17, 1, 35 },
	{ 17, 1, 36 },
	{ 17, 1, 37 },
	{ 17, 1, 38 },
	{ 17, 1, 39 },
	{ 18, 2, 40 },
	{ 18, 1, 41 },
	{ 19, 4, 42 },
	{ 20, 5, 43 },
	{ 20, 7, 44 },
	{ 21, 7, 45 },
	{ 22, 9, 46 },
	{ 23, 1, 47 },
	{ 23, 0, 48 },
	{ 24, 3, 49 },
	{ 25, 2, 50 },
	{ 25, 3, 51 },
	{ 26, 3, 52 },
	{ 26, 2, 53 },
	{ 26, 3, 54 },
	{ 26, 3, 55 },
	{ 26, 1, 56 },
	{ 26, 3, 57 },
	{ 26, 1, 58 },
	{ 27, 1, 59 },
	{ 27, 1, 60 },
	{ 27, 1, 61 },
	{ 27, 1, 62 },
	{ 27, 1, 63 },
	{ 27, 1, 64 },
	{ 27, 1, 65 },
	{ 27, 1, 66 },
	{ 27, 1, 67 },
	{ 27, 1, 68 },
	{ 27, 1, 69 },
	{ 28, 1, 70 },
	{ 28, 1, 71 },
	{ 29, 1, 72 },
	{ 29, 1, 73 },
	{ 30, 3, 74 },
	{ 30, 1, 75 },
	{ 30, 1, 76 },
	{ 30, 1, 77 },
	{ 30, 1, 78 },
	{ 31, 4, 79 },
	{ 32, 1, 80 },
	{ 32, 0, 81 },
	{ 33, 3, 82 },
	{ 33, 1, 83 }
};

int YYNEAR YYDCDECL yytokenaction_size = 244;
YYCONST yytokenaction_t YYNEARFAR YYBASED_CODE YYDCDECL yytokenaction[] = {
	{ 105, YYAT_SHIFT, 114 },
	{ 37, YYAT_SHIFT, 62 },
	{ 127, YYAT_SHIFT, 128 },
	{ 26, YYAT_SHIFT, 3 },
	{ 37, YYAT_SHIFT, 63 },
	{ 26, YYAT_SHIFT, 4 },
	{ 26, YYAT_SHIFT, 5 },
	{ 26, YYAT_SHIFT, 6 },
	{ 26, YYAT_SHIFT, 7 },
	{ 105, YYAT_SHIFT, 43 },
	{ 105, YYAT_SHIFT, 44 },
	{ 105, YYAT_SHIFT, 45 },
	{ 105, YYAT_SHIFT, 46 },
	{ 105, YYAT_SHIFT, 47 },
	{ 26, YYAT_SHIFT, 37 },
	{ 105, YYAT_SHIFT, 48 },
	{ 105, YYAT_SHIFT, 49 },
	{ 105, YYAT_SHIFT, 50 },
	{ 105, YYAT_SHIFT, 51 },
	{ 105, YYAT_SHIFT, 52 },
	{ 105, YYAT_SHIFT, 53 },
	{ 105, YYAT_SHIFT, 54 },
	{ 105, YYAT_SHIFT, 55 },
	{ 105, YYAT_SHIFT, 56 },
	{ 105, YYAT_SHIFT, 57 },
	{ 121, YYAT_SHIFT, 43 },
	{ 121, YYAT_SHIFT, 44 },
	{ 121, YYAT_SHIFT, 45 },
	{ 121, YYAT_SHIFT, 46 },
	{ 121, YYAT_SHIFT, 47 },
	{ 122, YYAT_ERROR, 0 },
	{ 121, YYAT_SHIFT, 48 },
	{ 121, YYAT_SHIFT, 49 },
	{ 121, YYAT_SHIFT, 50 },
	{ 121, YYAT_SHIFT, 51 },
	{ 121, YYAT_SHIFT, 52 },
	{ 121, YYAT_SHIFT, 53 },
	{ 121, YYAT_SHIFT, 54 },
	{ 121, YYAT_SHIFT, 55 },
	{ 121, YYAT_SHIFT, 56 },
	{ 121, YYAT_SHIFT, 57 },
	{ 112, YYAT_SHIFT, 43 },
	{ 112, YYAT_SHIFT, 44 },
	{ 112, YYAT_SHIFT, 45 },
	{ 112, YYAT_SHIFT, 46 },
	{ 112, YYAT_SHIFT, 47 },
	{ 120, YYAT_SHIFT, 124 },
	{ 112, YYAT_SHIFT, 48 },
	{ 112, YYAT_SHIFT, 49 },
	{ 112, YYAT_SHIFT, 50 },
	{ 112, YYAT_SHIFT, 51 },
	{ 112, YYAT_SHIFT, 52 },
	{ 112, YYAT_SHIFT, 53 },
	{ 112, YYAT_SHIFT, 54 },
	{ 112, YYAT_SHIFT, 55 },
	{ 112, YYAT_SHIFT, 56 },
	{ 112, YYAT_SHIFT, 57 },
	{ 109, YYAT_SHIFT, 43 },
	{ 109, YYAT_SHIFT, 44 },
	{ 109, YYAT_SHIFT, 45 },
	{ 109, YYAT_SHIFT, 46 },
	{ 109, YYAT_SHIFT, 47 },
	{ 118, YYAT_SHIFT, 122 },
	{ 109, YYAT_SHIFT, 48 },
	{ 109, YYAT_SHIFT, 49 },
	{ 109, YYAT_SHIFT, 50 },
	{ 109, YYAT_SHIFT, 51 },
	{ 109, YYAT_SHIFT, 52 },
	{ 109, YYAT_SHIFT, 53 },
	{ 109, YYAT_SHIFT, 54 },
	{ 109, YYAT_SHIFT, 55 },
	{ 109, YYAT_SHIFT, 56 },
	{ 109, YYAT_SHIFT, 57 },
	{ 106, YYAT_SHIFT, 43 },
	{ 106, YYAT_SHIFT, 44 },
	{ 106, YYAT_SHIFT, 45 },
	{ 106, YYAT_SHIFT, 46 },
	{ 106, YYAT_SHIFT, 47 },
	{ 114, YYAT_SHIFT, 119 },
	{ 106, YYAT_SHIFT, 48 },
	{ 106, YYAT_SHIFT, 49 },
	{ 106, YYAT_SHIFT, 50 },
	{ 106, YYAT_SHIFT, 51 },
	{ 106, YYAT_SHIFT, 52 },
	{ 106, YYAT_SHIFT, 53 },
	{ 106, YYAT_SHIFT, 54 },
	{ 106, YYAT_SHIFT, 55 },
	{ 106, YYAT_SHIFT, 56 },
	{ 106, YYAT_SHIFT, 57 },
	{ 70, YYAT_SHIFT, 43 },
	{ 70, YYAT_SHIFT, 44 },
	{ 70, YYAT_SHIFT, 45 },
	{ 70, YYAT_SHIFT, 46 },
	{ 70, YYAT_SHIFT, 47 },
	{ 111, YYAT_SHIFT, 117 },
	{ 70, YYAT_SHIFT, 48 },
	{ 70, YYAT_SHIFT, 49 },
	{ 70, YYAT_SHIFT, 50 },
	{ 70, YYAT_SHIFT, 51 },
	{ 70, YYAT_SHIFT, 52 },
	{ 70, YYAT_SHIFT, 53 },
	{ 70, YYAT_SHIFT, 54 },
	{ 70, YYAT_SHIFT, 55 },
	{ 70, YYAT_SHIFT, 56 },
	{ 70, YYAT_SHIFT, 57 },
	{ 69, YYAT_SHIFT, 43 },
	{ 69, YYAT_SHIFT, 44 },
	{ 69, YYAT_SHIFT, 45 },
	{ 69, YYAT_SHIFT, 46 },
	{ 69, YYAT_SHIFT, 47 },
	{ 110, YYAT_SHIFT, 116 },
	{ 69, YYAT_SHIFT, 48 },
	{ 69, YYAT_SHIFT, 49 },
	{ 69, YYAT_SHIFT, 50 },
	{ 69, YYAT_SHIFT, 51 },
	{ 69, YYAT_SHIFT, 52 },
	{ 69, YYAT_SHIFT, 53 },
	{ 69, YYAT_SHIFT, 54 },
	{ 69, YYAT_SHIFT, 55 },
	{ 69, YYAT_SHIFT, 56 },
	{ 69, YYAT_SHIFT, 57 },
	{ 68, YYAT_SHIFT, 43 },
	{ 68, YYAT_SHIFT, 44 },
	{ 68, YYAT_SHIFT, 45 },
	{ 68, YYAT_SHIFT, 46 },
	{ 68, YYAT_SHIFT, 47 },
	{ 107, YYAT_SHIFT, 115 },
	{ 68, YYAT_SHIFT, 48 },
	{ 68, YYAT_SHIFT, 49 },
	{ 68, YYAT_SHIFT, 50 },
	{ 68, YYAT_SHIFT, 51 },
	{ 68, YYAT_SHIFT, 52 },
	{ 68, YYAT_SHIFT, 53 },
	{ 68, YYAT_SHIFT, 54 },
	{ 68, YYAT_SHIFT, 55 },
	{ 68, YYAT_SHIFT, 56 },
	{ 68, YYAT_SHIFT, 57 },
	{ 33, YYAT_SHIFT, 43 },
	{ 33, YYAT_SHIFT, 44 },
	{ 33, YYAT_SHIFT, 45 },
	{ 33, YYAT_SHIFT, 46 },
	{ 33, YYAT_SHIFT, 47 },
	{ 104, YYAT_SHIFT, 113 },
	{ 33, YYAT_SHIFT, 48 },
	{ 33, YYAT_SHIFT, 49 },
	{ 33, YYAT_SHIFT, 50 },
	{ 33, YYAT_SHIFT, 51 },
	{ 33, YYAT_SHIFT, 52 },
	{ 33, YYAT_SHIFT, 53 },
	{ 33, YYAT_SHIFT, 54 },
	{ 33, YYAT_SHIFT, 55 },
	{ 33, YYAT_SHIFT, 56 },
	{ 33, YYAT_SHIFT, 57 },
	{ 129, YYAT_SHIFT, 79 },
	{ 100, YYAT_ERROR, 0 },
	{ 123, YYAT_SHIFT, 79 },
	{ 129, YYAT_SHIFT, 80 },
	{ 129, YYAT_SHIFT, 81 },
	{ 123, YYAT_SHIFT, 80 },
	{ 123, YYAT_SHIFT, 81 },
	{ 100, YYAT_SHIFT, 108 },
	{ 88, YYAT_SHIFT, 101 },
	{ 129, YYAT_SHIFT, 82 },
	{ 66, YYAT_SHIFT, 3 },
	{ 123, YYAT_SHIFT, 82 },
	{ 66, YYAT_SHIFT, 4 },
	{ 66, YYAT_SHIFT, 5 },
	{ 66, YYAT_SHIFT, 6 },
	{ 66, YYAT_SHIFT, 7 },
	{ 129, YYAT_SHIFT, 27 },
	{ 129, YYAT_SHIFT, 28 },
	{ 129, YYAT_SHIFT, 29 },
	{ 129, YYAT_SHIFT, 30 },
	{ 129, YYAT_SHIFT, 31 },
	{ 14, YYAT_SHIFT, 18 },
	{ 14, YYAT_SHIFT, 19 },
	{ 82, YYAT_SHIFT, 99 },
	{ 129, YYAT_SHIFT, 62 },
	{ 81, YYAT_SHIFT, 98 },
	{ 123, YYAT_SHIFT, 62 },
	{ 123, YYAT_SHIFT, 126 },
	{ 80, YYAT_SHIFT, 97 },
	{ 123, YYAT_SHIFT, 84 },
	{ 124, YYAT_SHIFT, 27 },
	{ 124, YYAT_SHIFT, 28 },
	{ 124, YYAT_SHIFT, 29 },
	{ 124, YYAT_SHIFT, 30 },
	{ 124, YYAT_SHIFT, 31 },
	{ 116, YYAT_SHIFT, 27 },
	{ 116, YYAT_SHIFT, 28 },
	{ 116, YYAT_SHIFT, 29 },
	{ 116, YYAT_SHIFT, 30 },
	{ 116, YYAT_SHIFT, 31 },
	{ 115, YYAT_SHIFT, 27 },
	{ 115, YYAT_SHIFT, 28 },
	{ 115, YYAT_SHIFT, 29 },
	{ 115, YYAT_SHIFT, 30 },
	{ 115, YYAT_SHIFT, 31 },
	{ 79, YYAT_SHIFT, 96 },
	{ 90, YYAT_SHIFT, 102 },
	{ 15, YYAT_SHIFT, 20 },
	{ 78, YYAT_SHIFT, 21 },
	{ 124, YYAT_SHIFT, 32 },
	{ 76, YYAT_SHIFT, 83 },
	{ 74, YYAT_SHIFT, 13 },
	{ 72, YYAT_SHIFT, 77 },
	{ 65, YYAT_SHIFT, 72 },
	{ 116, YYAT_SHIFT, 32 },
	{ 90, YYAT_SHIFT, 103 },
	{ 15, YYAT_SHIFT, 21 },
	{ 41, YYAT_SHIFT, 67 },
	{ 39, YYAT_SHIFT, 66 },
	{ 115, YYAT_SHIFT, 32 },
	{ 102, YYAT_SHIFT, 27 },
	{ 102, YYAT_SHIFT, 28 },
	{ 102, YYAT_SHIFT, 29 },
	{ 102, YYAT_SHIFT, 30 },
	{ 102, YYAT_SHIFT, 31 },
	{ 98, YYAT_SHIFT, 27 },
	{ 98, YYAT_SHIFT, 28 },
	{ 98, YYAT_SHIFT, 29 },
	{ 98, YYAT_SHIFT, 30 },
	{ 98, YYAT_SHIFT, 31 },
	{ 71, YYAT_SHIFT, 3 },
	{ 38, YYAT_SHIFT, 23 },
	{ 71, YYAT_SHIFT, 4 },
	{ 71, YYAT_SHIFT, 5 },
	{ 71, YYAT_SHIFT, 6 },
	{ 71, YYAT_SHIFT, 7 },
	{ 71, YYAT_REDUCE, 14 },
	{ 36, YYAT_SHIFT, 61 },
	{ 24, YYAT_SHIFT, 21 },
	{ 102, YYAT_SHIFT, 32 },
	{ 22, YYAT_SHIFT, 36 },
	{ 17, YYAT_SHIFT, 22 },
	{ 13, YYAT_SHIFT, 17 },
	{ 2, YYAT_SHIFT, 3 },
	{ 98, YYAT_SHIFT, 32 },
	{ 2, YYAT_SHIFT, 4 },
	{ 2, YYAT_SHIFT, 5 },
	{ 2, YYAT_SHIFT, 6 },
	{ 2, YYAT_SHIFT, 7 },
	{ 2, YYAT_REDUCE, 14 },
	{ 1, YYAT_ACCEPT, 0 }
};

YYCONST yystateaction_t YYNEARFAR YYBASED_CODE YYDCDECL yystateaction[] = {
	{ 0, 0, YYAT_REDUCE, 3 },
	{ 243, 1, YYAT_ERROR, 0 },
	{ -31, 1, YYAT_REDUCE, 1 },
	{ 0, 0, YYAT_REDUCE, 9 },
	{ 0, 0, YYAT_REDUCE, 11 },
	{ 0, 0, YYAT_REDUCE, 10 },
	{ 0, 0, YYAT_REDUCE, 12 },
	{ 0, 0, YYAT_REDUCE, 13 },
	{ 0, 0, YYAT_DEFAULT, 74 },
	{ 0, 0, YYAT_REDUCE, 5 },
	{ 0, 0, YYAT_REDUCE, 2 },
	{ 0, 0, YYAT_REDUCE, 4 },
	{ 0, 0, YYAT_REDUCE, 6 },
	{ -44, 1, YYAT_REDUCE, 20 },
	{ -110, 1, YYAT_ERROR, 0 },
	{ -77, 1, YYAT_REDUCE, 18 },
	{ 0, 0, YYAT_REDUCE, 17 },
	{ -40, 1, YYAT_ERROR, 0 },
	{ 0, 0, YYAT_REDUCE, 7 },
	{ 0, 0, YYAT_DEFAULT, 38 },
	{ 0, 0, YYAT_REDUCE, 25 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ -47, 1, YYAT_ERROR, 0 },
	{ 0, 0, YYAT_REDUCE, 20 },
	{ -55, 1, YYAT_REDUCE, 15 },
	{ 0, 0, YYAT_REDUCE, 16 },
	{ -264, 1, YYAT_REDUCE, 14 },
	{ 0, 0, YYAT_REDUCE, 21 },
	{ 0, 0, YYAT_REDUCE, 78 },
	{ 0, 0, YYAT_REDUCE, 79 },
	{ 0, 0, YYAT_REDUCE, 80 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ -150, 1, YYAT_REDUCE, 19 },
	{ 0, 0, YYAT_REDUCE, 77 },
	{ 0, 0, YYAT_REDUCE, 60 },
	{ -54, 1, YYAT_ERROR, 0 },
	{ -280, 1, YYAT_ERROR, 0 },
	{ -49, 1, YYAT_ERROR, 0 },
	{ -74, 1, YYAT_REDUCE, 24 },
	{ 0, 0, YYAT_REDUCE, 27 },
	{ -68, 1, YYAT_DEFAULT, 105 },
	{ 0, 0, YYAT_REDUCE, 55 },
	{ 0, 0, YYAT_REDUCE, 70 },
	{ 0, 0, YYAT_REDUCE, 71 },
	{ 0, 0, YYAT_REDUCE, 67 },
	{ 0, 0, YYAT_REDUCE, 68 },
	{ 0, 0, YYAT_REDUCE, 69 },
	{ 0, 0, YYAT_REDUCE, 61 },
	{ 0, 0, YYAT_REDUCE, 62 },
	{ 0, 0, YYAT_REDUCE, 63 },
	{ 0, 0, YYAT_REDUCE, 64 },
	{ 0, 0, YYAT_REDUCE, 65 },
	{ 0, 0, YYAT_REDUCE, 66 },
	{ 0, 0, YYAT_REDUCE, 72 },
	{ 0, 0, YYAT_REDUCE, 73 },
	{ 0, 0, YYAT_REDUCE, 74 },
	{ 0, 0, YYAT_REDUCE, 75 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ 0, 0, YYAT_REDUCE, 8 },
	{ 0, 0, YYAT_REDUCE, 31 },
	{ 0, 0, YYAT_REDUCE, 22 },
	{ 0, 0, YYAT_REDUCE, 23 },
	{ -73, 1, YYAT_REDUCE, 28 },
	{ -104, 1, YYAT_REDUCE, 14 },
	{ 0, 0, YYAT_REDUCE, 59 },
	{ -166, 1, YYAT_REDUCE, 54 },
	{ -182, 1, YYAT_REDUCE, 56 },
	{ -198, 1, YYAT_REDUCE, 57 },
	{ -44, 1, YYAT_REDUCE, 33 },
	{ -75, 1, YYAT_ERROR, 0 },
	{ 0, 0, YYAT_REDUCE, 26 },
	{ -69, 1, YYAT_ERROR, 0 },
	{ 0, 0, YYAT_REDUCE, 30 },
	{ -79, 1, YYAT_DEFAULT, 123 },
	{ 0, 0, YYAT_REDUCE, 29 },
	{ -85, 1, YYAT_REDUCE, 18 },
	{ -79, 1, YYAT_ERROR, 0 },
	{ -96, 1, YYAT_ERROR, 0 },
	{ -99, 1, YYAT_ERROR, 0 },
	{ -108, 1, YYAT_DEFAULT, 116 },
	{ 0, 0, YYAT_REDUCE, 44 },
	{ 0, 0, YYAT_REDUCE, 43 },
	{ 0, 0, YYAT_REDUCE, 32 },
	{ 0, 0, YYAT_REDUCE, 41 },
	{ 0, 0, YYAT_REDUCE, 36 },
	{ -123, 1, YYAT_DEFAULT, 100 },
	{ 0, 0, YYAT_REDUCE, 38 },
	{ -78, 1, YYAT_REDUCE, 77 },
	{ 0, 0, YYAT_REDUCE, 35 },
	{ 0, 0, YYAT_REDUCE, 34 },
	{ 0, 0, YYAT_REDUCE, 39 },
	{ 0, 0, YYAT_REDUCE, 40 },
	{ 0, 0, YYAT_REDUCE, 37 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ -55, 1, YYAT_REDUCE, 50 },
	{ 0, 0, YYAT_REDUCE, 52 },
	{ -124, 1, YYAT_DEFAULT, 105 },
	{ 0, 0, YYAT_REDUCE, 42 },
	{ -60, 1, YYAT_REDUCE, 83 },
	{ 0, 0, YYAT_DEFAULT, 116 },
	{ -136, 1, YYAT_DEFAULT, 105 },
	{ -278, 1, YYAT_ERROR, 0 },
	{ -214, 1, YYAT_REDUCE, 49 },
	{ -158, 1, YYAT_ERROR, 0 },
	{ 0, 0, YYAT_REDUCE, 53 },
	{ -230, 1, YYAT_REDUCE, 58 },
	{ -175, 1, YYAT_REDUCE, 82 },
	{ -184, 1, YYAT_ERROR, 0 },
	{ -246, 1, YYAT_REDUCE, 51 },
	{ 0, 0, YYAT_DEFAULT, 122 },
	{ -203, 1, YYAT_ERROR, 0 },
	{ -80, 1, YYAT_REDUCE, 50 },
	{ -85, 1, YYAT_ERROR, 0 },
	{ 0, 0, YYAT_REDUCE, 81 },
	{ -197, 1, YYAT_REDUCE, 45 },
	{ 0, 0, YYAT_REDUCE, 33 },
	{ -238, 1, YYAT_ERROR, 0 },
	{ -262, 1, YYAT_REDUCE, 58 },
	{ -252, 1, YYAT_DEFAULT, 123 },
	{ -102, 1, YYAT_DEFAULT, 116 },
	{ -90, 1, YYAT_REDUCE, 50 },
	{ 0, 0, YYAT_REDUCE, 46 },
	{ 0, 0, YYAT_REDUCE, 47 },
	{ -276, 1, YYAT_ERROR, 0 },
	{ 0, 0, YYAT_REDUCE, 33 },
	{ -104, 1, YYAT_REDUCE, 48 }
};

int YYNEAR YYDCDECL yynontermgoto_size = 63;

YYCONST yynontermgoto_t YYNEARFAR YYBASED_CODE YYDCDECL yynontermgoto[] = {
	{ 129, 90 },
	{ 128, 129 },
	{ 71, 75 },
	{ 71, 74 },
	{ 124, 34 },
	{ 121, 58 },
	{ 121, 59 },
	{ 121, 60 },
	{ 129, 85 },
	{ 129, 92 },
	{ 129, 91 },
	{ 129, 87 },
	{ 129, 95 },
	{ 129, 89 },
	{ 71, 76 },
	{ 129, 93 },
	{ 129, 94 },
	{ 129, 88 },
	{ 124, 127 },
	{ 26, 39 },
	{ 26, 40 },
	{ 124, 106 },
	{ 129, 86 },
	{ 102, 109 },
	{ 122, 125 },
	{ 124, 35 },
	{ 2, 10 },
	{ 2, 11 },
	{ 2, 8 },
	{ 102, 111 },
	{ 102, 110 },
	{ 66, 38 },
	{ 119, 123 },
	{ 2, 9 },
	{ 2, 12 },
	{ 74, 14 },
	{ 74, 16 },
	{ 74, 78 },
	{ 116, -1 },
	{ 115, 120 },
	{ 66, 73 },
	{ 116, 121 },
	{ 19, 25 },
	{ 19, 24 },
	{ 0, 1 },
	{ 0, 2 },
	{ 113, 118 },
	{ 103, 112 },
	{ 98, 107 },
	{ 97, 105 },
	{ 96, 104 },
	{ 82, 100 },
	{ 62, 71 },
	{ 60, 70 },
	{ 59, 69 },
	{ 58, 68 },
	{ 38, 65 },
	{ 37, 64 },
	{ 32, 42 },
	{ 31, 41 },
	{ 21, 33 },
	{ 20, 26 },
	{ 8, 15 }
};

YYCONST yystategoto_t YYNEARFAR YYBASED_CODE YYDCDECL yystategoto[] = {
	{ 43, -1 },
	{ 0, -1 },
	{ 23, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 54, 74 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 35, -1 },
	{ 49, -1 },
	{ 34, 116 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 6, 66 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 33, 116 },
	{ 32, 116 },
	{ 0, 121 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 38, -1 },
	{ 48, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, 121 },
	{ 0, 121 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 29, 116 },
	{ 28, 116 },
	{ 27, 116 },
	{ 0, -1 },
	{ 37, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 26, -1 },
	{ 0, -1 },
	{ 0, 121 },
	{ 0, 121 },
	{ 0, 121 },
	{ -2, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 29, -1 },
	{ 0, -1 },
	{ 0, 129 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 25, 116 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, 121 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 24, 116 },
	{ 23, 116 },
	{ 25, 124 },
	{ 0, -1 },
	{ 0, 121 },
	{ 0, -1 },
	{ -3, 116 },
	{ 21, 116 },
	{ 0, 121 },
	{ 0, 121 },
	{ 0, 121 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, 121 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, 121 },
	{ 29, 129 },
	{ 0, -1 },
	{ 16, 124 },
	{ 15, 124 },
	{ 0, -1 },
	{ 0, -1 },
	{ 16, -1 },
	{ 0, -1 },
	{ -22, -1 },
	{ 7, 129 },
	{ 0, 129 },
	{ -5, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ 0, -1 },
	{ -15, -1 },
	{ -9, 116 }
};

YYCONST yydestructor_t YYNEARFAR *YYNEAR YYDCDECL yydestructorptr = NULL;

YYCONST yytokendest_t YYNEARFAR *YYNEAR YYDCDECL yytokendestptr = NULL;
int YYNEAR YYDCDECL yytokendest_size = 0;

YYCONST yytokendestbase_t YYNEARFAR *YYNEAR YYDCDECL yytokendestbaseptr = NULL;
int YYNEAR YYDCDECL yytokendestbase_size = 0;
#line 952 ".\\myparser.y"


/////////////////////////////////////////////////////////////////////////////
// programs section

int main(void)
{
	while (1) {
		line = 1;
		st_location = 0;

		char* filename;	// 打开要读取的文本文件
		filename = (char*) malloc(40);
		printf("请输入编译代码文件名: ");
		scanf("%s", filename);
		yyin = fopen(filename, "r");
		if (yyin == NULL)	// 打开文件，并判断是否有打开错误
		{
		    printf("打开文件 %s 出现异常. \n", filename);
		    return 0;
		}
		printf("文件打开成功.\n\n");
	
		printf("翻译模式顺序追踪: \n");
		p = (TreeNode*) malloc(sizeof(TreeNode));
		t = (TreeNode*) malloc(sizeof(TreeNode));
		st = (BucketList) malloc(sizeof(struct BucketListRec));
		yyparse();

		printf("\n\n类型检查开始:\n");
		typeCheck(savedTree);

		printf("\n\n语法树生成如下:\n");
		printTree(savedTree);	// 打印树

		// printf("\n\n符号表生成如下:\n");
		// printSymTab();	// 打印符号表
		
		fclose(yyin);
		free(filename);
		
		printf("\n\n---------------------------------------------------------------\n\n");
	}
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

