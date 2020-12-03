(require 'smart-mode-line)

;;(sml/setup) ;; smart-mode-line

;;; SML Themes
;;(sml/apply-theme 'dark)
;;sml/apply-theme 'light)
;;(sml/apply-theme 'respectful)
;;(sml/apply-theme 'automatic)

(defun sml-startup ()
  (sml/setup)
  (sml/apply-theme 'respectful))


;;; SML adds a theme, so should be done after init.
(add-hook 'after-init-hook 'sml-startup)
