# Makefile for easy git stuff
# August Valera <avalera>

pull :
	git $@

add : pull clean
	git $@ --all

commit : add
	git $@

push : commit
	git $@ origin master
	make log

log : pull
	git $@ --graph --oneline -10

.PHONY : pull add commit push log
