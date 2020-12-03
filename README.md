emacs-setup
======================================================================

My emacs setup. 

Basically, an old school emacs setup that uses packages. 

The main folder is _elisp_.  

I run emacs a few different ways. I use the daemon for some things,
but I like to keep my projects in separate instances. I also like
to keep an instance just for mu4e, ie. Mail.  To facilitate that
I have a wrapper for emacs in my ~/bin directory.  `emacsn`.
It is a simple CLI that does all of those things. It runs `mu4e` or
my `main-window` function to set up emacs in a standard configuration
for a project. It's easy to add others. It's available in my
(my dotfiles repo)[http://github.com/EricGebhart/dotfiles]


*I think* This is a pretty straight forward setup. There is a _.emacs_ file 
and an _elisp_ directory full of stuff, mostly configurations and
extensions which I wrote or from someone else that aren't available
as packages. I leave _.emacs.d_ entirely for emacs to do what it
wants, although backups and savepoints are stored there.

The big things; Evil-mode (which can be easily switched off in _elisp/setup.el_).
clojure, clojure script, cider, et. al. Exuberant ctags, projectile, ag, magit,
git-gutter, smart-mode-line, ido, smex, company, aggressive indent, 
undo-tree the usual. Some nice evil and clojure-mode extensions to 
make clojure and vi mode nicer like add-hooks for eldoc. Golden-ratio 
if you are on a smaller screen. Lots of themes.  
Check out _elisp/packages.el_ to see all the
packages. look at _elisp/config_ for all the configurations.
This is the best place to look for how things are setup.

I have been studying French for the last few years, and I don't plan on stopping there.
I can also see that I'll probably want to add another language or two in the 
future. So I've been working to tap into the language capabilities of
emacs. I have a nice function to switch between input methods and dictionaries.
Ispell, flyspell, and hunspell are all working together for spell checking.
Google translate is there for highlighted text, current word, or sentence at point
and Language Tool is there to check grammar. Take a look at the language sub-menu
in _evil-leader-conf.el_ even if you are going to turn off evil-mode. Check out
_elisp/extensions/language.el_ and _elisp/config/lang-config.el_ and 
_google-translate-conf.el_

_Mu4e_ I use mu4e for email. I can't imagine a better email client. There is a
reasonably basic mu4e configuration with multiple contexts. There is a sample mbsyncrc
file that can be used to configure _isync/mbsync_.  I have a separate _.emacs-mu4e_ 
startup file for running an mu4e emacs instance in a terminal, it combines _.emacs_
and _elisp/setup.el_ into a single startup that is specifically for email in a terminal.

Everything that can be installed as packages is. *The glaring exception is mu4e.*
see this page about (installing mu/mu-git/mu4e)[https://www.djcbsoftware.nl/code/mu/mu4e/Installation.html#Installation].  There is a make rule that works to get everthing wired up on Arch Linux. YMMV.

Look in _packages.el_ if I happen to add a package through _package-install_ 
I then go add it to _packages.el_ so I won't forget and configuration is repeatable. 
 
I didn't mess with key mappings except for F keys, and the addition
of Evil-leader which allows for ,w for write, ,q delete-buffer, etc.
Mostly, the key mappings I added are non-intrusive.  It is definitely a
good idea to go read _config/evil-leader-conf.el_ whether you want _Evil_ key
bindings or not. It will give you a good idea of functionality to look for or map
to your own keys in _keys.el_

Additional tools needed
================

See my [arch-pkgs repo](http://github.com/ericgebhart/arch-pkgs) for an easy way to install
everything you need.

* For email
    * mu-git - on Arch linux
    * notmuch
    * isync (mbsync) 

* for Spelling and grammar.
    * languagetool 
    * hunspell -- add dictionaries as needed. 
    * hunspell dictionaries  [get them here!](https://github.com/EricGebhart/Hunspell-dictionaries)
    or just do `pacman -Ss hunspell` to see what arch has.

* *SourceCodePro Fonts* 
[They are here](https://github.com/adobe-fonts/source-code-pro)
Or just install the Arch Linux package.

Note that if you don't want to use emacs or mu4e for mail, mu, isync, and Openssl are unnecessary.
Additional isync/mbsync/mu4e resources [are here:] (http://www.ict4g.net/adolfo/notes/2014/12/27/EmacsIMAP.html)

Special Files
================

* .emacs-mu4e  - An alternative to .emacs if you want a separate mu4e emacs instance.
 This is set up to work inside a terminal. I use it in a pane of iterm2's visor.
 _If *Meta* does not work, check that the option key is set to send *+Esc* in iterm2's profiles.
* mu4e-terminal - An executable to start the mu4e emacs instance. `emacs -Q -nw -l ~/.emacs-mu4e`
* packages.el - defines all packages to load
* setup.el - last file to run, where stuff seems to go until it goes into config/
* config/ - where all the real setup goes.
* config/vars.el - miscellaneous variable setting.
* config/keys.el - key bindings, mostly F keys.
* config/evil-leader.el - more key bindings, vi style.

Installation
=============

* Fork this repository.
* Check out your new repository.

* Do `make install` or `make all` That'll get it mostly working even if you haven't 
  installed all the dependencies.. 
  
* `make mbsync` to copy a sample _.mbsyncrc_ for use with _isync_ to your home directory. 
* (install mu/mu-git/mu4e)[https://www.djcbsoftware.nl/code/mu/mu4e/Installation.html#Installation]
  or maybe just do a `yay -S mu-git` if you are on Arch.

* Possibly copy or link the newly installed mu4e elisp to _elisp/extensions/mu4e_. 
  Or add it to your load path. It's probably in _/usr/share/emacs/site-lisp_. that's where
  it is on Arch Linux.
  Alternatively you could add it to your load path.
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
  Or it may just work.
  Or possibly try `make mu4e` it might will probably worku On Arch Linux it does.

* install hunspell, languagetool and hunspell dictionaries as desired.


Evil Mode
=========
I've been using emacs in some sort of Vi emulation since 1995. Evil-mode is, IMHO the best vi emulator so far. Although neovim is doing a really good job. vimscript is an unfortunate language.
You can easily turn it off in _setup.el_ . The Evil mode setup includes a few but not all of the Evil-mode extensions. For more information check out the [Evil-mode documentation.](http://www.emacswiki.org/emacs/Evil)

Included along with evil mode are: 
* [evil-leader](https://github.com/cofi/evil-leader)
* [evil-paredit](https://github.com/roman/evil-paredit)
* [evil-nerd-commenter](https://github.com/redguardtoo/evil-nerd-commenter)
* [evil-surround](https://github.com/timcharper/evil-surround)
* evil-org
* undo-tree
 
CycleBufs
==============
Cyclebufs is now built on top of BS - Buffer Selection. There are several bs-configurations,
and extra functionality which makes switching buffers more contextual. 
Reusing windows for different mode groups shell, dired, and bs-show if they are visible.

Also cycling of buffers based on groups.

As an example, the shell group contains shell, eshell, ansi-term, cider, and inferior python modes.
Once a buffer has one of the modes in the group, cycling will stay within that group.
There is also contextual cycling based on the mode group of the current buffer, 
cycling through shells, *buffers, or file buffers accordingly. 

Cyclebufs will open a shell buffer of your choice based on the value of cb-shell-command. The default is
eshell. See *vars.el*.  

Ido
==========

ido, flx-ido, smex, ido-menu

C-Tags
===========

Exuberant ctags with ctags-update and helm+.  Also integrated with projectile.

Clojure
===========

clojure-mode +
This is my primary development environment.

paredit, company, clj-refactor, rainbow-delimiters, mic-paren, cider, evil-surround, evil-paredit. 
Also some syntactic sugar for #() (fn ) #{} and (partial ..).

Autocomplete via company, rather than autocomplete.

flycheck, kibit and eastwood, clj-refactor are also set up. You will have to set up the plugins in your _~/.lein/profiles.clj_
There is a basic _lein-profiles-example.clj_ which you can steal from for your _~/.lein/profiles.clj_ file.
kibit and eastwood, clj-refactor are the primary things to look at. There is nothing special otherwise.

ELPY
=========
This is the current king of python development on emacs. There have been others, but this one is currently under
development and is as up to date as it gets.
[Elpy](https://github.com/jorgenschaefer/elpy/wiki) is a Python development package which includes many other packages.
* [Rope](http://rope.sourceforge.net/) - This is the default.
* or [Jedi](https://github.com/davidhalter/jedi) for introspection.
* [flake8](https://pypi.python.org/pypi/flake8) *pyflakes* and *pep8* for code checking.
 * [flake8 configuration documentation](http://flake8.readthedocs.org/en/latest/config.html#global) 
* [Nose](https://nose.readthedocs.org/en/latest/) for testing.

Other language modes.
=====================
Haskell, Ruby, yaml, apache, markdown.

Themes
=========

Lots of themes from packages. Additionally my own personal theme
strange-deeper-blue. As well as a couple of variations on solarized.
There is also a palette-themes.el which is a more general library
adapted from the solarized-theme. Palette-themes allow for the creation
of themes simply by defining a palette of colors. There are four
different variations of the solarized themes included.
