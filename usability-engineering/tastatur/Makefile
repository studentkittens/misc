all:
	pandoc --smart --bibliography docs/documentation.bib --csl docs/ieee.csl docs/documentation.md -B docs/title.tex -H docs/header.tex -N --filter pandoc-fignos -o documentation.tex -V lang=de-DE
	latexmk -pdf -pdflatex=pdflatex  -interaction=batchmode documentation.tex
