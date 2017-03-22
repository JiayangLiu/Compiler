
char* copyString(char* s)
{
	int i;
	char* p;
	if(s == NULL) 
	{
		return NULL;
	}
	i = strlen(s)+1;
	p = malloc(i);
	if(p == NULL)
	{
		fprintf(listing, "out of memory error at line %d\n", lineno);
	}
	else{
		strcpy(p, s);
	}
	return p;
}

void syntaxError(char* me)
{  fprintf(listing, "\n>>> "); 
   fprintf(listing, "Syntax error at line %d: %s\n", lineno, me); 
   Error = TRUE;
}

void match(TokenType ex)
{
	if(token == ex)
	{
		token = getToken();
	}
	else {
		syntaxError("unexpected token->");
	    printToken(token, tokenString);
        fprintf(listing, "   ");  

	}
}

TreeNode* program()
{
	TreeNode* t = declaration();
 	TreeNode* p = t;  
	while((token!=INT) && (token!=VOID))
	{
		syntaxError("unexpected token->");
	    printToken(token, tokenString);
		token = getToken();
	}
	while((token==INT) || (token==VOID))
	{
		TreeNode* q;
		q = declaration();
		if(q != NULL)
		{
			if(t == NULL)
			{
				t = p = q;
			}
			else {
				p->sibling = q;
			   	p = q;
			}
		}
	}
	return t;
}

static TreeNode* declaration(void)
{
	TreeNode* t = NULL;
	if(token == INT)
	{
		t = newStmtNode(IntK);
		match(INT);
	}
 	if(token == VOID)
  	{  
    	t = newStmtNode(VoidK);
		match(VOID);
  	}
	if((t!=NULL) && (token==ID))
	{
		TreeNode* p = NULL;
		p = newExpNode(Idk);     
	  	p->attr.name = copyString(tokenString); 
		t->child[0] = p;
    	match(ID);
  	}
  	if((token==LPAREN) && (t->child[0]!=NULL))
  	{
  		t->child[1] = func_declaration();
  	}
  	else if((token==LZGH) || (token==SEMI))
	{
		t->child[1] = var_declaration();
	}
	else {
  		syntaxError("unexpected token->");
		printToken(token, tokenString);
	}
	return t;
}

static TreeNode* fun_declaration(void)
{
	TreeNode* t = newStmtNode(HanK);
    match(LPAREN);
	t->child[0] = params();  /*get the param list*/
	match(RPAREN);
	t->child[1] = compound_stmt();
	return t;
}

static TreeNode* var_declaration(void)
{
	TreeNode* t = NULL;
	if(token == LZGH)
	{
		match(LZGH);
		t = newExpNode(Vark);
		if((t!=NULL) && (token==NUM))
		{
			t->attr.val = atoi(tokenString);
		}
		else {
			syntaxError("unexpected token->");
	    	printToken(token, tokenString);
    	}
    	match(NUM);
    	match(RZGH);
    	match(SEMI);
   	} 
  	else {
  		match(SEMI);
  	}   //将;号辨别放在declaration中
    return t;
}

static TreeNode* params(void)
{
	TreeNode* t = NULL;
   	if(token == VOID)
 	{
   		t = newStmtNode(VoidK);
		match(VOID);
	}
   	else if(token==INT)
   	{
   		t = param_list();
   	}
   	else
   	{
   		syntaxError("unexpected token->");
	    printToken(token, tokenString);
   	}
   	return t;
}

static TreeNode* param_list(void)
{
	TreeNode* t = param();
	TreeNode* p = t; 
   	while (token == DOU)
   	{
   		TreeNode* q = NULL;
		match(DOU);
		q = param();
		if (q != NULL)
		{
			if (t == NULL)
			{
				t=p=q;
			}
			else {
				p->sibling = q;
	        	p=q;
			}
		}
   }
   return t;
}

static TreeNode* param(void)
{
	TreeNode* t = NULL;
	if (token == INT)
	{
		t = newStmtNode(IntK);
    	match(INT);
		if (token == ID)
		{
			TreeNode* p = NULL;
    		p = newExpNode(Idk);     
	 		p->attr.name = copyString(tokenString); 
			t->child[0] = p;
        	match(ID);
		}
    	else
		{
			syntaxError("unexpected token->");
	    	printToken(token, tokenString);
		}
		if ((token==LZGH) && (t->child[0]!=NULL))
		{
    		match(LZGH);
    		t->child[1] = newExpNode(Vark);
    		match(RZGH);
		}
		else {
	 		return t;
		}
  	} 
  	else {
  		syntaxError("unexpected token->");
	    printToken(token, tokenString);
	}
	return t;
}

