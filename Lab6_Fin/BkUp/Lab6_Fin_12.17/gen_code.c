#include "gen_code.h"

/*
*  函数名：gen_code()
*  功能：代码生成的顶层调用函数，调用其他子函数生成汇编代码
*/
void gen_code(FILE* fp, TreeNode* root)
{
  gen_header(fp);
  TreeNode* p = (TreeNode*)malloc(sizeof(TreeNode));
  p = root->child[0]->child[1]->child[3]->child[0]; // ->child[3]->child[0]
  if (p->nodekind == 2) { // DeclK
    printf("进入gen_decl\n");
    fprintf(fp, "\n\t.data\n");
    gen_decl(fp, p);
  }
  fprintf(fp, "\t\tbuffer BYTE 128 dup(0)\n");
  fprintf(fp, "\t\tLF BYTE 13, 10, 0\n");
  fprintf(fp, "\n\t.code\n");

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
