SOURCE=*.tex
OUTPUT=${SOURCE:.tex=.pdf}
OBJECT=${SOURCE:.tex=.aux} ${SOURCE:.tex=.log}

all : ${OUTPUT}

%.pdf : %.tex
	pdflatex $<

clean : 
	rm -f ${OBJECT}

# Git
commit : ${SOURCE} clean pull
	git add --all
	git $@

push : commit
	git $@ origin master
	make log
	
pull :
	git $@ origin master

log :
	git $@ --graph --oneline -10

.PHONY : all clean commit push pull log
