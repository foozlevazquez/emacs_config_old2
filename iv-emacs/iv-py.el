;;
;; iv-py
;;
(autoload 'pylookup-lookup "pylookup")
(autoload 'pylookup-update "pylookup")
(setq pylookup-program "~/.emacs.d/vendors/pylookup/pylookup.py")
(setq pylookup-db-file "~/.emacs.d/vendors/pylookup/pylookup.db")
(global-set-key "\C-ch" 'pylookup-lookup)
