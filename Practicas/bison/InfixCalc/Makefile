calc:calc.y calc.l
	bison -d calc.y
	flex calc.l
	gcc -c calc.tab.c
	gcc -c lex.yy.c
	gcc calc.tab.o lex.yy.c -lfl
