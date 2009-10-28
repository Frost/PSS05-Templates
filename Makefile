# Makefile for PSS 05 Documents

PPD= ppd
URD= urd
SRD= srd
ADD= add

DIRS= $(PPD) $(URD) $(SRD) $(ADD)

DOCUMENTS= $(PPD).pdf $(URD).pdf $(SRD).pdf $(ADD).pdf

pdf: $(DIRS)

%.pdf: %/*.tex
	-$(MAKE) -C $*

clean:
	for dir in $(DIRS); do $(MAKE) -C $$dir clean; done

$(PPD): clean $(PPD).pdf
$(URD): clean $(URD).pdf
$(SRD): clean $(SRD).pdf
$(ADD): clean $(ADD).pdf

.PHONY: $(PPD) $(URD) $(SRD) $(ADD)