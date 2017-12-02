(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(if (internet-up-p)
	(package-refresh-contents))
(use-package ivy
  :ensure t
  :pin melpa-stable
  :init (ivy-mode)
  (setq ivy-height 20)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-use-virtual-buffers t)
  :bind (("C-M-w" . ivy-switch-buffer))
  )
(use-package counsel
  :ensure t
  :after ivy
  :pin melpa-stable
  :bind (
		 ("M-x" . counsel-M-x)
		 ("C-o" . counsel-find-file)
		 ("C-b" . counsel-bookmark)
		 ("C-S-f" . counsel-grep)
		 ("C-h C-k" . counsel-descbinds)))
(use-package swiper
  :ensure t
  :pin melpa
  :after ivy
  :bind (("C-f" . counsel-grep-or-swiper)))
;;el-get
(use-package el-get
  :pin melpa
  :ensure t)
;;helm
;; (use-package helm
;;   :ensure t
;;   :pin melpa-stable
;;   :init (require 'helm-config)
;;   :config (defalias 'color 'helm-colors)
;;   (defalias 'htop 'helm-top)
;;   (defalias 'htop-emacs 'helm-list-emacs-process)
;;   (defalias 'task-manager 'helm-top)
;;   (defalias 'task-manager-emacs 'helm-list-emacs-process)
;;   (defalias 'process-manager 'helm-top)
;;   (defalias 'process-manager-emacs 'helm-list-emacs-process)
;;   (setq helm-exit-idle-delay 0)
;;   :bind (("M-x" . helm-M-x)
;;		 ("M-o" . helm-find-files)
;;		 ("M-c" . helm-colors)
;;		 ("M-b" . helm-bookmarks)
;;		 ("C-f" . helm-occur)))
;;some libs
(use-package dash
  :ensure t)
(use-package cl-lib
  :pin melpa-stable
  :ensure t)
(use-package popup
  :pin melpa-stable
  :ensure t)
;;autocomplete
(use-package company
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.2)
  (setq company-require-match nil)
  (delete 'company-dabbrev company-backends)
  (delete 'company-ispell company-backends)
  (delete '(company-dabbrev-code company-keywords) company-backends)
  :bind ("<tab>" . company-complete))
;;snippets
(use-package yasnippet
  :pin melpa-stable
  :ensure t
  :bind ("<C-tab>" . company-yasnippet)
  :init (yas-global-mode 1)
  :config
  (defalias 'snippet 'company-yasnippet)
  (defvar company-mode/enable-yas t
	"Enable yasnippet for all backends.")
  (defun company-mode/backend-with-yas (backend)
	(if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
		backend
	  (append (if (consp backend) backend (list backend))
			  '(:with company-yasnippet))))
  (add-hook 'after-init-hook
			(lambda ()
			  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))))
(use-package yatemplate
  :ensure t
  :config (auto-insert-mode)
  (setq auto-insert-alist nil)
  (yatemplate-fill-alist))
;;flycheck
(use-package flycheck
  :ensure t
  :pin melpa-stable
  :init (global-flycheck-mode))
(use-package flycheck-popup-tip
  :ensure t
  :after flycheck
  :pin melpa-stable
  :config (add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode))
(use-package hydra
  :ensure t
  :pin melpa-stable)
(use-package s
  :ensure t
  :pin melpa-stable)
(use-package async
  :ensure t
  ;; :pin melpa-stable
  )
