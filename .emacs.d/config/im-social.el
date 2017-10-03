;;; im-social.el --- social im

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps t)
(setq erc-log-insert-log-on-open nil)
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
			(local-set-key (kbd "C-o") #'erc-join-channel)))
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
;;; im-social.el ends here
