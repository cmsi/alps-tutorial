BASENAME = pyalps
SRC = ${BASENAME}.tex ../style/*.sty ../style/*.bb
PLATEX = platex -shell-escape -interaction=nonstopmode

default: ${BASENAME}-wide.pdf ${BASENAME}-normal.pdf

${BASENAME}-wide.pdf: ${BASENAME}-wide.tex ${SRC}
	TEXINPUTS=.:../style//: latexmk -pdfdvi -use-make -latex="${PLATEX}" \
	 -e '$$dvipdf = "dvipdfmx %O -o %D %S"' \
	 ${BASENAME}-wide.tex

${BASENAME}-normal.pdf: ${BASENAME}-normal.tex ${SRC}
	TEXINPUTS=.:../style//: latexmk -pdfdvi -use-make -latex="${PLATEX}" \
	 -e '$$dvipdf = "dvipdfmx %O -o %D %S"' \
	 ${BASENAME}-normal.tex

.sty:

clean:
	@latexmk -c ${BASENAME}-wide.tex ${BASENAME}-normal.tex
	@rm -f *.nav *.snm *.vrb

distclean: clean
	@latexmk -C ${BASENAME}-wide.tex ${BASENAME}-normal.tex
