;;; package ---Summary
;;; Commentary:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set the loadpath / bytecompile everything - Go -- Eric
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Code:

(setq load-path
      (append (list
	       "~/elisp"
	       "~/elisp/themes"
	       "~/elisp/extensions"
	       "~/elisp/config")
	      load-path))

;; so I don't have to look at a white screen while it
;; starts up. I do this first.
(load "themes-init")
;; this is a local theme. Code is in themes.
(load-theme 'strange-deeper-blue t)
(enable-theme 'strange-deeper-blue)

;; Byte-compile-directory makes sure everything
;; is compiled up to date, and then loads it.
(load "bytecompiledir")
(byte-compile-directory "~/elisp/extensions")
(byte-compile-directory "~/elisp/themes")

(load "display_hints") ; advice for various buffers.
(load "packages") ; make sure all the packages are installed.

(byte-compile-directory "~/elisp/config")


;;; Some global modes
;;; Turn on Vi mode.
(evil-mode t)

;;; line highlight
(global-hl-line-mode 1)

;;; Great for smaller screens. or bigger ones...
(golden-ratio-mode)

(setq visible-bell 1)

;; See more in elisp/config/appearance.el

;;; End of .emacs.



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(auto-compile-on-save-mode t)
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("f99318b4b4d8267a3ee447539ba18380ad788c22d0173fc0986a9b71fd866100" "2dc18516fce7f499531988be029c8c587110a729e46c4449408c0f44697b5753" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "4af38f1ae483eb9335402775b02e93a69f31558f73c869af0d2403f1c72d1d33" "8b58ef2d23b6d164988a607ee153fd2fa35ee33efc394281b1028c2797ddeebb" "5b7c31eb904d50c470ce264318f41b3bbc85545e4359e6b7d48ee88a892b1915" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3d3cdba780ab2be1ee2fe1ac4b3c81d3b7903230cd4819694f1e9c13c90697c1" "22b5a9132874b6c8bf40a35594b832a24ed665d304fd314584896f4945bd0e65" default))
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
   '(night-owl-theme alect-themes bubbleberry-theme monokai-theme atom-dark-theme exec-path-from-shell helm dash-functional dash idomenu company rich-minority wgrep flx-ido org ruby-mode haskell-mode lua-mode evil eval-sexp-fu clojure-mode cider projectile zoutline zenburn-theme yaml-mode which-key wgrep-ag waher-theme visual-fill-column uuid undo-tree underwater-theme ujelly-theme twilight-theme tronesque-theme tron-theme treemacs toxi-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme steady-theme solarized-theme soft-stone-theme soft-morning-theme smyx-theme smex smartscan smart-mode-line slack skewer-mode rainbow-mode rainbow-delimiters python-docstring pyenv-mode pydoc py-yapf py-autopep8 purple-haze-theme popwin paredit-menu origami org-bullets org-babel-eval-in-repl oldlace-theme nose noctilux-theme naquadah-theme multi-term mic-paren markdown-mode magit lush-theme light-soap-theme leuven-theme lavender-theme langtool kibit-helper jujube-theme json-mode jabber ir-black-theme inkpot-theme iedit hy-mode highlight-parentheses heroku-theme helm-sly helm-projectile helm-ghc helm-fish-completion helm-exwm helm-evil-markers helm-descbinds helm-ag haskell-snippets gotham-theme google-translate golden-ratio github-theme gited git-gutter gist gandalf-theme fuzzy-match frog-jump-buffer flycheck-tip flycheck-pos-tip flycheck-haskell flycheck-guile flycheck-clojure flx floobits flatui-theme flatland-theme firecode-theme find-file-in-project exwm-mff expand-region evil-surround evil-smartparens evil-paredit evil-org evil-nerd-commenter evil-mu4e evil-leader evil-cleverparens espresso-theme eshell-syntax-highlighting eshell-autojump esh-autosuggest elpy el-get ein edn doom-themes doom-modeline django-theme deep-thought-theme darkmine-theme darkburn-theme dark-krystal-theme darcula-theme dante cyberpunk-theme ctags-update counsel company-shell company-lua clues-theme clojure-mode-extra-font-locking cljsbuild-mode clj-refactor cider-eval-sexp-fu busybee-theme boron-theme bliss-theme autopair auto-compile assemblage-theme apache-mode ample-zen-theme ample-theme align-cljlet aggressive-indent ag ace-jump-mode ace-jump-buffer ac-cider))
 '(sclang-auto-scroll-post-buffer t)
 '(sclang-eval-line-forward nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
