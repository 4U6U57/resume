SOURCE=*.tex
OUTPUT=${SOURCE:.tex=.pdf}
OBJECT=${SOURCE:.tex=.aux} ${SOURCE:.tex=.log} ${SOURCE:.tex=.out}

all : ${OUTPUT}

%.pdf : %.tex
	pdflatex $<

clean : 
	rm -f ${OBJECT}

spotless : clean
	rm -f ${OUTPUT}

include git.mk

test : ${OUTPUT} clean
	cygstart $<

.PHONY : all clean spotless
