void basic() {
	int a, b;
	while (a == 0) { while(b == 0) { a = b + 1; } }
}

void declare() {
	int a = 1, b, c = 0;
}

void operator() {
	(1 - (2 - 3) - 4);
	1 + 2 * 3 << 4 && 5 || 6;
}

void control() {
	int a, b;
	if (a) 1; if (b) 2; else 3;
	if (a) { if (b); } else;
	for(;;) for(;;a + b) {};
}

void comment() {
	// single-line comment
	/*
	 * multiple-line comment
	 */
}

main() {
	if (a==0) ;
	basic();
	declare();
	operator();
	control();
	comment();
}