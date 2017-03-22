#include "gen_code.h"
#include <stdbool.h>

char* currTemp;
// int temp_Count = 0;
char* currRegister;
char* lastTemp;

char* begin_label;
char* enter_label;
// char* pass_label;
char* end_label;
char* wait_label;
bool assign_flag = FALSE;
bool or_flag = FALSE;

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
	currTemp = (char*)malloc(0);
	currRegister = (char*)malloc(0);

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
		// printf("ok0");
		begin_label = (char*)malloc(0);
		// printf("ok1");
		begin_label = new_label();
		end_label = (char*)malloc(0);
		end_label = new_label();
		// printf("ok2");
		fprintf(fp, "@%s:\n", begin_label);
		recursive_gen_code(fp, node->child[0]);
		recursive_gen_code(fp, node->child[1]);
		// printf("ok3");
		fprintf(fp, "\tjmp @%s\n", enter_label);
		fprintf(fp, "@%s:\n", end_label);
	}
	else if (node->kind.stmt == IfK)
	{
		printf("stmt: IfK\n");
		end_label = (char*)malloc(0);
		end_label = new_label();
		recursive_gen_code(fp, node->child[0]);
		recursive_gen_code(fp, node->child[1]);
	}
	else if (node->kind.stmt == ForK)
	{
		printf("stmt: ForK\n");
		begin_label = (char*)malloc(0);
		begin_label = new_label();
		end_label = (char*)malloc(0);
		end_label = new_label();
		fprintf(fp, "@%s:\n", enter_label);	// 技巧
		assign_flag = TRUE;
		recursive_gen_code(fp, node->child[0]);
		assign_flag = FALSE;
		recursive_gen_code(fp, node->child[1]);
		recursive_gen_code(fp, node->child[2]);
		recursive_gen_code(fp, node->child[3]);
		fprintf(fp, "\tjmp @%s\n", begin_label);
		fprintf(fp, "@%s:\n", end_label);
	}
	else if (node->kind.stmt == InputK)
	{
		printf("stmt: InputK\n");
		// push 写成函数吧
		pushRegister(fp);
		// "invoke   crt_scanf, addr format, addr _n"
		fprintf(fp, "invoke   crt_scanf, addr format, addr _ %s\n\n", node->child[0]->attr.name);
		popRegister(fp);
	}
	else if (node->kind.stmt == PrintK)
	{
		printf("stmt: PrintK\n");
		pushRegister(fp);
		if (node->child[0]->kind.expr == ConstK)
		{
			// "invoke   crt_printf, addr format, 数字"
			fprintf(fp, "invoke   crt_printf, addr format,  %s\n\n", node->child[0]->attr.val);
		}
		else if (node->child[0]->kind.expr == IdK)
		{
			// "invoke   crt_printf, addr format, _tempX"
			fprintf(fp, "invoke   crt_printf, addr format,  %s\n\n", currTemp);
		}
		popRegister(fp);
	}
	else if (node->kind.stmt == AssignK)
	{
		printf("stmt: AssignK\n");
		currRegister = getCurrRegister();
		// "mov eax, 0"
		fprintf(fp, "mov %s, %d\n", currRegister, node->child[1]->attr.val);
		// "mov _i, eax"
		fprintf(fp, "mov _%s, %s\n", node->child[0]->attr.name, currRegister);
		if (assign_flag)
		{
			fprintf(fp, "@%s:\n", enter_label);
		}
	}
	else if (node->kind.stmt == ReturnK)
	{
		// no need
	}
}

