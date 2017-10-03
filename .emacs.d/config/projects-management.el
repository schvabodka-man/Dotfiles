(use-package projectile
  :ensure t
  :config (projectile-global-mode)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (global-set-key (kbd "C-M-r") 'projectile-replace-regexp)
  (defalias 'project-add 'projectile-add-known-project))
(use-package counsel-projectile
  :ensure t
  :bind (("M-p" . counsel-projectile-switch-project)
		 ("M-f" . counsel-projectile-find-file)
		 ("M-S-f" . counsel-projectile-find-dir)
		 ("C-M-f" . counsel-projectile-ag))
  :config (setq projectile-completion-system 'default))
