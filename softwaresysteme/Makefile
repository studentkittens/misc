pandoc:
	# That's ugly, but a man has to eat.
	# Nice cooking takes time. As clean solutions do...
	cp zusammenfassung.md zusammenfassung.whole.md
	echo -e '\n## 5.1 ``6.i``\n```lex' >> zusammenfassung.whole.md
	cat 6.i | sed 's/^/    /g' >> zusammenfassung.whole.md
	echo -e '```\n## 5.2 ``7.i``\n```lex' >> zusammenfassung.whole.md
	cat 7.i | sed 's/^/    /g' >> zusammenfassung.whole.md
	echo -e '```\n## 5.3 ``fts.i``\n```lex' >> zusammenfassung.whole.md
	cat fts.i | sed 's/^/    /g' >> zusammenfassung.whole.md
	echo -e '```\n## 5.4 ``fts.y``\n```yacc' >> zusammenfassung.whole.md
	cat fts.y | sed 's/^/    /g' >> zusammenfassung.whole.md
	echo -e '```\n## 5.5 ``Makefile``\n```makefile' >> zusammenfassung.whole.md
	cat Makefile | sed 's/^/    /g' >> zusammenfassung.whole.md
	echo -e '```\n' >> zusammenfassung.whole.md
	pandoc zusammenfassung.whole.md -o zusammenfassung.pdf 

view: pandoc
	evince zusammenfassung.pdf

clean:
	rm -f zusammenfassung.pdf
	rm lex.yy.c fts.tab.c *.o

6i: 
	flex 6.i
	gcc lex.yy.c -W -g -o 6 -lfl

7i:
	flex 7.i
	gcc lex.yy.c -W -g -o 7 -lfl

fts:
	bison -g -v -d -t fts.y 
	flex fts.i
	gcc lex.yy.c fts.tab.c -W -g
