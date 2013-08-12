;;
;; iv-default.el
;;

(when window-system
  (load (format "iv-arch-%s" window-system))) ; i.e. "iv-arch-w32", "iv-arch-x"

(let ((default-directory (concat user-emacs-directory "vendors")))
  (normal-top-level-add-subdirs-to-load-path))

(load "iv-basic")
(load "iv-keys")
(load "iv-py")


;; inf-ruby
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
(eval-after-load 'ruby-mode
      '(add-hook 'ruby-mode-hook (lambda () 
                                   (inf-ruby-setup-keybindings))))

;; emacs-w3m
(require 'w3)
(require 'browse-url)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(setq w3m-use-cookies t)



