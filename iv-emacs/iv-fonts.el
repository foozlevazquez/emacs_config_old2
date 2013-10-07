
(setq testline
 "# This could be done at CLASS INSTANTIATION time, by using metaclasses, but!!!") # 78 chars long exactly line-wrap length

(setq *final-font* nil)

(defun check-fonts ()
  (let ((bad-regexps '("-urw" "Nanum"))
        (font-list (x-list-fonts "-*-*-*-r-normal-*-1" nil (selected-frame)))
        fonts)
    (dolist (font font-list)
      (let ((add t))
        (dolist (re bad-regexps)
          (when (string-match re font)
            (setq add nil)))
        (when add
          (push font fonts))))
    (while fonts
      (let ((font (car fonts)))
        (setq fonts (cdr fonts))
        (unless (string-match "-urw" font)
          (set-default-font font)
          (message font)
          (setq *final-font* font)
          (read-event))))))
