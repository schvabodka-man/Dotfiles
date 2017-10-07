(use-package projectile
  :ensure t
  :config (projectile-global-mode)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (define-key evil-normal-state-map (kbd "C-r") 'counsel-projectile-find-file)
  (defalias 'project-add 'projectile-add-known-project))
(use-package counsel-projectile
  :ensure t
  :config (setq projectile-completion-system 'default)
  (define-key evil-normal-state-map (kbd "C-f") 'counsel-projectile-find-file)
  (define-key evil-normal-state-map (kbd "F") 'counsel-projectile-ag)
  (key-chord-define evil-normal-state-map (kbd "op") 'counsel-projectile-switch-project))
