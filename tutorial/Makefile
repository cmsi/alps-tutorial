BASENAME1 = tutorial1
SRC1 = ${BASENAME1}.tex ../style/*.sty ../style/*.bb
BASENAME2 = tutorial2
SRC2 = ${BASENAME2}.tex ../style/*.sty ../style/*.bb
PLATEX   = platex
PDFLATEX = pdflatex
TEXFLAGS = -shell-escape -interaction=nonstopmode

default: ${BASENAME1}-wide.pdf ${BASENAME1}-normal.pdf ${BASENAME1}-en-wide.pdf ${BASENAME1}-en-normal.pdf ${BASENAME2}-wide.pdf ${BASENAME2}-normal.pdf ${BASENAME2}-en-wide.pdf ${BASENAME2}-en-normal.pdf

${BASENAME1}-wide.pdf: ${BASENAME1}-wide.tex ${SRC1}
	TEXINPUTS=.:../style//: latexmk -pdfdvi -use-make -latex="${PLATEX} ${TEXFLAGS}" \
	 -e '$$dvipdf = "dvipdfmx %O -o %D %S"' \
	 ${BASENAME1}-wide.tex

${BASENAME1}-normal.pdf: ${BASENAME1}-normal.tex ${SRC1}
	TEXINPUTS=.:../style//: latexmk -pdfdvi -use-make -latex="${PLATEX} ${TEXFLAGS}" \
	 -e '$$dvipdf = "dvipdfmx %O -o %D %S"' \
	 ${BASENAME1}-normal.tex

${BASENAME1}-en-wide.pdf: ${BASENAME1}-en-wide.tex ${BASENAME1}-en.tex ${SRC1}
	TEXINPUTS=.:../style//: latexmk -pdf -use-make -pdflatex="${PDFLATEX} ${TEXFLAGS}" ${BASENAME1}-en-wide.tex

${BASENAME1}-en-normal.pdf: ${BASENAME1}-en-normal.tex ${BASENAME1}-en.tex ${SRC1}
	TEXINPUTS=.:../style//: latexmk -pdf -use-make -pdflatex="${PDFLATEX} ${TEXFLAGS}" ${BASENAME1}-en-normal.tex

${BASENAME2}-wide.pdf: ${BASENAME2}-wide.tex ${SRC2}
	TEXINPUTS=.:../style//: latexmk -pdfdvi -use-make -latex="${PLATEX} ${TEXFLAGS}" \
	 -e '$$dvipdf = "dvipdfmx %O -o %D %S"' \
	 ${BASENAME2}-wide.tex

${BASENAME2}-normal.pdf: ${BASENAME2}-normal.tex ${SRC2}
	TEXINPUTS=.:../style//: latexmk -pdfdvi -use-make -latex="${PLATEX} ${TEXFLAGS}" \
	 -e '$$dvipdf = "dvipdfmx %O -o %D %S"' \
	 ${BASENAME2}-normal.tex

${BASENAME2}-en-wide.pdf: ${BASENAME2}-en-wide.tex ${BASENAME2}-en.tex ${SRC2}
	TEXINPUTS=.:../style//: latexmk -pdf -use-make -pdflatex="${PDFLATEX} ${TEXFLAGS}" ${BASENAME2}-en-wide.tex

${BASENAME2}-en-normal.pdf: ${BASENAME2}-en-normal.tex ${BASENAME2}-en.tex ${SRC2}
	TEXINPUTS=.:../style//: latexmk -pdf -use-make -pdflatex="${PDFLATEX} ${TEXFLAGS}" ${BASENAME2}-en-normal.tex

.sty:

clean:
	@latexmk -c ${BASENAME1}-wide.tex ${BASENAME1}-normal.tex
	@latexmk -c ${BASENAME2}-wide.tex ${BASENAME2}-normal.tex ${BASENAME2}-en-wide.tex ${BASENAME2}-en-normal.tex
	@rm -f *.nav *.snm *.vrb

distclean: clean
	@latexmk -C ${BASENAME1}-wide.tex ${BASENAME1}-normal.tex
	@latexmk -C ${BASENAME2}-wide.tex ${BASENAME2}-normal.tex ${BASENAME2}-en-wide.tex ${BASENAME2}-en-normal.tex
