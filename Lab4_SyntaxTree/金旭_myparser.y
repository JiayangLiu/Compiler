%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 3016Äê11ÔÂ8ÈÕ
****************************************************************************/
#include "Tree.h"
#include "mylexer.h"
#include "SymbolTable.h"
int linenum=0;
int seq=0;
vector<TreeNode*> forest;
extern SymbolTable table;
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
#ifndef YYSTYPE TreeNode*
#define YYSTYPE TreeNode*
#endif
}

// place any declarations here
%token _BOOL,_INT,_DOUBLE,_FLOAT,_CHAR,_VOID,_IF,_ELSE,_DO,_WHILE,_FOR,_RETURN,_ID,_NUM,_PLUS_ASSIGN,_MINUS_ASSIGN,_TIMES_ASSIGN,_DIVIDE_ASSIGN,_INCREASE,_DECREASE,_ARROW,_POINT,_PLUS,_MINUS,_TIMES,_DIVIDE,_COMPLEMENTION,_REVERSE,_LEFT_S,_RIGHT_S,_LEFT_M,_RIGHT_M,_LEFT_L,_RIGHT_L,_LARGER,_LESS,_LARGER_EQUAL,_LESS_EQUAL,_NOT_EQUAL,_EQUAL,_ASSIGN,_BIT_AND,_BIT_OR,_LOGICAL_AND,_LOGICAL_OR,_COMMA,_SEMICOLON,_LEFT_SHIFT,_RIGHT_SHIFT,_NOT,_RIGHT
%right _RIRHT
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (OP::there must be at least one)
start:start stmtseg{/*cout<<endl;*/}{forest.push_back($2);cout<<*$2<<endl;}
	|start funcdef{/*cout<<endl;*/}{forest.push_back($2);cout<<*$2<<endl;}
	|stmtseg{cout<<*$1<<endl;}
	|funcdef{cout<<*$1<<endl;}
	;
funcdef:type _ID{/*cout<<"I"<<" ";*/} _LEFT_S {/*cout<<"LS"<<" ";*/} paralist _RIGHT_S {/*cout<<"RS"<<" ";*/} _LEFT_L {/*cout<<"LL"<<" ";*/} stmtlist _RIGHT_L {/*cout<<"RL"<<" ";*/}
	{
	$$=TreeNode::new_funcdef_node($2->attribute.text,$1->attribute.var_type,++seq);
	$$->next[0]=$6;
	$$->next[1]=$11;
	SymbolTableNode* node=table.findlast($2->attribute.text);
	node->var_type=$1->attribute.var_type;
	node->id_type=id_function;
	for(int i=0;$6->next[i]!=NULL;i++){
		node->para.push_back(Para($6->next[i]->attribute.var_type,$6->next[i]->attribute.id_type,$6->next[i]->attribute.text));
	}
	}
	|type _TIMES {/*cout<<"x"<<" ";*/}_ID{/*cout<<"I"<<" ";*/} _LEFT_S {/*cout<<"LS"<<" ";*/} paralist _RIGHT_S {/*cout<<"RS"<<" ";*/} _LEFT_L {/*cout<<"LL"<<" ";*/} stmtlist _RIGHT_L {/*cout<<"RL"<<" ";*/}
	{
	$$=TreeNode::new_funcdef_node($4->attribute.text,$1->attribute.var_type,++seq,id_pointer);
	$$->next[0]=$8;
	$$->next[1]=$13;
	SymbolTableNode* node=table.findlast($4->attribute.text);
	node->var_type=(VAR_TYPE)($1->attribute.var_type+6);
	node->id_type=id_function;
	for(int i=0;$6->next[i]!=NULL;i++){
	node->para.push_back(Para($6->next[i]->attribute.var_type,$6->next[i]->attribute.id_type,$6->next[i]->attribute.text));
	}
	}
	;
paralist:paralist _COMMA {/*cout<<"CM"<<" ";*/}para
	{
	$$=TreeNode::new_paralist_node(++seq);
	int i=0;
	for(i=0;i<MAX_SIZE;i++){
		if($1->next[i])$$->next[i]=$1->next[i];
		else break;
		}
	$$->next[i]=$4;
	}
	|para
	{
	$$=TreeNode::new_paralist_node(++seq);
	$$->next[0]=$1;
	}
	|
	{
	$$=TreeNode::new_paralist_node(++seq);
	}
	;
