#include "tree.h"
#include "mylexer.h"
#include "myparser.h"

// extern YYSTYPE yylval;
extern int line;
int nodecount = 0;

TreeNode* newStmtNode(StmtKind kind)
{
	TreeNode* t = (TreeNode*) malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", line);
	else {
		for (i=0; i<MAXCHILDREN; i++)
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
	TreeNode* t = (TreeNode*) malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", line);
	else {
		for (i=0; i<MAXCHILDREN; i++)
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
	TreeNode* t = (TreeNode*) malloc(sizeof(TreeNode));
	int i;
	if (t == NULL)
		printf("Out of memory error at line %d\n", line);
	else {
		for (i=0; i<MAXCHILDREN; i++)
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
