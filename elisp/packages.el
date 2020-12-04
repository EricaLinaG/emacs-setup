;;; package --- Summary
;;; Commentary:
;; All my packages, easy to install and update.
;;; Code

(defvar mypackages '(golden-ratio
                     projectile

                     ;; Multi-language support
                     google-translate
                     langtool

                     ;;navigation
		     ace-jump-mode ace-window frog-jump-buffer

                     ;; basic tools
                     which-key
                     el-get
                     gited

                     ;; Choose: ido/smex or ivy/swiper/counsel and/or helm.
                     ;; ido/smex and helm are known to play nice. See helm doc.
                     ;;
                     ;; find-file = counsel-find-file = helm-find-file
                     ;; smex = counsel-m-x = helm-m-x ~= Nicer M-x...
                     ;; ido = ivy =  helm = fuzzy search of candidates, in many situations,
                     ;; files, buffers, symbols.
                     ;; swiper = helm_swoop = occur incrementally..
                     ;; I do like helm on the big wide screen, because the minibuffer is so
                     ;; far away down there in the corner. Both Ido and ivy are more minibuffer
                     ;; centric. I've used ido and smex since the beginning... 20+ years.
                     ;; trying out helm

                     ;;ido ido-flx ido-imenu
		     smex
                     ;;ivy swiper counsel


                     ;; helm - an experiment in progess...
                     helm
                     helm-projectile
                     helm-fish-completion
                     helm-evil-markers
                     helm-descbinds
                     helm-swoop
                     helm-org

                     helm-ag
                     helm-sly
                     helm-clojuredocs

                     ;; hydra -- A lot to think about here...
                     ;; https://github.com/abo-abo/hydra/wiki/Hydras-by-Topic
                     ;; have to bind them, and try them, and make some.
                     ;; maybe evil-leader stuff can just pop over.
                     ;; maybe a few at first, that I use all the time.
                     ;; ,fqgbsiaw   hmmm. don't know it's necessary...
                     hydra pretty-hydra cider-hydra major-mode-hydra

                     dash dash-functional

                     ;; exwm window manager - another exploration..
                     exwm
                     helm-exwm
                     exwm-mff

                     ;; eshell
                     eshell-autojump
                     fish-completion

                     ;; evil-mode
                     evil
                     evil-nerd-commenter
                     evil-leader
                     evil-org
                     evil-mu4e

                     ;; Parentheses.
                     evil-surround
                     highlight-parentheses
                     paredit evil-paredit
                     ;; smartparens evil-smartparens evil-cleverparens ;; - finicky setup.
                     ;; lispy lispyville ;; -- not a fan.
		     rainbow-mode
                     mic-paren

                     ;; git
                     magit git-gutter

                     ;;coding support
                     eldoc
                     auto-compile
                     company
                     origami
                     undo-tree
                     flycheck-tip
                     kibit-helper
                     flycheck-pos-tip
                     aggressive-indent

                     ;; Silver Surfer, grep, fuzzy, ctags.
                     ag wgrep wgrep-ag fuzzy-match ctags-update


                     ;; clojure -- need to rexamine this. lots of newer stuff.
                     cider clj-refactor ac-cider
                     cider-eval-sexp-fu
                     clojure-mode eval-sexp-fu clojure-mode-extra-font-locking ;popup
                     uuid rainbow-delimiters flycheck-clojure

                     ;; clojure script
                     cljsbuild-mode smartscan

                     lua-mode
                     company-lua
                     ruby-mode
                     hy-mode

                     json-mode
                     markdown-mode
                     yaml-mode
                     apache-mode

                     ;;Shell
                     company-shell

                     ;;C/C++
                     ;; Not sure, need to pursue a better C/C++ setup
                     ;;irony company-irony company-ctags helm-etags ;company-rtags

                     ;;haskell
                     haskell-mode
                     ghc
                     haskell-snippets
                     dante ;; GHCi
                     helm-ghc
                     flycheck-haskell

                     ;;scheme/common lisp
                     geiser
                     sly
                     flycheck-guile

                     ;;Python
                     elpy
                     pyenv-mode nose ein
                     python-docstring
                     py-autopep8
                     py-yapf pydoc

                     ;;org mode.
                     org
                     org-babel-eval-in-repl
                     org-bullets
                     visual-fill-column

                     ;;slack - hasn't worked very well so far..
                     slack
                     oauth2
                     alert
                     emojify
                     ;;helm-slack


                     ;; modeline
                     ;; smart-mode-line rich-minority
                     doom-modeline all-the-icons ;; the doom modeline

                     ;;extras
                     ;;treemacs treemacs-evil treemacs-magit treemacs-projectile
                     expand-region floobits
                     gist
                     exec-path-from-shell


		     ;; themes
                     doom-themes
                     monokai-theme monokai-alt-theme obsidian-theme atom-dark-theme
                     bubbleberry-theme atom-one-dark-theme
		     ujelly-theme twilight-theme tronesque-theme tron-theme
		     tango-2-theme tango-plus-theme tangotango-theme zenburn-theme
		     waher-theme underwater-theme toxi-theme sublime-themes
		     subatomic-theme sunny-day-theme subatomic256-theme steady-theme
                     soft-stone-theme soft-morning-theme purple-haze-theme
		     noctilux-theme naquadah-theme leuven-theme lavender-theme
		     light-soap-theme jujube-theme ir-black-theme inkpot-theme heroku-theme
		     github-theme gandalf-theme flatland-theme firecode-theme
		     flatui-theme espresso-theme django-theme darkburn-theme darkmine-theme
		     darcula-theme oldlace-theme deep-thought-theme cyberpunk-theme clues-theme
		     busybee-theme boron-theme bliss-theme assemblage-theme
		     ample-zen-theme ample-theme lush-theme smyx-theme gotham-theme
		     solarized-theme dark-krystal-theme))

;;
;; Install stuff from packages.

(defun install-mypackages ()
  (dolist (pkg mypackages)
    (unless (package-installed-p pkg))
    (package-install pkg)))

(defun update-mypackages ()
  (interactive)
  (dolist (pkg mypackages)
    (package-install pkg)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
;;(defvar foo (package-list-packages))

(install-mypackages)
;;(update-mypackages)
