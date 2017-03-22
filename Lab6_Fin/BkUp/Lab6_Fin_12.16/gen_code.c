#include "gen_code.h"

/*
 *  函数名：gen_code()
 *  功能：代码生成的顶层调用函数，调用其他子函数生成汇编代码
 */
void gen_code(FILE* fp, TreeNode* root)
{
  gen_header(fp);
  // Node *p = root->children[0];
  // if (p->kind == DECL_NODE)
  //   gen_decl(out, p);
  // out << endl << endl << "\t.code" << endl;
  // recursive_gen_code(out, root);
  // if (root->label.next_label != "")
  //   out << root->label.next_label << ":" << endl;
  // out << "\tinvoke ExitProcess, 0" << endl;
  // out << "end " << root->label.begin_label << endl;
}


/*
 *  函数名：gen_header()
 *  功能：向out输出386汇编指令的汇编文件的文件头内容
 */
void gen_header(FILE* fp)
{
  fprintf(fp, "\t.386\n");
  fprintf(fp, "\t.model flat, stdcall\n");
  fprintf(fp, "\toption casemap :none\n\n");

  fprintf(fp, "\tinclude \\masm32\\include\\windows.inc\n");
  fprintf(fp, "\tinclude \\masm32\\include\\user32.inc\n");
  fprintf(fp, "\tinclude \\masm32\\include\\kernel32.inc\n");
  fprintf(fp, "\tinclude \\masm32\\include\\masm32.inc\n");

  fprintf(fp, "\tincludelib \\masm32\\lib\\user32.lib\n");
  fprintf(fp, "\tincludelib \\masm32\\lib\\kernel32.lib\n");
  fprintf(fp, "\tincludelib \\masm32\\lib\\masm32.lib\n");
}
