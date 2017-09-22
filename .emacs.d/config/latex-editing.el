;;; latex-editing.el --- LaTeX

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package auctex
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init (setq TeX-auto-save t
			  TeX-parse-self t
			  TeX-save-query nil
			  TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook #'flyspell-mode)
  :config (add-hook 'LaTeX-mode-hook (lambda ()
									   (push
										'("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
										  :help "Run latexmk on file")
										TeX-command-list)))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
  (define-key 'TeX-mode-map (kbd "<M-f2>") #'TeX-command-run-all)
  (define-key 'LaTeX-mode-map (kbd "<M-f2>") #'TeX-command-run-all))
(use-package reftex
  :commands turn-on-reftex
  :init
  (setq reftex-plug-into-AUCTeX t)
  (add-hook 'LaTeX-mode-hook #'turn-on-reftex))
(use-package company-auctex
  :ensure t
  :config (company-auctex-init)
  (add-to-list 'company-backends 'company-auctex))
(use-package company-bibtex
  :ensure t
  :config (add-to-list 'company-backends 'company-bibtex))
(use-package latex-preview-pane
  :ensure t
  :config (define-key TeX-mode-map (kbd "<M-f1>") #'latex-preview-pane-mode)
  (define-key LaTeX-mode-map (kbd "<M-f1>") #'latex-preview-pane-mode)
  (define-key doc-view-mode-map (kbd "M-r") #'latex-preview-pane-update)
  (define-key doc-view-mode-map (kbd "M-p") #'projectile-switch-project))
(use-package company-math
  :ensure t
  :config (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-to-list 'company-backends 'company-math-symbols-latex)
  (add-to-list 'company-backends 'company-latex-commands))
(use-package magic-latex-buffer
  :ensure t
  :config (add-hook 'latex-mode-hook 'magic-latex-buffer)
  (add-hook 'tex-mode-hook 'magic-latex-buffer)
  (add-hook 'TeX-mode-hook 'magic-latex-buffer)
  (add-hook 'LaTeX-mode-hook 'magic-latex-buffer))
;;; latex-editing.el ends here
