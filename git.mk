# Makefile for easy git stuff
# cmps111 git.mk
# August Valera <avalera>

pull :
	git $@ origin master

add : pull
	git $@ --all

commit : add
	git $@

push : commit
	git $@ origin master
	make log

log :
	git $@ --graph --oneline -10

.PHONY : pull add commit push log
