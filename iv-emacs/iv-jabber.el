;; Connect using jabber-connect

;; My username from the HipChat configuration
;; from https://www.hipchat.com/account/xmpp
(setq jabber-account-list '(("66000_460074@chat.hipchat.com")))

;; Token
;; ivan:   yebin3Moxe5xriKfuwGXJbcqhXZmMgNEI54JFybQ

;;
;; Username	66000_460074
;; Jabber ID	66000_460074@chat.hipchat.com
;; Room nickname	Ivan Vazquez
;; Connect host	chat.hipchat.com
;; Connect port	5222 (TLS) or 5223 (Legacy SSL)
;; Conference (MUC) domain	conf.hipchat.com
;; Rooms

;; HipChat name	XMPP/Jabber name
;; GitHub	 66000_github
;; Marketing	 66000_marketing
;; ServerPilot	 66000_serverpilot
;; Water Cooler	 66000_water_cooler

;; To join HipChat rooms easily
(defvar hipchat-number "66000")
(defvar hipchat-nickname "Ivan Vazquez")
(defun hipchat-join (room)
  (interactive "sRoom name: ")
  (jabber-groupchat-join
   (jabber-read-account)
   (concat hipchat-number "_" room "@conf.hipchat.com")
   hipchat-nickname
   t))

;; Mention nicknames in a way that HipChat clients will pickup
(defun hipchat-mention (nickname)
  (interactive
   (list (jabber-muc-read-nickname jabber-group "Nickname: ")))
  (insert (concat "@\"" nickname "\" ")))
