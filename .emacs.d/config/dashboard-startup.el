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
