#include "gen_code.h"

/*
 *  前件：out是一个打开的输出流类对象，t是一个全局变量声明的语法树节点  
 *  后件：向out输出t的变量声明的数据段部分，并将变量的地址填入其符号表
 */
void gen_decl(FILE* fp, TreeNode* node)
{
  BucketList st = (BucketList) malloc(sizeof(struct BucketListRec));
  char* varLine = (char*) malloc(0);
  if (node != NULL)
  {
    if (node->parseName == "ID") {
      if (node->type == 0)
      {
        st = st_get(node->attr.name);
        // varLine = strcat(strcat("\t\t_", st->name), " DWORD 0\n");
        strcat(varLine, "\t\t_");
        strcat(varLine, st->name);
        strcat(varLine, " DWORD 0\n");
        printf("%s\n", varLine);
        fprintf(fp, varLine);
        // out << "\t\t_" << symtbl.getname(p->attr.symtbl_seq) << " DWORD 0" << endl;        
      }
      else if (node->type == 1)
      {
        st = st_get(node->attr.name);
        varLine = strcat(strcat("\t\t_", st->name), " BYTE 0\n");
        fprintf(fp, varLine);
        // out << "\t\t_" << symtbl.getname(p->attr.symtbl_seq) << " BYTE 0" << endl;
      }
    }

    TreeNode* childNode;
    childNode = (TreeNode*)malloc(sizeof(TreeNode));
    int childNum = 0;
    for (int i = 0; node->child[i] != NULL; i++)
    {
      childNum++;
    }
    for (int j = 0; j < childNum; j++)
    {
      childNode = node->child[j];
      gen_decl(fp, childNode);
    }
  }

  // ???
  // for (int i = 0; i < temp_var_seq; i++)
  // {
  //   out << "\t\tt" <<  i << " DWORD 0" << endl;
  // }


  // out << "\t\tbuffer BYTE 128 dup(0)" << endl;
  // out << "\t\tLF BYTE 13, 10, 0" << endl;
}

