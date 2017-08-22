;;; gnus --- My gnus config
;;; Commentary:
;;; MUH GNUS
;;; Code:
(setq nnml-directory "~/Email")
(setq message-directory "~/Email")
(setq gnus-agent-synchronize-flags t)

(setq gnus-always-read-dribble-file t)
(setq gnus-dribble-directory "~/Email")
(setq gnus-home-directory "~/Email")

(setq gnus-asynchronous t)

(setq mail-source-directory "~/Email")

(setq message-auto-save-directory "~/Mail/drafts")
(setq smtpmail-debug-info t)

(setq user-mail-address "scvhapps@gmail.com"
	  user-full-name "P. Ivan")

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port 993)
               (nnimap-stream ssl)))

(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


(setq gnus-thread-sort-functions
	  '((not gnus-thread-sort-by-number)
		gnus-thread-sort-by-score))

(setq gnus-group-line-format "                                                 %(%G%) Unread:%N All: %t Read: %R\n")
(setq gnus-summary-line-format "%U%R%z%I%(%[%A: %f%]%) %s %D\n")

(cond (window-system
	   (setq custom-background-mode 'light)
	   (defface my-group-face-1
		 '((t (:foreground "Red" :bold nil))) "First group face")
	   (defface my-group-face-2
		 '((t (:foreground "SpringGreen" :bold nil)))
		 "Second group face")
	   (defface my-group-face-3
		 '((t (:foreground "Orange" :bold nil))) "Third group face")
	   (defface my-group-face-4
		 '((t (:foreground "Yellow" :bold nil))) "Fourth group face")
	   (defface my-group-face-5
		 '((t (:foreground "LawnGreen" :bold nil))) "Fifth group face")))

(setq gnus-group-highlight
	  '(((> unread 200) . my-group-face-1)
		((and (< level 3) (zerop unread)) . my-group-face-2)
		((< level 3) . my-group-face-3)
		((zerop unread) . my-group-face-4)
		(t . my-group-face-5)))

(setq gnus-article-mode-hook
      '(lambda ()
		 (local-set-key (kbd "C-S-n") #'gnus-article-reply-with-original)
		 (local-set-key (kbd "C-n") #'gnus-article-mail)
		 (local-set-key (kbd "C-/") #'gnus-article-describe-briefly)
		 (local-set-key (kbd "<M-RET>") #'gnus-article-show-summary)
		 (local-set-key (kbd "<pageup>") #'gnus-article-prev-page)
		 (local-set-key (kbd "<pagedown>") #'gnus-article-next-page)))

(setq gnus-group-mode-hook
      '(lambda ()
		 (local-set-key (kbd "<C-left>") #'gnus-group-prev-group)
		 (local-set-key (kbd "<C-right>") #'gnus-group-next-group)
		 (local-set-key (kbd "<C-S-left>") #'gnus-group-prev-unread-group)
		 (local-set-key (kbd "<C-S-right>") #'gnus-group-next-unread-group)
		 (local-set-key (kbd "C-m") #'gnus-group-mark-group)
		 (local-set-key (kbd "C-n") #'gnus-group-mail)
		 (local-set-key (kbd "C-S-m") #'gnus-group-unmark-group)
		 (local-set-key (kbd "C-M-m") #'gnus-group-mark-buffer)
		 (local-set-key (kbd "C-M-S-m") #'gnus-group-unmark-all-groups)
		 (local-set-key (kbd "C-r") #'gnus-group-mark-regexp)))

(setq gnus-summary-mode-hook 
      '(lambda ()
		 (local-set-key (kbd "<C-left>") #'gnus-summary-prev-article)
		 (local-set-key (kbd "<C-right>") #'gnus-summary-next-article)
		 (local-set-key (kbd "<C-S-left>") #'gnus-summary-prev-unread-article)
		 (local-set-key (kbd "<C-S-right>") #'gnus-summary-next-unread-article)
		 (local-set-key (kbd "C-S-n") #'gnus-summary-reply)
		 (local-set-key (kbd "C-n") #'gnus-summary-mail-other-window)
		 (local-set-key (kbd "C-r") #'gnus-summary-put-mark-as-read)
		 (local-set-key (kbd "C-u") #'gnus-summary-put-mark-as-unread)
		 (local-set-key (kbd "C-S-r") #'gnus-summary-catchup)
		 (local-set-key (kbd "<pageup>") #'gnus-summary-scroll-up)
		 (local-set-key (kbd "<pagedown>") #'gnus-summary-scroll-down)
		 (local-set-key (kbd "<home>") #'gnus-summary-beginning-of-article)
		 (local-set-key (kbd "<end>") #'gnus-summary-end-of-article)))

(add-hook 'message-mode-hook (lambda ()
							   (local-set-key (kbd "<M-RET>") #'message-send-and-exit)
							   (local-set-key (kbd "M-a") #'mml-attach-file)
							   (local-set-key (kbd "M-v") #'mml-attach-file)
							   (local-set-key (kbd "M-k") #'message-dont-send)))

(defalias 'send-email 'message-send-and-exit)
(defalias 'send-message 'message-send-and-exit)
(defalias 'attachment-email 'mml-attach-file)
(defalias 'add-attachment-email 'mml-attach-file)
(defalias 'attach-email 'mml-attach-file)
(defalias 'add-attach-email 'mml-attach-file)
(defalias 'file-email 'mml-attach-file)
(defalias 'add-file-email 'mml-attach-file)
(defalias 'attachment-mail 'mml-attach-file)
(defalias 'add-attachment-mail 'mml-attach-file)
(defalias 'attach-mail 'mml-attach-file)
(defalias 'add-attach-mail 'mml-attach-file)
(defalias 'file-mail 'mml-attach-file)
(defalias 'add-file-mail 'mml-attach-file)
(defalias 'attachment-message 'mml-attach-file)
(defalias 'add-attachment-message 'mml-attach-file)
(defalias 'attach-message 'mml-attach-file)
(defalias 'add-attach-message 'mml-attach-file)
(defalias 'file-message 'mml-attach-file)
(defalias 'add-file-message 'mml-attach-file)
(defalias 'cancel-email 'message-dont-send)
(defalias 'cancel-mail 'message-dont-send)
(defalias 'cancel-message 'message-dont-send)

;;; gnus.el ends here
