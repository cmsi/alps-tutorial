BASENAME = overview
SRC = *.bb ../style/*.sty ../style/*.bb

default: ${BASENAME}-wide.pdf ${BASENAME}-normal.pdf ${BASENAME}-en-wide.pdf ${BASENAME}-en-normal.pdf

${BASENAME}-wide.dvi: ${BASENAME}-wide.tex ${BASENAME}.tex ${SRC}
	TEXINPUTS=.:../style//: platex -shell-escape ${BASENAME}-wide.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-wide.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-wide.tex

${BASENAME}-wide.pdf: ${BASENAME}-wide.dvi
	TEXINPUTS=.:../style//: dvipdfmx ${BASENAME}-wide.dvi

${BASENAME}-normal.dvi: ${BASENAME}-normal.tex ${BASENAME}.tex ${SRC}
	TEXINPUTS=.:../style//: platex -shell-escape ${BASENAME}-normal.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-normal.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-normal.tex

${BASENAME}-normal.pdf: ${BASENAME}-normal.dvi
	TEXINPUTS=.:../style//: dvipdfmx ${BASENAME}-normal.dvi

${BASENAME}-en-wide.dvi: ${BASENAME}-en-wide.tex ${BASENAME}-en.tex ${SRC}
	TEXINPUTS=.:../style//: platex -shell-escape ${BASENAME}-en-wide.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-en-wide.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-en-wide.tex

${BASENAME}-en-wide.pdf: ${BASENAME}-en-wide.dvi
	TEXINPUTS=.:../style//: dvipdfmx ${BASENAME}-en-wide.dvi

${BASENAME}-en-normal.dvi: ${BASENAME}-en-normal.tex ${BASENAME}-en.tex ${SRC}
	TEXINPUTS=.:../style//: platex -shell-escape ${BASENAME}-en-normal.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-en-normal.tex
	TEXINPUTS=.:../style//: platex ${BASENAME}-en-normal.tex

${BASENAME}-en-normal.pdf: ${BASENAME}-en-normal.dvi
	TEXINPUTS=.:../style//: dvipdfmx ${BASENAME}-en-normal.dvi

clean:
	rm -f ${BASENAME}*.aux ${BASENAME}*.dvi ${BASENAME}*.log ${BASENAME}*.nav ${BASENAME}*.out ${BASENAME}*.snm ${BASENAME}*.toc ${BASENAME}*.vrb
	rm -rf auto *.xbb ../style/*.xbb

distclean: clean
	rm -f ${BASENAME}-wide.pdf ${BASENAME}-normal.pdf ${BASENAME}-en-wide.pdf ${BASENAME}-en-normal.pdf