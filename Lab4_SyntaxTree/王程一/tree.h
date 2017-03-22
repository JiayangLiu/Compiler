#pragma once
#include "local_table.h"
#define MAX_CHILDREN 4
struct Node {
	struct Node *children[MAX_CHILDREN];
	struct Node* sibling;
	int lineno;
	NodeKind nodeKind;
	Kind kind;
	Type type;
	NodeAttr attr;
};
Node* newStmtNode(StmtKind kind);
Node* newExprNode(ExprKind kind);
Node* newDeclNode(DeclKind kind);
class tree {
	Node* root;

	Node* newroot(Node* n=NULL,Node* child1=NULL,Node* child2=NULL,Node* child3=NULL,Node* child4=NULL);
	

};