%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2016Äê11ÔÂ8ÈÕ
****************************************************************************/

#include "mylexer.h"
#include <iostream>
#include <stack>
#include "tree.h"

local_table *top=new local_table();
tree parsetree;
stack<local_table*> symtlb=stack<local_table*>();
extern Node* yylval;
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// parser name
%name myparser

// class definition
{
	// place any extra class members here
}

// constructor
{
	// place any extra initialisation code here
}

// destructor
{
	// place any extra cleanup code here
}

// attribute type
%include {
#ifndef YYSTYPE
#define YYSTYPE Node*
#endif
}

// place any declarations here
%token ENDFILE ERROR
%token CHAR INT VOID FLOAT BREAK CONTINUE IF ELSE FOR WHILE RETURN
%token  LP RBP LSP RSP LFP RFP 
%token INC DEC LAND LOR EQ BE AE NEQ ADD SUB NUL DIV REMAIN ASSIGN AND OR XOR NOT 
%token LSHIFT RSHIFT BELOW ABOVE SEMICOLON COMMA
%token NUM ID FNUM CONSTCHAR
%token INPUT PRINT


%right SEMICOLON
%left	COMMA 
%right	ASSIGN 
%left LOR     
%left LAND 
%left EQ NEQ 
%left BELOW ABOVE BE AE
%left LSHIFT RSHIFT 
%left ADD SUB 
%left MUL DIV REMAIN
%left INT FLOAT CHAR VOID
%left NOT INC DEC
%right RP RSP RFP
%left LP LSP LFP 
 
%right ELSE 
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)
program		:decl_list		{$$=$1;}  //ok
			;
decl_list	:decl_list decl			//ok
			{
				Node* p=$1;
				if(p)
				{
					while(p->sibling)
						p=p->sibling;
					p->sibling=$2;
					$$=$1;
				}
			}					
			|decl			{$$=$1;} //ok
			;
decl		:var_decl  {$$=$1;} //ok
			|fun_decl	{$$=$1;} //ok
			|fun_def	{$$=$1;}  //ok
			;
var_decl	:type_spec id_list SEMICOLON	//ok
				{
					Node *p;
					p=newDeclNode(VARDECL);
					Node *t;
					for(t=$2;t!=NULL;t=t->sibling)
					{
						t->type=$1->type;
						//top->set_type(t->attr.symtlb_index,$1->type);
					}
					$$=parsetree.newroot(p,$1,$2);
				}
			;
type_spec	:INT	//ok
			{
				Node *p;
				p=newExprNode(TYPEEXPR);
				p->type=INTEGER;
				$$=parsetree.newroot(p);
			}
			|CHAR		//ok
			{
				Node *p;
				p=newExprNode(TYPEEXPR);
				p->type=CHARACTOR;
				$$=parsetree.newroot(p);
			}
			|FLOAT	//ok
			{
				Node *p;
				p=newExprNode(TYPEEXPR);
				p->type=T_FLOAT;
				$$=parsetree.newroot(p);
			}
			|VOID	//ok
			{
				Node *p;
				p=newExprNode(TYPEEXPR);
				p->type=NOTYPE;
				$$=parsetree.newroot(p);
			}
			;
id_list		:id_list COMMA var	//ok
			{
				Node *p=$1;
				if(p)
				{
				while(p->sibling)
					p=p->sibling;
			//	cout<<"yes";
				p->sibling=$3;
				}
				$$=$1;
			}
			|id_list COMMA assign_decl
			{
				Node *p=$1;
				if(p)
				{
				while(p->sibling)
					p=p->sibling;
			//	cout<<"yes";
				p->sibling=$3;
				}
				$$=$1;
			}
			|var {$1->sibling=NULL;$$=$1;}	//ok
			|assign_decl{$$=$1;}
			;
var			:ID
			{
				//cout<<"here"<<endl;
				Node *p =newExprNode(IDEXPR);
				
				p->attr.symtlb_index=top->insert($1->attr.ch);
				top->set_token(p->attr.symtlb_index,T_ID);
				$$=parsetree.newroot(p);
			} 
			;
