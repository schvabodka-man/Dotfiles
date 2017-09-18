(use-package paradox
  :ensure t
  :config (paradox-enable))
;;using package without installing it
(use-package try
  :ensure t
  :config
  (defalias 'temporary-package 'try)
  (defalias 'temporary-install 'try)
  (defalias 'try-temporary 'try)
  (defalias 'try-install 'try)
  (defalias 'try-package 'try)
  (defalias 'package-temporary 'try)
  (defalias 'package-try 'try)
  (defalias 'install-temporary 'try)
  (defalias 'install-try 'try))
