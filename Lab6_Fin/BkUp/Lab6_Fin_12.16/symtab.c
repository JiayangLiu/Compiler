#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab.h"

/* 散列表大小 */
#define SIZE 211

#define SHIFT 4

static int hash(char* key)
{
	int temp = 0;
	int i = 0;
	while (key[i] != '\0')
	{
		temp = ((temp << SHIFT) + key[i]) % SIZE;
		++i;
	}
	return temp;
}

/* 散列表 */
static BucketList hashTable[SIZE];

/* loc=memory location只在第一次插入，其他情况下忽略 */
void st_insert(char* name, int lineno_, int loc, ExprType currType)
{
	int h = hash(name);
	BucketList l = hashTable[h];
	while ((l != NULL) && (strcmp(name, l->name) != 0))
		l = l->next;
	if (l == NULL) /* 该变量不在表中 */
	{
		l = (BucketList)malloc(sizeof(struct BucketListRec));
		l->name = name;
		l->lines = (LineList)malloc(sizeof(struct LineListRec));
		l->lines->lineno_ = lineno_;
		l->memloc = loc;
		l->type = currType;
		l->lines->next = NULL;
		l->next = hashTable[h];
		hashTable[h] = l;
	}
	else /* 在表中找到，则添加新的行号 */
	{
		LineList t = l->lines;
		while (t->next != NULL)
		{
			t = t->next;
		}
		t->next = (LineList)malloc(sizeof(struct LineListRec));
		t->next->lineno_ = lineno_;
		t->next->next = NULL;
	}
}

int st_lookup(char* name)
{
	int h = hash(name);
	BucketList l = hashTable[h];
	while ((l != NULL) && (strcmp(name, l->name) != 0))
		l = l->next;
	if (l == NULL)
		return -1;
	else
		return l->memloc;
}

BucketList st_get(char* name)
{
	int h = hash(name);
	BucketList l = hashTable[h];
	while ((l != NULL) && (strcmp(name, l->name) != 0))
		l = l->next;
	return l;
}

void printSymTab()
{
	int i;
	printf("Variable Name  Location   Line Numbers\n");
	printf("-------------  --------   ------------\n");
	for (i = 0; i<SIZE; ++i)
	{
		if (hashTable[i] != NULL)
		{
			BucketList l = hashTable[i];
			while (l != NULL)
			{
				LineList t = l->lines;
				printf("%-14s ", l->name);
				printf("%-8d  ", l->memloc);
				while (t != NULL)
				{
					printf("%4d ", t->lineno_);
					t = t->next;
				}
				printf("\n");
				l = l->next;
			}
		}
	}
	// 清空散列表
	for (i = 0; i<SIZE; ++i)
	{
		if (hashTable[i] != NULL)
		{
			hashTable[i] = NULL;
		}
	}
}
