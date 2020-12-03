;; (autoload 'enable-paredit-mode "paredit"
;;  "Turn on pseudo-structural editing of Lisp code." t)

(require 'paredit)
(require 'evil-paredit)
(require 'highlight-parentheses)
(require 'origami)

(global-origami-mode t)

;; (require 'evil-smartparens)
;; (require 'smartparens-config)
;; (require 'evil-cleverparens)
;; (require 'evil-cleverparens-text-objects)

;; (add-hook 'emacs-lisp-mode-hook       #'evil-cleverparens-mode)
;; (add-hook 'lisp-mode-hook             #'evil-cleverparens-mode)
;; (add-hook 'lisp-interaction-mode-hook #'evil-cleverparens-mode)
;; (add-hook 'scheme-mode-hook           #'evil-cleverparens-mode)
;; (add-hook 'clojure-mode-hook          #'evil-cleverparens-mode)
;; (add-hook 'cider-mode-hook            #'evil-cleverparens-mode)
;; (add-hook 'sh-mode-hook               #'evil-cleverparens-mode)

(add-hook 'emacs-lisp-mode-hook       'par-edit-mode-hook-func)

(add-hook 'lisp-mode-hook             'par-edit-mode-hook-func)
(add-hook 'lisp-interaction-mode-hook 'par-edit-mode-hook-func)
(add-hook 'scheme-mode-hook           'par-edit-mode-hook-func)
(add-hook 'clojure-mode-hook          'par-edit-mode-hook-func)
(add-hook 'cider-mode-hook            'par-edit-mode-hook-func)
(add-hook 'python-mode-hook           'par-edit-mode-hook-func)
(add-hook 'sh-mode-hook               'par-edit-mode-hook-func)
(add-hook 'esh-mode-hoo               'par-edit-mode-hook-func)

(defvar autopair-modes '(r-mode ruby-mode python-mode sh-mode))
(defun turn-on-autopair-mode () (autopair-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
