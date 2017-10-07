(use-package visual-regexp
  :ensure t
  :config (defalias 'multiple-cursors-mark 'vc/mc-mark)
  (define-key evil-normal-state-map (kbd "r") 'vr/query-replace)
  (define-key evil-normal-state-map (kbd "R") 'vr/replace))
;; (use-package visual-regexp-steroids
;;   :ensure t
;;   :after visual-regexp)
