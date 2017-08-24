(use-package  simple-httpd
  :ensure t)
(use-package impatient-mode
  :ensure t
  :after simple-httpd
  :config (add-hook 'web-mode-hook 'impatient-mode)
  (add-hook 'html-mode-hook 'impatient-mode))
(use-package emmet-mode
  :ensure t
  :config
  (defalias 'emmet 'emmet-expand-yas)
  (global-set-key (kbd "M-e") 'emmet-expand-yas))
