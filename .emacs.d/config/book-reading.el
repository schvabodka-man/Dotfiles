(el-get-bundle calibre-mode
  :url "https://raw.githubusercontent.com/whacked/calibre-mode/master/calibre-mode.el"
  :description "Calibre library management"
  :features calibre-mode)
(require 'calibre-mode)
(setq sql-sqlite-program "/usr/bin/sqlite3")
(setq calibre-root-dir (expand-file-name "~/Books"))
(setq calibre-db (concat calibre-root-dir "/metadata.db"))
(use-package ereader
  :ensure t
  :config
  (define-key ereader-mode-map (kbd "g") nil)
  (define-key ereader-mode-map (kbd "C-M-g") 'ereader-goto-chapter)
  (define-key ereader-mode-map (kbd "<return>") 'ereader-follow-link)
  )
(defun fb2-mode()
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0)
  (longlines-mode)
  (view-mode))
(add-to-list 'auto-mode-alist '("\\.fb2$" . fb2-mode))
