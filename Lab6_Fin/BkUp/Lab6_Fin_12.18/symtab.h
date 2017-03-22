#include <ctype.h>
#include <stdio.h>
#include "tree.h"

/* һ�����������õĴ����к��б� */
typedef struct LineListRec
{
	int lineno_;
	struct LineListRec* next;
} *LineList;

/* һ�������ļ�¼�����������������кš��洢λ�� */
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