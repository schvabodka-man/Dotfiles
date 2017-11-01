;;; python.el --- python stuff

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
	  'no-indent
	nil))
(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

;; Enter key executes newline-and-indent
(defun set-newline-and-indent ()
  "Map the return key with `newline-and-indent'"
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'python-mode-hook 'set-newline-and-indent)
(use-package py-autopep8
  :ensure t
  :config (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))
(use-package yaml-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
  :config
  ;; (add-hook 'yaml-mode-hook 'whitespace-mode)
  (add-hook 'yaml-mode-hook 'set-newline-and-indent)
  (add-hook 'yaml-mode-hook (lambda () (electric-indent-local-mode -1))))
;;; python.el ends here