para: type id	
	{
	if($2->attribute.id_type==id_pointer)$$=TreeNode::new_para_node($1->attribute.var_type,$2->attribute.text,++seq,id_pointer);
	else $$=TreeNode::new_para_node($1->attribute.var_type,$2->attribute.text,++seq);
	SymbolTableNode* node=table.findlast($2->attribute.text);
	node->var_type=$1->attribute.var_type;
	node->id_type=$2->attribute.id_type;
	node->size.push_back($2->attribute.arraysize);
	}
	;				
stmtseg:_WHILE{/*cout<<"W"<<" ";*/} _LEFT_S{/*cout<<"LS"<<" ";*/} expr _RIGHT_S{/*cout<<"RS"<<" ";*/} stmtseg 
	{
	$$=TreeNode::new_stmt_node(stmt_while,++seq);
	$$->next[0]=$5;
	$$->next[1]=$8;
	}
	|_FOR{/*cout<<"F"<<" ";*/} _LEFT_S{/*cout<<"LS"<<" ";*/} expr _SEMICOLON{/*cout<<"SC"<<" ";*/} expr _SEMICOLON{/*cout<<"SC"<<" ";*/} expr _RIGHT_S{/*cout<<"RS"<<" ";*/} stmtseg
	{
	$$=TreeNode::new_stmt_node(stmt_for,++seq);
	$$->next[0]=$5;
	$$->next[1]=$8;
	$$->next[2]=$11;
	$$->next[3]=$14;
	} 
	|_DO{/*cout<<"D"<<" ";*/} stmtseg _WHILE{/*cout<<"W"<<" ";*/} expr _SEMICOLON {/*cout<<"SC"<<" ";*/}
	{
	$$=TreeNode::new_stmt_node(stmt_do_while,++seq);
	$$->next[0]=$3;
	$$->next[1]=$6;
	}
	|if 
	{
	$$=$1;
	}
	|if _ELSE{/*cout<<"E"<<" ";*/} stmtseg
	{
	$$=$1;
	$$->next[2]=$4;
	} 
	|type idlist _SEMICOLON{/*cout<<"SC"<<" ";*/}
	{
	$$=TreeNode::new_def_node($1->attribute.var_type,++seq);
	$$->next[0]=$2;
	for(int i=0;$2->next[i]!=NULL;i++){
		SymbolTableNode* node=table.findlast($2->next[i]->attribute.text);
		node->var_type=$1->attribute.var_type;
		node->id_type=$2->next[i]->attribute.id_type;
		node->size.push_back($2->next[i]->attribute.arraysize);
	}
	}
	|arith _SEMICOLON{/*cout<<"SC"<<" ";*/}
	{
	$$=$1;
	}
	|func _SEMICOLON{/*cout<<"SC"<<" ";*/}
	{
	$$=$1;
	}
	|_RETURN {/*cout<<"RT"<<" ";*/} expr _SEMICOLON {/*cout<<"SC"<<" ";*/}
	{
	$$=TreeNode::new_stmt_node(stmt_return,++seq);
	$$->next[0]=$3;
	}
	|_LEFT_L{/*cout<<"LL"<<" ";*/} stmtlist _RIGHT_L{/*cout<<"RL"<<" ";*/}
	{
	$$=$3;
	}
	|_SEMICOLON{/*cout<<"SC"<<" ";*/}
	{
	$$=TreeNode::new_stmtlist_node(++seq);
	}
	;

func:_ID {/*cout<<"I"<<" ";*/} _LEFT_S {/*cout<<"LS"<<" ";*/} exprlist _RIGHT_S {/*cout<<"RS"<<" ";*/}
	{
	$$=TreeNode::new_func_node($1->attribute.text,++seq);
	$$->next[0]=$5;
	}	
	;
