(use-package fish-mode
  :ensure t
  :config (define-key fish-mode-map (kbd "<return>") 'newline-and-indent))
(use-package company-shell
  :ensure t
  :init (add-to-list 'company-backends '(company-shell-env company-fish-shell)))
