;;
(cond ((eq window-system 'x)
       (cond ((> (x-display-pixel-width) 1280)
              (set-default-font "-misc-fixed-medium-r-normal--13-*-*"))
             (t 
              (set-default-font "-misc-fixed-medium-r-normal--13-*-*"))))
      (t
       (error "Not x window system")))