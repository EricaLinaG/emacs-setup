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
