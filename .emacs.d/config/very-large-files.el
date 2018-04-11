(use-package vlf
  :ensure t
  :init (require 'vlf-setup)
  :config (define-key vlf-mode-map (kbd "C-f") #'vlf-occur)
  (define-key vlf-mode-map (kbd "C-g") #'vlf-goto-line)
  (define-key vlf-mode-map (kbd "C-r") #'vlf-query-replace)
  (define-key vlf-mode-map (kbd "<C-Home>") #'vlf-beginning-of-file)
  (define-key vlf-mode-map (kbd "<C-End>") #'vlf-end-of-file)
  (setq large-file-warning-threshold nil))
