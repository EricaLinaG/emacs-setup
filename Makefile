emacs-home := ~/Emacs

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

clean-links:
	rm $(HOME)/.mbsyncrc

chemacs:
	cp .emacs-profiles.el ~/

emacs-home:
	mkdir -p $(emacs-home)

backup-dot-emacs:
	[ -f ~/.emacs ] && mv ~/.emacs ~/.emacs.bak
	[ -d ~/.emacs.d ] && mv ~/.emacs.d ~/.emacs.default

.PHONY: remove-dot-emacs
remove-dot-emacs:
	rm -rf ~/.emacs.d
	rm -f ~/.emacs

install-chemacs: backup-dot-emacs
	git clone https://github.com/plexus/chemacs2.git ~/.emacs.d

.PHONY: install-doom
install-doom:
	git clone https://github.com/hlissner/doom-emacs $(emacs-home)/doom
	$(emacs-home)/doom/bin/doom install

update-doom:
	$(emacs-home)/doom/bin/doom update

remove-doom:
	rm -rf $(emacs-home)/doom

.PHONY: install-spacemacs
install-spacemacs:
	git clone https://github.com/syl20bnr/spacemacs $(emacs-home)/space

remove-spacemacs:
	rm -rf $(emacs-home)/space

.PHONY: install-dev
install-dev:
	git clone https://github.com/ericalinag/emacs-setup $(emacs-home)/dev

.PHONY: install-stable
install-stable:
	git clone https://github.com/ericalinag/emacs-setup $(emacs-home)/stable

update-stable:
	cd $(emacs-home)/stable; git pull origin master

.PHONY: install-spacedoom
install-spacedoom: install-spacemacs install-doom

install-all: install-chemacs install-dev install-stable install-spacedoom

install-min: install-chemacs install-stable

all: mu4e links
