(use-package web-mode
  :ensure t
  :config
  (define-key web-mode-map (kbd "<return>") 'newline-and-indent)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode)))
(use-package  simple-httpd
  :ensure t
  :config (httpd-stop)
  (httpd-start))
(use-package impatient-mode
  :ensure t
  :after simple-httpd
  :config (add-hook 'web-mode-hook 'impatient-mode)
  (add-hook 'html-mode-hook 'impatient-mode))
(use-package emmet-mode
  :ensure t
  :config
  (defalias 'emmet 'emmet-expand-yas)
  (global-set-key (kbd "C-e") 'emmet-expand-yas))
(use-package company-web
  :ensure t
  :config
  (require 'company-web-html)
  (require 'company-web-jade)
  (require 'company-web-slim)
  (defun my-web-mode-hook ()
	(set (make-local-variable 'company-backends)
		 '(company-tern company-web-html company-yasnippet company-files)))
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  (defadvice company-tern (before web-mode-set-up-ac-sources activate)
	(if (equal major-mode 'web-mode)
		(let ((web-mode-cur-language
			   (web-mode-language-at-pos)))
		  (if (or (string= web-mode-cur-language "javascript")
				  (string= web-mode-cur-language "jsx")
				  )
			  (unless tern-mode (tern-mode))
			(if tern-mode (tern-mode -1)))))))
(use-package tidy
  :ensure t
  :config (with-eval-after-load 'flycheck
			(flycheck-add-mode 'html-tidy 'html-mode)
			(flycheck-add-mode 'html-tidy 'web-mode))
  (add-hook 'find-file-hook (lambda ()
							  (when (string= (file-name-extension buffer-file-name) "html")
								(flycheck-select-checker 'html-tidy)))))
(use-package flymake-css
  :ensure t
  :config (with-eval-after-load 'flycheck
			(flycheck-add-mode 'css-csslint 'css-mode)
			(flycheck-add-mode 'css-csslint 'web-mode))
  (add-hook 'find-file-hook (lambda ()
							  (when (string= (file-name-extension buffer-file-name) "css")
								(flycheck-select-checker 'css-csslint)))))
(use-package ac-html-csswatcher
  :ensure t
  :after company-web
  :config (company-web-csswatcher-setup))
