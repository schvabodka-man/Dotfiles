(use-package rainbow-mode
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-mode)
  (add-hook 'text-mode-hook 'rainbow-mode))
(use-package rainbow-delimiters
  :ensure t
  :after rainbow-mode
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'text-mode-hook 'rainbow-delimiters-mode))
;;icons
(use-package all-the-icons
  :ensure t)
(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
(use-package spaceline
  :init (require 'spaceline-config)
  (spaceline-emacs-theme)
  (spaceline-toggle-minor-modes-off)
  :ensure t)
(el-get-bundle seti-theme
  :url "https://raw.githubusercontent.com/schvabodka-man/seti-theme/master/seti-theme.el"
  :description "Port of Atom theme")
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/seti-theme")
(load-theme 'seti t)
(use-package emojify
  :ensure t
  :config (add-hook 'emacs-startup-hook 'global-emojify-mode))
