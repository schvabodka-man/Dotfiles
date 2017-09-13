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
  (defalias 'htop 'helm-top)
  (defalias 'htop-emacs 'helm-list-emacs-process)
  (defalias 'task-manager 'helm-top)
  (defalias 'task-manager-emacs 'helm-list-emacs-process)
  (defalias 'process-manager 'helm-top)
  (defalias 'process-manager-emacs 'helm-list-emacs-process)
  :bind (("M-x" . helm-M-x)
		 ("M-o" . helm-find-files)
		 ("M-c" . helm-colors)
		 ("C-M-w" . helm-buffers-list)
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
  (setq company-idle-delay 0)
  :bind ("<C-tab>" . company-complete))
;;snippets
(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1)
  :bind ("<C-S-tab>" . company-yasnippet)
  :config
  (defalias 'snippet 'yas-expand)
  (global-set-key (kbd "M-TAB") 'company-yasnippet)
  ;;i found this on the stackoverflow
  (defvar company-mode/enable-yas t
	"Enable yasnippet for all backends.")

  (defun company-mode/backend-with-yas (backend)
	(if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
		backend
	  (append (if (consp backend) backend (list backend))
			  '(:with company-yasnippet))))

  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
(use-package yatemplate
  :ensure t
  :config (auto-insert-mode)
  (setq auto-insert-alist nil)
  (yatemplate-fill-alist))
;;flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
