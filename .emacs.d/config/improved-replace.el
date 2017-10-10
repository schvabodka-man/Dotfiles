(use-package visual-regexp
  :ensure t
  :config (defalias 'multiple-cursors-mark 'vc/mc-mark)
  :bind (("C-r" . vr/query-replace)
		 ("C-S-r" . vr/replace)))
;; (use-package visual-regexp-steroids
;;   :ensure t
;;   :after visual-regexp)
