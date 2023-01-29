;;; package ---Summary
;;; Commentary:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set the loadpath / bytecompile everything - Go -- Eric
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Code:
;; cl is obsolete, cl-lib is the replacement
;; Lots of current packages still use cl.
;; this gets rid of the warning everytime emacs starts.
(setq byte-compile-warnings '(cl-functions))

(setq load-path
      (append (list
	       "."
	       "./themes"
	       "./extensions"
	       "./config")
	      load-path))

;; so org doesn't step on the S-Arrow keys from windmove.
(setq org-replace-disputed-keys t)

(load "packages") ; make sure all the packages are installed.

;; just so I dont have to look at Emacs default so long.
(load "appearance")
(load "themes-init")
;; this is a local theme I made. Code is in themes.
;; (load-theme 'strange-deeper-blue t)
;; (enable-theme 'strange-deeper-blue)
(require 'modus-themes)


;; Faint yellow comments and a different shade of green for strings
(setq modus-themes-common-palette-overrides
      '((string yellow-faint)
        (fringe unspecified)
        ;;(string green-warmer)
        (bg-region bg-lavender) ; try `bg-ochre' `bg-lavender', `bg-sage'
        (fg-region unspecified)
        (bg-paren-match bg-magenta-intense)
        (underline-paren-match fg-main)))
(setq modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-prompts '(intense-bold)
      modus-themes-completions 'intense-bold
      modus-themes-org-blocks 'tinted-background)

(load-theme 'modus-vivendi-tinted t)             ; Dark theme

;; load up everything, compiling as needed.
;; still the simplest, even though just load could
;; work if auto compile was on for loading and saving..
;; theoretically, if everything was just right.
;; takes the same amount of time either way.

;; conditionally recompile and load these dirs.
(require 'bytecompiledir)
(byte-compile-directory "./extensions")
(byte-compile-directory "./config")
(byte-compile-directory "./themes")

(load "display_hints") ; advice for various buffers.

;;; Some global modes
;;; Turn on Vi mode.
(evil-mode t)

;;; line highlight
(global-hl-line-mode 1)

;;; Great for smaller screens. or bigger ones...
(golden-ratio-mode)

(setq visible-bell 1)

;; windmove navigation
(windmove-default-keybindings)         ; shifted arrow keys
(setq windmove-wrap-around t)

(provide init)
;;; init.el ends here.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frog-menu-avy-keys
   (append
    (string-to-list "oeuhtn")
    (string-to-list ",.pgcl")
    (string-to-list "qjkmwv")
    (string-to-list "OEUHTN")
    (string-to-list "<>PGCR")
    (string-to-list "QJKMWV")
    (number-sequence 44 64)))
 '(package-selected-packages
   '(async emojify alert oauth2 org sly geiser haskell-mode markdown-mode ruby-mode lua-mode lsp-mode eval-sexp-fu clojure-mode clj-refactor cider wgrep company eldoc smartparens evil fish-completion dash pretty-hydra hydra helm which-key ace-window restclient perspective all-the-icons emms posframe embark consult vertico exwm projectile zenburn-theme yaml-mode windower which-key-posframe wgrep-ag waher-theme visual-fill-column vertico-posframe uuid undo-tree underwater-theme ujelly-theme twilight-theme transient-posframe toxi-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme solarized-theme soft-stone-theme soft-morning-theme smyx-theme smex smartscan slack session restclient-helm ranger rainbow-mode rainbow-delimiters python-docstring python-black pyenv-mode pydoc py-yapf py-autopep8 purple-haze-theme powerthesaurus perspective-exwm ox-gfm origami org-emms org-drill-table org-drill org-cliplink org-bullets org-babel-eval-in-repl oldlace-theme obsidian-theme noctilux-theme naquadah-theme mw-thesaurus multi-term monokai-theme monokai-alt-theme modus-themes mini-frame mic-paren marginalia major-mode-hydra magit lush-theme lsp-ui lsp-treemacs light-soap-theme leuven-theme lavender-theme langtool kibit-helper json-mode ir-black-theme inkpot-theme ibuffer-tramp ibuffer-projectile ibuffer-git hy-mode highlight-parentheses heroku-theme helm-swoop helm-sly helm-projectile helm-org helm-fish-completion helm-exwm helm-evil-markers helm-emms helm-descbinds helm-clojuredocs helm-cider helm-ag haskell-snippets gotham-theme google-translate golden-ratio github-theme gited git-gutter gist general gandalf-theme frog-jump-buffer flycheck-tip flycheck-pos-tip flycheck-haskell flycheck-guile flycheck-clojure flycheck-clj-kondo floobits flatui-theme flatland-theme firecode-theme find-file-in-project fd-dired exwm-mff expand-region exec-path-from-shell evil-surround evil-smartparens evil-org evil-nerd-commenter evil-mu4e evil-leader evil-cleverparens espresso-theme eshell-autojump emms-soundcloud emms-mark-ext emms-info-mediainfo embark-consult elpy el-get ein doom-themes doom-modeline dmenu django-theme diredfl dired-rsync diff-hl dashboard dash-functional darkmine-theme dark-krystal-theme darcula-theme dante cyberpunk-theme ctags-update company-shell company-lua clues-theme clojure-mode-extra-font-locking cljsbuild-mode cljr-helm cider-hydra cider-eval-sexp-fu busybee-theme bubbleberry-theme boron-theme bliss-theme auto-compile atom-one-dark-theme atom-dark-theme apache-mode ample-zen-theme ample-theme all-the-icons-ibuffer all-the-icons-dired all-the-icons-completion aggressive-indent ag ace-jump-mode ace-jump-buffer ac-cider 4clojure))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
