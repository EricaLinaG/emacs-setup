;;; Package --- Summary
;;; Commentary:
;;; Code:

;; Ace-window, Ace-jump-buffer, frog-jump-buffer
(require 'ace-jump-buffer)
(require 'frog-menu)

(global-set-key (kbd "M-o") 'ace-window)

;; dvorak home row, beakl regions (3x3).
(setq aw-keys '(?o ?e ?u ?h ?t ?n ?, ?. ?p ?g ?c ?l ?q ?j ?k ?m ?w ?v))

;; Whenever ace-window prompts for a window selection, it grays out
;; all the window characters, highlighting window labels in red.  To
;; disable this behavior, set this:

;;(setq aw-background nil)

;; If you want to know the selection characters ahead of time, turn on
(ace-window-display-mode)

;; variable from from menu.
;; Dvorak with beakl regions, (3x3).
;; "Frog menu keys used for `avy-keys'.
(custom-set-variables '(frog-menu-avy-keys (append (string-to-list "oeuhtn")
                                                   (string-to-list ",.pgcl")
                                                   (string-to-list "qjkmwv")
                                                   (string-to-list "OEUHTN")
                                                   (string-to-list "<>PGCR")
                                                   (string-to-list "QJKMWV")
                                                   (number-sequence ?, ?@))))

(provide 'ace-window-conf)
;;; ace-window-conf.el ends here
