(use-package malyon
  :ensure t
  :init
  :config
  (defalias 'z-machine 'malyon)
  (defalias 'z-machine-save 'malyon-save-file)
  (defalias 'z-machine-quit 'malyon-quit)
  (defalias 'z-machine-restore 'malyon-restore-file)
  (add-hook 'malyon-mode-hook
			(lambda ()
			  (local-set-key (kbd "C-s") #'malyon-save-file)
			  (local-set-key (kbd "C-o") #'malyon-restore-file)
			  (local-set-key (kbd "C-a") #'mark-whole-buffer)
			  (local-set-key (kbd "C-w") #'ivy-purpose-switch-buffer-with-some-purpose)
			  (local-set-key (kbd "<Home>") #'malyon-beginning-of-line)
			  (local-set-key (kbd "C-d") nil)
			  (local-set-key (kbd "M-d") nil)
			  (local-set-key (kbd "M-p") nil)
			  (local-set-key (kbd "M-n") nil)
			  (local-set-key (kbd "C-q") #'malyon-quit))))
