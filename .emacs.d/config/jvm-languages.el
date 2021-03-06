;;; jvm-languages --- JVM dev
;;; Commentary:
;;; Code:
(use-package cider
  :ensure t
  :pin melpa
  :config (setq nrepl-log-messages t)
  (setq nrepl-hide-special-buffers t)
  (setq cider-prefer-local-resources t)
  (setq cider-eval-result-prefix ";; --> ")
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion))
(use-package clj-refactor
  :ensure t
  :config (add-hook 'clojure-mode-hook (lambda ()
										 (clj-refactor-mode 1))))
(use-package clojure-snippets
  :ensure t)
(use-package autodisass-java-bytecode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.aj\\'" . java-mode))
(use-package java-snippets
  :ensure t)
(use-package kotlin-mode
  :ensure t
  :config (define-key kotlin-mode-map (kbd "<return>") 'newline-and-indent))
(use-package sbt-mode
  :ensure t
  :pin melpa)
(use-package scala-mode
  :ensure t
  :pin melpa)
(use-package groovy-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
  (define-key groovy-mode-map (kbd "<return>") 'newline-and-indent))

;; (use-package ensime
;;   :ensure t
;;   :pin melpa
;;   :config
;;   (setq
;;    ensime-sbt-command "/usr/bin/sbt"
;;    sbt:program-name "/usr/bin/sbt")
;;   (setq ensime-startup-notification nil)
;;   (setq ensime-startup-snapshot-notification nil)
;;   (defalias 'scala-import 'ensime-import-type-at-point)
;;   (defalias 'scala-clean-import 'ensime-refactor-diff-organize-imports)
;;   (defalias 'scala-organize-import 'ensime-refactor-diff-organize-imports)
;;   (defalias 'ensime-clean-import 'ensime-refactor-diff-organize-imports)
;;   (defalias 'ensime-organize-import 'ensime-refactor-diff-organize-imports)
;;   (defalias 'scala-repl 'ensime-inf-switch)
;;   (defalias 'ensime-repl 'ensime-inf-switch)
;;   (defalias 'scala-eval 'ensime-inf-eval-buffer)
;;   (defalias 'ensime-eval 'ensime-inf-eval-buffer)
;;   (defalias 'scala-eval-region 'ensime-inf-eval-region)
;;   (defalias 'ensime-eval-region 'ensime-inf-eval-region)
;;   (defalias 'ensime-jump-to-definition 'ensime-edit-definition)
;;   (defalias 'scala-jump-to-definition 'ensime-edit-definition)
;;   (defalias 'scala-undo-jump-to-definition 'ensime-pop-find-definition-stack)
;;   (defalias 'ensime-undo-jump-to-definition 'ensime-pop-find-definition-stack)
;;   (defalias 'scala-back-jump-to-definition 'ensime-pop-find-definition-stack)
;;   (defalias 'ensime-back-jump-to-definition 'ensime-pop-find-definition-stack)
;;   (defalias 'ensime-doc 'ensime-show-doc-for-symbol-at-point)
;;   (defalias 'ensime-documentation 'ensime-show-doc-for-symbol-at-point)
;;   (defalias 'scala-documentation 'ensime-show-doc-for-symbol-at-point)
;;   (defalias 'scala-doc 'ensime-show-doc-for-symbol-at-point)
;;   (add-hook 'java-mode-hook 'ensime-mode)
;;   (define-key ensime-mode-map (kbd "M-,") nil)
;;   (define-key ensime-mode-map (kbd "M-.") nil)
;;   (define-key ensime-mode-map (kbd "C-,") #'scala-syntax:backward-sexp)
;;   (define-key ensime-mode-map (kbd "C-.") #'scala-syntax:forward-sexp)
;;   (define-key ensime-mode-map (kbd "C-u") #'ensime-show-uses-of-symbol-at-point)
;;   (define-key ensime-mode-map (kbd "C-j") #'ensime-edit-definition)
;;   (define-key ensime-mode-map (kbd "C-S-j") #'ensime-pop-find-definition-stack)
;;   (define-key ensime-mode-map (kbd "M-r") #'ensime-refactor-diff-rename)
;;   (define-key ensime-mode-map (kbd "C-S-e") #'ensime-inf-eval-buffer)
;;   (define-key ensime-mode-map (kbd "C-d") #'ensime-show-doc-for-symbol-at-point)
;;   (define-key ensime-mode-map (kbd "C-e") #'ensime-inf-eval-region)
;;   (define-key ensime-mode-map (kbd "C-S-o") #'projectile-switch-project)
;;   (define-key ensime-mode-map (kbd "C-p") #'projectile-find-file)
;;   (define-key ensime-mode-map (kbd "<tab>") #'ensime-company-complete-or-indent)
;;   (define-key ensime-mode-map (kbd "M-i") #'ensime-import-type-at-point))
;; (use-package groovy-imports
;;   :ensure t
;;   :config (setq groovy-imports-find-block-function 'groovy-imports-find-place-sorted-block)
;;   (define-key groovy-mode-map (kbd "M-i") 'groovy-imports-add-import)
;;   (define-key groovy-mode-map (kbd "C-S-i") 'groovy-imports-add-import-dwim)
;;   (define-key groovy-mode-map (kbd "C-M-i") 'groovy-imports-scan-file)
;;   (setq groovy-imports-save-buffer-after-import-added nil)
;;   (add-hook 'groovy-mode-hook 'groovy-imports-scan-file))
;; (use-package inf-groovy
;;   :ensure t
;;   :config (add-hook 'groovy-mode-hook 'inferior-groovy-mode)
;;   (add-hook 'groovy-mode-hook 'inferior-groovy-mode)
;;   (define-key inferior-groovy-mode-map (kbd "<f1>") 'switch-to-groovy)
;;   (define-key inferior-groovy-mode-map (kbd "<C-f1>") 'run-groovy)
;;   (define-key inferior-groovy-mode-map (kbd "C-e") 'groovy-send-region)
;;   (define-key inferior-groovy-mode-map (kbd "C-S-e") 'groovy-send-region-and-go)
;;   (define-key inferior-groovy-mode-map (kbd "M-i") 'groovy-imports-add-import)
;;   (define-key inferior-groovy-mode-map (kbd "C-S-i") 'groovy-imports-add-import-dwim)
;;   (define-key inferior-groovy-mode-map (kbd "C-M-i") 'groovy-imports-scan-file)
;;   (defalias 'groovy-repl-run 'run-groovy)
;;   (defalias 'groovy-repl 'switch-to-groovy))
;; (use-package grails-mode
;;   :ensure t
;;   :config (add-hook 'groovy-mode-hook 'grails-mode))
;; (el-get-bundle maven-pom-mode
;;   :url "https://github.com/m0smith/maven-pom-mode.git")
;; (load "~/.emacs.d/el-get/maven-pom-mode/maven-pom-mode")
;; (define-key maven-pom-mode-map (kbd "M-i") #'maven-pom-add-dependency)
;; (define-key maven-pom-mode-map (kbd "C-S-i") #'maven-pom-insert-dependency-xml)
;; (define-key maven-pom-mode-map (kbd "C-c d") nil)
;; (use-package flycheck-kotlin
;;   :ensure t
;;   :config (flycheck-kotlin-setup))
;; (use-package gradle-mode
;;   :ensure t)
;; (use-package meghanada
;;   :ensure t
;;   :config
;;   (defun java ()
;;	(interactive)
;;	(meghanada-mode t)
;;	(meghanada-client-direct-connect))
;;   (setq meghanada-maven-path "/usr/bin/mvn")
;;   (defalias 'java-import 'meghanada-import-all)
;;   (defalias 'java-optimize-import 'meghanada-optimize-import)
;;   (defalias 'java-beautify 'meghanada-code-beautify)
;;   (defalias 'java-indent 'meghanada-code-beautify)
;;   (defalias 'java-jump 'meghanada-jump-declaration)
;;   (defalias 'java-jump-undo 'meghanada-back-jump)
;;   (defalias 'java-jump-back 'meghanada-back-jump)
;;   (defalias 'java-run 'meghanada-exec-main)
;;   (defalias 'java-exec 'meghanada-exec-main)
;;   (defalias 'java-run-junit-test-class 'meghanada-run-junit-class)
;;   (defalias 'java-exec-junit-test-class 'meghanada-run-junit-class)
;;   (defalias 'java-debug 'meghanada-debug-main)
;;   (defalias 'java-debug-junit-test-case 'meghanada-debug-junit-test-case)
;;   (add-hook 'java-mode-hook
;;			(lambda ()
;;			  (if (string-match "pong" (meghanada-ping))
;;				  (progn
;;					(meghanada-mode t)))))
;;   (add-hook 'meghanada-mode-hook
;;			(lambda ()
;;			  (local-set-key (kbd "C-j") #'meghanada-jump-declaration)
;;			  (local-set-key (kbd "C-b") #'meghanada-code-beautify)
;;			  (local-set-key (kbd "C-S-i") #'meghanada-optimize-import)
;;			  (local-set-key (kbd "M-i") #'meghanada-import-all)
;;			  (local-set-key (kbd "C-S-j") #'meghanada-back-jump)))
;;   (define-key meghanada-mode-map (kbd "M-,") nil)
;;   (define-key meghanada-mode-map (kbd "M-.") nil)
;; (defun run-meghanada-on-gradle ()
;;	(when (string= (file-name-extension buffer-file-name) "gradle")
;;	  (java)
;;	  (gradle-mode)))
;; (defun run-meghanada-on-maven ()
;;	(when (string= (file-name-base buffer-file-name) "pom")
;;	  (java)))
;; (add-hook 'nxml-mode-hook 'run-meghanada-on-maven)
;; (add-hook 'groovy-mode-hook 'run-meghanada-on-gradle)
;; (add-hook 'kill-emacs-hook 'meghanada-server-kill))
;; ;; (use-package android-mode
;; ;;   :ensure t
;; ;;   :config (add-hook 'java-mode-hook 'android-mode)
;; ;;   (add-hook 'scala-mode-hook 'android-mode))
;; (el-get-bundle jdibug
;;   :url "https://github.com/udalrich/jdibug.git")
;; (add-to-list 'load-path "~/.emacs.d/el-get/jdibug")
;; (require 'jdibug)
;; (require 'jdibug-ui)
;; (use-package eclim
;;   :ensure t
;;   :config (setq eclimd-autostart nil)
;;   (global-eclim-mode)
;;   (custom-set-variables
;;    '(eclim-eclipse-dirs '("~/bin/eclipse"))
;;    '(eclim-executable "~/bin/eclipse/eclim")))
;; (use-package company-emacs-eclim
;;   :ensure t
;;   :config (company-emacs-eclim-setup))
