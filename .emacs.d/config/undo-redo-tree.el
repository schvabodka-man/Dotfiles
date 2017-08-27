(use-package undo-tree
  :ensure t
  :config (define-key undo-tree-map (kbd "C-/") nil)
  :bind (("C-S-z" . undo-tree-redo)))
