# Makefile for PPD - Project Planning Document

include ../lib/Makefile.in

SECTIONS= sections/*.tex appendices/*.tex

all: pdf

pdf: ppd.pdf

dvi: ppd.dvi

ppd.dvi: minutes_list ppd.tex $(SECTIONS)
	$(LATEX) ppd
	$(LATEX) ppd

ppd.pdf: minutes_list ppd.tex $(SECTIONS)
	$(PDFLATEX) ppd
	$(PDFLATEX) ppd

clean:
	@echo "cleaning in ppd..."
	-$(RM) -f $(TRASH)
	-$(RM) -f appendices/minutes/minutes_* appendices/minutes/mpdf.tex
	-$(RM) -f ppd.pdf