void expr_gen_code(FILE* fp, TreeNode* node)
{
	currRegister = (char*)malloc(0);
	
	// currTemp = (char*)malloc(0);
	lastTemp = (char*)malloc(0);
	lastTemp = currTemp;
	
	// 将要用的currTemp准备好
	int temp_Count = node->tempID;
	strcat(currTemp, "_temp");
	strcat(currTemp, temp_Count);

	printf("进入expr_gen_code\n");
	TreeNode* e1 = (TreeNode*)malloc(sizeof(TreeNode));
	TreeNode* e2 = (TreeNode*)malloc(sizeof(TreeNode));
	if (node->attr.name == "SELF_ADD_op" && node->attr.name == "SELF_SUB_op" && node->attr.name == "NOT_op")
	{
		e1 = node->child[0];
	}
	else
	{
	e1 = node->child[0];
	e2 = node->child[1];
	}

	if (node->attr.name == "ADD_op")
	{
		printf("expr: ADD_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov %s, _", currRegister);
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
		fprintf(fp, "\tadd %s, ", currRegister);
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
		fprintf(fp, "mov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "SUB_op")
	{
		printf("expr: SUB_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tsub %s, ", currRegister);
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
		fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "MUL_op")
	{
		printf("expr: MUL_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		if (e2->kind.expr == IdK)
		{
			BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
			st = st_get(e2->attr.name);
			fprintf(fp, "\tmul _%s\n", st->name);
		}
		else if (e2->kind.expr == ConstK)
		{
			fprintf(fp, "\tmul %s\n", e2->attr.val);
		}
		fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "DIV_op")
	{
		printf("expr: DIV_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		if (e2->kind.expr == IdK)
		{
			BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
			st = st_get(e2->attr.name);
			fprintf(fp, "\tdiv _%s\n", st->name);
		}
		else if (e2->kind.expr == ConstK)
		{
			fprintf(fp, "\tdiv %s\n", e2->attr.val);
		}
		fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "EQ_op")
	{
		printf("expr: EQ_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tcmp %s, ", currRegister);
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
		fprintf(fp, "\tjne @%s\n", end_label);
	}
	else if (node->attr.name == "NE_op")
	{
		printf("expr: NE_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tcmp %s, ", currRegister);
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
		fprintf(fp, "\tje @%s\n", end_label);
	}
	else if (node->attr.name == "LE_op")
	{
		printf("expr: LE_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tcmp %s, ", currRegister);
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
		if (or_flag){
			wait_label = (char*)malloc(0);
			fprintf(fp, "\tjg @%s\n", wait_label);
			fprintf(fp, "\tjg @%s\n", enter_label);
		}
		else
		{
			fprintf(fp, "\tjg @%s\n", end_label);
		}
	}
	else if (node->attr.name == "GE_op")
	{
		printf("expr: GE_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tcmp %s, ", currRegister);
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
		fprintf(fp, "\tjl @%s\n", end_label);
	}
	else if (node->attr.name == "LT_op")
	{
		printf("expr: LT_op\n");
		fprintf(fp, "\tmov eax, ");
		// printf("LT_ok1");
		if (e1->kind.expr == IdK)
		{
			// printf("LT_ok2");
			BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
			st = st_get(e1->attr.name);
			fprintf(fp, "_%s\n", st->name);
			// printf("LT_ok3");
		}
		else if (e1->kind.expr == ConstK)
		{
			fprintf(fp, "%s\n", e1->attr.val);
		}
		/*			else out << "t" << e1->temp_var;
					out << endl;
					*/
		fprintf(fp, "\tcmp eax, ");
		// printf("LT_ok4");
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
/*		printf("LT_ok5");
		char* true_label = (char*)malloc(0);
		true_label = new_label();
		char* false_label = (char*)malloc(0);
		false_label = new_label();
*/		fprintf(fp, "\tjnl ");
		fprintf(fp, "@%s\n", end_label);
	}
	else if (node->attr.name == "GT_op")
	{
		printf("expr: GT_op\n");
		currRegister = getCurrRegister();
		if (or_flag)
		{
			fprintf(fp, "@%s:\n", wait_label);
		}
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tcmp %s, ", currRegister);
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
		if (or_flag)
		{
			fprintf(fp, "\tjg @%s\n", enter_label);
		}
		fprintf(fp, "\tjng @%s\n", end_label);
	}
	else if (node->attr.name == "AND_op")
	{
		printf("expr: AND_op\n");
		recursive_gen_code(fp, e1);
		recursive_gen_code(fp, e2);
	}
	else if (node->attr.name == "OR_op")
	{
		printf("expr: OR_op\n");
		or_flag = TRUE;
		recursive_gen_code(fp, e1);
		recursive_gen_code(fp, e2);
		or_flag = FALSE;
	}
	else if (node->attr.name == "XOR_op")
	{
		printf("expr: GT_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\txor %s, ", currRegister);
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
		fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "L_SHIFT_op")
	{
		printf("expr: GT_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tshl %s, ", currRegister);
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
		fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "R_SHIFT_op")
	{
		printf("expr: GT_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tshr %s, ", currRegister);
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
		fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "MOD_op")
	{
		// fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
		fprintf(fp, "mov edx, 0");
		fprintf(fp, "mov eax, _temp2");
		fprintf(fp, "mov _temp3, 6");
		fprintf(fp, "div _temp3");
		fprintf(fp, "mov _temp3, edx");
		fprintf(fp, "mov eax, _temp0");
		fprintf(fp, "sub eax, _temp3");
		fprintf(fp, "mov _temp4, eax");
	}
	else if (node->attr.name == "BIT_AND_op")
	{
		printf("expr: GT_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tand %s, ", currRegister);
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
		fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "BIT_OR_op")
	{
		printf("expr: GT_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
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
		fprintf(fp, "\tor %s, ", currRegister);
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
		fprintf(fp, "\tmov %s, %s\n", currTemp, currRegister);
	}
	else if (node->attr.name == "SELF_ADD_op")
	{
		printf("expr: SELF_ADD_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
		BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
		st = st_get(e1->attr.name);
		if (e1->kind.expr == IdK)
		{
			fprintf(fp, "%s\n", st->name);
		}
		else if (e1->kind.expr == ConstK)
		{
			fprintf(fp, "%s\n", e1->attr.val);
		}
		fprintf(fp, "\tinc %s", currRegister);
		fprintf(fp, "\tmov _%s, %s", st->name, currRegister);
	}
	else if (node->attr.name == "SELF_SUB_op")
	{
		printf("expr: SELF_ADD_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
		BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
		st = st_get(e1->attr.name);
		if (e1->kind.expr == IdK)
		{
			fprintf(fp, "%s\n", st->name);
		}
		else if (e1->kind.expr == ConstK)
		{
			fprintf(fp, "%s\n", e1->attr.val);
		}
		fprintf(fp, "\tdec %s", currRegister);
		fprintf(fp, "\tmov _%s, %s", st->name, currRegister);
	}
	else if (node->attr.name == "NOT_op")
	{
		printf("expr: SELF_ADD_op\n");
		currRegister = getCurrRegister();
		fprintf(fp, "\tmov eax, _");
		BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
		st = st_get(e1->attr.name);
		if (e1->kind.expr == IdK)
		{
			fprintf(fp, "%s\n", st->name);
		}
		else if (e1->kind.expr == ConstK)
		{
			fprintf(fp, "%s\n", e1->attr.val);
		}
		fprintf(fp, "\tdec %s", currRegister);
		fprintf(fp, "\tmov _%s, %s", st->name, currRegister);
	}
}

void pushRegister(fp)
{
	fprintf(fp, "push eax");
	fprintf(fp, "push ecx");
	fprintf(fp, "push ebx");
	fprintf(fp, "push edx");
}

void popRegister(fp)
{
	fprintf(fp, "pop edx");
	fprintf(fp, "pop ebx");
	fprintf(fp, "pop ecx");
	fprintf(fp, "pop eax");
}

char* getCurrRegister()
{
	return "eax";
}