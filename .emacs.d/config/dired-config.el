(defun shell-instead-dired ()
  (interactive)
  (let ((dired-buffer (current-buffer)))
	(eshell (concat default-directory "-eshell"))
	(kill-buffer dired-buffer)
	(delete-other-windows)))

(global-set-key (kbd "M-d") 'dired)

(add-hook 'dired-mode-hook
		  (lambda ()
			(local-set-key (kbd "<") nil)
			(local-set-key (kbd ">") nil)
			(local-set-key (kbd "A") nil)
			(local-set-key (kbd "B") nil)
			(local-set-key (kbd "C") nil)
			(local-set-key (kbd "D") nil)
			(local-set-key (kbd "E") nil)
			(local-set-key (kbd "F") nil)
			(local-set-key (kbd "G") nil)
			(local-set-key (kbd "H") nil)
			(local-set-key (kbd "I") nil)
			(local-set-key (kbd "J") nil)
			(local-set-key (kbd "K") nil)
			(local-set-key (kbd "L") nil)
			(local-set-key (kbd "M") nil)
			(local-set-key (kbd "N") nil)
			(local-set-key (kbd "O") nil)
			(local-set-key (kbd "P") nil)
			(local-set-key (kbd "Q") nil)
			(local-set-key (kbd "R") nil)
			(local-set-key (kbd "S") nil)
			(local-set-key (kbd "T") nil)
			(local-set-key (kbd "U") nil)
			(local-set-key (kbd "V") nil)
			(local-set-key (kbd "W") nil)
			(local-set-key (kbd "X") nil)
			(local-set-key (kbd "Y") nil)
			(local-set-key (kbd "Z") nil)
			(local-set-key (kbd "a") nil)
			(local-set-key (kbd "b") nil)
			(local-set-key (kbd "c") nil)
			(local-set-key (kbd "d") nil)
			(local-set-key (kbd "e") nil)
			(local-set-key (kbd "f") nil)
			(local-set-key (kbd "g") nil)
			(local-set-key (kbd "h") nil)
			(local-set-key (kbd "i") nil)
			(local-set-key (kbd "j") nil)
			(local-set-key (kbd "k") nil)
			(local-set-key (kbd "l") nil)
			(local-set-key (kbd "m") nil)
			(local-set-key (kbd "n") nil)
			(local-set-key (kbd "o") nil)
			(local-set-key (kbd "p") nil)
			(local-set-key (kbd "q") nil)
			(local-set-key (kbd "r") nil)
			(local-set-key (kbd "s") nil)
			(local-set-key (kbd "t") nil)
			(local-set-key (kbd "u") nil)
			(local-set-key (kbd "v") nil)
			(local-set-key (kbd "w") nil)
			(local-set-key (kbd "x") nil)
			(local-set-key (kbd "y") nil)
			(local-set-key (kbd "z") nil)
			(local-set-key (kbd ":a") nil)
			(local-set-key (kbd ":b") nil)
			(local-set-key (kbd ":c") nil)
			(local-set-key (kbd ":d") nil)
			(local-set-key (kbd ":e") nil)
			(local-set-key (kbd ":f") nil)
			(local-set-key (kbd ":g") nil)
			(local-set-key (kbd ":h") nil)
			(local-set-key (kbd ":i") nil)
			(local-set-key (kbd ":j") nil)
			(local-set-key (kbd ":k") nil)
			(local-set-key (kbd ":l") nil)
			(local-set-key (kbd ":m") nil)
			(local-set-key (kbd ":n") nil)
			(local-set-key (kbd ":o") nil)
			(local-set-key (kbd ":p") nil)
			(local-set-key (kbd ":q") nil)
			(local-set-key (kbd ":r") nil)
			(local-set-key (kbd ":s") nil)
			(local-set-key (kbd ":t") nil)
			(local-set-key (kbd ":u") nil)
			(local-set-key (kbd ":v") nil)
			(local-set-key (kbd ":w") nil)
			(local-set-key (kbd ":x") nil)
			(local-set-key (kbd ":y") nil)
			(local-set-key (kbd ":z") nil)
			(local-set-key (kbd ":A") nil)
			(local-set-key (kbd ":B") nil)
			(local-set-key (kbd ":C") nil)
			(local-set-key (kbd ":D") nil)
			(local-set-key (kbd ":E") nil)
			(local-set-key (kbd ":F") nil)
			(local-set-key (kbd ":G") nil)
			(local-set-key (kbd ":H") nil)
			(local-set-key (kbd ":I") nil)
			(local-set-key (kbd ":J") nil)
			(local-set-key (kbd ":K") nil)
			(local-set-key (kbd ":L") nil)
			(local-set-key (kbd ":M") nil)
			(local-set-key (kbd ":N") nil)
			(local-set-key (kbd ":O") nil)
			(local-set-key (kbd ":P") nil)
			(local-set-key (kbd ":Q") nil)
			(local-set-key (kbd ":R") nil)
			(local-set-key (kbd ":S") nil)
			(local-set-key (kbd ":T") nil)
			(local-set-key (kbd ":U") nil)
			(local-set-key (kbd ":V") nil)
			(local-set-key (kbd ":W") nil)
			(local-set-key (kbd ":X") nil)
			(local-set-key (kbd ":Y") nil)
			(local-set-key (kbd ":Z") nil)
			(local-set-key (kbd "M-b") nil)
			(local-set-key (kbd "C-M") nil)
			(local-set-key (kbd "M-q") nil)
			(local-set-key (kbd "+") nil)
			(local-set-key (kbd "M-G") nil)

			(local-set-key (kbd "C-n") #'find-file)
			(local-set-key (kbd "C-S-n") #'dired-create-directory)
			(local-set-key (kbd "C-g") #'dired-goto-file)
			(local-set-key (kbd "C-S-g") #'dired-goto-subdir)
			(local-set-key (kbd "C-S-c") #'dired-do-copy)
			(local-set-key (kbd "<down>") #'dired-next-line)
			(local-set-key (kbd "<up>") #'dired-previous-line)
			(local-set-key (kbd "<delete>") #'dired-do-delete)
			(local-set-key (kbd "<C-delete>") #'dired-flag-file-deletion)
			(local-set-key (kbd "C-S-r") #'dired-do-find-regexp-and-replace)
			(local-set-key (kbd "C-r") #'dired-do-rename)
			(local-set-key (kbd "C-m") #'dired-mark)
			(local-set-key (kbd "<RET>") #'dired-find-file)
			(local-set-key (kbd "<mouse-1>") #'dired-find-file)
			(local-set-key (kbd "C-M-r") #'dired-do-rename-regexp)
			(local-set-key (kbd "C-v") #'dired-do-rename)
			(local-set-key (kbd "C-p") #'dired-do-print)
			(local-set-key (kbd "C-i") #'image-dired)
			(local-set-key (kbd "C-u") #'dired-unmark)
			(local-set-key (kbd "C-v") #'dired-do-rename)
			(local-set-key (kbd "M-z") #'dired-do-compress)
			(local-set-key (kbd "C-S-f") #'dired-do-find-regexp)
			(local-set-key (kbd "C-S-u") #'dired-unmark-all-files)
			(local-set-key (kbd "C-`") #'dired-do-shell-command)
			(local-set-key (kbd "M-`") #'shell-instead-dired)
			(local-set-key (kbd "C-b") #'diredp-do-bookmark)

			(local-set-key (kbd "M-p") #'helm-projectile)))

(setq delete-by-moving-to-trash t)

(defalias 'chmod 'dired-do-chmod)
(defalias 'chown 'dired-do-chown)
(defalias 'chowner 'dired-do-chown)
(defalias 'change-owner 'dired-do-chmod)
(defalias 'ch-owner 'dired-do-chmod)
(defalias 'chgrp 'dired-do-chgrp)
(defalias 'chgroup 'dired-do-chgrp)
(defalias 'change-grp 'dired-do-chgrp)
(defalias 'change-group 'dired-do-chgrp)
(defalias 'ch-grp 'dired-do-chgrp)
(defalias 'ch-group 'dired-do-chgrp)
(defalias 'zip 'dired-do-compress)
(defalias 'compress-file 'dired-do-compress)

;;dired additions
(use-package dired+
  :ensure t
  :config  (diredp-toggle-find-file-reuse-dir))
(use-package dired-filter
  :ensure t
  :config (add-hook 'dired-mode-hook
					(lambda ()
					  (local-set-key (kbd "M-f") #'dired-filter-load-saved-filters))))
(use-package dired-subtree
  :ensure t
  :config (add-hook 'dired-mode-hook
					(lambda ()
					  (local-set-key (kbd "<SPC>") #'dired-subtree-toggle))))
;;image viewer
(use-package picpocket
  :ensure t
  :config (add-hook 'image-mode-hook 'picpocket)
  (add-hook 'image-minor-mode-hook 'picpocket)
  (add-hook 'picpocket-mode-hook
			(lambda ()
			  (local-set-key (kbd "<SPC>") nil)
			  (local-set-key (kbd "<backspace>") nil)
			  (local-set-key (kbd "A") nil)
			  (local-set-key (kbd "B") nil)
			  (local-set-key (kbd "C") nil)
			  (local-set-key (kbd "D") nil)
			  (local-set-key (kbd "E") nil)
			  (local-set-key (kbd "F") nil)
			  (local-set-key (kbd "G") nil)
			  (local-set-key (kbd "H") nil)
			  (local-set-key (kbd "I") nil)
			  (local-set-key (kbd "J") nil)
			  (local-set-key (kbd "K") nil)
			  (local-set-key (kbd "L") nil)
			  (local-set-key (kbd "M") nil)
			  (local-set-key (kbd "N") nil)
			  (local-set-key (kbd "O") nil)
			  (local-set-key (kbd "P") nil)
			  (local-set-key (kbd "Q") nil)
			  (local-set-key (kbd "R") nil)
			  (local-set-key (kbd "S") nil)
			  (local-set-key (kbd "T") nil)
			  (local-set-key (kbd "U") nil)
			  (local-set-key (kbd "V") nil)
			  (local-set-key (kbd "W") nil)
			  (local-set-key (kbd "X") nil)
			  (local-set-key (kbd "Y") nil)
			  (local-set-key (kbd "Z") nil)
			  (local-set-key (kbd "A") nil)
			  (local-set-key (kbd "B") nil)
			  (local-set-key (kbd "C") nil)
			  (local-set-key (kbd "D") nil)
			  (local-set-key (kbd "E") nil)
			  (local-set-key (kbd "F") nil)
			  (local-set-key (kbd "G") nil)
			  (local-set-key (kbd "H") nil)
			  (local-set-key (kbd "I") nil)
			  (local-set-key (kbd "J") nil)
			  (local-set-key (kbd "K") nil)
			  (local-set-key (kbd "L") nil)
			  (local-set-key (kbd "M") nil)
			  (local-set-key (kbd "N") nil)
			  (local-set-key (kbd "O") nil)
			  (local-set-key (kbd "P") nil)
			  (local-set-key (kbd "Q") nil)
			  (local-set-key (kbd "R") nil)
			  (local-set-key (kbd "S") nil)
			  (local-set-key (kbd "T") nil)
			  (local-set-key (kbd "U") nil)
			  (local-set-key (kbd "V") nil)
			  (local-set-key (kbd "W") nil)
			  (local-set-key (kbd "X") nil)
			  (local-set-key (kbd "Y") nil)
			  (local-set-key (kbd "Z") nil)
			  (local-set-key (kbd "a") nil)
			  (local-set-key (kbd "b") nil)
			  (local-set-key (kbd "c") nil)
			  (local-set-key (kbd "d") nil)
			  (local-set-key (kbd "e") nil)
			  (local-set-key (kbd "f") nil)
			  (local-set-key (kbd "g") nil)
			  (local-set-key (kbd "h") nil)
			  (local-set-key (kbd "i") nil)
			  (local-set-key (kbd "j") nil)
			  (local-set-key (kbd "k") nil)
			  (local-set-key (kbd "l") nil)
			  (local-set-key (kbd "m") nil)
			  (local-set-key (kbd "n") nil)
			  (local-set-key (kbd "o") nil)
			  (local-set-key (kbd "p") nil)
			  (local-set-key (kbd "q") nil)
			  (local-set-key (kbd "r") nil)
			  (local-set-key (kbd "s") nil)
			  (local-set-key (kbd "t") nil)
			  (local-set-key (kbd "u") nil)
			  (local-set-key (kbd "v") nil)
			  (local-set-key (kbd "w") nil)
			  (local-set-key (kbd "x") nil)
			  (local-set-key (kbd "y") nil)
			  (local-set-key (kbd "z") nil)
			  (local-set-key (kbd "C-d") nil)

			  (local-set-key (kbd "C-k") #'picpocket-delete-file)
			  (local-set-key (kbd "<DEL>") #'picpocket-delete-file)
			  (local-set-key (kbd "<C-right>") #'picpocket-next)
			  (local-set-key (kbd "C-S-z") #'picpocket-undo)
			  (local-set-key (kbd "C-g") #'picpocket-jump)
			  (local-set-key (kbd "C-q") #'picpocket-quit)
			  (local-set-key (kbd "C-r") #'picpocket-rename)
			  (local-set-key (kbd "C-S-c") #'picpocket-copy)
			  (local-set-key (kbd "C-S-v") #'picpocket-move)
			  (local-set-key (kbd "<C-left>") #'picpocket-previous))))
