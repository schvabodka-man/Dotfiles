(use-package drag-stuff
  :ensure t
  :config (drag-stuff-global-mode 1)
  :bind (("<C-up>" . drag-stuff-up)
		 ("<C-down>" . drag-stuff-down)
		 ("<C-M-left>" . drag-stuff-left)
		 ("<C-M-right>" . drag-stuff-right)))
(use-package dumb-jump
  :ensure t
  :config (defalias 'jump-to-definition 'dumb-jump-go)
  (defalias 'jump-definition 'dumb-jump-go)
  (defalias 'undo-jump-definition 'dumb-jump-back)
  (defalias 'undo-jump-to-definition 'dumb-jump-back)
  :bind (("C-j" . dumb-jump-go)
		 ("C-S-j" . dumb-jump-back)))
