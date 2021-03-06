(use-package restclient
  :ensure t
  :config
  (add-hook 'restclient-mode-hook
			(lambda () (local-set-key (kbd "<f1>") #'restclient-http-send-current-stay-in-window)
			  (local-set-key (kbd "C-e") #'restclient-http-send-current-stay-in-window)
			  (local-set-key (kbd "C-.") #'restclient-jump-next)
			  (local-set-key (kbd "C-,") #'restclient-jump-prev)))
  (defalias 'restclient 'restclient-mode)
  (defalias 'rest 'restclient-mode)
  (defalias 'restapi 'restclient-mode)
  (defalias 'restclient-curl 'restclient-copy-curl-command)
  (defalias 'rest-curl 'restclient-copy-curl-command)
  (defalias 'restapi-curl 'restclient-copy-curl-command))
;;links hinting
(use-package link-hint
  :ensure t
  :bind (("M-g" . link-hint-open-link)
		 ("M-S-g" . link-hint-copy-link)
		 ("<C-return>" . link-hint-open-link-at-point)))
(use-package multiple-cursors
  :ensure t
  :config
  (define-key mc/keymap (kbd "<return>") #'newline-and-indent)
  (define-key mc/keymap (kbd "<escape>") #'multiple-cursors-mode)
  (global-set-key (kbd "<C-S-down>") 'mc/mark-next-like-this)
  (global-set-key (kbd "<C-S-up>") 'mc/mark-previous-like-this)
  )
;; (use-package minimap
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-M-s") 'minimap-mode))
;;it must be by default in emacs
;;local bookmarks for buffer
;; (use-package bm
;;   :ensure t
;;   :config (setq-default bm-buffer-persistence t)
;;   (setq bm-repository-file "~/.emacs.d/local-bookmarks")
;;   (add-hook' after-init-hook 'bm-repository-load)
;;   (add-hook 'find-file-hooks 'bm-buffer-restore)
;;   (add-hook 'kill-emacs-hook #'(lambda nil
;;								 (bm-buffer-save-all)
;;								 (bm-repository-save)))
;;   (add-hook 'after-save-hook #'bm-buffer-save)
;;   (add-hook 'find-file-hooks   #'bm-buffer-restore)
;;   (add-hook 'after-revert-hook #'bm-buffer-restore)
;;   :bind ("C-S-b" . bm-toggle))
;; (use-package helm-bm
;;   :ensure t
;;   :config (defalias 'local-bookmarks 'helm-bm)
;;   :bind ("C-M-b" . helm-bm))
;;whitespaces problems
(use-package whitespace-cleanup-mode
  :ensure t
  :config (global-whitespace-cleanup-mode t))
(use-package tldr
  :ensure t
  :config
  (if (internet-up-p)
	  (tldr-update-docs)))
;; (use-package smooth-scrolling
;;   :ensure t
;;   :config (smooth-scrolling-mode 1))
