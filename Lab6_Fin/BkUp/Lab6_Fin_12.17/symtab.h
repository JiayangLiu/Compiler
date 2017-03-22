#include <ctype.h>
#include <stdio.h>
#include "tree.h"

/* 一个变量被引用的代码行号列表 */
typedef struct LineListRec
{
	int lineno_;
	struct LineListRec* next;
} *LineList;

/* 一个变量的记录，包含：变量名、行号、存储位置 */
typedef struct BucketListRec
{
	char* name;
	LineList lines;
	int memloc;
	ExprType type;
	struct BucketListRec* next;
} *BucketList;

void st_insert(char* name, int lineno, int loc, ExprType currType);
int st_lookup(char* name);
BucketList st_get(char* name);
void printSymTab(void);