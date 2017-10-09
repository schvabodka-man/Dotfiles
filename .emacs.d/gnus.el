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

(add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
													 (nnimap-address "imap.gmail.com")  
													 (nnimap-server-port "imaps")
													 (nnimap-stream ssl)
													 (nnmail-expiry-target "nnimap+gmail:[Gmail]/All Mail")  
													 (nnmail-expiry-wait 'immediate)
													 (nnir-search-engine imap)))

(defun kill-gnus ()
  (interactive)
  (flet ((kill-buffer-ask (buffer) (kill-buffer buffer)))
	(kill-matching-buffers "*Group*")
	(kill-matching-buffers "*Article .+")
	(kill-matching-buffers "*Summary .+")))

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

(evil-set-initial-state 'gnus-article-mode 'normal)
(evil-set-initial-state 'gnus-group-mode 'normal)
(evil-set-initial-state 'gnus-summary-mode 'normal)

(evil-define-key 'normal gnus-article-mode-map (kbd "n") 'gnus-article-reply-with-original)
(evil-define-key 'normal gnus-article-mode-map (kbd "N") 'gnus-article-mail)
(evil-define-key 'normal gnus-article-mode-map (kbd "/") 'gnus-article-describe-briefly)
(evil-define-key 'normal gnus-article-mode-map (kbd "<C-RET>") 'gnus-article-show-summary)
(evil-define-key 'normal gnus-article-mode-map (kbd "<pageup>") 'gnus-article-prev-page)
(evil-define-key 'normal gnus-article-mode-map (kbd "C-q") 'kill-gnus)
(evil-define-key 'normal gnus-article-mode-map (kbd "<pagedown>") 'gnus-article-next-page)
(evil-define-key 'normal gnus-article-mode-map (kbd ",") 'gnus-article-prev-page)
(evil-define-key 'normal gnus-article-mode-map (kbd ".") 'gnus-article-next-page)

(evil-define-key 'normal gnus-group-mode-map (kbd "<C-left>") 'gnus-group-prev-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<C-left>") 'gnus-group-prev-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<C-right>") 'gnus-group-next-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<C-S-left>") 'gnus-group-prev-unread-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<C-S-right>") 'gnus-group-next-unread-group)
(evil-define-key 'normal gnus-group-mode-map (kbd ",") 'gnus-group-prev-group)
(evil-define-key 'normal gnus-group-mode-map (kbd ".") 'gnus-group-next-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<") 'gnus-group-prev-unread-group)
(evil-define-key 'normal gnus-group-mode-map (kbd ">") 'gnus-group-next-unread-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<up>") 'gnus-group-prev-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<down>") 'gnus-group-next-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<C-up>") 'gnus-group-prev-unread-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "<C-down>") 'gnus-group-next-unread-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "m") 'gnus-group-mark-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "n") 'gnus-group-mail)
(evil-define-key 'normal gnus-group-mode-map (kbd "C-r") 'gnus-group-restart)
(evil-define-key 'normal gnus-group-mode-map (kbd "C-q") 'kill-gnus)
(evil-define-key 'normal gnus-group-mode-map (kbd "F") 'gnus-group-make-nnir-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "u") 'gnus-group-unmark-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "M") 'gnus-group-mark-buffer)
(evil-define-key 'normal gnus-group-mode-map (kbd "U") 'gnus-group-unmark-all-groups)
(evil-define-key 'normal gnus-group-mode-map (kbd "r") 'gnus-group-mark-regexp)
(evil-define-key 'normal gnus-group-mode-map (kbd "<return>") 'gnus-group-read-group)
(evil-define-key 'normal gnus-group-mode-map (kbd "SPC") nil)

(evil-define-key 'normal gnus-summary-mode-map (kbd "C-q") 'kill-gnus)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<C-left>") 'gnus-summary-prev-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<C-right>") 'gnus-summary-next-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<C-S-left>") 'gnus-summary-prev-unread-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<C-S-right>") 'gnus-summary-next-unread-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<up>") 'gnus-summary-prev-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<down>") 'gnus-summary-next-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<C-up>") 'gnus-summary-prev-unread-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<C-down>") 'gnus-summary-next-unread-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd ",") 'gnus-summary-prev-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd ".") 'gnus-summary-next-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<") 'gnus-summary-prev-unread-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd ">") 'gnus-summary-next-unread-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "N") 'gnus-summary-reply)
(evil-define-key 'normal gnus-summary-mode-map (kbd "n") 'gnus-summary-mail-other-window)
(evil-define-key 'normal gnus-summary-mode-map (kbd "C-r") 'gnus-summary-rescan-group)
(evil-define-key 'normal gnus-summary-mode-map (kbd "r") 'gnus-summary-put-mark-as-read-next)
(evil-define-key 'normal gnus-summary-mode-map (kbd "u") 'gnus-summary-put-mark-as-unread-next)
(evil-define-key 'normal gnus-summary-mode-map (kbd "e") 'gnus-summary-put-mark-as-expirable-next)
(evil-define-key 'normal gnus-summary-mode-map (kbd "C-e") 'gnus-summary-expire-articles-now)
(evil-define-key 'normal gnus-summary-mode-map (kbd "R") 'gnus-summary-catchup)
(evil-define-key 'normal gnus-summary-mode-map (kbd "F") 'gnus-summary-make-nnir-group)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<pageup>") 'gnus-summary-scroll-up)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<pagedown>") 'gnus-summary-scroll-down)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<home>") 'gnus-summary-beginning-of-article)
(evil-define-key 'normal gnus-summary-mode-map (kbd "<end>") 'gnus-summary-end-of-article)

