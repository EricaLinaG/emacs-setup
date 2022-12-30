.PHONY: install
install: links

.PHONY: mu4e
mu4e:
	cp -r ~/.cache/yay/mu-git/src/mu/mu4e $(HOME)/elisp/extensions/

.PHONY: mbsync
mbsync:
	ln -s $(PWD)/mbsyncrc $(HOME)/.mbsyncrc

.PHONY: links
links: mbsync
	ln -s $(PWD)/.emacs $(HOME)/.emacs
	ln -s $(PWD)/elisp $(HOME)/elisp

clean-links:
	rm $(HOME)/.emacs
	rm $(HOME)/elisp
	rm $(HOME)/.mbsyncrc

all: mu4e links
