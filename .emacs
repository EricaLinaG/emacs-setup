;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This My personal keymappings and functions. -- Eric
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq load-path
      (append (list
	       "~/elisp"
	       "~/elisp/extensions"
	       "~/elisp/extensions/mu4e"
	       "~/elisp/config"
	       "~/elisp/themes")
	      load-path))

(load "vars") ; if you change vars - be sure to delete the .elc !!
(load "packages") ; make sure all the packages are installed.

(install-mypackages)

(load "bytecompiledir")
					; Byte-compile-directory makes sure everything
					; is compiled up to date, and then loads it.
					;(byte-compile-directory "~/elisp")
(byte-compile-directory "~/elisp/extensions/mu4e")
(byte-compile-directory "~/elisp/extensions")
(byte-compile-directory "~/elisp/themes")
					;(byte-compile-directory "~/elisp/extensions/auto-complete")
;;(byte-compile-directory "~/elisp/extensions/git-modes")
;;(byte-compile-directory "~/elisp/extensions/helm-etags-plus")
(byte-compile-directory "~/elisp/config")


					;(require 'session)
					;(add-hook 'after-init-hook 'session-initialize)
					;(session-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3d3cdba780ab2be1ee2fe1ac4b3c81d3b7903230cd4819694f1e9c13c90697c1" "22b5a9132874b6c8bf40a35594b832a24ed665d304fd314584896f4945bd0e65" default)))
 '(sclang-auto-scroll-post-buffer t)
 '(sclang-eval-line-forward nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "themes-init")
(load-theme 'strange-deeper-blue t)
(enable-theme 'strange-deeper-blue)

(load "setup")
