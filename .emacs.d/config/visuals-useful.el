(use-package highlight-thing
  :ensure t
  :init (global-highlight-thing-mode))
(defface hi-white
  '((((background dark)) (:background "#696969" :foreground "white"))
	(t (:background "#696969")))
  "Face for hi-lock mode."
  :group 'hi-lock-faces)
;;beacon for not losing cursor
(use-package beacon
  :ensure t
  :config (defalias 'cursor-blink 'beacon-blink)
  (defalias 'caret-blink 'beacon-blink)
  :bind (("<s-f1>" . beacon-blink)))
;; nice parenthesis
(use-package rainbow-mode
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-mode)
  (add-hook 'text-mode-hook 'rainbow-mode))
(use-package rainbow-delimiters
  :ensure t
  :after rainbow-mode
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'text-mode-hook 'rainbow-delimiters-mode))
;;indent
(use-package indent-guide
  :ensure t
  :config (indent-guide-global-mode))
;;better scrollbar
(use-package yascroll
  :ensure t
  :config (global-yascroll-bar-mode 1))
;;hiding mode line
(use-package hide-mode-line
  :ensure t)
