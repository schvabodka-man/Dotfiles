;;; im-social.el --- social im

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(erc-log-mode)
(setq erc-log-channels-directory "~/.emacs.d/erc-logs/")
(setq erc-save-buffer-on-part nil
	  erc-save-queries-on-quit nil
	  erc-log-write-after-send t
	  erc-log-write-after-insert t)
(setq erc-hide-timestamps t)
(setq erc-log-insert-log-on-open t)
(defun social ()
  "Connect to IM networks using bitlbee."
  (interactive)
  (erc :server "localhost" :port 6667 :nick "scvh"))
(defalias 'im 'social)
(defalias 'irc 'social)
(defalias 'chat 'social)
(defalias 'messenger 'social)
(add-hook 'erc-mode-hook
		  (lambda ()
			(local-set-key (kbd "M-r") #'erc-channel-names)
			(local-set-key (kbd "C-o") #'erc-cmd-QUERY)
			(local-set-key (kbd "C-S-o") #'erc-join-channel)
			(local-set-key (kbd "M-n") (lambda ()
										 (interactive)
										 (split-window-horizontally)
										 (other-window 1)))
			(local-set-key (kbd "M-N") (lambda ()
										 (interactive)
										 (split-window-vertically)
										 (other-window 1)))))
(use-package erc-image
  :ensure t
  :defer t
  :config (add-to-list 'erc-modules 'image)
  (erc-update-modules)
  (add-hook 'erc-mode-hook
			(lambda ()
			  (erc-image-mode 1))))
(use-package erc-view-log
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.erclogs/.*\\.log" . erc-view-log-mode)))
(use-package erc-hl-nicks
  :ensure t
  :config (add-hook 'erc-mode-hook
					(lambda ()
					  (erc-hl-nicks-mode 1))))
(use-package erc-yt
  :ensure t
  :config (add-to-list 'erc-modules 'youtube)
  (erc-update-modules)
  (add-hook 'erc-mode-hook
			(lambda ()
			  (erc-youtube-mode 1))))
(use-package ercn
  :ensure t
  :config (setq ercn-notify-rules
				'((current-nick . ("scvh"))
				  (keyword . all)
				  (pal . all)
				  (query-buffer . all)))
  (defun do-notify (nickname message)
	(notifications-notify
	 :title nickname
	 :body message
	 :timeout 1500
	 :app-name "ERC")
	)
  (add-hook 'ercn-notify-hook 'do-notify))
(defun bitlbee-identify ()
  (setq bitlbee-pass (shell-command-to-string "pass self-hosted/bitlbee/scvh"))
  (when (and (string= "localhost" erc-session-server)
			 (string= "&bitlbee" (buffer-name)))
	(erc-message "PRIVMSG" (concat "&bitlbee " "identify " "scvh " bitlbee-pass))
	(erc-message "PRIVMSG" (concat "&bitlbee " "yes"))))
(add-hook 'erc-join-hook 'bitlbee-identify)
;;; im-social.el ends here
