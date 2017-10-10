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
;;indent
(use-package indent-guide
  :ensure t
  :init (indent-guide-global-mode))
