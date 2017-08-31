(use-package kotlin-mode
  :ensure t)
(use-package groovy-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode)))
(use-package grails-mode
  :ensure t
  :config (add-hook 'groovy-mode-hook 'grails-mode))
(use-package autodisass-java-bytecode
  :ensure t)
(use-package meghanada
  :ensure t
  :config
  (defun java ()
	(interactive)
	(meghanada-mode t)
	(meghanada-client-direct-connect))
  (defun java-import ()
	(interactive)
	(meghanada-import-all)
	(meghanada-optimize-import))
  (defalias 'java-jump 'meghanada-jump-declaration)
  (defalias 'java-jump-undo 'meghanada-back-jump)
  (defalias 'java-jump-back 'meghanada-back-jump)
  (add-hook 'java-mode-hook
			(lambda ()
			  (meghanada-mode t)
			  (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
			  (add-hook 'before-save-hook 'meghanada-optimize-import)))
  (add-hook 'meghanada-mode-hook
			(lambda ()
			  (local-set-key (kbd "C-j") #'meghanada-jump-declaration)
			  (local-set-key (kbd "C-S-j") #'meghanada-back-jump)))
  (define-key meghanada-mode-map (kbd "M-,") nil)
  (define-key meghanada-mode-map (kbd "M-.") nil)
  (defun run-meghanada-on-gradle ()
	(when (string= (file-name-extension buffer-file-name) "gradle")
	  (java)))
  (add-hook 'groovy-mode-hook 'run-meghanada-on-gradle)
  (add-hook 'kill-emacs-hook 'meghanada-server-kill))
(use-package ensime
  :ensure t
  :pin melpa
  :config
  (setq
   ensime-sbt-command "/usr/bin/sbt"
   sbt:program-name "/usr/bin/sbt"))
