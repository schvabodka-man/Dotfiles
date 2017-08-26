(use-package drag-stuff
  :ensure t
  :config (drag-stuff-global-mode 1)
  :bind (("<C-up>" . drag-stuff-up)
		 ("<C-down>" . drag-stuff-down)
		 ("<C-S-left>" . drag-stuff-left)
		 ("<C-S-right>" . drag-stuff-right)))
