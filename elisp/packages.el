(defvar mypackages '(golden-ratio
                     projectile

                     ;; Multi-language support
                     google-translate
                     langtool which-key

                     ;;navigation
		     ace-jump-mode ace-window frog-jump-buffer

                     ;; basic tools
                     el-get
                     gited
                     ;; might go back to ido for some things. Helm is noisy but great
                     ;; for somethings.
                     ;;ido ido-flx
                     ;;ivy
		     smex


                     helm
                     helm-projectile
                     helm-fish-completion
                     helm-evil-markers
                     helm-descbinds

                     helm-ag
                     helm-sly

                     dash dash-functional

                     ;; exwm window manager
                     exwm
                     helm-exwm
                     exwm-mff

                     eshell-autojump
                     fish-completion

                     ;; evil-mode
                     evil
                     evil-nerd-commenter
                     evil-leader
                     evil-org
                     evil-mu4e

                     evil-surround
                     highlight-parentheses
                     paredit evil-paredit
                     ;; smartparens evil-smartparens evil-cleverparens
                     ;; lispy lispyville
		     rainbow-mode
                     mic-paren

                     ;; git
                     magit auto-compile git-gutter

                     ;;coding support
                     eldoc
                     company
                     origami
                     undo-tree
                     flycheck-tip
                     kibit-helper
                     flycheck-pos-tip
                     aggressive-indent

                     ;;Silver Surfer, grep, fuzzy, ctags.
                     ag wgrep wgrep-ag fuzzy-match ctags-update

		     rich-minority

                     ;; clojure -- need to rexamine this. lots of newer stuff.
                     cider clj-refactor ac-cider
                     cider-eval-sexp-fu
                     clojure-mode eval-sexp-fu clojure-mode-extra-font-locking ;popup
                     uuid rainbow-delimiters flycheck-clojure

                     json-mode
                     markdown-mode

                     ;; clojure script
                     cljsbuild-mode smartscan

                     lua-mode
                     company-lua
                     ruby-mode
                     yaml-mode
                     apache-mode
                     hy-mode

                     ;;Shell
                     company-shell

                     ;;C/C++
                     ;; Not sure, need to pursue a C/C++ setup
                     ;;irony company-irony company-ctags counsel-etags ;company-rtags

                     ;;haskell
                     haskell-mode
                     ghc
                     haskell-snippets
                     dante
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

                     ;;slack
                     slack
                     oauth2
                     alert
                     emojify
                     ;;helm-slack


                     ;;modeline
                     smart-mode-line ; needs rich-minority one way or another.
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
