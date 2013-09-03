

(defun iv-set-python ()
  (let ((pythons-to-use-ordered '("/usr/bin/python3.3-sp" "/usr/bin/python3.3"
                                  "/usr/bin/python2.7"))
        p-found)
    (while (and (not p-found) pythons-to-use-ordered)
      (let ((p (car pythons-to-use-ordered)))
        (setq pythons-to-use-ordered (cdr pythons-to-use-ordered))
        (when (file-exists-p p)
          (custom-set-variables `(python-shell-interpreter ,p t))
          (custom-set-variables `(gud-pdb-command-name
                                  (format "%s -m pdb" ,p) t))
          (setq p-found p))))
    p-found))

(iv-set-python)

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





;(eval-after-load "python"
;  '(add-hook 'inferior-python-mode-hook
;             (lambda ()
;               (python-send-string
;                "import sys,os; sys.path.append(os.getcwd());"))))


  ;(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY")

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'python-pep8)
(require 'python-pylint)
