.PHONY: install
install:
	ln -s .emacs $(HOME)/.emacs
	ln -s elisp $(HOME)/elisp

.PHONY: mu4e
mu4e:
	cp -r ~/.cache/yay/mu-git/src/mu/mu4e $(HOME)/elisp/extensions/

.PHONY: mbsync
mbsync:
	ln -s mbsyncrc ~/.mbsyncrc

all: install mu4e mbsync
