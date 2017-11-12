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
  (spaceline-toggle-version-control-on)
  :ensure t)
(el-get-bundle seti-theme
  :url "https://raw.githubusercontent.com/schvabodka-man/seti-theme/master/seti-theme.el"
  :description "Port of Atom theme")
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/seti-theme")
(load-theme 'seti t)
(use-package emojify
  :ensure t
  :config (add-hook 'emacs-startup-hook 'global-emojify-mode)
  (add-hook 'prog-mode-hook (lambda () (emojify-mode -1))))
(use-package all-the-icons-ivy
  :ensure t
  :config (all-the-icons-ivy-setup))
;; (use-package all-the-icons-gnus
;;   :ensure t
;;   :pin melpa-stable
;;   :config (all-the-icons-gnus-setup))
