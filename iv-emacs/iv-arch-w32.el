;;;
;;; iv-arch-w32
;;;
(cond ((eq window-system 'w32)
       (setq exec-path
             (append 
              (list "C:/cygwin/bin") exec-path))
       
       (setenv "PATH" (concat "C:\\cygwin\\bin;" (getenv "PATH")))
       
       ;; Use cygwin bash
       (add-hook 'comint-output-filter-functions
                 'shell-strip-ctrl-m nil t)
       (add-hook 'comint-output-filter-functions
                 'comint-watch-for-password-prompt nil t)
      
       (setq explicit-shell-file-name "bash.exe")

       ;; For subprocesses invoked via the shell
       ;; (e.g., "shell -c command")
       (setq shell-file-name explicit-shell-file-name)
       (set-default-font
        "-outline-Consolas-normal-r-normal-normal-12-97-96-96-c-*-iso8859-1")
       )
      (t
       (error "Not w32 system.!")))

       


      
      

