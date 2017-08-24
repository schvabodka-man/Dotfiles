(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(package-refresh-contents)
;;usable with some packages that don't use helm stuff
(use-package ivy
  :ensure t
  :init (ivy-mode))
;;el-get
(use-package el-get
  :ensure t)
;;helm
(use-package helm
  :ensure t
  :init (require 'helm-config)
  :config (defalias 'color 'helm-colors)
  :bind (("M-x" . helm-M-x)
		 ("M-o" . helm-find-files)
		 ("M-c" . helm-colors)
		 ("M-W" . helm-buffers-list)
		 ("M-b" . helm-bookmarks)
		 ("C-f" . helm-occur)))
;;git
(use-package magit
  :ensure t)
;;some libs
(use-package dash
  :ensure t)
(use-package cl-lib
  :ensure t)
;;(use-package magithub
;;  :after magit
;;  :config (magithub-feature-autoinject t))
;;autocomplete
(use-package company
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0))
;;snippets
(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1)
  :config
  (defalias 'snippet 'yas-expand)
  (global-set-key (kbd "M-TAB") 'yas-expand))
;;flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