(evil-define-key 'normal message-mode-map (kbd "i") 'mml-attach-file)
(evil-define-key 'normal message-mode-map (kbd "C-q") 'message-dont-send)

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

(defalias 'mail-mark-read 'gnus-summary-put-mark-as-read-next)
(defalias 'email-mark-read 'gnus-summary-put-mark-as-read-next)
(defalias 'gnus-mark-read 'gnus-summary-put-mark-as-read-next)
(defalias 'mail-mark-read 'gnus-summary-put-mark-as-unread-next)
(defalias 'email-mark-read 'gnus-summary-put-mark-as-unread-next)
(defalias 'gnus-mark-unread 'gnus-summary-put-mark-as-unread-next)
(defalias 'email-mark-all-read 'gnus-summary-catchup)
(defalias 'mail-mark-all-read 'gnus-summary-catchup)
(defalias 'gnus-mark-all-read 'gnus-summary-catchup)

(defalias 'mail-mark-archive 'gnus-summary-put-mark-as-expirable-next)
(defalias 'email-mark-archive 'gnus-summary-put-mark-as-expirable-next)
(defalias 'gnus-mark-archive 'gnus-summary-put-mark-as-expirable-next)

(defalias 'mail-archive 'gnus-summary-expire-articles-now)
(defalias 'email-archive 'gnus-summary-expire-articles-now)
(defalias 'gnus-archive 'gnus-summary-expire-articles-now)

(defalias 'mail-summary-refresh 'gnus-summary-rescan-group)
(defalias 'email-summary-refresh 'gnus-summary-rescan-group)
(defalias 'gnus-summary-refresh 'gnus-summary-rescan-group)
(defalias 'mail-group-refresh 'gnus-group-restart)
(defalias 'email-group-refresh 'gnus-group-restart)
(defalias 'gnus-group-refresh 'gnus-group-restart)
(defalias 'mail-summary-update 'gnus-summary-rescan-group)
(defalias 'email-summary-update 'gnus-summary-rescan-group)
(defalias 'gnus-summary-update 'gnus-summary-rescan-group)
(defalias 'mail-group-update 'gnus-group-restart)
(defalias 'email-group-update 'gnus-group-restart)
(defalias 'gnus-group-update 'gnus-group-restart)

(gnus-add-configuration
 '(article
   (horizontal 1.0
			   (vertical 25 (group 1.0))
			   (vertical 1.0
						 (summary 0.35 point)
						 (article 1.0)))))

(gnus-add-configuration
 '(summary
   (horizontal 1.0
			   (vertical 25 (group 1.0))
			   (vertical 1.0 (summary 1.0 point)))))
;;; gnus.el ends here
