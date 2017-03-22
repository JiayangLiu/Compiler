#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "symtab.h"

void typeCheck(TreeNode* savedTree);
static void postTraverse(TreeNode* currNode);
static void checkNode(TreeNode* t);
static void typeError(TreeNode* t, char* errorMessage);