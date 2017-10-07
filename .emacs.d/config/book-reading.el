(el-get-bundle calibre-mode
  :url "https://raw.githubusercontent.com/whacked/calibre-mode/master/calibre-mode.el"
  :description "Calibre library management"
  :features calibre-mode)
(require 'calibre-mode)
(setq sql-sqlite-program "/usr/bin/sqlite3")
(setq calibre-root-dir (expand-file-name "~/Dropbox/Books"))
(setq calibre-db (concat calibre-root-dir "/metadata.db"))
(use-package ereader
  :ensure t
  :config
  (define-key ereader-mode-map (kbd "g") nil)
  (evil-define-key 'normal ereader-mode-map (kbd "C-g") 'ereader-goto-chapter)
  (evil-define-key 'normal ereader-mode-map (kbd "G") 'ereader-follow-link))
(defun bread-mode()
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0)
  (longlines-mode)
  (view-mode))
(add-to-list 'auto-mode-alist '("\\.fb2$" . bread-mode))
