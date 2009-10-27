#!/usr/bin/env bash
MINUTES_DIR=appendices/minutes
if [ `ls minutes|grep -e 'pdf$'|wc -l` -gt 0 ]; then
  echo "\begin{itemize*}" > $MINUTES_DIR/minutes_list.tex
  ls $MINUTES_DIR/*.pdf | sort | awk '{ sub(/minutes\//, "", $$1); sub(/\.pdf/, "", $$1); print "\\item ",$$1 }' >> $MINUTES_DIR/minutes_list.tex
  ls $MINUTES_DIR/*.pdf | sort | awk '{ print "\\includepdfmerge{",$$1,",-}" }' > $MINUTES_DIR/mpdf.tex
  cat $MINUTES_DIR/mpdf.tex|sed -e 's/^[ \t\n]*//' | sed -e 's/[ \t\n]*\Z//' > $MINUTES_DIR/minutes_pdf.tex
  echo "\end{itemize*} > $MINUTES_DIR/minutes_list.tex"
else
  echo "" > $MINUTES_DIR/minutes_list.tex
fi