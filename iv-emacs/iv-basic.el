;;;
;;; iv-basic.el
;;;
;; Indent stuff
(setq-default fill-column 78)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default column-number-mode t)
(setq-default truncate-partial-width-windows nil)
(setq-default eval-expression-print-length nil)
;; PDFs

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . no-pdf))

(defun no-pdf ()
  "Run pdftotext on the entire buffer."
  (interactive)
  (let ((modified (buffer-modified-p)))
    (erase-buffer)
    (shell-command
     (concat 
      "\"c:/Documents and Settings/Ivan Vazquez/My Documents/Program Files/xpdf/pdftotext.exe\" " 
      (buffer-file-name) " -")
     (current-buffer)
     t)
    (set-buffer-modified-p modified)))

;; Tab stop munchificazione

(let ((i 15))
  (setq tab-stop-list nil)
  (while (> i 0)
    (setq tab-stop-list (append (list (* tab-width i)) tab-stop-list))
    (setq i (- i 1))))

;; beautifcation

(set-background-color "BLACK")
(set-foreground-color "GREEN")
(set-cursor-color "RED")

;; sanity helpers
(setq mouse-yank-at-point t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; desktop
(setq desktop-dirname user-emacs-directory)
(desktop-save-mode 1)

;; misc
(setq display-time-day-and-date t)
(display-time)



