(require 'diredfl)
(setq diredfl-global-mode 't)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; I have git gutter already.
;; (global-diff-hl-mode)
;; (add-hook 'prog-mode-hook 'diff-hl-mode)
;; (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
