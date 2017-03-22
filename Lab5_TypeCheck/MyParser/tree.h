
#include <ctype.h>
#include <stdio.h>

#ifndef FALSE
#define FALSE 0
#endif

#ifndef TRUE
#define TRUE 1
#endif

int lineno = 0;	/* source line number for listing */
int nodecount = 0;

typedef enum
{
	ENDFILE,ERROR,
	IF,ELSE,INT,RETURN,VOID,WHILE,	//关键字
	ID,NUM,
	ASSIGN,EQ,LT,PLUS,MINUS,TIMES,OVER,LPAREN,RPAREN,SEMI,BT,LQ,BQ,
	UEQ,DOU,LZGH,RZGH,LDGH,RDGH,	//特殊字符
} TokenType;

// 语法分析树
typedef enum {StmtK, ExprK, DeclK} NodeKind;
typedef enum {IfK, WhileK, ForK, ReadK, WriteK, ReturnK} StmtKind;
typedef enum {TypeK, ParamK, OpK, AssignK, ConstK, IdK, CompareK, LogicK, ShiftK} ExprKind;
typedef enum {Integer, Charactor, Float, Boolean, Void} ExprType;
typedef enum {VarK, ArrayK, FunK} DeclKind;

#define MAXCHILDREN 4

typedef struct treeNode
{ 
	struct treeNode* child[MAXCHILDREN];
	struct treeNode* sibling;
	int lineno;
	NodeKind nodekind;
	union { StmtKind stmt; ExprKind expr; DeclKind decl} kind;
	union { TokenType op; int val; char* name; } attr;	// Symbal Table
	ExprType type; /* for type checking of exps 类型检查 */
	int nodenum;
} TreeNode;

TreeNode* newStmtNode(StmtKind kind);
TreeNode* newExprNode(ExprKind kind);
TreeNode* newDeclNode(DeclKind kind);

void printTree(TreeNode* savedTree);