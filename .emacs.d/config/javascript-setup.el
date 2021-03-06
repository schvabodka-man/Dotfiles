(use-package js2-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode)))
(use-package js2-refactor
  :ensure t
  :after js2-mode
  :config (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (define-key js2-refactor-mode-map (kbd "<S-<f1>") 'js2r-rename-var)
  (define-key js2-refactor-mode-map (kbd "C-k") 'js2r-kill)  
  (defalias 'js-rename 'js2r-rename-var)
  (defalias 'js-log 'js2r-log-this)
  (defalias 'js-extract-function 'js2r-extract-function)
  (defalias 'js-extract-var 'js2r-extract-var)
  (defalias 'js-extract-method 'js2r-extract-method)
  (defalias 'js-expand 'js2r-expand-node-at-point)
  (defalias 'js-arguments-object 'js2r-arguments-to-object)

  (defalias 'javascript-rename 'js2r-rename-var)
  (defalias 'javascript-log 'js2r-log-this)
  (defalias 'javascript-extract-function 'js2r-extract-function)
  (defalias 'javascript-extract-var 'js2r-extract-var)
  (defalias 'javascript-extract-method 'js2r-extract-method)
  (defalias 'javascript-expand 'js2r-expand-node-at-point)
  (defalias 'javascript-arguments-object 'js2r-arguments-to-object))
;; (use-package indium
;;   :ensure t
;;   :config (add-hook 'js2-mode-hook #'indium-interaction-mode)
;;   (setq indium-update-script-on-save t)
;;   (define-key indium-interaction-mode-map (kbd "<M-f4>") 'indium-connect-to-chrome)
;;   (define-key indium-interaction-mode-map (kbd "<M-f1>") 'indium-add-breakpoint)
;;   (define-key indium-interaction-mode-map (kbd "<M-f2>") 'indium-remove-breakpoint)
;;   (define-key indium-interaction-mode-map (kbd "<M-S-f2>") 'indium-remove-all-breakpoints-from-buffer)
;;   (defalias 'js-chrome 'indium-connect-to-chrome)
;;   (defalias 'js-connect-chrome 'indium-connect-to-chrome)
;;   (defalias 'javascript-chrome 'indium-connect-to-chrome)
;;   (defalias 'javascript-connect-chrome 'indium-connect-to-chrome)
;;   (defalias 'js-add-breakpoint 'indium-add-breakpoint)
;;   (defalias 'js-remove-breakpoint 'indium-remove-breakpoint)
;;   (defalias 'js-delete-breakpoint 'indium-remove-breakpoint)
;;   (defalias 'javascript-add-breakpoint 'indium-add-breakpoint)
;;   (defalias 'javascript-remove-breakpoint 'indium-remove-breakpoint)
;;   (defalias 'javascript-delete-breakpoint 'indium-remove-breakpoint)
;;   (defalias 'js-remove-all-breakpoints 'indium-remove-all-breakpoints-from-buffer)
;;   (defalias 'javascript-remove-all-breakpoints 'indium-remove-all-breakpoints-from-buffer)
;;   (defalias 'js-breakpoints 'indium-list-breakpoints)
;;   (defalias 'javascript-breakpoints 'indium-list-breakpoints)
;;   (defalias 'javascript-scratch 'indium-scratch)
;;   (defalias 'js-scratch 'indium-scratch)
;;   (defalias 'js-repl 'indium-switch-to-repl-buffer)
;;   (defalias 'javascript-repl 'indium-switch-to-repl-buffer))
(use-package  json-mode
  :ensure t
  :config (define-key json-mode-map (kbd "<return>") 'newline-and-indent))
(use-package web-beautify
  :ensure t
  :config (define-key js2-mode-map (kbd "C-s") '(lambda () (interactive) (web-beautify-js)
												  (save-buffer)))
  (defun web-beautify-based-on-mode ()
	(interactive)
	(if (string-match ".html" (buffer-file-name))
		(progn
		  (web-beautify-html)))
	(if (string-match ".css" (buffer-file-name))
		(progn
		  (web-beautify-css))))
  (define-key web-mode-map (kbd "C-s") '(lambda () (interactive) (web-beautify-based-on-mode)
										  (save-buffer)))
  (define-key json-mode-map (kbd "C-s") '(lambda ()
										   (interactive)
										   (web-beautify-js)
										   (save-buffer))))

(use-package tern
  :ensure t)
(use-package company-tern
  :ensure t
  :config (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook 'tern-mode)
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil)
  (define-key tern-mode-keymap (kbd "C-d") #'tern-get-docs))
(use-package jquery-doc
  :ensure t
  :config (jquery-doc-fetch-and-generate-data)
  (add-to-list 'company-backends 'company-jquery)
  (define-key js2-mode-map (kbd "C-S-d") #'jquery-doc))
(use-package conkeror-minor-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist (cons (rx ".conkerorrc" eos) 'js2-mode))
  (add-hook 'js2-mode-hook (lambda ()
							 (when (string-match "conkeror" (buffer-file-name))
							   (conkeror-minor-mode 1)))))
