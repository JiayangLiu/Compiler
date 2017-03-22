#include "tree.h"
#include <iostream>
using namespace std;
Node* tree::newroot(Node* n, Node* child1 = NULL, Node* child2 = NULL, Node* child3 = NULL, Node* child4 = NULL)
{
	root = n;
	root->children[0] = child1;
	root->children[1] = child2;
	root->children[2] = child3;
	root->children[3] = child4;
	return root;
}
Node* newStmtNode(StmtKind kind)
{
	Node * t = (Node *)malloc(sizeof(Node));
	int i;
	if (t == NULL)
		cout << "Out of memory error at line" << lineno << endl;
	else {
		for (i = 0; i<MAX_CHILDREN; i++)
			t->children[i] = NULL;
		t->sibling = NULL;
		t->nodeKind = STMTNODE;
		t->kind.stmt = kind;
		t->lineno = lineno;
		t->type = NOTYPE;
	}
	return t;
}
Node* newExprNode(ExprKind kind)
{
	Node * t = (Node *)malloc(sizeof(Node));
	int i;
	if (t == NULL)
		cout << "Out of memory error at line" << lineno << endl;
	else {
		for (i = 0; i<MAX_CHILDREN; i++)
			t->children[i] = NULL;
		t->sibling = NULL;
		t->nodeKind = STMTNODE;
		t->kind.expr = kind;
		t->lineno = lineno;
		t->type = NOTYPE;
	}
	return t;
}
Node* newDeclNode(DeclKind kind)
{
	Node * t = (Node *)malloc(sizeof(Node));
	int i;
	if (t == NULL)
		cout << "Out of memory error at line" << lineno << endl;
	else {
		for (i = 0; i<MAX_CHILDREN; i++)
			t->children[i] = NULL;
		t->sibling = NULL;
		t->nodeKind = STMTNODE;
		t->kind.decl = kind;
		t->lineno = lineno;
		t->type = NOTYPE;
	}
	return t;
}