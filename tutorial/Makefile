BASENAME = tutorial
SRC = ${BASENAME}.tex ../style/*.sty ../style/*.bb
PLATEX   = platex
PDFLATEX = pdflatex
TEXFLAGS = -shell-escape -interaction=nonstopmode

default: ${BASENAME}-wide.pdf ${BASENAME}-normal.pdf ${BASENAME}-en-wide.pdf ${BASENAME}-en-normal.pdf

${BASENAME}-wide.pdf: ${BASENAME}-wide.tex ${SRC}
	TEXINPUTS=.:../style//: latexmk -pdfdvi -use-make -latex="${PLATEX} ${TEXFLAGS}" \
	 -e '$$dvipdf = "dvipdfmx %O -o %D %S"' \
	 ${BASENAME}-wide.tex

${BASENAME}-normal.pdf: ${BASENAME}-normal.tex ${SRC}
	TEXINPUTS=.:../style//: latexmk -pdfdvi -use-make -latex="${PLATEX} ${TEXFLAGS}" \
	 -e '$$dvipdf = "dvipdfmx %O -o %D %S"' \
	 ${BASENAME}-normal.tex

${BASENAME}-en-wide.pdf: ${BASENAME}-en-wide.tex ${BASENAME}-en.tex ${SRC}
	TEXINPUTS=.:../style//: latexmk -pdf -use-make -pdflatex="${PDFLATEX} ${TEXFLAGS}" ${BASENAME}-en-wide.tex

${BASENAME}-en-normal.pdf: ${BASENAME}-en-normal.tex ${BASENAME}-en.tex ${SRC}
	TEXINPUTS=.:../style//: latexmk -pdf -use-make -pdflatex="${PDFLATEX} ${TEXFLAGS}" ${BASENAME}-en-normal.tex

.sty:

clean:
	@latexmk -c ${BASENAME}-wide.tex ${BASENAME}-normal.tex ${BASENAME}-en-wide.tex ${BASENAME}-en-normal.tex
	@rm -f *.nav *.snm *.vrb

distclean: clean
	@latexmk -C ${BASENAME}-wide.tex ${BASENAME}-normal.tex ${BASENAME}-en-wide.tex ${BASENAME}-en-normal.tex
