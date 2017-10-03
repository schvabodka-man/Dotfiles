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
			(local-set-key (kbd "<return>") #'dired-find-file)
			(local-set-key (kbd "<mouse-1>") #'dired-find-file)
			(local-set-key (kbd "C-M-r") #'dired-do-rename-regexp)
			(local-set-key (kbd "C-S-v") #'dired-do-rename)
			(local-set-key (kbd "C-p") #'dired-do-print)
			(local-set-key (kbd "C-i") #'image-dired)
			(local-set-key (kbd "C-u") #'dired-unmark)
			(local-set-key (kbd "C-S-u") #'dired-unmark-all-marks)
			(local-set-key (kbd "C-m") #'dired-mark)
			(local-set-key (kbd "C-v") #'dired-do-rename)
			(local-set-key (kbd "C-S-f") #'dired-do-find-regexp)
			(local-set-key (kbd "C-S-u") #'dired-unmark-all-files)
			(local-set-key (kbd "M-`") #'shell-instead-dired)
			(local-set-key (kbd "C-~") #'dired-do-shell-command)
			(local-set-key (kbd "C-`") #'dired-do-async-shell-command)
			(local-set-key (kbd "C-s") #'dired-do-compress)
			(local-set-key (kbd "C-b") #'diredp-do-bookmark)

			(local-set-key (kbd "M-p") #'counsel-projectile-switch-project)))

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
;;git
(use-package dired-k
  :ensure t
  :config (add-hook 'dired-initial-position-hook 'dired-k)
  (add-hook 'dired-after-readin-hook #'dired-k-no-revert))
;;one buffer per dired
(el-get-bundle joseph-single-dired
  :url "https://www.emacswiki.org/emacs/download/joseph-single-dired.el")
(eval-after-load 'dired '(progn (require 'joseph-single-dired)))
;;nice highlight
;; (use-package dired-rainbow
;;   :ensure t)
;;image viewer
;; (use-package picpocket
;;   :ensure t
;;   :config
;;   (setq auto-mode-alist
;;		(cl-loop for (regexp . mode) in auto-mode-alist
;;				 if (eq mode 'image-mode)
;;				 collect (cons regexp #'picpocket)
;;				 else
;;				 collect (cons regexp mode)))
;;   (add-hook 'picpocket-mode-hook
;;			(lambda ()
;;			  (local-set-key (kbd "<SPC>") nil)
;;			  (local-set-key (kbd "<backspace>") nil)
;;			  (local-set-key (kbd "A") nil)
;;			  (local-set-key (kbd "B") nil)
;;			  (local-set-key (kbd "C") nil)
;;			  (local-set-key (kbd "D") nil)
;;			  (local-set-key (kbd "E") nil)
;;			  (local-set-key (kbd "F") nil)
;;			  (local-set-key (kbd "G") nil)
;;			  (local-set-key (kbd "H") nil)
;;			  (local-set-key (kbd "I") nil)
;;			  (local-set-key (kbd "J") nil)
;;			  (local-set-key (kbd "K") nil)
;;			  (local-set-key (kbd "L") nil)
;;			  (local-set-key (kbd "M") nil)
;;			  (local-set-key (kbd "N") nil)
;;			  (local-set-key (kbd "O") nil)
;;			  (local-set-key (kbd "P") nil)
;;			  (local-set-key (kbd "Q") nil)
;;			  (local-set-key (kbd "R") nil)
;;			  (local-set-key (kbd "S") nil)
;;			  (local-set-key (kbd "T") nil)
;;			  (local-set-key (kbd "U") nil)
;;			  (local-set-key (kbd "V") nil)
;;			  (local-set-key (kbd "W") nil)
;;			  (local-set-key (kbd "X") nil)
;;			  (local-set-key (kbd "Y") nil)
;;			  (local-set-key (kbd "Z") nil)
;;			  (local-set-key (kbd "a") nil)
;;			  (local-set-key (kbd "b") nil)
;;			  (local-set-key (kbd "c") nil)
;;			  (local-set-key (kbd "d") nil)
;;			  (local-set-key (kbd "e") nil)
;;			  (local-set-key (kbd "f") nil)
;;			  (local-set-key (kbd "g") nil)
;;			  (local-set-key (kbd "h") nil)
;;			  (local-set-key (kbd "i") nil)
;;			  (local-set-key (kbd "j") nil)
;;			  (local-set-key (kbd "k") nil)
;;			  (local-set-key (kbd "l") nil)
;;			  (local-set-key (kbd "m") nil)
;;			  (local-set-key (kbd "n") nil)
;;			  (local-set-key (kbd "o") nil)
;;			  (local-set-key (kbd "p") nil)
;;			  (local-set-key (kbd "q") nil)
;;			  (local-set-key (kbd "r") nil)
;;			  (local-set-key (kbd "s") nil)
;;			  (local-set-key (kbd "t") nil)
;;			  (local-set-key (kbd "u") nil)
;;			  (local-set-key (kbd "v") nil)
;;			  (local-set-key (kbd "w") nil)
;;			  (local-set-key (kbd "x") nil)
;;			  (local-set-key (kbd "y") nil)
;;			  (local-set-key (kbd "z") nil)
;;			  (local-set-key (kbd "C-d") nil)

;;			  (local-set-key (kbd "C-k") #'picpocket-delete-file)
;;			  (local-set-key (kbd "<DEL>") #'picpocket-delete-file)
;;			  (local-set-key (kbd "<C-right>") #'picpocket-next)
;;			  (local-set-key (kbd "C-S-z") #'picpocket-undo)
;;			  (local-set-key (kbd "C-g") #'picpocket-jump)
;;			  (local-set-key (kbd "C-q") #'picpocket-quit)
;;			  (local-set-key (kbd "C-r") #'picpocket-rename)
;;			  (local-set-key (kbd "C-S-c") #'picpocket-copy)
;;			  (local-set-key (kbd "C-S-v") #'picpocket-move)
;;			  (local-set-key (kbd "<C-left>") #'picpocket-previous))))
(use-package async
  :ensure t)
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)
(el-get-bundle tumme
  :url "http://repo.or.cz/emacs.git/blob_plain/HEAD:/lisp/image-dired.el")
(load "~/.emacs.d/el-get/tumme/image-dired")
(add-hook 'dired-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-o") #'image-dired)
			(local-set-key (kbd "C-S-o") #'image-dired-display-thumbs)))
(add-hook 'image-mode-hook
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
			(local-set-key (kbd "<") nil)
			(local-set-key (kbd ">") nil)
			(local-set-key (kbd "<DEL>") nil)

			(local-set-key (kbd "<C-right>") #'image-next-file)
			(local-set-key (kbd "<up>") #'image-scroll-up)
			(local-set-key (kbd "<down>") #'image-scroll-down)
			(local-set-key (kbd "<C-left>") #'image-previous-file)
			(local-set-key (kbd "+") #'imagex-sticky-zoom-in)
			(local-set-key (kbd "-") #'imagex-sticky-zoom-out)
			(local-set-key (kbd "C-s") #'imagex-sticky-save-image)
			(local-set-key (kbd "*") #'imagex-sticky-maximize)
			(local-set-key (kbd ",") #'imagex-sticky-rotate-left)
			(local-set-key (kbd ".") #'imagex-sticky-rotate-right)
			(local-set-key (kbd "/") #'imagex-sticky-restore-original)))
(use-package image+
  :ensure t
  :config (eval-after-load 'image '(require 'image+))
  (eval-after-load 'image+ '(imagex-global-sticky-mode 1))
  (eval-after-load 'image+ '(imagex-auto-adjust-mode 1)))
;; (use-package sunrise-commander
;;   :ensure t)

(add-hook 'archive-mode-hook
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
			(local-set-key (kbd "C-n") nil)
			(local-set-key (kbd "C-p") nil)

			(local-set-key (kbd "C-m") #'archive-mark)
			(local-set-key (kbd "C-r") #'archive-rename-entry)
			(local-set-key (kbd "C-S-u") #'archive-unmark-all-files)
			(local-set-key (kbd "C-k") #'archive-flag-deleted)
			(local-set-key (kbd "C-M-z") #'archive-undo)
			(local-set-key (kbd "C-u") #'archive-unflag)
			(local-set-key (kbd "<delete>") #'dired-do-delete)
			(local-set-key (kbd "<C-delete>") #'archive-flag-deleted)))

(add-hook 'tar-mode-hook
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
			(local-set-key (kbd "C-n") nil)
			(local-set-key (kbd "C-p") nil)

			(local-set-key (kbd "C-S-c") #'tar-copy)
			(local-set-key (kbd "C-n") #'tar-new-entry)
			(local-set-key (kbd "C-r") #'tar-rename-entry)
			(local-set-key (kbd "C-u") #'tar-unflag)
			(local-set-key (kbd "C-S-u") #'tar-clear-modification-flags)
			(local-set-key (kbd "C-k") #'tar-flag-deleted)
			(local-set-key (kbd "C-s") #'tar-untar-buffer)
			(local-set-key (kbd "C-M-s") #'tar-expunge)
			(local-set-key (kbd "<delete>") #'tar-expunge)
			(local-set-key (kbd "<C-delete>") #'tar-flag-deleted)))
;; (use-package peep-dired
;;   :ensure t)
;;speedbar
;; (use-package neotree
;;   :ensure t
;;   :pin melpa-stable
;;   :config (define-key neotree-mode-map (kbd "C-n") #'neotree-create-node)
;;   (define-key neotree-mode-map (kbd "C-S-c") #'neotree-copy-node)
;;   (define-key neotree-mode-map (kbd "C-r") #'neotree-rename-node)
;;   (define-key neotree-mode-map (kbd "C-u") #'neotree-copy-filepath-to-yank-ring)
;;   (define-key neotree-mode-map (kbd "C-k") #'neotree-delete-node)
;;   (define-key neotree-mode-map (kbd "M-r") #'neotree-refresh)
;;   (define-key neotree-mode-map (kbd "C-f") #'neotree-find)
;;   (define-key neotree-mode-map (kbd "C-g") #'neotree-dir)
;;   (define-key neotree-mode-map (kbd "<return>") #'neotree-change-root)
;;   (define-key neotree-mode-map (kbd "<up>") #'neotree-previous-line)
;;   (define-key neotree-mode-map (kbd "<down>") #'neotree-next-line)
;;   (define-key neotree-mode-map (kbd "<delete>") #'neotree-delete-node)
;;   (define-key neotree-mode-map (kbd "C-q") #'neotree-hide)
;;   (define-key neotree-mode-map (kbd "C-h") #'neotree-hidden-file-toggle)
;;   (define-key neotree-mode-map (kbd "q") nil)
;;   (define-key neotree-mode-map (kbd "i") nil)
;;   (define-key neotree-mode-map (kbd "n") nil)
;;   (define-key neotree-mode-map (kbd "H") nil)
;;   (define-key neotree-mode-map (kbd "D") nil)
;;   (define-key neotree-mode-map (kbd "U") nil)
;;   (define-key neotree-mode-map (kbd "A") nil)
;;   (define-key neotree-mode-map (kbd "s") nil)
;;   (define-key neotree-mode-map (kbd "S") nil)
;;   (define-key neotree-mode-map (kbd "C-c C-c") nil)
;;   (define-key neotree-mode-map (kbd "C-c c") nil)
;;   :bind (("M-s" . neotree-toggle)))
(use-package dired-sidebar
  :ensure t
  :bind (("M-s" . dired-sidebar-toggle-with-current-directory))
  :config (add-hook 'dired-mode-hook
					(lambda ()
					  (local-set-key (kbd "M-s") #'dired-sidebar-toggle-sidebar))))
