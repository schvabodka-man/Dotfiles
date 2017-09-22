(use-package undo-tree
  :ensure t
  :config (define-key undo-tree-map (kbd "C-/") nil)
  (setq undo-tree-history-directory-alist '(("." . "~/Dropbox/Emacs/Undo")))
  :bind (("C-S-z" . undo-tree-redo)))
