;;; package --- Summary
;;; Commentary:

;; provides functionality to open magit in another frame.

;;; Code:
(require 'magit-git)
(require 'magit-status)

(defun magit-other-frame ()
  "Start Magit status in another frame."
  (interactive)
  (if (magit-toplevel)
      (progn
        (select-frame (make-frame-command))
        (magit-status-setup-buffer)
        (delete-other-windows))
    (magit--not-inside-repository-error)))

(provide 'git-frame)
;;; git-frame.el ends here
