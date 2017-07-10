SOURCE=*.tex
OUTPUT=${SOURCE:.tex=.pdf}
OBJECT=${SOURCE:.tex=.aux} ${SOURCE:.tex=.log} ${SOURCE:.tex=.out}

all: ${OUTPUT}

%.pdf: %.tex
	pdflatex -interaction=nonstopmode -halt-on-error $<
	pdflatex -interaction=nonstopmode -halt-on-error $<

clean:
	rm -f ${OBJECT}

spotless: clean
	rm -f ${OUTPUT}

ci: spotless
	git commit -av
	git push

edit: ${SOURCE}
	${EDITOR} $<
	make open

open: ${OUTPUT} clean
ifeq ($(shell uname -o),Cygwin)
	cygstart $<
else
	xdg-open $<
endif

.PHONY: all clean spotless edit open test
