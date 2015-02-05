BASENAME = tutorial
SRC = ../style/*.sty ../style/*.bb

default: ${BASENAME}-wide.pdf ${BASENAME}-normal.pdf ${BASENAME}-en-wide.pdf ${BASENAME}-en-normal.pdf

${BASENAME}-wide.dvi: ${BASENAME}-wide.tex ${SRC} ${BASENAME}.tex
	TEXINPUTS=.:../style//: platex -shell-escape ${BASENAME}-wide.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-wide.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-wide.tex

${BASENAME}-wide.pdf: ${BASENAME}-wide.dvi
	TEXINPUTS=.:../style//: dvipdfmx ${BASENAME}-wide.dvi

${BASENAME}-normal.dvi: ${BASENAME}-normal.tex ${SRC} ${BASENAME}.tex
	TEXINPUTS=.:../style//: platex -shell-escape ${BASENAME}-normal.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-normal.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-normal.tex

${BASENAME}-normal.pdf: ${BASENAME}-normal.dvi
	TEXINPUTS=.:../style//: dvipdfmx ${BASENAME}-normal.dvi

${BASENAME}-en-wide.pdf: ${BASENAME}-en-wide.tex ${SRC} ${BASENAME}-en.tex
	TEXINPUTS=.:../style//: pdflatex ${BASENAME}-en-wide.tex
	TEXINPUTS=.:../style//: pdflatex ${BASENAME}-en-wide.tex
	TEXINPUTS=.:../style//: pdflatex ${BASENAME}-en-wide.tex

${BASENAME}-en-normal.pdf: ${BASENAME}-en-normal.tex ${SRC} ${BASENAME}-en.tex
	TEXINPUTS=.:../style//: pdflatex ${BASENAME}-en-normal.tex
	TEXINPUTS=.:../style//: pdflatex ${BASENAME}-en-normal.tex
	TEXINPUTS=.:../style//: pdflatex ${BASENAME}-en-normal.tex

clean:
	rm -f ${BASENAME}*.aux ${BASENAME}*.dvi ${BASENAME}*.log ${BASENAME}*.nav ${BASENAME}*.out ${BASENAME}*.snm ${BASENAME}*.toc ${BASENAME}*.vrb
	rm -rf auto *.xbb ../style/*.xbb

distclean: clean
	rm -f ${BASENAME}-wide.pdf ${BASENAME}-normal.pdf ${BASENAME}-en-wide.pdf ${BASENAME}-en-normal.pdf
