(use-package undo-tree
  :ensure t
  :config (define-key undo-tree-map (kbd "C-/") nil)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/Undo")))
  (define-key evil-normal-state-map (kbd "z") 'undo-tree-undo)
  (define-key evil-normal-state-map (kbd "Z") 'undo-tree-redo))
