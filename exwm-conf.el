;;; package --- Summary
;;; Commentary: Exwm config.
;;; Code:

;; This code was lifted from here.
;; https://github.com/johanwiden/exwm-setup/blob/master/.emacs.d/config.org

;; Then simplified to be only for exwm and only a config.

;; But that code came from:
;; The code has then been modified, mainly with settings from the
;; (Ambrevar)[https://gitlab.com/ambrevar/dotfiles/-/blob/master/.emacs.d/lisp/init-exwm.el]
;; configuration.

;; EXWM buffer names are changed to be much more human readable.
;; For example, the buffer for a browser window, will get its name from the
;; title of the currently selected tab in that window.

;; The EXWM keybindings are all defined as one element sequences. This is
;; required, except for some special cases such as "C-c C-q". To avoid collisions
;; with other emacs keybindings the exwm-input-global-keys use the "Super"
;; modifier key, and the simulation keys use the "Hyper" modifier key.

;; The key bindings under

;; 'S-s-N': Move window to, and switch to, a certain workspace.

;; Support for resizing windows, using the mouse.
;; Position the mouse on the divider line between two windows, the mouse pointer
;; should then change to a double arrow.
;; Press the left mouse button, and move the mouse.


;; pgp entry from emacs.
;; (setf epg-pinentry-mode 'loopback)
;; (defun pinentry-emacs (desc prompt ok error)
;;   (let ((str
;;          (read-passwd
;;           (concat
;;            (replace-regexp-in-string
;;             "%22" "\""
;;             (replace-regexp-in-string "%0A" "\n" desc)) prompt ": "))))
;;     str))


(require 'browse-url)
(require 'exwm-manage)
(require 'windower)

;; Rename buffer to window title.
(defun ambrevar/exwm-rename-buffer-to-title () (exwm-workspace-rename-buffer exwm-title))

(defun ambrevar/call-process-to-string (program &rest args)
  "Call PROGRAM with ARGS and return output.
  See also `process-lines'."
  ;; Or equivalently:
  ;; (with-temp-buffer
  ;;   (apply 'process-file program nil t nil args)
  ;;   (buffer-string))
  (with-output-to-string
    (with-current-buffer standard-output
      (apply 'process-file program nil t nil args))))


(setq browse-url-generic-program
      (or
       (executable-find (or (getenv "BROWSER") ""))
       (when (executable-find "xdg-mime")
         (let ((desktop-browser (ambrevar/call-process-to-string "xdg-mime" "query" "default" "text/html")))
           (substring desktop-browser 0 (string-match "\\.desktop" desktop-browser))))
       (executable-find browse-url-chrome-program)))


;; Set the initial workspace number.
(unless (get 'exwm-workspace-number 'saved-value)
  (setq exwm-workspace-number 4))

;; Make class name the buffer name
(add-hook 'exwm-update-class-hook
          (lambda ()
            (exwm-workspace-rename-buffer exwm-class-name)))


;; Global keybindings. 0-9 bcDfFgGhHijJkKlLmoOQrRwW !@#$%^&*() tab f2 backspace
(unless (get 'exwm-input-global-keys 'saved-value)
  (setq exwm-input-global-keys
        `(
          ;; (,(kbd "s-b") . exwm-workspace-switch-to-buffer)
          (,(kbd "s-b") . helm-mini) ;; list and select buffers
          (,(kbd "s-c") . helm-resume) ;; Continue in latest helm selection buffer
          (,(kbd "s-G") . helm-locate) ;; locate file, based in Linux locate command
          (,(kbd "s-g") . helm-do-grep-ag) ;; Grep search in files
          (,(kbd "s-r") . helm-run-external-command) ;; Start an application, such as google-chrome
          (,(kbd "s-W") . helm-exwm-switch-browser) ;; Switch to some browser windows
          (,(kbd "s-m") . (lambda () ;; Toggle display of mode-line and minibuffer, in an EXWM window
                            (interactive)
                            (exwm-layout-toggle-mode-line)
                            (exwm-workspace-toggle-minibuffer)))
          (,(kbd "s-i") . exwm-input-toggle-keyboard) ;; Toggle between "line-mode" and "char-mode" in an EXWM window
          ;; 's-r': Reset (to line-mode).
          (,(kbd "s-R") . exwm-reset) ;; Try to reset EXWM to a sane mode. Panic key
          ;; Interactively select, and switch to, a workspace. Only works in non EXWM windows.
          (,(kbd "s-w") . exwm-workspace-switch)
          ;; 's-a': Launch application.
          ;; (,(kbd "s-a") . (lambda (command)
          ;;              (interactive (list (read-shell-command "$ ")))
          ;;              (start-process-shell-command command nil command)))
          ;; 's-N': Switch to a certain workspace.
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9))
          ;; 'S-s-N': Move window to, and switch to, a certain workspace.
          ,@(cl-mapcar (lambda (c n)
                         `(,(kbd (format "s-%c" c)) .
                           (lambda ()
                             (interactive)
                             (exwm-workspace-move-window ,n)
                             (exwm-workspace-switch ,n))))
                       '(?\) ?! ?@ ?# ?$ ?% ?^ ?& ?* ?\()
                       ;; '(?\= ?! ?\" ?# ?¤ ?% ?& ?/ ?\( ?\))
                       (number-sequence 0 9))

          ;; Bind "s-<f2>" to "slock", a simple X display locker.
          (,(kbd "s-<f2>") . (lambda ()
                               (interactive)
                               (start-process "" nil "/usr/bin/slock")))
          ;; (,(kbd "s-f") . find-file)
          (,(kbd "s-<tab>") . windower-switch-to-last-buffer) ;; Switch to last open buffer in current window
          (,(kbd "s-o") . windower-toggle-single) ;; Toggle between multiple windows, and a single window
          (,(kbd "s-O") . windower-toggle-split)  ;; Toggle between vertical and horizontal split. Only works with exactly two windows.
          (,(kbd "s-H") . windower-swap-left)  ;; Swap current window with the window to the left
          (,(kbd "s-J") . windower-swap-below) ;; Swap current window with the window below
          (,(kbd "s-K") . windower-swap-above) ;; Swap current window with the window above
          (,(kbd "s-L") . windower-swap-right) ;; Swap current window with the window to the right
          (,(kbd "s-F") . exwm-floating-toggle-floating) ;; Toggle the current window between floating and non-floating states
          (,(kbd "s-Q") . exwm-layout-toggle-fullscreen) ;; Toggle fullscreen mode, when in an EXWM window.
          (,(kbd "s-D") . kill-this-buffer)
          (,(kbd "s-<backspace>") . kill-this-buffer)
          )))


;; Line-editing shortcuts: abBcdefFknpqsvwx
(unless (get 'exwm-input-simulation-keys 'saved-value)
  (setq exwm-input-simulation-keys
        `((,(kbd "H-b") . ,(kbd "<left>"))
          (,(kbd "H-B") . ,(kbd "C-<left>"))
          (,(kbd "H-f") . ,(kbd "<right>"))
          (,(kbd "H-F") . ,(kbd "C-<right>"))
          (,(kbd "H-p") . ,(kbd "<up>"))
          (,(kbd "H-n") . ,(kbd "<down>"))
          (,(kbd "H-a") . ,(kbd "<home>"))
          (,(kbd "H-e") . ,(kbd "<end>"))
          ;; q and w are convenient if Caps Lock key is Hyper key
          (,(kbd "H-q") . ,(kbd "<prior>"))
          (,(kbd "H-w") . ,(kbd "<next>"))
          (,(kbd "H-d") . ,(kbd "<delete>"))
          (,(kbd "H-k") . ,(kbd "S-<end> <delete>"))
          ;; cut/paste.
          (,(kbd "H-x") . ,(kbd "C-x"))
          (,(kbd "H-c") . ,(kbd "C-c"))
          (,(kbd "H-v") . ,(kbd "C-v"))
          ;; search
          (,(kbd "H-s") . ,(kbd "C-f"))
          )))

;; Default is save-buffers-kill-terminal, but that may kill daemon before its finished
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)
(add-hook 'exwm-update-title-hook 'ambrevar/exwm-rename-buffer-to-title)

;; Ensure that EXWM input mode is displayed in mode line
(add-hook 'exwm-input--input-mode-change-hook
          'force-mode-line-update)

;; Allow resizing of non-floating windows, with mouse.
(setq window-divider-default-bottom-width 2
      window-divider-default-right-width 2)
(window-divider-mode)


;; Allow switching to EXWM buffers not belonging to current workspace.
;; This behaviour takes some getting used to
;; (setq exwm-layout-show-all-buffers t)

;; When a buffer list is displayed, we want a separate section for EXWM buffers.
;; EXWM buffers that do not belong to the current workspace, are listed with an
;; indent.
(require 'helm-exwm)

(setq helm-exwm-emacs-buffers-source (helm-exwm-build-emacs-buffers-source))
(setq helm-exwm-source (helm-exwm-build-source))
(setq helm-mini-default-sources `(helm-exwm-emacs-buffers-source
                                  helm-exwm-source
                                  helm-source-recentf))

;; When saving emacs desktop, also save Helm find-file-history.
;; That way we also save dired paths.

;; not sure what package this is.
;; (add-to-list 'desktop-globals-to-save 'helm-ff-history)

;; Sets up the hooks.  Exwm starts with the first frame if it can.
(exwm-enable)
