SOURCE=*.tex
OUTPUT=${SOURCE:.tex=.pdf}
OBJECT=${SOURCE:.tex=.aux} ${SOURCE:.tex=.log} ${SOURCE:.tex=.out}

all : ${OUTPUT}

%.pdf : %.tex
	pdflatex -interaction=nonstopmode -halt-on-error $<
	pdflatex -interaction=nonstopmode -halt-on-error $<

clean : 
	rm -f ${OBJECT}

spotless : clean
	rm -f ${OUTPUT}

include git.mk

submit : ${OUTPUT} clean push

edit : ${SOURCE}
	vim $<

open : ${OUTPUT} clean
ifeq ($(shell uname -o),Cygwin)
	cygstart $<
else
	open $<
endif

test : edit
	make open

ci : spotless push

.PHONY : all clean spotless edit open test
