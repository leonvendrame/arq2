PDFCOMP = pdflatex
BIBTX = bibtex
DOCNAME = RA90562

all:
	$(PDFCOMP) $(DOCNAME).tex
	$(BIBTX) $(DOCNAME).aux
	$(PDFCOMP) $(DOCNAME).tex $(DOCNAME).aux $(DOCNAME).bbl
	$(PDFCOMP) $(DOCNAME).tex
	cp -f $(DOCNAME).pdf ../

clean:
	rm -f $(DOCNAME).pdf $(DOCNAME).aux $(DOCNAME).bbl $(DOCNAME).blg $(DOCNAME).log
	rm -f ../$(DOCNAME).pdf
