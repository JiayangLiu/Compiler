#include <ctype.h>
#include <stdio.h>

void st_insert(char* name, int lineno, int loc);

int st_lookup(char* name);

void printSymTab(void);