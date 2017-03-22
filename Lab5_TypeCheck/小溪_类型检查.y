%{
/****************************************************************************
myparser1.y
ParserWizard generated YACC file.

Date: 2016Äê11ÔÂ9ÈÕ
****************************************************************************/

#include "mylexer.h"
#include "struct.h"
#include <stdlib.h>
extern char temp[100];
extern char attribute[100][30];
extern int listsize;
extern char wordfind[100];
extern lexword[100];
extern lexcmp[100];
extern char savew[100];
struct hashlist *list;
struct treenode *start;
struct treenode *tpnode;
struct treenode *tempnode;
char errors[30][100];
int errorsize=0;
int linenum=0;
int noden=0;

	void addword(char*,char*);
	void printl();
	struct word* lookup(char*word);
	void gbbirth(char*,char*);
	void first_print(struct treenode*node,int depth);
	void back_traversal(struct treenode*node);
	
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// attribute type
%include {
#ifndef YYSTYPE
#define YYSTYPE struct treenode*
#endif
}

// place any declarations here
%token TYP MAN WILE FRR IFElS 
%token VAR NUM IFF ELS
%token EQU LBS LB RBS RB CMP
%left ADD MIN MUL DIV 
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)


START:
TYP_S MAN LBS RBS LB STMT RB 
{
	start->children[0]=$1;
	gbbirth("main","ID");$2=tpnode;start->children[1]=$2;
	gbbirth("{","BRACKET");$5=tpnode;start->children[2]=$5;
							start->children[3]=$6;
	gbbirth("}","BRACKET");$7=tpnode;start->children[4]=$7;

	
}
;
STMT:  
STMTS STMT
{

gbbirth("null","STMT");$$=tpnode;
$$->children[0]=$1;
$$->children[1]=$2;
}
|     
;
STMTS:
TYP_DEFINE		{$$=$1;}
|WILE_S			{$$=$1;}
|CUL			{$$=$1;}
|FRR_S			{$$=$1;}
|IFELS			{$$=$1;}
|GIVALUE		{$$=$1;}
| 
;
GIVALUE:
FACTOR EQU FACTOR			
{
	gbbirth("=","EQU");$$=tpnode;
	$$->children[0]=$1;
	$$->children[1]=$3;
}

|FACTOR EQU CUL
{
	gbbirth("=","EQU");$$=tpnode;
	$$->children[0]=$1;
	$$->children[1]=$3;
}
;
TYP_DEFINE:
TYP_S {gbbirth("VARS","VARS");tempnode=tpnode;tempnode->need[0]=$1;}
VARS
{
	gbbirth("type_define","STMT");$$=tpnode;
	$$->children[0]=$1;
	$$->children[1]=tempnode;
}
;
TYP_S:
TYP {gbbirth(lexword,"TYP");$$=tpnode;}
;
VARS:FACTOR  
{
	$$=tempnode;
	$$->children[0]=$1;
	if(!lookup($1->name)){addword($1->name,$$->need[0]->name,linenum);}
	else {sprintf(errors[errorsize],"error:line %d : %s redefine\n",linenum+1,$1->name);errorsize++;}
}
;
WILE_S:WILE LBS EXPR RBS LB STMT RB
{
	gbbirth("while","STMT");$$=tpnode;
	$$->children[0]=$3;
	$$->children[1]=$6;
	
}
;
CUL:
 CUL ADD TERM
 {
	gbbirth("+","CUL");$$=tpnode;
	$$->children[0]=$1;
	$$->children[1]=$3;
}
|CUL MIN TERM
{
	gbbirth("-","CUL");$$=tpnode;
	$$->children[0]=$1;
	$$->children[1]=$3;
}
|TERM {}
;
TERM: 
TERM MUL FACTOR
{
	gbbirth("*","CUL");$$=tpnode;
	$$->children[0]=$1;
	$$->children[1]=$3;
}
|TERM DIV FACTOR
{
	gbbirth("/","CUL");$$=tpnode;
	$$->children[0]=$1;
	$$->children[1]=$3;
}
|FACTOR {}
;

