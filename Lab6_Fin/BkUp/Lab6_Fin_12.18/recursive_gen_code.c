#include "gen_code.h"

void recursive_gen_code(FILE* fp, TreeNode* node)
{
	printf("开始recursive_gen_code\n");
	if (node->nodekind == StmtK)
	{
		stmt_gen_code(fp, node);
	}
	else if ((node->nodekind==ExprK) && (node->kind.expr==OpK))
	{
		expr_gen_code(fp, node);
	}
	else
	{
		printf("else\n");
	}
}

void stmt_gen_code(FILE* fp, TreeNode* node)
{
	printf("进入stmt_gen_code\n");
	if (node->kind.stmt == CompK)
	{
		printf("stmt: CompK\n");
		TreeNode* p = (TreeNode*)malloc(sizeof(TreeNode));
		for (int i = 0; node->child[i]; i++)
		{
			recursive_gen_code(fp, node->child[i]);
			for (p=node->child[i]->sibling; p; p=p->sibling)
				recursive_gen_code(fp, p);
		}
	}
	else if (node->kind.stmt == WhileK)
	{
		printf("stmt: WhileK\n");
		printf("ok0");
		char* begin_label = (char*)malloc(0);
		printf("ok1");
		begin_label = new_label();
		printf("ok2");
		fprintf(fp, "%s:\n", begin_label);
		recursive_gen_code(fp, node->child[0]);
		recursive_gen_code(fp, node->child[1]);
		printf("ok3");
		fprintf(fp, "\tjmp %s\n", begin_label);
	}
}

void expr_gen_code(FILE* fp, TreeNode* node)
{
	printf("进入expr_gen_code\n");
	TreeNode* e1 = (TreeNode*)malloc(sizeof(TreeNode));
	TreeNode* e2 = (TreeNode*)malloc(sizeof(TreeNode));
	e1 = node->child[0];
	e2 = node->child[1];
	if (node->attr.name == "ADD_op")
	{	// +
		printf("expr: ADDt\n");
		fprintf(fp, "\tMOV eax, _");
		if (e1->kind.expr == IdK)
		{
			BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
			st = st_get(e1->attr.name);
			fprintf(fp, "%s\n", st->name);
		}
		else if (e1->kind.expr == ConstK)
		{
			fprintf(fp, "%s\n", e1->attr.val);
		}
		/*			else
						out << "t" << e1->temp_var;
						out << endl;
						*/			// out << endl;

		// out << "\tADD eax, ";
		fprintf(fp, "\tMOV eax, ");
		if (e2->kind.expr == IdK)
		{
			BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
			st = st_get(e2->attr.name);
			fprintf(fp, "_%s\n", st->name);
		}
		else if (e2->kind.expr == ConstK)
		{
			fprintf(fp, "%s\n", e2->attr.val);
		}
		/*			else out << "t" << e2->temp_var;
					out << endl;
					out << "\tMOV t" << t->temp_var << ", eax" << endl;
					*/
	}

	else if (node->attr.name == "LT_op")
	{
		printf("expr: LTt\n");
		fprintf(fp, "\tMOV eax, ");
		printf("LT_ok1");
		if (e1->kind.expr == IdK)
		{
			printf("LT_ok2");
			BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
			st = st_get(e1->attr.name);
			fprintf(fp, "_%s\n", st->name);
			printf("LT_ok3");

		}
		else if (e1->kind.expr == ConstK)
		{
			fprintf(fp, "%s\n", e1->attr.val);
		}
		/*			else out << "t" << e1->temp_var;
					out << endl;
					*/
		fprintf(fp, "\tCMP eax, ");
		printf("LT_ok4");

		if (e2->kind.expr == IdK)
		{
			BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
			st = st_get(e2->attr.name);
			fprintf(fp, "_%s\n", st->name);
		}
		else if (e2->kind.expr == ConstK)
		{
			fprintf(fp, "%s\n", e2->attr.val);
		}
		/*			else out << "t" << e2->temp_var;
					out << endl;
					*/
		printf("LT_ok5");

		char* true_label = (char*)malloc(0);
		true_label = new_label();
		char* false_label = (char*)malloc(0);
		false_label = new_label();
		fprintf(fp, "\tjl ");
		fprintf(fp, "%s\n", true_label);
		printf("%s\n", true_label);
		fprintf(fp, "\tjmp ");
		fprintf(fp, "%s\n", false_label);
		printf("%s\n", false_label);
		printf("LT_ok6");

	}
}
