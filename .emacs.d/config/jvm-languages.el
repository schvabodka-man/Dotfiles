(use-package kotlin-mode
  :ensure t)
(use-package groovy-mode
  :ensure t)
(use-package grails-mode
  :ensure t
  :config (add-hook 'groovy-mode-hook 'grails-mode))
(use-package autodisass-java-bytecode
  :ensure t)
(use-package meghanada
  :ensure t
  :config (add-hook 'java-mode-hook
					(lambda ()
					  (meghanada-mode t)
					  (setq c-basic-offset 2)
					  (add-hook 'before-save-hook 'meghanada-code-beautify-before-save))))
(use-package ensime
  :ensure t
  :pin melpa
  :config
  (setq
   ensime-sbt-command "/usr/bin/sbt"
   sbt:program-name "/usr/bin/sbt"))
