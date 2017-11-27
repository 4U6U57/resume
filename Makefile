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

open: all clean
	xdg-open resume.pdf

edit:
	edit resume.tex
	make open

.PHONY: all build clean spotless open edit
