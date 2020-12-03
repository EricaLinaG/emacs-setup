(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       'par-edit-mode-hook-func)
(add-hook 'lisp-mode-hook             'par-edit-mode-hook-func)
(add-hook 'lisp-interaction-mode-hook 'par-edit-mode-hook-func)
(add-hook 'scheme-mode-hook           'par-edit-mode-hook-func)
(add-hook 'clojure-mode-hook          'par-edit-mode-hook-func)
(add-hook 'cider-mode-hook            'par-edit-mode-hook-func)
