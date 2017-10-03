;;google translate
(use-package google-translate
  :ensure t
  :init (require 'google-translate-smooth-ui)
  :config (defalias 'google-translate 'google-translate-smooth-translate))
