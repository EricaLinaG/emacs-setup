;;Example 11-6. ``.emacs'' example for naive page scrolling with Wheeled Mouse

;;;; wheel mouse
;;(global-set-key [mouse-4] 'scroll-down)
;;(global-set-key [mouse-5] 'scroll-up)

;;; MacOS X specific stuff
;(setq mac-command-key-is-meta nil)

;(setq mac-command-modifier 'meta')
;(setq mac-option-modifier 'super')

;; Define the return key to avoid problems on MacOS X
;(define-key function-key-map [return] [13])

;(global-set-key [(alt a)] 'mark-whole-buffer)
;(global-set-key [(alt v)] 'yank)
;(global-set-key [(alt c)] 'kill-ring-save)
;(global-set-key [(alt x)] 'kill-region)
;(global-set-key [(alt s)] 'save-buffer)
;(global-set-key [(alt l)] 'goto-line)
;(global-set-key [(alt o)] 'find-file)
;(global-set-key [(alt f)] 'isearch-forward)
;(global-set-key [(alt g)] 'isearch-repeat-forward)
;(global-set-key [(alt w)]
;                (lambda () (interactive) (kill-buffer (current-buffer))))
;(global-set-key [(alt .)] 'keyboard-quit)

;; I disabled this since I want to avoid hitting Cmd-q accidentally.
;(global-set-key [(alt q)] 'save-buffers-kill-emacs)

;(global-set-key [next] 	   'pager-page-down)
;;;     (global-set-key "\ev"	   'pager-page-up)
;(global-set-key [prior]	   'pager-page-up)
;(global-set-key '[(meta up)]    'pager-row-up)
;;;     (global-set-key '[M-kp-8]  'pager-row-up)
;(global-set-key '[(meta down)]  'pager-row-down)
;;;     (global-set-key '[M-kp-2]  'pager-row-down)
(global-set-key (kbd "C-*") 'evil-search-word-forward)
(global-set-key (kbd "C-#") 'evil-search-word-backward)

(require 'git-frame)
(global-set-key (kbd "C-c g") 'magit-other-frame)
(define-key magit-mode-map (kbd "q") 'delete-frame)

;;(global-set-key (kbd "C-c g")        'magit-status)
(global-set-key (kbd "C-c c")        'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c l")        'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c b")        'evilnc-comment-or-uncomment-paragraphs)
(global-set-key (kbd "C-c r")        'evilnc--comment-or-uncomment-region)
(global-set-key (kbd "C-c s")        'cb-next-shell-window)
(global-set-key (kbd "C-c S")        'cb-next-cider-window)

(global-set-key (kbd "<f1>")        'smex)
(global-set-key (kbd "C-<f1>")      'redraw-display)
(global-set-key (kbd "M-<f1>")      'vkill)

(global-set-key  (kbd "<f2>")       'help-for-help)
(global-set-key  (kbd "S-<f2>")     'describe-function)
(global-set-key  (kbd "C-<f2>")     'apropos)
(global-set-key  (kbd "M-<f2>")     'describe-key)

(global-set-key  (kbd "<f3>")       'cb-next-shell-window)
(global-set-key  (kbd "S-<f3>")     'cb-next-cider-window)
(global-set-key  (kbd "C-<f3>")     'cider-quit)
(global-set-key  (kbd "M-<f3>")     'cider-connect)

(global-set-key  (kbd "<f4>")       'cb-next-dired-window)
(global-set-key  (kbd "S-<f4>")     'dired)
(global-set-key  (kbd "C-<f4>")     'cb-next-show-window)
(global-set-key  (kbd "M-<f4>")     'projectile-switch-to-buffer)
(global-set-key  (kbd "s-<f4>")     'cb-next-files-window)

(global-set-key  (kbd "<f5>")       'next-error)
(global-set-key  (kbd "S-<f5>")     'previous-error)
(global-set-key  (kbd "<C-f5>")     'toggle-current-window-dedication)
(global-set-key  (kbd "M-<f5>")     'projectile-regenerate-tags)
(global-set-key  (kbd "s-<f5>")     'magit-status)

(global-set-key  (kbd "<f6>")       'find-tag-without-ns)
(global-set-key  (kbd "S-<f6>")     'find-next-tag-without-ns)
(global-set-key  (kbd "C-<f6>")     'ido-find-tag)
(global-set-key  (kbd "M-<f6>")     'cider-jump-to-var)
(global-set-key  (kbd "s-<f6>")     'projectile-ag)


(global-set-key   (kbd "<f7>")      'magit-status)
(global-set-key   (kbd "S-<f7>")    'magit-log)
(global-set-key   (kbd "C-<f7>")    'speedbar)

(global-set-key  (kbd "<f8>")       'cb-next-files-window)
(global-set-key  (kbd "<C-f8>")     'cb-next-files-buffer)

(global-set-key  (kbd "<f9>")       'cb-kill)
(global-set-key  (kbd "S-<f9>")     'cb-kill-delete-window)
(global-set-key  (kbd "C-<f9>")     'cb-kill-delete-frame)

(global-set-key  (kbd "<f10>")      'find-file)
(global-set-key  (kbd "S-<f10>")    'projectile-switch-to-buffer)
(global-set-key  (kbd "C-<f10>")    'find-file-at-point-other-window)
(global-set-key  (kbd "M-<f10>")    'find-file-at-point-new-frame)

(global-set-key  (kbd "<f11>")       'other-window)
(global-set-key  (kbd "S-<f11>")     'evilnc-comment-or-uncomment-lines)
(global-set-key  (kbd "C-<f11>")     'evilnc-comment-or-uncomment-paragraphs)

(global-set-key  (kbd "<f12>")       'cb-next-buffer-contextual)
(global-set-key  (kbd "S-<f12>")     'cb-previous-buffer-contextual)
(global-set-key  (kbd "C-<f12>")     'cb-next-all-buffer)
(global-set-key  (kbd "M-<f12>")     'cb-previous-all-buffer)
(global-set-key  (kbd "s-<f12>")     'cb-next-files-buffer)

(global-set-key  (kbd "<home>")      'beginning-of-buffer)
(global-set-key  (kbd "S-<home>")    'end-of-buffer)

(global-set-key  (kbd "<f13>")       'toggle-current-window-dedication)

;(global-set-key  '[prior]           'scroll-down)
;(global-set-key  '[(shift prior)]   'line-to-bottom-of-window)
;(global-set-key  '[(control prior)] 'go-top-of-window)
;(global-set-key  '[(meta prior)]    'scroll-other-window-down)

;(global-set-key  '[select]          'goto-line)

;(global-set-key  '[(shift select)]   'point-to-register-compatibility-binding)

;(global-set-key  '[(control select)] 'dummy-binding)
;(global-set-key  '[(meta select)]    'jump-to-register-compatibility-binding)


;(global-set-key  '[break]          'exit-recursive-edit)

;(global-set-key  '[(kp-period)]      'next-error)
;(global-set-key  '[(kp-decimal)]     'next-error)

;(global-set-key  '[(control c) ?s] 'dictionary-search)
;(global-set-key  '[(control c) ?m] 'dictionary-match-words)
