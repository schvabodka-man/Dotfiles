(use-package visual-regexp
  :ensure t)
(use-package visual-regexp-steroids
  :ensure t
  :after visual-regexp
  :config (defalias 'multiple-cursors-mark 'vc/mc-mark)
  :bind (("C-r" . vr/query-replace)
		 ("C-S-r" . vr/replace)))
