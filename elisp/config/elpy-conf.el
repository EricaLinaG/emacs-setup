(require 'elpy)
(require 'py-autopep8)
;;;;;;;;;;;;;;;;;;;;;
;;  ELPY

(elpy-enable)

(setq elpy-rpc-backend "rope")
;;(setq elpy-rpc-backend "jedi")

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))

;;;; use python interpreter
(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i")

;;;; use Ipython interpreter
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i --simple-prompt")

;; ;;;; use jupyter interactive notebook
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")

;; (setq py-install-directory "~/.emacs.d/python-mode-6.0.11")
;; (add-to-list 'load-path py-install-directory)
;; (require 'python-mode)

;;                                         ; use IPython
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;       '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; (setq py-force-py-shell-name-p t)

;; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ; try to automagically figure out indentation
;; (setq py-smart-indentation t)
