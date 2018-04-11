;;; clang.el

;;; Copyright (C) 2018 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary: c/cpp/objc development
;;; Code:
(use-package irony
  :ensure t
  :config (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
(use-package irony-eldoc
  :ensure t
  :config (add-hook 'irony-mode-hook #'irony-eldoc))
(use-package flycheck-irony
  :ensure t
  :config (eval-after-load 'flycheck
			'(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
(use-package company-irony
  :ensure t)
(use-package company-irony-c-headers
  :ensure t
  :after company-irony
  :config (eval-after-load 'company
			'(add-to-list
			  'company-backends '(company-irony-c-headers company-irony))))
;;; clang.el ends here