static TreeNode* compound_stmt(void)
{
	TreeNode* t = newStmtNode(HanshutiK);
	match(LDGH);
	if (token == INT)
	{
		t->child[1] = local_var_declaration();
		if (token == RDGH)   
		{
			match(RDGH);
			return t;
		}
	    else {
	    	t->child[2] = statement_list();
	    }
	}
	else if (token == RDGH)
    {
    	match(RDGH);
    	return t;
	}
	else {
		t->child[0] = statement_list();
	}
	while((token!=RDGH) && (token!=ENDFILE))
	{
		token = getToken();
	}
	match(RDGH);
	return t;
}

static TreeNode* local_var_declaration(void)
{
	TreeNode* t = NULL;
	TreeNode* s = t;
	while (token == INT)
	{
		TreeNode* q = newStmtNode(IntK);
		match(INT);
    	if((q!=NULL) && (token==ID))
		{
			TreeNode* p = NULL;
    		p = newExpNode(Idk);     
    		p->attr.name = copyString(tokenString); 
			match(ID);
			p->child[1] = var_declaration();
			q->child[0] = p; 
			if (t == NULL)
			{
				t=s=q;
			} 
			else {
				s->sibling = q;
	    		s=q;
	    	}
		}
    	else {
    		syntaxError("unexpected token->");
	    	printToken(token, tokenString);
		}
	}
    return t;
}

static TreeNode* statement_list(void)
{
	TreeNode* t = statement();   
	TreeNode* p = t;
	while (IF==token || token==LDGH || ID==token || WHILE==token || RETURN==token)
	{
		TreeNode* q;
    	q = statement();
		if (q != NULL)
		{
			if (t == NULL)
			{
				t=p=q;
			}
			else
			{
				p->sibling = q;
				p=q;
			}
		}
	}
	return t;
}

static TreeNode* statement(void)
{
	TreeNode* t = NULL;
	switch (token)
	{
		case IF:
			t = selection_stmt();
			break;
		case ID:
			t = expression_stmt();
			break;
		case SEMI:
    		t = expression_stmt();
    		break;
		case WHILE:
			t = iteration_stmt();
			break;
		case RETURN:
			t = return_stmt();
			break;
		case LDGH:
			t = compound_stmt();
			break;
		default:
			syntaxError("unexpected token->");
	    	printToken(token, tokenString);
        	token = getToken();
			break;
	}
    return t;
}

static TreeNode* selection_stmt(void)
{
	TreeNode* t = newStmtNode(IfK);
	match(IF);
	match(LPAREN);
	if(t != NULL)
	{
		t->child[0] = expression();
	}
    match(RPAREN);
	t->child[1] = statement();
	if (token == ELSE)
	{
		match(ELSE);
    	if (t != NULL)
    	{
    		t->child[2] = statement();
    	}
	}
	return t;
}

static TreeNode* expression_stmt(void)
{
	TreeNode* t  =NULL;
	if (token == SEMI)  
	{
		return t;
	}
	else 
	{
		t = expression();
    	match(SEMI);
	}
	return t;
}

static TreeNode* iteration_stmt(void)
{
	TreeNode* t = newStmtNode(WhileK);
    match(WHILE);
    match(LPAREN);
    if (t != NULL)
    {
    	t->child[0] = expression();
    }
    match(RPAREN);
	if (t != NULL)
	{
		t->child[1] = statement();
	}
    return t;
}

static TreeNode* return_stmt(void)
{
	TreeNode* t = newStmtNode(ReturnK);
	match(RETURN);
	if (token == SEMI)
	{
		match(SEMI);
		return t;
	}
	else {
		if (t != NULL)
		{
			t->child[0] = expression();
		} 
	}
    match(SEMI);
    return t;
}


static TreeNode* expression(void)
{
	TreeNode* t = var();
	if (t == NULL)
    {
    	t = simple_expression(t);
    }
	else {
		TreeNode* p = NULL;
		if (token == ASSIGN)
		{
			p = newStmtNode(AssignK);
	    	p->attr.name = t->attr.name;
        	t = p;
	    	match(ASSIGN);
        	t->child[1] = expression();
        	return t;
		}
		else {
			t = simple_expression(t);
		}
	}	   
    return t;
}

