(use-package restclient
  :ensure t
  :config
  (add-hook 'restclient-mode-hook
			(lambda () (local-set-key (kbd "<M-f4>") #'restclient-http-send-current-stay-in-window)
			  (local-set-key (kbd "C-.") #'restclient-jump-next)
			  (local-set-key (kbd "C-,") #'restclient-jump-prev)))
  (defalias 'restclient 'restclient-mode)
  (defalias 'rest 'restclient-mode)
  (defalias 'restapi 'restclient-mode)
  (defalias 'restclient-curl 'restclient-copy-curl-command)
  (defalias 'rest-curl 'restclient-copy-curl-command)
  (defalias 'restapi-curl 'restclient-copy-curl-command))
;;using package without installing it
(use-package try
  :ensure t
  :config
  (defalias 'temporary-package 'try)
  (defalias 'temporary-install 'try)
  (defalias 'try-temporary 'try)
  (defalias 'try-install 'try)
  (defalias 'try-package 'try)
  (defalias 'package-temporary 'try)
  (defalias 'package-try 'try)
  (defalias 'install-temporary 'try)
  (defalias 'install-try 'try))
;;speedbar
(use-package sr-speedbar
  :ensure t
  :config 
  (defalias 'bar 'sr-speedbar-toggle)
  (defalias 'panel 'sr-speedbar-toggle)
  (defalias 'bar-toggle 'sr-speedbar-toggle)
  (defalias 'panel-toggle 'sr-speedbar-toggle)
  :bind (("M-s" . sr-speedbar-toggle)))
;;links hinting
(use-package link-hint
  :ensure t
  :config (defalias 'link-open 'link-hint-open-link)
  (defalias 'link-copy 'link-hint-copy-link)
  :bind
  ("M-g" . link-hint-open-link)
  ("M-S-g" . link-hint-copy-link))
(use-package minimap
  :ensure t
  :config
  (global-set-key (kbd "M-m") 'minimap-mode))
;;it must be by default in emacs
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-<down>") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-S-<up>") 'mc/mark-previous-like-this)
  (add-hook' after-init-hook 'bm-repository-load)
  (add-hook 'find-file-hooks 'bm-buffer-restore)
  (add-hook 'kill-emacs-hook #'(lambda nil
								 (bm-buffer-save-all)
								 (bm-repository-save)))
  (add-hook 'after-save-hook #'bm-buffer-save)
  (add-hook 'find-file-hooks   #'bm-buffer-restore)
  (add-hook 'after-revert-hook #'bm-buffer-restore))
;;local bookmarks for buffer
(use-package bm
  :ensure t
  :config (setq-default bm-buffer-persistence t)
  (setq bm-repository-file "~/.emacs.d/local-bookmarks")
  :bind ("C-S-b" . bm-toggle))
(use-package helm-bm
  :ensure t
  :config (defalias 'local-bookmarks 'helm-bm)
  :bind ("C-M-b" . helm-bm))
;;whitespaces problems
(use-package whitespace-cleanup-mode
  :ensure t
  :config (global-whitespace-cleanup-mode t))