exprlist:exprlist _COMMA {/*cout<<"CM"<<" ";*/} expr
	{
	$$=TreeNode::new_exprlist_node(++seq);
	int i=0;
	for(i=0;i<MAX_SIZE;i++){
		if($1->next[i])$$->next[i]=$1->next[i];
		else break;
		}
	$$->next[i]=$4;
	}
	|expr
	{
	$$=TreeNode::new_exprlist_node(++seq);
	$$->next[0]=$1;
	}
	|
	{
	$$=TreeNode::new_exprlist_node(++seq);
	}
	;	
stmtlist:stmtlist stmtseg
	{
	$$=TreeNode::new_stmtlist_node(++seq);
	int i=0;
	for(i=0;i<MAX_SIZE;i++){
		if($1->next[i]!=NULL)$$->next[i]=$1->next[i];
		else break;
	}
	$$->next[i]=$2;
	}
	|
	{
	$$=TreeNode::new_stmtlist_node(++seq);
	}	
	;
if: _IF{/*cout<<"IF"<<" ";*/} _LEFT_S{/*cout<<"LS"<<" ";*/} expr _RIGHT_S{/*cout<<"RS"<<" ";*/} stmtseg
	{
	$$=TreeNode::new_stmt_node(stmt_if,++seq);
	$$->next[0]=$5;
	$$->next[1]=$8;
	}
	;	
type:_INT{/*cout<<"INT"<<" ";*/} {$$=TreeNode::new_vartype_node(type_int,++seq);}
	|_DOUBLE{/*cout<<"DOU"<<" ";*/} {$$=TreeNode::new_vartype_node(type_double,++seq);}
	|_FLOAT{/*cout<<"FLO"<<" ";*/} {$$=TreeNode::new_vartype_node(type_float,++seq);}
	|_CHAR{/*cout<<"CH"<<" ";*/} {$$=TreeNode::new_vartype_node(type_char,++seq);}
	|_VOID{/*cout<<"VO"<<" ";*/} {$$=TreeNode::new_vartype_node(type_void,++seq);}
	|_BOOL{/*cout<<"BO"<<" ";*/} {$$=TreeNode::new_vartype_node(type_bool,++seq);}
	//|_INT{/*cout<<"INT"<<" ";*/} _TIMES  {$$=TreeNode::new_vartype_node(type_p_int,++seq);}
	//|_DOUBLE{/*cout<<"DOU"<<" ";*/} _TIMES {$$=TreeNode::new_vartype_node(type_p_double,++seq);}
	//|_FLOAT{/*cout<<"FLO"<<" ";*/} _TIMES {$$=TreeNode::new_vartype_node(type_p_float,++seq);}
	//|_CHAR{/*cout<<"CH"<<" ";*/} _TIMES {$$=TreeNode::new_vartype_node(type_p_char,++seq);}
	//|_VOID{/*cout<<"VO"<<" ";*/} _TIMES {$$=TreeNode::new_vartype_node(type_p_void,++seq);}
	//|_BOOL{/*cout<<"BO"<<" ";*/} _TIMES {$$=TreeNode::new_vartype_node(type_p_bool,++seq);}
	;
idlist:idlist _COMMA{/*cout<<"CM"<<" ";*/} next
	{
	$$=TreeNode::new_idlist_node(++seq);
	int i=0;
	for(i=0;i<MAX_SIZE;i++){
		if($1->next[i]!=NULL)$$->next[i]=$1->next[i];
		else break;
	}
	$$->next[i]=$4;	
	} 
	|next
	{
	$$=TreeNode::new_idlist_node(++seq);
	$$->next[0]=$1;
	}
	;
next:id
	{
	$$=$1;
	}
	|id _ASSIGN right
	{
	$$=$1;
	$$->next[0]=$3;
	}
	;	
right:expr
	{
	$$=$1;
	}	
	|_LEFT_L numlist _RIGHT_L
	{
	$$=$2;
	}
	;
numlist:numlist _COMMA _NUM
	{
	$$=TreeNode::new_numlist_node(++seq);
	int i=0;
	for(i=0;i<MAX_SIZE;i++){
		if($1->next[i])$$->next[i]=$1->next[i];
		else break;
		}
	$$->next[i]=$3;
	$$->next[i]->seq=++seq;
	}
	|_NUM
	{
	$$=TreeNode::new_numlist_node(++seq);
	$$->next[0]=$1;
	$$->next[0]->seq=++seq;
	}
	;		
