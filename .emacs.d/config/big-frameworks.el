(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(if (internet-up-p)
	(package-refresh-contents))
(use-package ivy
  :ensure t
  :pin melpa
  :init (ivy-mode)
  (setq ivy-height 20)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-use-virtual-buffers t)
  :bind (("C-M-w" . ivy-switch-buffer))
  )
(use-package counsel
  :ensure t
  :after ivy
  :pin melpa
  :bind (
		 ("M-x" . counsel-M-x)
		 ("C-o" . counsel-find-file)
		 ("C-b" . counsel-bookmark)
		 ("C-f" . counsel-grep)
		 ("C-h C-k" . counsel-descbinds))
  :config (define-key counsel-find-file-map (kbd "<left>") 'counsel-up-directory)
  (define-key counsel-find-file-map (kbd "C-y") 'counsel-yank-directory)
  (define-key counsel-find-file-map (kbd "<right>") 'ivy-alt-done)
  (define-key counsel-find-file-map (kbd "<return>") 'ivy-alt-done))
(use-package swiper
  :ensure t
  :pin melpa
  :after ivy
  :bind (("C-M-f" . counsel-grep-or-swiper)))
;;el-get
(use-package el-get
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
  :pin melpa-stable
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
  :pin melpa
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
(use-package polymode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.md$" . poly-markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.Snw$" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rnw$" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rmd$" . poly-markdown+r-mode))
  (add-to-list 'auto-mode-alist '("\\.rapport$" . poly-rapport-mode))
  (add-to-list 'auto-mode-alist '("\\.Rhtml$" . poly-html+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rbrew$" . poly-brew+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rcpp$" . poly-r+c++-mode))
  (add-to-list 'auto-mode-alist '("\\.cppR$" . poly-c++r-mode))
  (add-to-list 'auto-mode-alist '("\\.js.erb$" . poly-javascript+erb-mode))
  (add-to-list 'auto-mode-alist '("\\.coffee.erb$" . poly-coffee+erb-mode))
  (add-to-list 'auto-mode-alist '("\\.html.erb$" . poly-html+erb-mode))
  (add-to-list 'auto-mode-alist '("\\.slim$" . poly-slim-mode)))
