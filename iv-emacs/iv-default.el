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
(load "iv-gnus")

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

;; magit
(require 'magit)
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list
                       (concat user-emacs-directory "vendors/magit"))))
;; git-emacs
(require 'git-emacs)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-set-upstream-on-push  'dontask)
 '(gud-pdb-command-name (format "%s -m pdb" "/usr/bin/python3.3-sp"))
 '(python-shell-interpreter "/usr/bin/python3.3-sp")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "localhost")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
