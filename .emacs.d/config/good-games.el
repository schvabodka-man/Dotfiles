(use-package malyon
  :ensure t
  :init
  :config
  (evil-set-initial-state 'malyon-mode 'emacs)
  (defalias 'z-machine 'malyon)
  (defalias 'z-machine-save 'malyon-save-file)
  (defalias 'z-machine-quit 'malyon-quit)
  (defalias 'z-machine-restore 'malyon-restore-file))
