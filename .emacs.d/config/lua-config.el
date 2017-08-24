(use-package lua-mode
  :ensure t)
(use-package company-lua
  :ensure t
  :config (add-to-list 'company-backends 'company-lua))
