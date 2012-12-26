;;
;; iv-default.el
;;

(when window-system
  (load (format "iv-arch-%s" window-system))) ; i.e. "iv-arch-w32", "iv-arch-x"

(load "iv-basic")
(load "iv-keys")
(load "iv-py")

(let ((default-directory (concat user-emacs-directory "vendors")))
  (normal-top-level-add-subdirs-to-load-path))

;; inf-ruby

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
(eval-after-load 'ruby-mode
      '(add-hook 'ruby-mode-hook (lambda () 
                                   (inf-ruby-setup-keybindings))))
