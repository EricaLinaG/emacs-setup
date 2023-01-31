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

# Put this repo into the Chemacs profiles as OG
# copy it to ~/
chemacs-profiles:
	cp .emacs-profiles.el ~/

install-emacsn:
	cp emacsn ~/bin/

touch-custom:
	touch ~/.config/emacs-custom.el

mk-emacs-home: touch-custom
	mkdir -p $(emacs-home)

# move with preserve dot emacs.
backup-dot-emacs:
	[ -f ~/.emacs ] && mv ~/.emacs ~/.emacs.bak
	[ -d ~/.emacs.d ] && mv ~/.emacs.d ~/.emacs.default

# scorch dot emacs.
remove-dot-emacs:
	rm -rf ~/.emacs.d
	rm -f ~/.emacs

# Create a new Chemacs profiles with this repo as OG
.PHONY: add-og
add-og:
	touch .emacs-profiles.el
	sed 's:FIXME:$(PWD):' emacs-profiles-orig.el > .emacs-profiles.el

# Chemacs goes in emacs.d
install-chemacs:
	git clone https://github.com/plexus/chemacs2.git ~/.emacs.d

# everyone else goes in emacs home.
install-doom:
	sed 's/;;doom//' .emacs-profiles.el > tmp
	mv tmp .emacs-profiles.el
	git clone https://github.com/hlissner/doom-emacs $(emacs-home)/doom

install-spacemacs:
	sed 's/;;space//' .emacs-profiles.el > tmp
	mv tmp .emacs-profiles.el
	git clone https://github.com/syl20bnr/spacemacs $(emacs-home)/space

install-test:
	sed 's/;;test//' .emacs-profiles.el > tmp
	mv tmp .emacs-profiles.el
	git clone https://github.com/ericalinag/emacs-setup $(emacs-home)/dev

remove-test:
	rm -f $(emacs-home)/test

install-dev:
	sed 's/;;dev//' .emacs-profiles.el > tmp
	mv tmp .emacs-profiles.el
	git clone https://github.com/ericalinag/emacs-setup $(emacs-home)/dev

install-stable:
	git clone https://github.com/ericalinag/emacs-setup $(emacs-home)/stable

all: mu4e install-all

# not sure about mu4e installation at this point. I think it just works now.
# I need to test that.

# prepare for install
# remove .mbsync, move ~/.emacs, ~/.emacs.d, mkdir emacs home.
prepare-install: clean-links backup-dot-emacs mk-emacs-home

# prepare and install links, emacsn, chemacs, chemacs profiles
install: prepare-install links install-emacsn add-og \
	install-chemacs chemacs-profiles

# prepare and install everything we have.
# the install plus: stable, dev, doom, and space emacs.
install-all: install install-stable install-dev \
	install-spacemacs install-doom chemacs-profiles

# test a fresh install from github.
test-install: remove-test install-test
	emacs --with-profile test

# except for doom, just run an instance of each and let them load themselves.
finish-install:
	emacs --with-profile OG
	[ -d ~/$(emacs-home)/stable ] && emacs --with-profile stable
	[ -d ~/$(emacs-home)/dev ] && emacs --with-profile dev
	[ -d ~/$(emacs-home)/space ] && emacs --with-profile space
	[ -d ~/$(emacs-home)/doom ] && $(emacs-home)/doom/bin/doom install
