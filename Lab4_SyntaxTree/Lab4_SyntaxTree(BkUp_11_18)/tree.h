#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
// #include "myparser.h"


#ifndef FALSE
#define FALSE 0
#endif

#ifndef TRUE
#define TRUE 1
#endif

// int lineno = 0; 	/* source line number for listing */    lineno是ParGen自带的，这样会重定义
typedef int TokenType;
// typedef enum { IF, ELSE, WHILE, FOR, SWITCH, CASE, BREAK, DEFAULT, RETURN, INT, FLOAT, DOUBLE, CHAR, BOOL, VOID, LP, RP, LS, RS, LB, RB, COLON, SEMICOLON, COMMA, ASSIGN, EQ, NE, LE, GE, LT, GT, ADD, SUB, MUL, DIV } TokenType;

// 语法分析树
typedef enum {StmtK=0, ExprK, DeclK} NodeKind;
typedef enum {CompK=0, IfK, WhileK, ForK, ReadK, WriteK, AssignK, ReturnK} StmtKind;
typedef enum {TypeK=0, ParamK, OpK, ConstK, IdK, CompareK, LogicK, ShiftK} ExprKind;
typedef enum {Integer=0, Charactor, Float, Bool, Void} ExprType;
typedef enum {VarK=0, ArrayK, FunK} DeclKind;

#define MAXCHILDREN 4

typedef struct treeNode
{ 
	struct treeNode* child[MAXCHILDREN];
	struct treeNode* sibling;
	int lineno;
	NodeKind nodekind;
	union {StmtKind stmt; ExprKind expr; DeclKind decl; } kind;
	union {TokenType op; int val; char* name; } attr;	// Symbal Table
	ExprType type; /* for type checking of exprs 类型检查 */
	int nodenum;
} TreeNode;

TreeNode* newStmtNode(StmtKind kind);
TreeNode* newExprNode(ExprKind kind);
TreeNode* newDeclNode(DeclKind kind);

void printTree(TreeNode* savedTree);