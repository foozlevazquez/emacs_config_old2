;; more wonderful keybindings
(defun my-iconify-maybe (&optional ignored)
  (interactive "i")
  (if (y-or-n-p "Iconfy? ")
      (iconify-or-deiconify-frame)
    (message "rock on")))

(global-set-key "" 'my-iconify-maybe)

(define-key lisp-interaction-mode-map "" 'eval-print-last-sexp)
;;
;;  A simple function to move the point the the previous window, when
;; there are multiple windows on screen.  Simpler to use that
;; "other-window"
;;
(defun other-window-backward (&optional n)
  "Select Nth previous window"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

;; Go to 3 windows on the current frame
;;
(defun split-window-three-ways-horizontally (&optional ignored)
  (interactive "i")
  (delete-other-windows)
  (save-excursion
    (let ((wwdiv3 (/ (window-width) 3)))
      (split-window-horizontally wwdiv3)  
      (other-window 1)
      (split-window-horizontally wwdiv3))))

(global-set-key "\C-x5" 'split-window-horizontally)
(global-set-key "\C-x3" 'split-window-three-ways-horizontally)


;;
;; Key bindings for next window, and previous window.
;; taken straight from the Glickenstein.
(global-set-key "\C-x\C-n" 'other-window)
(global-set-key "\C-x\C-p" 'other-window-backward)

(global-set-key "\C-Cc" 'compile)


