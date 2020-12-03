.PHONY: install
install:
	cp .emacs $(HOME)/
	cp -r elisp $(HOME)/

.PHONY: mu4e
mu4e:
	cp -r ~/.cache/yay/mu-git/src/mu/mu4e $(HOME)/elisp/extensions/

.PHONY: mbsync
mbsync:  
	cp mbsyncrc ~/.mbsyncrc

all: install mu4e mbsync
