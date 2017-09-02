(use-package restclient
  :ensure t
  :config
  (add-hook 'restclient-mode-hook
			(lambda () (local-set-key (kbd "<M-f1>") #'restclient-http-send-current-stay-in-window)
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
(use-package neotree
  :ensure t
  :pin melpa-stable
  :config (define-key neotree-mode-map (kbd "C-n") #'neotree-create-node)
  (define-key neotree-mode-map (kbd "C-S-c") #'neotree-copy-node)
  (define-key neotree-mode-map (kbd "C-r") #'neotree-rename-node)
  (define-key neotree-mode-map (kbd "C-u") #'neotree-copy-filepath-to-yank-ring)
  (define-key neotree-mode-map (kbd "C-k") #'neotree-delete-node)
  (define-key neotree-mode-map (kbd "M-r") #'neotree-refresh)
  (define-key neotree-mode-map (kbd "C-f") #'neotree-find)
  (define-key neotree-mode-map (kbd "C-g") #'neotree-dir)
  (define-key neotree-mode-map (kbd "<return>") #'neotree-change-root)
  (define-key neotree-mode-map (kbd "<up>") #'neotree-previous-line)
  (define-key neotree-mode-map (kbd "<down>") #'neotree-next-line)
  (define-key neotree-mode-map (kbd "<delete>") #'neotree-delete-node)
  (define-key neotree-mode-map (kbd "C-q") #'neotree-hide)
  (define-key neotree-mode-map (kbd "C-h") #'neotree-hidden-file-toggle)
  (define-key neotree-mode-map (kbd "q") nil)
  (define-key neotree-mode-map (kbd "i") nil)
  (define-key neotree-mode-map (kbd "n") nil)
  (define-key neotree-mode-map (kbd "H") nil)
  (define-key neotree-mode-map (kbd "D") nil)
  (define-key neotree-mode-map (kbd "U") nil)
  (define-key neotree-mode-map (kbd "A") nil)
  (define-key neotree-mode-map (kbd "s") nil)
  (define-key neotree-mode-map (kbd "S") nil)
  (define-key neotree-mode-map (kbd "C-c C-c") nil)
  (define-key neotree-mode-map (kbd "C-c c") nil)
  :bind (("M-s" . neotree-toggle)))
;;calibre
(el-get-bundle calibre-mode
  :url "https://raw.githubusercontent.com/whacked/calibre-mode/master/calibre-mode.el"
  :description "Great sidebar"
  :features calibre-mode)
(require 'calibre-mode)
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
  (global-set-key (kbd "C-S-<up>") 'mc/mark-previous-like-this))
;;local bookmarks for buffer
(use-package bm
  :ensure t
  :config (setq-default bm-buffer-persistence t)
  (setq bm-repository-file "~/.emacs.d/local-bookmarks")
  (add-hook' after-init-hook 'bm-repository-load)
  (add-hook 'find-file-hooks 'bm-buffer-restore)
  (add-hook 'kill-emacs-hook #'(lambda nil
								 (bm-buffer-save-all)
								 (bm-repository-save)))
  (add-hook 'after-save-hook #'bm-buffer-save)
  (add-hook 'find-file-hooks   #'bm-buffer-restore)
  (add-hook 'after-revert-hook #'bm-buffer-restore)
  :bind ("C-S-b" . bm-toggle))
(use-package helm-bm
  :ensure t
  :config (defalias 'local-bookmarks 'helm-bm)
  :bind ("C-M-b" . helm-bm))
;;whitespaces problems
(use-package whitespace-cleanup-mode
  :ensure t
  :config (global-whitespace-cleanup-mode t))