EXPR:FACTOR CMP FACTOR 
{gbbirth(lexcmp,"CMP");$$=tpnode;$$->children[0]=$1;$$->children[1]=$3;}

|GIVALUE {$$=$1;}
| 
;
FRR_S:FRR LBS EXPR EXPR EXPR RBS LB STMT RB
{
	gbbirth("for_s","STMT");$$=tpnode;
	$$->children[0]=$3;
	$$->children[1]=$4;
	$$->children[2]=$5;
	$$->children[3]=$8;
}
;
IFELS:IFF LBS EXPR RBS LB STMT RB IFELS_S
{
	gbbirth("if","STMT");$$=tpnode;
	$$->children[0]=$3;
	$$->children[1]=$6;	
	$$->children[2]=$8;
}
;
IFELS_S:
ELS LB STMT RB
{
	gbbirth("else","STMT");$$=tpnode;
	$$->children[0]=$3;	
}
| 
;

FACTOR:
 VAR {gbbirth(lexword,"VAR");$$=tpnode;}
|NUM {gbbirth(lexword,"int");$$=tpnode;$$->num=atoi(lexword);}
;
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int main(void)
{
	

	list = (struct hashlist*)malloc(sizeof(struct hashlist));
	list->size1 = list->size2 = list->size3 = 0;


	list->one = (struct word*)malloc(sizeof(struct word));
	list->two = (struct word*)malloc(sizeof(struct word));
	list->three = (struct word*)malloc(sizeof(struct word));
	list->one->next=list->two->next=list->three->next=NULL;
	
	yyin=fopen("1.txt","r");
	if(yyin==NULL){printf("open error\n");}
	
	gbbirth("start","START_SIGN");
	start=tpnode;
	
	do{
	yyparse();}while(!feof(yyin));

	first_print(start,0);
	fclose(yyin);
	
	back_traversal(start);
	
	for(int i=0;i<=errorsize;i++)
	{printf("%s",errors[i]);}
		printl();
	return 0;
	
	
}

void first_print(struct treenode*node,int depth)
{
	
	if(strcmp(node->name,"null"))
{	for(int i=0;i<depth;i++){printf("  ");}
	printf("%s[%s]\n",node->type,node->name);
	depth++;
}
	for(int i=0;node->children[i]!=NULL;i++)
	{
		first_print(node->children[i],depth);
	}
	
}



