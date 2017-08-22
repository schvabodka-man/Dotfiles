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

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port 993)
               (nnimap-stream ssl)))

(setq gnus-thread-sort-functions
           '((not gnus-thread-sort-by-number)
             gnus-thread-sort-by-score))

(setq gnus-group-line-format "                                                 %(%G%) Unread:%N All: %t Read: %R\n")

;;; gnus.el ends here
