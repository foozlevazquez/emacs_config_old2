;;
(cond ((eq window-system 'x)
       (set-default-font "-misc-fixed-medium-r-normal--10-*-*"))
      (t
       (error "Not x window system")))