void back_traversal(struct treenode*node)
{
	
	for(int i=0;node->children[i]!=NULL;i++)
	{
		back_traversal(node->children[i]);
	}
	
	//deal with the = situation
	if(strcmp(node->name,"=")==0)
	{
		int value=-999;
		//if left child is a const throw an error
		if(strcmp(node->children[0]->type,"int")==0)
		{
			sprintf(errors[errorsize],"error:line %d : a const cant be given value\n",node->linenum);
			errorsize++;
		}
		
		//else give the value to left child
		else 
		{
			int flag=0;
			struct word*myword=(struct word*)lookup(node->children[0]->name);
			//if right is a var
			if(strcmp(node->children[1]->type,"VAR")==0)
			{
				struct word*tword=(struct word*)lookup(node->children[1]->name);
				if(tword==0)flag=1;
				//if not initialized throw error
				if(flag==1)
				{
					sprintf(errors[errorsize],"error:line %d : undefined variable %s\n",node->linenum,node->children[1]->name);
					errorsize++;
				}
				else if(strcmp(myword->type,tword->type)!=0)
				{
				sprintf(errors[errorsize],"error:line %d : %s cant be cust to %s\n",node->linenum,myword->type,tword->type);
				errorsize++;flag=1;
				}
				else
				{
					if(tword->num==-999)
					{
						sprintf(errors[errorsize],"error:line %d : uninitialized variable %s\n",node->linenum,tword->name);
						errorsize++;
					}
					value=tword->num;
				}
			}
			else
			{
				if(strcmp(myword->type,node->children[1]->type)!=0)
				{
				sprintf(errors[errorsize],"error:line %d : %s cant be cust to %s\n",node->linenum,myword->type,node->children[1]->type);
				errorsize++;flag=1;
				}else{
				value=node->children[1]->num;}
			}
			if(flag==0&&value!=-999){
			myword->num=value;
			printf("after '=':value of %s is %d\n",myword->name,myword->num);}

		}
	
	}
	
	//deal with the + situation
	if(strcmp(node->name,"+")==0)
	{
			
		char *lname,*rname,*ltype,*rtype;
		int lvalue,rvalue;
		//what's the type of the left child of +
		if(strcmp(node->children[0]->type,"VAR")==0)
		{
			struct word*tword=(struct word*)lookup(node->children[0]->name);
			lname=tword->name;
			ltype=tword->type;
			lvalue=tword->num;
		}
		if(strcmp(node->children[0]->name,"+")==0)
		{
			lname = node->children[0]->name;
			ltype=node->children[0]->type;
			lvalue=node->children[0]->num;
		}
		//what's the type of the right child of +
		if(strcmp(node->children[1]->type,"VAR")==0)
		{
			struct word*tword=lookup(node->children[1]->name);
			rname=tword->name;
			rtype=tword->type;
			rvalue=tword->num;
		}
		if(strcmp(node->children[1]->name,"+")==0)
		{
			rname = node->children[1]->name;
			rtype=node->children[1]->type;
			rvalue=node->children[1]->num;
		}
		
		if(strcmp(node->children[0]->type,"int")==0)
		{ltype=(char*)malloc(sizeof("int")+1);strcpy(ltype,"int");lvalue=node->children[0]->num;}
		if(strcmp(node->children[1]->type,"int")==0)
		{rtype=(char*)malloc(sizeof("int")+1);strcpy(ltype,"int");lvalue=node->children[1]->num;}

		//compare the rtype with ltype if same plus them 
		//else print error 
		if(strcmp(ltype,rtype)==0)
		{
			strcpy(node->type,ltype);
			//if initialized?if so add them and give the value to +
			if(lvalue!=-999||rvalue!=-999)
			{
			node->num=lvalue+rvalue;
			}
			//if not initialized throw an uninitialized error(except '+' itself) 
		 	if(lvalue==-999&&strcmp(node->children[0]->name,"+")!=0)
			{
			sprintf(errors[errorsize],"error:line %d : uninitialized variable %s\n",node->linenum,lname);
			errorsize++;
			}
			if(rvalue==-999&&strcmp(node->children[1]->name,"+")!=0)
			{
			sprintf(errors[errorsize],"error:line %d : uninitialized variable %s\n",node->linenum,rname);
			errorsize++;
			}
		 
		}else
		{
			strcpy(node->type,"unknown");
			sprintf(errors[errorsize],"error:line %d : %s and %s cant be added\n",node->linenum,ltype,rtype);
			errorsize++;
		}
		
	}
}



void gbbirth(char* name,char* type)
{
	struct treenode *temp=(struct treenode*)malloc(sizeof(struct treenode));
	temp->name=(char*)malloc(sizeof(name)+1);
	temp->type=(char*)malloc(sizeof(type)+1);
	strcpy(temp->name,name);
	strcpy(temp->type,type);
	temp->linenum=linenum;
	temp->num=-999;
	for(int i=0;i<10;i++)
	{
		temp->children[i]=(struct treenode*)malloc(sizeof(struct treenode));
		temp->children[i]=NULL;
	}
	for(int i=0;i<5;i++)
	{
		temp->need[i]=(struct treenode*)malloc(sizeof(struct treenode));
		temp->need[i]=NULL;
	}
	tpnode=temp;
}

