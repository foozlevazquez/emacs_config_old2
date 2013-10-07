;;
(cond ((eq window-system 'x)
       (cond ((> (x-display-pixel-width) 1280)
              (set-default-font
               ;; "-misc-fixed-medium-r-normal--13-*-75-75-c-70-iso8859-13"
               ;; "-xos4-terminus-medium-r-normal--12-*-72-72-c-60-iso8859-13"

               "-xos4-terminus-medium-r-normal--12-*-72-72-c-60-iso8859-9"
               ;;"-xos4-Terminus-normal-normal-normal-*-14-*-*-*-c-80-iso10646-1"
               ;;"-B&H-LucidaTypewriter-normal-normal-normal-Sans-11-*-*-*-m-70-iso10646-1"
               ))
             (t
              (set-default-font "-xos4-Terminus-normal-normal-normal-*-12-*-*-*-c-60-iso10646-1")
              )))
      (t
       (error "Not x window system")))
