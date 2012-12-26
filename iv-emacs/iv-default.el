;;;
;;; iv-default.el
;;;

;; i.e. "iv-arch-w32", "iv-arch-x"
(let ((arch-init-file (format "iv-arch-%s" window-system)))
  (load arch-init-file))

(load "iv-basic")
(load "iv-keys")
