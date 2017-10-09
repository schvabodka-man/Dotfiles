(use-package yaml-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
  :config (add-hook 'yaml-mode-hook 'whitespace-mode)
  (evil-define-key 'normal yaml-mode-map (kbd "s") 'put-file-name-on-clipboard))
