;;
;; iv-py
;;
(autoload 'pylookup-lookup "pylookup")
(autoload 'pylookup-update "pylookup")
(setq pylookup-program "~/.emacs.d/vendors/pylookup/pylookup.py")
(setq pylookup-db-file "~/.emacs.d/vendors/pylookup/pylookup.db")
(global-set-key "\C-ch" 'pylookup-lookup)

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(if (eq system-type 'windows-nt)
    (let ((windows-python "python2.6"))
      (eval-after-load "python" 
        `(setq python-command ,windows-python))
    (eval-after-load "pymacs"
      `(setq pymacs-python-command ,windows-python))))

  ;(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY")

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