var_find	:ID
			{
				Node *p = newExprNode(IDEXPR);
				//cout<<top->location<<" "<<top->size<<endl;
				p->attr.symtlb_index=top->search($1->attr.ch);
				$$=parsetree.newroot(p);
			}
			;
fid			:var
			{
			    top->set_token($1->attr.symtlb_index,T_FID);
				$$=parsetree.newroot($1);
			}	
			;
fun_decl	:type_spec fid LP params RP SEMICOLON  //ok
			{
			
				Node* p =newDeclNode(FUNDECL);
				Node* t = $2;
				t->type=$1->type;
				$$=parsetree.newroot(p,$1,$2,$4);
			}
			;	
params		:params param_list
			{
				$$=$2;
			}  //ok
			|		
			{
				local_table *newtop=new local_table();
				if(!symtlb.empty())
				{
					newtop->set_prev(symtlb.top());
				}
				else
				{
					newtop->set_prev(NULL);
				}
				symtlb.push(newtop);
				top=newtop;
				$$=NULL;
			}	//ok
			;
param_list	:param_list COMMA param  //ok
			{
				Node* p = $1;
				while(p->sibling)
					p=p->sibling;
				p->sibling=$2;
				$$=$1;
			}
			|param 
			{$$=$1;}  //ok
			;
param		:type_spec var	//ok
			{
				Node* p = newExprNode(PARAMEXPR);
				p->type=$1->type;
				$2->type=$1->type;
				$$=parsetree.newroot(p,$1,$2);
			}
			|type_spec var LSP RSP  //???
			{
				Node* p = newExprNode(PARAMEXPR);
				p->type=$1->type;
				$2->type=$1->type;
				$$=parsetree.newroot(p,$1,$2);//????
			}
			;
fun_def		:type_spec fid LP params RP compound	//???
			{
		//	cout<<top->location<<"  "<<top->size<<endl;
				symtlb.pop();
				if(!symtlb.empty())
					top=symtlb.top();
				else 
					top=NULL;
				Node* p =newDeclNode(FUNDEF);
				Node* t = $2;
				t->type=$1->type;
				$$=parsetree.newroot(p,$1,$2,$4,$6);
			}
			;
compound	:LFP local_decl stmts RFP //need to test
			{
				Node *p =newStmtNode(COMPSTMT);
				$$=parsetree.newroot(p,$2,$3);
				cout<<top->location<<"  "<<top->size<<endl;
				symtlb.pop();
				if(!symtlb.empty())
					top=symtlb.top();
				else 
					top=NULL;
			}
			;
				
local_decl	:local_decl var_decl
			{
			//	cout<<"local decl";
				Node *p=$1;
				if(p!=NULL)
				{
				while(p->sibling)
					p=p->sibling;
				p->sibling=$2;
				$$=$1;
				}
				else
				 $$=$2;
			}
			|	
			{
				local_table *newtop=new local_table();
				if(!symtlb.empty())
				{
					newtop->set_prev(symtlb.top());
				}
				else
				{
					newtop->set_prev(NULL);
				}
				symtlb.push(newtop);
				top=newtop;
				$$=NULL;
			}
			;
stmts		:stmts stmt
			{
				Node *p=$1;
				if(p)
				{
				while(p->sibling)
					p=p->sibling;
				p->sibling=$2;
				$$=$1;
				}
				else 
					$$=$2;
			}
			|		{$$=NULL;}
			;
stmt		:expr_stmt	{$$=$1;}
			|if_stmt	{$$=$1;}
			|while_stmt	{$$=$1;}
			|for_stmt	{$$=$1;}
			//|input	{$$=$1;}
			//|print	{$$=$1;}
			|compound	
			{
				$$=$1;
			}
			|return_stmt	{$$=$1;}	//ok
			|assign_stmt {$$=$1;}
			;
