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
	# xdg-open, unless we're in Bash for Windows, then use Chrome
	grep -q "Microsoft" /proc/sys/kernel/osrelease &>/dev/null &&\
		(mv *.pdf /mnt/c/Users/4u6u5/Desktop &&\
		/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe "C:\Users\4u6u5\Desktop\resume.pdf")\
		|| xdg-open resume.pdf

edit:
	edit resume.tex
	make open

.PHONY: all build clean spotless open edit
