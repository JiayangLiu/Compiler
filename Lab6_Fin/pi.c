main() {
	int i, j, n, r, x, y, pi = 0;
	char c = 'a';
	printf(1+2-3*4/5%6&7|8^9>>1);

	for (i = 0; i < 10; i = i + 1)
		printf(c++ - 'a');

	input(n);
	while (n >= 0) {
		if (n >= 10 && n < 100) 
			printf(1);
		else if (n <= -1 || n > 4) 
			r = 0;
		else for (r = 1; n > 0; n--)
			r = (r << 3) + (r << 1);
			//should not write r * 10 by this way in practice.

		pi = 0;
		for (i = -r; i < r; i = i + 1) {
			for (j = -r; j < r; j = j + 1) {
				x = (i * 2) + 1; y = (j * 2) + 1;
				if (x * x + y * y < 4 * r * r) pi = pi + 1;
			}
		}

		if (r >= 1)
			if (r >= 2) 
				printf(pi / r);
			else 
				printf(3);
		input(n);
	}
}
