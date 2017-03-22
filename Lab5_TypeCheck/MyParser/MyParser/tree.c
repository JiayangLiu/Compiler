#include "tree.h"

TreeNode* newStmtNode(StmtKind kind)
{
	TreeNode* t = (TreeNode*) malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", lineno);
	else {
		for (i=0; i<MAXCHILDREN; i++)
		{
			t->child[i] = NULL;
			t->sibling = NULL;
			t->nodekind = StmtK;
			t->kind.stmt = kind;
			t->lineno = lineno;
		}
	}
	return t;
}

TreeNode* newExprNode(ExprKind kind)
{
	TreeNode* t = (TreeNode*) malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", lineno);
	else {
		for (i=0; i<MAXCHILDREN; i++)
		{
			t->child[i] = NULL;
			t->sibling = NULL;
			t->nodekind = ExprK;
			t->kind.expr = kind;
			t->lineno = lineno;
			t->type = Void;
		}
	}
	nodecount++;
	t->nodenum = nodecount;
	return t;
}

TreeNode* newDeclNode(DeclKind kind)
{
	TreeNode * t = (TreeNode*) malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", lineno);
	else {
		for (i=0; i<MAXCHILDREN; i++)
		{
			t->child[i] = NULL;
			t->sibling = NULL;
			t->nodekind = ExprK;
			t->kind.decl = kind;
			t->lineno = lineno;
			t->type = Void;
		}
	}
	nodecount++;
	t->nodenum = nodecount;
	return t;
}

void printTree(TreeNode* savedTree)
{
	printf("%s: %s\n", savedTree->nodenum, savedTree->nodekind);
	while (savedTree->sibling)
	{
		int i = 0;
		while (savedTree->child[i])
		{
			printTree(savedTree->child[i]);
			i++;
		}
	}
}
