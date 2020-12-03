(require 'eshell)
;;;;;;;;;;;;;;;;;;;;;
;; ESHELL
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

(setq eshell-history-size 1024)
(setq eshell-prompt-regexp "^[^#$]*[#$] ")

(load "em-hist")           ; So the history vars are defined
(if (boundp 'eshell-save-history-on-exit)
    (setq eshell-save-history-on-exit t)) ; Don't ask, just save
;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)
(if (boundp 'eshell-ask-to-save-history)
    (setq eshell-ask-to-save-history 'always)) ; For older(?) version
;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)

(defun eshell/ef (fname-regexp &rest dir) (ef fname-regexp default-directory))


;;; ---- path manipulation

(defun pwd-repl-home (pwd)
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
   (home-len (length home)))
    (if (and
   (>= (length pwd) home-len)
   (equal home (substring pwd 0 home-len)))
  (concat "~" (substring pwd home-len))
      pwd)))

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (propertize (concat "["
                          (if (and (> (length git-output) 0)
                                   (not (string-match "fatal:.*" git-output)))
                  (substring git-output 0 -1)
                "no branch")
              "]") 'face `(:foreground "#A09000"))
      )))


;; Prompts - pick what you want at the bottom.
(defun simple-time-prompt ()
  (setq eshell-prompt-function
        (lambda ()
          (concat (format-time-string "%Y-%m-%d %H:%M" (current-time))
                  (if (= (user-uid) 0) " # " " $ ")))))

(defun simple-path-prompt ()
  (setq eshell-prompt-function
        (lambda nil
          (concat
           (eshell/pwd)
           " $ "))))

; A simple colored prompt.
(defun simple-prompt ()
  (setq eshell-prompt-function (lambda nil
                                 (concat
                                  (propertize (eshell/pwd) 'face `(:foreground "blue"))
                                  (propertize " $ " 'face `(:foreground "green")))))
  (setq eshell-highlight-prompt nil))

; a simple prompt, limiting the path to the last three entries
; Adding the git branch if it can find one.
(defun short-path-prompt ()
  (setq eshell-prompt-function
        (lambda ()
          (concat
           (propertize ((lambda (p-lst)
                          (if (> (length p-lst) 3)
                              (concat
                               (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                                                          (substring elm 0 1)))
                                          (butlast p-lst 3)
                                          "/")
                               "/"
                               (mapconcat (lambda (elm) elm)
                                          (last p-lst 3)
                                          "/"))
                            (mapconcat (lambda (elm) elm)
                                       p-lst
                                       "/")))
                        (split-string (pwd-repl-home (eshell/pwd)) "/")) 'face `(:foreground "yellow"))
           (or (curr-dir-git-branch-string (eshell/pwd)))
           (propertize "# " 'face 'default))))

  (setq eshell-highlight-prompt nil))


;; A two line prompt. path, date and time on one line.
;; userid and git branch at the prompt.
 (defmacro with-face (str &rest properties)
    `(propertize ,str 'face (list ,@properties)))

  (defun shk-eshell-prompt ()
    (let ((header-bg "#100050"))
      (concat
       (with-face (concat (eshell/pwd) " ") :foreground "#008888" :background header-bg)
       (with-face (format-time-string "--------------- (%Y-%m-%d %H:%M)"
                                      (current-time)) :background header-bg :foreground "#888")
       (with-face
        (or (ignore-errors (format "(%s)" (vc-responsible-backend default-directory))) "")
        :background header-bg)
       (with-face "\n" :background header-bg)
       (with-face user-login-name :foreground "#909090")
       (or (curr-dir-git-branch-string (eshell/pwd)))
       (if (= (user-uid) 0)
           (with-face " #" :foreground "red")
         " $")
       " ")))

(defun fancy-2-line-prompt ()
  (setq eshell-prompt-function 'shk-eshell-prompt)
  (setq eshell-highlight-prompt nil))


;;;;;;;;;;;;;;;;;;;;;;;;;
;; choose your prompt. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
(fancy-2-line-prompt)
;(simple-time-prompt)
;(simple-path-prompt)
;(simple-prompt)
;(short-path-prompt)
