while true;
do
  inotifywait -e close_write -r ./docs/documentation.md 
  catlight rgb 255 0 255 
  pandoc --smart --bibliography docs/documentation.bib --csl docs/ieee.csl docs/documentation.md -B docs/title.tex -H docs/header.tex -N --filter pandoc-fignos  --filter pandoc-tablenos -o documentation.tex -V lang=de-DE
  latexmk  -pdf -interaction=batchmode -quiet  documentation.tex
  if [ $? = 0 ]; then
      catlight rgb 0 255 0
  else
      catlight rgb 255 0 0
  fi

done
