#include "typecheck.h"
#include <stdio.h>
#include <string.h>

void gen_code(FILE* fp, TreeNode* root);
void gen_header(FILE* fp);
void gen_decl(FILE* fp, TreeNode* node);