expr:expr _LOGICAL_AND {/*cout<<"LA"<<" ";*/} second
	{
	$$=TreeNode::new_expr_node(OP::logical_and,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|expr _LOGICAL_OR {/*cout<<"LO"<<" ";*/} second
	{
	$$=TreeNode::new_expr_node(OP::logical_or,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|second
	{
	$$=$1;
	}
	;
second:second _LARGER {/*cout<<"LAR"<<" ";*/} arith
	{
	$$=TreeNode::new_expr_node(OP::larger,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|second _LARGER_EQUAL {/*cout<<"LARE"<<" ";*/} arith
	{
	$$=TreeNode::new_expr_node(OP::larger_equal,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|second _LESS {/*cout<<"L"<<" ";*/} arith
	{
	$$=TreeNode::new_expr_node(OP::less,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|second _LESS_EQUAL {/*cout<<"LE"<<" ";*/} arith
	{
	$$=TreeNode::new_expr_node(OP::less_equal,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|second _EQUAL {/*cout<<"E"<<" ";*/} arith
	{
	$$=TreeNode::new_expr_node(OP::equal,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|second _NOT_EQUAL {/*cout<<"NE"<<" ";*/} arith
	{
	$$=TreeNode::new_expr_node(OP::not_equal,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|arith
	{
	$$=$1;
	}
	;
arith:arith _ASSIGN {/*cout<<"E"<<" ";*/}part 
	{
	$$=TreeNode::new_expr_node(OP::assign,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|arith _PLUS_ASSIGN {/*cout<<"PA"<<" ";*/}part
	{
	$$=TreeNode::new_expr_node(OP::plus_assign,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|arith _MINUS_ASSIGN {/*cout<<"MA"<<" ";*/}part
	{
	$$=TreeNode::new_expr_node(OP::minus_assign,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|arith _TIMES_ASSIGN {/*cout<<"TA"<<" ";*/}part
	{
	$$=TreeNode::new_expr_node(OP::times_assign,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|arith _DIVIDE_ASSIGN {/*cout<<"DA"<<" ";*/}part
	{
	$$=TreeNode::new_expr_node(OP::divide_assign,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|part
	{
	$$=$1;
	}
	;	
part:part _PLUS {/*cout<<"P"<<" ";*/} term
	{
	$$=TreeNode::new_expr_node(OP::plus,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|part _MINUS {/*cout<<"M"<<" ";*/} term
	{
	$$=TreeNode::new_expr_node(OP::minus,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|part _COMPLEMENTION {/*cout<<"C"<<" ";*/} term
	{
	$$=TreeNode::new_expr_node(OP::complemention,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|term
	{
	$$=$1;
	}
	;
term:term _BIT_AND {/*cout<<"BA"<<" ";*/}section
	{
	$$=TreeNode::new_expr_node(OP::bit_and,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|term _BIT_OR {/*cout<<"BO"<<" ";*/}section
	{
	$$=TreeNode::new_expr_node(OP::bit_or,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|term _LEFT_SHIFT {/*cout<<"LS"<<" ";*/}section
	{
	$$=TreeNode::new_expr_node(OP::left_shift,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|term _RIGHT_SHIFT {/*cout<<"RS"<<" ";*/}section
	{
	$$=TreeNode::new_expr_node(OP::right_shift,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|section
	{
	$$=$1;
	}
	;
section:section _TIMES {/*cout<<"T"<<" ";*/}factor
	{
	$$=TreeNode::new_expr_node(OP::times,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|section _DIVIDE {/*cout<<"D"<<" ";*/}factor
	{
	$$=TreeNode::new_expr_node(OP::divide,++seq);
	$$->next[0]=$1;
	$$->next[1]=$4;
	}
	|factor
	{
	$$=$1;
	}
	;
factor:_NOT{/*cout<<"NOT"<<" ";*/} factor %prec _RIGHT
		{
		$$=TreeNode::new_expr_node(OP::not_,++seq);
		$$->next[0]=$3;
		}
		|_REVERSE{/*cout<<"RE"<<" ";*/} factor %prec _RIGHT
		{
		$$=TreeNode::new_expr_node(OP::reverse,++seq);
		$$->next[0]=$3;
		}
		|_MINUS{/*cout<<"UM"<<" ";*/} factor %prec _RIGHT
		{
		$$=TreeNode::new_expr_node(OP::uminus,++seq);
		$$->next[0]=$3;
		}
		|_NUM{/*cout<<"N"<<" ";*/}
		{
		$$=$1;
		$$->seq=++seq;
		}
		|_ID{/*cout<<"I"<<" ";*/}
		{
		$$=$1;
		$$->seq=++seq;
		}
		|_BIT_AND{/*cout<<"ADDR"<<" ";*/} factor{/*cout<<"I"<<" ";*/}%prec _RIGHT
		{
		$$=TreeNode::new_expr_node(OP::get_address,++seq);
		$$->next[0]=$3;
		$$->next[0]->seq=++seq;
		}
		|_TIMES{/*cout<<"VA"<<" ";*/} factor{/*cout<<"I"<<" ";*/}%prec _RIGHT
		{
		$$=TreeNode::new_expr_node(OP::get_value,++seq);
		$$->next[0]=$3;
		$$->next[0]->seq=++seq;
		}	
		|_ID{/*cout<<"I"<<" ";*/} _INCREASE{/*cout<<"IC"<<" ";*/}
		{
		$$=TreeNode::new_expr_node(OP::right_increase,++seq);
		$$->next[0]=$3;
		$$->next[0]->seq=++seq;
		}
		|_INCREASE{/*cout<<"IC"<<" ";*/} _ID{/*cout<<"I"<<" ";*/}%prec _RIGHT
		{
		$$=TreeNode::new_expr_node(OP::left_increase,++seq);
		$$->next[0]=$3;
		$$->next[0]->seq=++seq;
		}
		|_ID{/*cout<<"I"<<" ";*/} _DECREASE{/*cout<<"DC"<<" ";*/}
		{
		$$=TreeNode::new_expr_node(OP::right_decrease,++seq);
		$$->next[0]=$3;
		$$->next[0]->seq=++seq;
		}
		|_DECREASE{/*cout<<"DC"<<" ";*/} _ID{/*cout<<"I"<<" ";*/}%prec _RIGHT
		{
		$$=TreeNode::new_expr_node(OP::left_decrease,++seq);
		$$->next[0]=$3;
		$$->next[0]->seq=++seq;
		}
		|_LEFT_S{/*cout<<"LS"<<" ";*/} expr _RIGHT_S{/*cout<<"RS"<<" ";*/}
		{
		$$=$3;
		}
		|func
		{
		$$=$1;
		}
		|_ID _LEFT_M expr _RIGHT_M
		{
		$$=TreeNode::new_expr_node(OP::subscript,++seq);
		$$->next[0]=$1;
		$$->next[0]->seq=++seq;
		$$->next[1]=$3;
		}
		;
id:_ID{/*cout<<"I"<<" ";*/}
		{
		$$=$1;
		$$->attribute.id_type=id_variable;
		$$->seq=++seq;
		}
		|_TIMES{/*cout<<"VA"<<" ";*/} _ID{/*cout<<"I"<<" ";*/}%prec _RIGHT
		{
		$$=$3;
		$$->attribute.id_type=id_pointer;
		$$->seq=++seq;
		}
		|_ID {/*cout<<"I"<<" ";*/} _LEFT_M{/*cout<<"LM"<<" ";*/} _NUM{/*cout<<"N"<<" ";*/} _RIGHT_M {/*cout<<"RM"<<" ";*/}
		{
		$$=$3;
		$$->attribute.id_type=id_array;
		$$->seq=++seq;
		$$->attribute.arraysize=$5->attribute.value;
		}
		;
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int main(void)
{
	int n = 1;
	mylexer lexer;
	myparser parser;
	if (parser.yycreate(&lexer)) {
		if (lexer.yycreate(&parser)) {
			lexer.yyin = new ifstream("input.txt");
			n = parser.yyparse();
		}
	}
	table.postprocess();
	//cout<<table;
	system("PAUSE");
	return n;
}

