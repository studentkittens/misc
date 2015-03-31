pandoc:
	pandoc zusammenfassung.md -o zusammenfassung.pdf 

view: pandoc
	mupdf-x11 zusammenfassung.pdf

clean:
	rm -f zusammenfassung.pdf
