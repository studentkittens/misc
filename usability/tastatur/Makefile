all:
	pandoc --smart --bibliography docs/documentation.bib --csl docs/ieee.csl docs/documentation.md -B docs/title.tex -H docs/header.tex --filter pandoc-fignos --filter pandoc-tablenos -N -o documentation.tex -V lang=de-DE
	latexmk -lualatex -interaction=batchmode documentation.tex
