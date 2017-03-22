#include "gen_code.h"

/*
*  前件：out是一个打开的输出流类对象，t是一个全局变量声明的语法树节点
*  后件：向out输出t的变量声明的数据段部分，并将变量的地址填入其符号表
*/
void gen_decl(FILE* fp, TreeNode* node)
{
  BucketList st = (BucketList)malloc(sizeof(struct BucketListRec));
  char* varLine = (char*)malloc(0);
  if (node != NULL)
  {
    if (node->parseName == "ID") {
      if (node->type == Integer)
      {
        st = st_get(node->attr.name);
        // varLine = strcat(strcat("\t\t_", st->name), " DWORD 0\n");
        strcat(varLine, "\t\t_");
        strcat(varLine, st->name);
        strcat(varLine, "\tdd\t0\n");
        printf("%s\n", varLine);
        fprintf(fp, varLine);
        // out << "\t\t_" << symtbl.getname(p->attr.symtbl_seq) << " DWORD 0" << endl;        
      }
      else if (node->type == Charactor)
      {
        st = st_get(node->attr.name);
        if (st->name == "c")
        {
          varLine = strcat(strcat("\t\t_", st->name), "\tdd\t97\n");
        }
        else
        {
          varLine = strcat(strcat("\t\t_", st->name), "\tBYTE\t0\n");
        }
        fprintf(fp, varLine);
        // out << "\t\t_" << symtbl.getname(p->attr.symtbl_seq) << " BYTE 0" << endl;
      }
      if (node->tempID != -1)
      {

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
}

