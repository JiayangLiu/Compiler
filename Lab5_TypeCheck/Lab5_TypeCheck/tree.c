#include "tree.h"
#include "mylexer.h"
#include "myparser.h"

// extern YYSTYPE yylval;
extern int line;
int nodecount = 0;
int treeLevel = 0;

TreeNode* newStmtNode(StmtKind kind)
{
	TreeNode* t = (TreeNode*)malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", line);
	else {
		for (i = 0; i<MAXCHILDREN; i++)
		{
			t->child[i] = NULL;
			t->sibling = NULL;
			t->lineno = line;
			t->nodekind = StmtK;
			t->kind.stmt = kind;
			t->type = Void;
		}
	}
	nodecount++;
	t->nodenum = nodecount;
	return t;
}

TreeNode* newExprNode(ExprKind kind)
{
	TreeNode* t = (TreeNode*)malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", line);
	else {
		for (i = 0; i<MAXCHILDREN; i++)
		{
			t->child[i] = NULL;
			t->sibling = NULL;
			t->lineno = line;
			t->nodekind = ExprK;
			t->kind.expr = kind;
			t->type = Void;
		}
	}
	nodecount++;
	t->nodenum = nodecount;
	return t;
}

TreeNode* newDeclNode(DeclKind kind)
{
	TreeNode* t = (TreeNode*)malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", line);
	else {
		for (i = 0; i<MAXCHILDREN; i++)
		{
			t->child[i] = NULL;
			t->sibling = NULL;
			t->lineno = line;
			t->nodekind = ExprK;
			t->kind.decl = kind;
			t->type = Void;
		}
	}
	nodecount++;
	t->nodenum = nodecount;
	return t;
}

void printTree(TreeNode* currNode) // �������
{
	char* transType = (char*)malloc(40);
	if (currNode != NULL)
	{
		for (int a = 0; a<treeLevel; a++)
		{
			printf("   ");
		}
		switch (currNode->type)
		{
			case 0: transType = "Integer"; break;
			case 1: transType = "Charactor"; break;
			case 2: transType = "Double"; break;
			case 3: transType = "Boolean"; break;
			case 4: transType = "Void"; break;
			case 5: transType = "ErrorType"; break;
			default: break;
		}
		printf("%s [ %s ] --- { %s }\n", currNode->parseName, currNode->attr, transType);

		TreeNode* childNode;
		childNode = (TreeNode*)malloc(sizeof(TreeNode));
		int childNum = 0;
		for (int i = 0; currNode->child[i] != NULL; i++)
		{
			childNum++;
		}
		treeLevel++;
		for (int j = 0; j < childNum; j++)
		{
			childNode = currNode->child[j];
			printTree(childNode);
			treeLevel--;
		}
	}
}