static TreeNode* simple_expression(TreeNode* k)
{
	TreeNode* t = additive_expression(k);
	k = NULL;
	if ((token==EQ) || (token==BT) || (token==BQ) || (token==LT)|| (token==LQ) || (token==UEQ))
	{
		TreeNode* q = newExpNode(Opk);
	    q->attr.op = token; 
		q->child[0] = t;
		t = q;
		match(token);
		t->child[1] = additive_expression(k);		 
		return t;
	}
    return t;
}
static TreeNode* additive_expression(TreeNode* k)
{
	TreeNode* t = term(k);
    k = NULL;
	while ((token==PLUS) || (token==MINUS))
	{
		TreeNode* q = newExpNode(Opk);
        q->attr.op = token; 
		q->child[0] = t; 
		match(token);
		q->child[1] = term(k);
		t = q;		
	}
    return t;
}

static TreeNode* term(TreeNode* k)
{
	TreeNode* t = factor(k);
    k = NULL;
	while ((token==TIMES) || (token==OVER))
	{
		TreeNode* q = newExpNode(Opk);
        q->attr.op = token; 
		q->child[0] = t; 
		t = q;
        match(token);
		q->child[1] = factor(k);
	}
    return t;
}

static TreeNode* factor(TreeNode* k)
{
	TreeNode* t = NULL;
	if (k != NULL)
	{
		if (token == LPAREN) 
		{
			t = call(k);
		}
		else {
			t = k;
		}
	}
	else {
	switch (token)
	{
		case LPAREN:
			match(LPAREN);
			t = expression();
        	match(RPAREN);
			break;
		case ID:
			t = var();
        	if ((token==LPAREN) && (t->child[0]==NULL)) 
			{
				t = call(t);
			}
			break;
		case NUM:
			t = newExpNode(Constk);
			if((t!=NULL) && (token==NUM))
			{
				t->attr.val = atoi(tokenString);
			}
			match(NUM);
			break;
		default:
        	syntaxError("unexpected token->");
	    	printToken(token, tokenString);
        	token = getToken();
			break;
		} 
	}
	return t;
}

static TreeNode* var(void)
{
	TreeNode* t = NULL;
	if (token == ID)
	{
		t = newExpNode(Idk);     
		t->attr.name = copyString(tokenString); 
    	match(ID);
		if (token == LZGH) 
		{
			match(LZGH);
	    	t->child[0] = expression();
        	match(RZGH);
		}
	}
	return t;
}

static TreeNode* call(TreeNode* k)
{
	TreeNode* t = k;
	match(LPAREN);
	if (token == RPAREN)  
	{
		match(RPAREN);
		return t;
	}
	else {
		t->child[0] = args();
		match(RPAREN);
	}
	return t;
}

static TreeNode* args(void)
{
	TreeNode* t = expression();
	TreeNode* p = t;
	while (token == DOU)
	{
		TreeNode* q;
    	match(DOU);
    	q = expression();
		if(q != NULL)
		{
			if (t == NULL)
			{
				t=p=q;
			}
			else
			{
				p->sibling = q;
				p=q;
			}
		}
	}
	return t;
}

TreeNode* parse(void)
{
	TreeNode* t;
	token = getToken();
	t = program();
	if (token != ENDFILE)
	{
		syntaxError("code end before\n");
	}
	return t;
}


// ------------------------------------------



/*
TreeNode* simple_exp(void)
{
	TreeNode* t = term();
	while ((token==PLUS) || (token==MINUS))
	{
		TreeNode* p = newExpNode(OpK);
		if (p != NULL)
		{
			p->child[0] = t;
			p->attr.op = token;
			t = p;
			match(token);
			t->child[1] = term();
		}
	}
	return t;
}

TreeNode* if_stmt(void)
{
	TreeNode* t = newStmtNode(IfK);
	match(IF);
	if (t != NULL)
		t->child[0] = exp();
	match(THEN);
	if (t != NULL)
		t->child[1] = stmt_sequence();
	if (token == ELSE)
	{
		match(ELSE);
		if (t != NULL)
			t->child[2] = stmt_sequence();
	}
	match(END);
	return t;
}
*/
