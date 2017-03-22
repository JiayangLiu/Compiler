#pragma once

typedef enum {
	ID = 0,
	FID
}Token;
typedef enum {
	NOTYPE=0,
	INTEGER ,
	CHARACTOR,
	FLOAT,
}Type;
typedef enum {
	STMTNODE = 0,
	EXPRNODE,
	DECLNODE
}NodeKind;
typedef enum {
	IFSTMT = 0,
	WHILESTMT,
	FORSTMT,
	INSTMT,
	OUTSTMT,
	RETURNSTMT
}StmtKind;
typedef enum {
	OPEXPR = 0,
	COMPEXPR,
	ASSIGNEXPR,
	LOGICEXPR,
	IDEXPR,
	TYPEEXPR,
	PARAMEXPR,
	COMSTEXPR
}ExprKind;
typedef enum {
	VARDECL=0,
	ARRAYDECL,
	FUNDECL
}DeclKind;
union Kind{
	StmtKind stmt; ExprKind expr; DeclKind decl;
};
enum {
	LOR=0,
	LAND,
	EQ,
	NEQ,
	BE,
	AE,
	BELOW,
	ABOVE,
	ADD,
	SUB,
	MUL,
	DIV
};
union NodeAttr{
	int op;
	int value;
	float fvalue;
	char* ch;
	int symtlb_index;
};