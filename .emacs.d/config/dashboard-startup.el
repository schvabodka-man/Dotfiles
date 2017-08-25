(use-package page-break-lines
  :ensure t)
(use-package dashboard
  :ensure t
  :after page-break-lines
  :init (dashboard-setup-startup-hook)
  :config (setq dashboard-banner-logo-title "Welcome back!")
  (setq dashboard-items '((recents  . 8)
						  (bookmarks . 8)
						  (projects . 8)
						  (agenda . 8))))
;;remove bullshit and start dashboard
(defun acg-initial-buffer-choice ()
  (if (get-buffer "*scratch*")
	  (kill-buffer "*scratch*"))
  (get-buffer "*dashboard*"))

(setq initial-buffer-choice 'acg-initial-buffer-choice)
