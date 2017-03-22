#pragma once

typedef enum
{
	ENDFILE,ERROR,
	IF,ELSE,INT,RETURN,VOID,WHILE,	//关键字
	ID,NUM,
	ASSIGN,EQ,LT,PLUS,MINUS,TIMES,OVER,LPAREN,RPAREN,SEMI,BT,LQ,BQ,
	UEQ,DOU,LZGH,RZGH,LDGH,RDGH,	//特殊字符
}   TokenType;

// 语法分析树
typedef enum {StmtK, ExprK, DeclK} NodeKind;
typedef enum {IfK, WhileK, ForK, AssignK, ReadK, WriteK} StmtKind;
typedef enum {TypeK, ParamK, OpK, ConstK, IdK, ReturnK} ExprKind;
typedef enum {Integer, Charactor, Float, Boolean, Void} ExprType;
typedef enum {VarK, FunK} DeclKind;

#define MAXCHILDREN 3

typedef struct treeNode
{ 
	struct treeNode* child[MAXCHILDREN];
	struct treeNode* sibling;
	int lineno;
	NodeKind nodekind;
	union { StmtKind stmt; ExprKind expr; DeclKind decl} kind;
	union { TokenType op; int val; char* name; } attr;	// Symbal Table
	ExprType type; /* for type checking of exps */
} TreeNode;