(use-package projectile
  :ensure t
  :config (projectile-global-mode)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (global-set-key (kbd "C-M-r") 'projectile-replace-regexp)
  (defalias 'project-add 'projectile-add-known-project))
(use-package helm-projectile
  :ensure t
  :after projectile
  :config (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  (global-set-key (kbd "M-p") 'helm-projectile-switch-project)
  (global-set-key (kbd "M-f") 'helm-projectile-find-file)
  (global-set-key (kbd "M-S-f") 'helm-projectile-find-dir)
  (global-set-key (kbd "C-S-f") 'helm-projectile-grep))
