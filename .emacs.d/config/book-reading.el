(el-get-bundle calibre-mode
  :url "https://raw.githubusercontent.com/whacked/calibre-mode/master/calibre-mode.el"
  :description "Calibre library management"
  :features calibre-mode)
(require 'calibre-mode)
(setq sql-sqlite-program "/usr/bin/sqlite3")
(setq calibre-root-dir (expand-file-name "~/Books"))
(setq calibre-db (concat calibre-root-dir "/metadata.db"))
;; (use-package ereader
;;   :ensure t
;;   :config
;;   (define-key ereader-mode-map (kbd "g") nil)
;;   (define-key ereader-mode-map (kbd "C-g") 'ereader-goto-chapter)
;;   (define-key ereader-mode-map (kbd "C-S-g") 'ereader-follow-link))
(use-package nov
  :ensure t
  :pin melpa-stable
  :config (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  ;; (defun my-nov-font-setup ()
  ;;	(face-remap-add-relative 'variable-pitch :family "Fira Mono"
  ;;							 :height 1.2))
  ;; (add-hook 'nov-mode-hook 'my-nov-font-setup)
  (defalias 'nov-index 'nov-goto-toc)
  (defalias 'epub-index 'nov-goto-toc)
  (add-hook 'nov-mode-hook
			(lambda ()
			  (null-all-bindings)
			  (local-set-key (kbd "M-\\") #'nov-goto-toc)
			  (local-set-key (kbd ",") #'nov-previous-document)
			  (local-set-key (kbd ".") #'nov-next-document)))
  ;; (add-hook 'nov-mode-hook 'nlinum-mode)
  )
(defun fb2-mode()
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0)
  (longlines-mode)
  (view-mode))
(add-to-list 'auto-mode-alist '("\\.fb2$" . fb2-mode))
