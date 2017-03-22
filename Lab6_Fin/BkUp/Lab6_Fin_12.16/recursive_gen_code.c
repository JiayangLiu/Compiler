void tree::recursive_gen_code(ostream &out, Node *t)
{
	if (t->kind == STMT_NODE)
	{
		stmt_gen_code(out, t);
	}
	else if (t->kind == EXPR_NODE && (t->kind_kind == OP_EXPR || t->kind_kind == NOT_EXPR))
	{
		expr_gen_code(out, t);
	}
}

void tree::expr_gen_code(ostream &out, Node *t)
{
	Node *e1 = t->children[0];
	Node *e2 = t->children[1];
	switch (t->attr.op)
	{
		case PLUS:
		out << "\tMOV eax, ";
		if (e1->kind_kind == ID_EXPR)
			out << "_" << symtbl.getname(e1->attr.symtbl_seq);
		else if (e1->kind_kind == CONST_EXPR)
			out << e1->attr.vali;
		else out << "t" << e1->temp_var;
		out << endl;
		out << "\tADD eax, ";


		if (e2->kind_kind == ID_EXPR)
			out << "_" << symtbl.getname(e2->attr.symtbl_seq);
		else if (e2->kind_kind == CONST_EXPR)
			out << e2->attr.vali;
		else out << "t" << e2->temp_var;
		out << endl;
		out << "\tMOV t" << t->temp_var << ", eax" << endl;
		break;

		case LT:
		out << "\tMOV eax, ";
		if (e1->kind_kind == ID_EXPR)
			out << "_" << symtbl.getname(e1->attr.symtbl_seq);
		else if (e1->kind_kind == CONST_EXPR)
			out << e1->attr.vali;
		else out << "t" << e1->temp_var;
		out << endl;
		out << "\tCMP eax, ";
		if (e2->kind_kind == ID_EXPR)
			out << "_" << symtbl.getname(e2->attr.symtbl_seq);
		else if (e2->kind_kind == CONST_EXPR)
			out << e2->attr.vali;
		else out << "t" << e2->temp_var;
		out << endl;
		out << "\tjl " << t->label.true_label << endl;
		out << "\tjmp " << t->label.false_label << endl;
		break;



		void tree::stmt_gen_code(ostream &out, Node *t)
		{
			if (t->kind_kind == COMP_STMT)
			{
				for (int i = 0; t->children[i]; i++)
				{
					recursive_gen_code(out, t->children[i]);
					for (Node *p = t->children[i]->sibling; p; p = p->sibling)
						recursive_gen_code(out, p);
				}
			}
			else if (t->kind_kind == WHILE_STMT)
			{
				if (t->label.begin_label != "")
					out << t->label.begin_label << ":" << endl;
				recursive_gen_code(out, t->children[0]);
				recursive_gen_code(out, t->children[1]);
				out << "\tjmp " << t->label.begin_label << endl;
			}


