# Makefile for documents related to Clockwork

include lib/Makefile.in

PPD= ppd
URD= urd
SRD= srd
ADD= add

DIRS= $(PPD) $(URD) $(SRD) $(ADD)

DOCUMENTS= $(PPD).pdf $(URD).pdf $(SRD).pdf $(ADD).pdf

pdf: $(DIRS)

%.dvi: %/*.tex
	$(MAKE) -C `echo $@|sed -e 's/\..*//'` dvi

%.pdf: %/*.tex
	$(MAKE) -C `echo $@|sed -e 's/\..*//'` pdf

clear:
	for dir in $(DIRS); do $(MAKE) -C $$dir clean; done

clean: clear
	@echo "removing documents..."
	-$(RM) -f $(DOCUMENTS)

$(PPD): clean $(PPD).pdf
	$(MV) $(PPD)/$(PPD).pdf .

$(URD): clean $(URD).pdf
	$(MV) $(URD)/$(URD).pdf .

$(SRD): clean $(SRD).pdf
	$(MV) $(SRD)/$(SRD).pdf .

$(ADD): clean $(ADD).pdf
	$(MV) $(ADD)/$(ADD).pdf .
