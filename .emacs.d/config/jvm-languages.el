;;; jvm-languages --- JVM dev
;;; Commentary:
;;; Code:
(use-package yasnippet-java-mode
  :ensure t)
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
  (defalias 'java-beautify 'meghanada-code-beautify)
  (defalias 'java-indent 'meghanada-code-beautify)
  (defalias 'java-jump 'meghanada-jump-declaration)
  (defalias 'java-jump-undo 'meghanada-back-jump)
  (defalias 'java-jump-back 'meghanada-back-jump)
  (defalias 'java-run 'meghanada-exec-main)
  (defalias 'java-exec 'meghanada-exec-main)
  (defalias 'java-run-junit-test-class 'meghanada-run-junit-class)
  (defalias 'java-exec-junit-test-class 'meghanada-run-junit-class)
  (defalias 'java-debug 'meghanada-debug-main)
  (defalias 'java-debug-junit-test-case 'meghanada-debug-junit-test-case)
  (add-hook 'java-mode-hook
			(lambda ()
			  (if (string-match "pong" (meghanada-ping))
				  (progn
					(meghanada-mode t)))))
  (add-hook 'meghanada-mode-hook
			(lambda ()
			  (local-set-key (kbd "C-j") #'meghanada-jump-declaration)
			  (local-set-key (kbd "C-b") #'meghanada-code-beautify)
			  (local-set-key (kbd "<M-f3>") #'meghanada-run-junit-test-case)
			  (local-set-key (kbd "<M-f4>") #'meghanada-debug-junit-test-case)
			  (local-set-key (kbd "<M-f1>") #'meghanada-exec-main)
			  (local-set-key (kbd "<M-f2>") #'meghanada-debug-main)
			  (local-set-key (kbd "C-S-j") #'meghanada-back-jump)))
  (define-key meghanada-mode-map (kbd "M-,") nil)
  (define-key meghanada-mode-map (kbd "M-.") nil)
  (defun run-meghanada-on-gradle ()
	(when (string= (file-name-extension buffer-file-name) "gradle")
	  (java)))
  (defun run-meghanada-on-maven ()
	(when (string= (file-name-base buffer-file-name) "pom")
	  (java)))
  (add-hook 'nxml-mode-hook 'run-meghanada-on-maven)
  (add-hook 'groovy-mode-hook 'run-meghanada-on-gradle)
  (add-hook 'kill-emacs-hook 'meghanada-server-kill))
(use-package ensime
  :ensure t
  :pin melpa
  :config
  (setq
   ensime-sbt-command "/usr/bin/sbt"
   sbt:program-name "/usr/bin/sbt")
  (setq ensime-startup-notification nil)
  (setq ensime-startup-snapshot-notification nil))
(use-package sbt-mode
  :ensure t
  :pin melpa)
(use-package scala-mode
  :ensure t
  :pin melpa)