if_stmt		:IF LP expr RP stmt 
			{
				Node *p = newStmtNode(IFSTMT);
				$$=parsetree.newroot(p,$3,$5);
			}
			|IF LP expr RP stmt ELSE stmt
			{
				Node *p = newStmtNode(IFSTMT);
				$$=parsetree.newroot(p,$3,$5,$7);
			}
			;
while_stmt	:WHILE LP expr RP stmt
			{
				Node *p = newStmtNode(WHILESTMT);
				$$=parsetree.newroot(p,$3,$5);
			}
			;
for_stmt	:FOR LP expr_list SEMICOLON expr_list SEMICOLON expr_list RP stmt
			{
				Node *p = newStmtNode(FORSTMT);
				$$=parsetree.newroot(p,$3,$5,$7,$9);
			}	
			;
expr_list	:expr {$$=$1;}
			| {$$=NULL;}
			;
return_stmt	:RETURN SEMICOLON 
			{
				Node* p= newStmtNode(RETURNSTMT);
				$$=parsetree.newroot(p);
			}
			|RETURN expr SEMICOLON
			{
				Node* p= newStmtNode(RETURNSTMT);
				$$=parsetree.newroot(p,$2);
			}
			;
expr_stmt	:expr SEMICOLON {$$=$1;}
			|SEMICOLON	{$$=NULL;}
			;
assign_decl	:var ASSIGN expr 
			{
				Node* p = newStmtNode(ASSIGNSTMT);
				$$=parsetree.newroot(p,$1,$3);
			}
			;
assign_stmt	:var_find ASSIGN expr 
			{
				Node* p = newStmtNode(ASSIGNSTMT);
				$$=parsetree.newroot(p,$1,$3);
			}
			;	
expr		:expr LOR expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="||";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr LAND expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="&&";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr EQ expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="==";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr NEQ expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="!=";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr BE expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="<=";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr AE expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op=">=";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr BELOW expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="<";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr ABOVE expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op=">";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr ADD expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="+";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr SUB expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="-";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr MUL expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="*";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr DIV expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="/";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr LSHIFT expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="<<";
				$$=parsetree.newroot(p,$1,$3);
			}
			|expr RSHIFT expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op=">>";
				$$=parsetree.newroot(p,$1,$3);
			}
			|NOT expr
			{
				Node *p=newExprNode(OPEXPR);
				p->attr.op="!";
				$$=parsetree.newroot(p,$2);
			}
			|factor {$$=$1;}
			;
factor		:LP expr RP {$$=$2;}
			|var_find	{$$=$1;}
			|NUM	
			{
				$1->type=INTEGER;
				$$=parsetree.newroot($1);
			}
			|FNUM
			{
				$1->type=T_FLOAT;
				$$=parsetree.newroot($1);
			//	cout<<"ok";
			}
			|CONSTCHAR
			{
		
				$$=parsetree.newroot($1);
			}
			|fun	{$$=$1;}
			;
fun			:var_find LP argv RP 
			{
				Node* p =newExprNode(FUNEXPR);
				p->type=$1->type;
				$$=parsetree.newroot(p,$1,$3);
			}
			;
argv		:argv_list{$$=$1;}
			 |	{$$=NULL;}
			 ;
argv_list	:argv_list COMMA expr
			{
				Node* t=$1;
				while(t->sibling)
					t=t->sibling;
				t->sibling=$2;
				$$=$1;
			}
			|expr	{$$=$1;}
			;
			
Grammar
	: /* empty */
	;

%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int main(void)
{
	//cout<<top->location<<"  "<<top->size<<endl;
	symtlb.push(top);
	//cout<<"init"<<endl;
	int n = 1;
	mylexer lexer;
	myparser parser;
	if (parser.yycreate(&lexer)) {
		if (lexer.yycreate(&parser)) {
			n = parser.yyparse();
		}
	}
	return n;
}

