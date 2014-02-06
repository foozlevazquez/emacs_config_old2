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

(defvar *iv-color-switch-value* 'light
  "Either 'light or 'dark")

(defvar  *iv-color-maps*
  '((dark "BLACK" "WHITE" "PINK")
    (light "WHITE" "BLACK" "PINK")))


(defun iv-increment-indicator (indicator mapl)
  (let ((first (car (car mapl)))
        found
        result)
    (while (and mapl (not found))
      (if (eq (car (car mapl)) indicator)
          (setq found t))
      (setq mapl (cdr mapl)))

    (cond (mapl
            (setq result (car (car mapl))))
          (t
            (setq result first)))
    result))


(defun iv-toggle-colors (&optional scheme)
  (let (colors)
    (if scheme
        (setq *iv-color-switch-value* scheme)
      (setq *iv-color-switch-value*
            (iv-increment-indicator *iv-color-switch-value* *iv-color-maps*)))
    (setq colors (cdr (assoc *iv-color-switch-value* *iv-color-maps*)))
    (set-background-color (elt colors 0))
    (set-foreground-color (elt colors 1))
    (set-cursor-color (elt colors 2))
    *iv-color-switch-value*))




;;(set-background-color "BLACK"
;;                      ;;"grey10"
;;                      )
;;(set-foreground-color "white"
;;                      ;; "GREEN"
;;                      )
;;(set-cursor-color "pink")

(setq-default cursor-in-non-selected-windows nil)

;; sanity helpers
(setq mouse-yank-at-point nil)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; desktop
(setq desktop-dirname user-emacs-directory)
(desktop-save-mode 1)

;; misc
(setq display-time-day-and-date t)
(display-time)


;; make mode line show wtf is going on
(set-face-attribute  'mode-line
                 nil
                 :foreground "gray80"
                 :background "gray25"
                 :box '(:line-width 10 :style released-button))
(set-face-attribute  'mode-line-inactive
                 nil
                 :foreground "gray30"
                 :background "black"
                 :box '(:line-width 1 :style released-button))


(defun re-shell ()
  (interactive)
  (kill-process (get-buffer-process (current-buffer)))
  (sit-for 2)
  (shell))
