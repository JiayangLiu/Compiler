
/*
 *	前件：out是一个打开的输出流类对象，t是一个全局变量声明的语法树节点  
 *  后件：向out输出t的变量声明的数据段部分，并将变量的地址填入其符号表
 */
void tree::gen_decl(ostream &out, TreeNode *t)
{
  out << endl << endl << "\t.data" << endl;
  
  for (; t->kind == DECL_NODE; t = t->sibling)
  {
    for (Node *p = t->children[1]; p; p = p->sibling)
      if (p->type == Integer)
        out << "\t\t_" << symtbl.getname(p->attr.symtbl_seq) << " DWORD 0" << endl;
      else if (p->type == Char)
        out << "\t\t_" << symtbl.getname(p->attr.symtbl_seq) << " BYTE 0" << endl;
  }
  for (int i = 0; i < temp_var_seq; i++)
  {
    out << "\t\tt" <<  i << " DWORD 0" << endl;
  }

  out << "\t\tbuffer BYTE 128 dup(0)" << endl;
  out << "\t\tLF BYTE 13, 10, 0" << endl;
}

