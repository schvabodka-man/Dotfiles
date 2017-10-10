(use-package vlf
  :ensure t
  :init (require 'vlf-setup)
  :config (add-hook 'vlf-mode-hook
					(lambda () (local-set-key (kbd "C-f") #'vlf-occur)
					  (local-set-key (kbd "C-g") #'vlf-goto-line)
					  (local-set-key (kbd "C-r") #'vlf-query-replace)
					  (local-set-key (kbd "<C-Home>") #'vlf-beginning-of-file)
					  (local-set-key (kbd "<C-End>") #'vlf-end-of-file)))
  (setq large-file-warning-threshold nil))
