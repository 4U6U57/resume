all:
	latexmk -pdf

build: all clean
	# Overleaf sync, insecure
	# git remote add upstream https://git.overleaf.com/8394985fqbcmtszhnwh
	# git push -f upstream master

clean:
	latexmk -c

spotless: clean
	latexmk -C

# Export for Bash for Windows
# TODO: Make this cleaner
win: all
	mv *.pdf /mnt/c/Users/4u6u5/Desktop
	make spotless

.PHONY: all build clean spotless win
