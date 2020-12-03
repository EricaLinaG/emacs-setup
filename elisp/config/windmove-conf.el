(require 'windmove)

(windmove-default-keybindings)         ; shifted arrow keys

;; (windmove-default-keybindings 'hyper) ; etc.
;;
;; to use another modifier key.
;;
;;
;; If you wish to enable wrap-around, also add a line like:
(setq windmove-wrap-around t)

;; Change the ignore argument to window-in-direction to t
;; which causes it to NOT ignore windows marked ignore.
;; After using Magit, windows are marked ignore and windmove
;; stops working. I'm sure this effects other things as well
;; since window-in-direction is part of window.el and is likely
;; used by other things.  `no-other-window is the window parameter
;; being/not being tested here..  (window-parameter w 'no-other-window)
;; set-window-parameter is presumably the way it gets set. But that call
;; is no where to be found.

(defun windmove-find-other-window (dir &optional arg window)
  "Return the window object in direction DIR.
DIR, ARG, and WINDOW are handled as by `windmove-other-window-loc'."
  (window-in-direction
   (cond
    ((eq dir 'up) 'above)
    ((eq dir 'down) 'below)
    (t dir))
   window t arg windmove-wrap-around t))
