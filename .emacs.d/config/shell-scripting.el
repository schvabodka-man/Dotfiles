(use-package fish-mode
  :ensure t)
(use-package company-shell
  :ensure t
  :init (add-to-list 'company-backends '(company-shell company-shell-env company-fish-shell)))
