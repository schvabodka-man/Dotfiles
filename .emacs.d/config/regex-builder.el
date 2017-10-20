;;; regex-builder.el --- like regex101 but in emacs

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(setq reb-re-syntax 'string)
(defalias 'regex101-offline 're-builder)
(defalias 'regexp101-offline 're-builder)
(defalias 'regex-test 're-builder)
(defalias 'regexp-test 're-builder)
(defalias 're-test 're-builder)
(add-hook 'reb-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-S-c") 'reb-copy)
			(local-set-key (kbd "C-c C-w") nil)
			(local-set-key (kbd "C-y") 'reb-copy)))
;;; regex-builder.el ends here