void addword(char* myword,char*mytype,int linenum)
{
	char *name = myword;
	int i,hashcode=0;
	for (i = 0; i <strlen(name); i++)
	{
		hashcode += (int)name[i];
	}
		hashcode = hashcode % 3;
	//culculating hashcode!!!

	//create a wordnode

	if (hashcode == 0)
	{
		
		struct word *temp=(struct word*)malloc(sizeof(struct word));
		temp->name = (char*)malloc(strlen(myword)*sizeof(char)+1);
		temp->type = (char*)malloc(strlen(mytype)*sizeof(char)+1);
		temp->linenum = linenum;
		temp->num=temp->numd=-999;
		temp->value=NULL;
		 strcpy(temp->name, myword);
		 strcpy(temp->type, mytype);
		list->size1++; 
		temp->next=list->one;
		list->one=temp;
	}
	if (hashcode == 1)
	{
		
		struct word *temp=(struct word*)malloc(sizeof(struct word));
		temp->name = (char*)malloc(strlen(myword)*sizeof(char)+1);
		temp->type = (char*)malloc(strlen(mytype)*sizeof(char)+1);
		temp->linenum = linenum;
		temp->num=temp->numd=-999;
		temp->value=NULL;
		 strcpy(temp->name, myword);
		 strcpy(temp->type, mytype);
		list->size2++; 
		temp->next=list->two;
		list->two=temp;
	}
	if (hashcode == 2)
	{
		
		struct word *temp=(struct word*)malloc(sizeof(struct word));
		temp->name = (char*)malloc(strlen(myword)*sizeof(char)+1);
		temp->type = (char*)malloc(strlen(mytype)*sizeof(char)+1);
		temp->linenum = linenum;
		temp->num=temp->numd=-999;
		temp->value=NULL;
		 strcpy(temp->name, myword);
		 strcpy(temp->type, mytype);
		list->size3++; 
		temp->next=list->three;
		list->three=temp;
	}
	//hashing
}

void printl()
{
	
	struct hashlist templ =*list;
	struct hashlist *temp;
	temp = &templ;
	while ((temp->one->next)!=NULL&&temp->size1!=0)
	{
		printf("listone:word is %s type is %s value is %d\n", temp->one->name,temp->one->type,temp->one->num);
		temp->one = temp->one->next;
	}

	while ((temp->two->next )!=NULL&&temp->size2 != 0)
	{
		printf("listtwo:word is %s type is %s value is %d\n", temp->two->name,temp->two->type,temp->two->num);
		temp->two = temp->two->next;
	}

	while ((temp->three->next)!=NULL&&temp->size3 !=0 )
	{
		
		printf("listthree:word is %s type is %s value is %d\n", temp->three->name,temp->three->type,temp->three->num);
		temp->three = temp->three->next;
	}
}

struct word* lookup(char*word)
{
	
	struct hashlist templ = *list;
	struct hashlist *temp;
	temp = &templ;
	char *name = word;
	int i, hashcode = 0;
	for (i = 0; i <strlen(name); i++)
	{
		hashcode += (int)name[i];
	}
	hashcode = hashcode % 3;
	//get hashcode

	switch (hashcode)
	{
	case 0:
		while ((temp->one) != NULL&&temp->size1 != 0)
		{
			char *name = temp->one->name;
			char *type = temp->one->type;
			if (strcmp(word, temp->one->name)==0)
			{
				
					strcpy(wordfind, "");
					strcpy(wordfind, word);
					return temp->one;
			}
			   temp->one = temp->one->next;
		}
		break;
	case 1:
		while ((temp->two) != NULL&&temp->size2 != 0)
		{
			char *name = temp->two->name;
			char *type = temp->two->type;
			if (strcmp(word, name) == 0)
			{
				strcpy(wordfind, "");
				strcpy(wordfind, word);
				return temp->two;
			}
			temp->two = temp->two->next;
		}
		break;
	case 2:
		while ((temp->three) != NULL&&temp->size3 != 0)
		{
			char *name = temp->three->name;
			char *type = temp->three->type;
			if (strcmp(word, temp->three->name) == 0)
			{
				strcpy(wordfind, "");
				strcpy(wordfind, word);
				return temp->three;
			}
			temp->three = temp->three->next;
		}
		break;
	}
	return 0;
}

