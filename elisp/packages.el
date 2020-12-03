(defvar mypackages '(golden-ratio
                     projectile
                     google-translate
                     langtool which-key
                     ;; communication
                     jabber slack
                     ;; clojure
		     align-cljlet ;autocomplete
                     cider clj-refactor ac-cider
                     cider-eval-sexp-fu
                     ;; clojure
                     clojure-mode eval-sexp-fu clojure-mode-extra-font-locking ;popup
                     uuid rainbow-delimiters flycheck-clojure flycheck-pos-tip
                     flycheck-tip kibit-helper
                     ;; clojure script
                     cljsbuild-mode smartscan
                     ;; evil-mode
                     evil evil-paredit evil-surround evil-nerd-commenter
                     evil-leader evil-org undo-tree
                     ;; git
                     magit auto-compile git-gutter popwin
                     ;;languages
                     lua-mode haskell-mode ruby-mode yaml-mode apache-mode

                     elpy
                     ;;Python
                     pyenv-mode nose ein
                     python-docstring
                     py-autopep8
                     py-yapf pydoc
                     markdown-mode
                     ;;org mode.
                     org
                     ;;extras
                                        ;solarized-theme ;; crashes.
                     smart-mode-line  ; needs rich-minority one way or another.
                     flx-ido ag wgrep wgrep-ag fuzzy-match ctags-update
		     rich-minority company find-file-in-project
		     idomenu smex dash dash-functional mic-paren
		     ace-jump-mode expand-region floobits helm
                     gist aggressive-indent exec-path-from-shell multi-term
		     rainbow-mode
		     ;; themes
		     ujelly-theme twilight-theme tronesque-theme tron-theme
		     tango-2-theme tango-plus-theme tangotango-theme zenburn-theme
		     waher-theme underwater-theme toxi-theme sublime-themes
		     subatomic-theme sunny-day-theme subatomic256-theme steady-theme
		     ;;stekene-theme
                     soft-stone-theme soft-morning-theme purple-haze-theme
		     noctilux-theme naquadah-theme leuven-theme lavender-theme
		     light-soap-theme jujube-theme ir-black-theme inkpot-theme heroku-theme
		     github-theme gandalf-theme flatland-theme firecode-theme
		     flatui-theme espresso-theme django-theme darkburn-theme darkmine-theme
		     darcula-theme oldlace-theme deep-thought-theme cyberpunk-theme clues-theme
		     busybee-theme boron-theme bliss-theme assemblage-theme
		     ample-zen-theme ample-theme lush-theme smyx-theme gotham-theme
		     solarized-theme dark-krystal-theme
		     ))

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
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
;;(defvar foo (package-list-packages))

(install-mypackages)
;;(update-mypackages)
