.PHONY: install
install:
	ln -s $(PWD)/.emacs $(HOME)/.emacs
	ln -s $(PWD)/elisp $(HOME)/elisp

.PHONY: mu4e
mu4e:
	cp -r ~/.cache/yay/mu-git/src/mu/mu4e $(HOME)/elisp/extensions/

.PHONY: mbsync
mbsync:
	ln -s $(PWD)/mbsyncrc $(HOME)/.mbsyncrc

all: install mu4e mbsync
