#include "typecheck.h"
// #include "tree.h"
#include "mylexer.h"
#include "myparser.h"

void typeCheck(TreeNode * syntaxTree)
{
	postTraverse(syntaxTree);
}

static void postTraverse(TreeNode* currNode)
{
	if (currNode != NULL)
	{
		TreeNode* childNode;
		childNode = (TreeNode*)malloc(sizeof(TreeNode));
		int childNum = 0;
		for (int i = 0; currNode->child[i] != NULL; i++)
		{
			childNum++;
		}
		for (int j = 0; j < childNum; j++)
		{
			childNode = currNode->child[j];
			postTraverse(childNode);
		}
		checkNode(currNode);
	}
}

static void checkNode(TreeNode* t)
{
	switch (t->nodekind)
	{
	case ExprK:
		// { TypeK = 0, ParamK, OpK, ConstK, IdK, CompareK, LogicK, ShiftK } ExprKind;
		switch (t->kind.expr)
		{
		case OpK:
			if (t->child[0]->type != t->child[1]->type)
			{
				typeError(t, "Op applied to incompatible pair");
				t->type = ErrorType;
			}
			if ((t->attr.op == EQt) || (t->attr.op == NEt) || (t->attr.op == LEt) || (t->attr.op == GEt) ||
				(t->attr.op == LTt) || (t->attr.op == GTt) || (t->attr.op == ANDt) || (t->attr.op == ORt) || (t->attr.op == XORt))
				t->type = Boolean;
			else
				t->type = Integer;
			break;
			// 其他情况均已在.y翻译模式中写好
		default:
			break;
		}
		break;
	case StmtK:
		// { CompK = 0, IfK, WhileK, ForK, ReadK, WriteK, AssignK, ReturnK} StmtKind;
		switch (t->kind.stmt)
		{
		case IfK:
			if (t->child[0]->type != Boolean)
			{
				typeError(t->child[0], "if test is not Boolean");
				t->type = ErrorType;
			}
			break;
		case WhileK:
			if (t->child[0]->type != Boolean)
			{
				// typeError(t->child[1], "while test is not Boolean");
				// t->type = ErrorType;
			}
			break;
		case ForK:
			if (t->child[1]->type != Boolean)
			{
				typeError(t->child[1], "for test is not Boolean");
				t->type = ErrorType;
			}
			break;
		case ReadK:
			if ((t->child[0]->type != Integer) || (t->child[0]->type != Double))
			{
				typeError(t->child[0], "read of non-integer value");
				t->type = ErrorType;
			}
			break;
		case WriteK:
			if ((t->child[0]->type != Integer) || (t->child[0]->type != Double))
			{
				typeError(t->child[0], "write of non-integer value");
				t->type = ErrorType;
			}
			break;
		case AssignK:
/*			if ((t->child[0]->type == Integer_R) || (t->child[0]->type == Charactor_R) || (t->child[0]->type == Double_R) || (t->child[0]->type == Float_R))
			{
				typeError(t->child[0], "is a R-value, thus can't be placed before ==.");
				t->type = ErrorType;
			}
			break;
			if ((t->child[1]->type == Integer_R) || (t->child[1]->type == Charactor_R) || (t->child[1]->type == Double_R) || (t->child[1]->type == Float_R))
				break;
*/			
			if (t->child[0]->type == Const_init)
			{
				typeError(t->child[0], "has been initialized as CONST, thus can't be assigned again.");
				t->type = ErrorType;
			}
			if (t->child[0]->type == Float && t->child[1]->type == Double)
			{
				typeError(t->child[0], "assignment of incompatible type");
				t->type = ErrorType;
			}
			if ((t->child[0]->type == Double) && (t->child[1]->type == Integer))
				break;
			if ((t->child[0]->type == Float) && (t->child[1]->type == Integer))
				break;
			if ((t->child[0]->type == Double) && (t->child[1]->type == Float))
				break;
			if ((t->child[0]->type == Const_Int) || (t->child[0]->type == Const_Char) || (t->child[0]->type == Const_Float) || (t->child[0]->type == Const_Double))
				break;
			if (t->child[0]->type != t->child[1]->type)
			{
				typeError(t->child[0], "assignment of incompatible type");
				t->type = ErrorType;
			}
			break;
		case ReturnK:
			break;
		default:
			break;
		}
		break;
	case DeclK:
		break;
	default:
		break;
	}
}

static void typeError(TreeNode* t, char* errorMessage)
{
	// errorMessage = (char*) malloc(100);
	printf("代码第 %d 行的 %s 附近出现类型错误, 错误信息为: %s\n", t->lineno, t->parseName, errorMessage);
}
