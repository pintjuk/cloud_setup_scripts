report.pdf: report.tex
	pdflatex report && bibtex report && pdflatex report && pdflatex report 

clean:
	rm -f *.pdf *.dvi *.log *.aux *.bbl *.blg *.out *.toc 
