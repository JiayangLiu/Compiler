#include "typecheck.h"
#include <stdio.h>
#include <string.h>

void gen_code(FILE* fp, TreeNode* root);
void gen_header(FILE* fp);
void gen_decl(FILE* fp, TreeNode* node);
char* new_label();

void recursive_gen_code(FILE* fp, TreeNode* node);
void stmt_gen_code(FILE* fp, TreeNode* node);
void expr_gen_code(FILE* fp, TreeNode* node);

char* getCurrRegister();
void pushRegister(FILE* fp);
void popRegister(FILE* fp);
