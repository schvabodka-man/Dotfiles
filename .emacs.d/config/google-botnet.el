;;google translate
(use-package google-translate
  :ensure t
  :init (require 'google-translate-smooth-ui)
  :bind (("M-t" . google-translate-smooth-translate))
  :config (defalias 'google-translate 'google-translate-smooth-translate))
