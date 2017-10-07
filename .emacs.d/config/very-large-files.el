(use-package vlf
  :ensure t
  :init (require 'vlf-setup)
  :config
  (evil-define-key 'normal vlf-mode-map (kbd "f") 'vlf-occur)
  (evil-define-key 'normal vlf-mode-map (kbd "C-g") 'vlf-goto-line)
  (evil-define-key 'normal vlf-mode-map (kbd "r") 'vlf-query-replace)
  (evil-define-key 'normal vlf-mode-map (kbd "C-<Home>") 'vlf-beginning-of-file)
  (evil-define-key 'normal vlf-mode-map (kbd "C-<End>") 'vlf-end-of-file)
  (setq large-file-warning-threshold nil))
