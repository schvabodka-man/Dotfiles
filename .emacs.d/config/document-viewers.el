;;; document-viewers.el --- document viewing

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
;;linum is bad on performance in doc view
(add-hook 'doc-view-mode-hook
		  (lambda ()
			(nlinum-mode 0)
			(linum-mode 0)))
(use-package tablist
  :ensure t)
(use-package pdf-tools
  :ensure t
  :after tablist
  :config (my/bypass-confirmation-all #'pdf-tools-install)
  (add-hook 'pdf-view-mode-hook
			(lambda ()
			  (nlinum-mode 0)
			  (linum-mode 0)
			  (null-all-bindings)
			  (local-set-key (kbd "M->") nil)
			  (local-set-key (kbd "M-<") nil)))

  (define-key pdf-view-mode-map (kbd "C-f") #'pdf-occur)
  (define-key pdf-view-mode-map (kbd "C-S-f") #'pdf-links-isearch-link)
  (define-key pdf-view-mode-map (kbd "C-g") #'pdf-view-goto-page)
  (define-key pdf-view-mode-map (kbd "M-g") #'pdf-links-action-perform)
  (define-key pdf-view-mode-map (kbd "<home>") #'pdf-view-first-page)
  (define-key pdf-view-mode-map (kbd "<end>") #'pdf-view-last-page)
  (define-key pdf-view-mode-map (kbd "M-i") #'pdf-virtual-edit-mode)
  (define-key pdf-view-mode-map (kbd "<C-left>") #'pdf-view-previous-page-command)
  (define-key pdf-view-mode-map (kbd "<C-right>") #'pdf-view-next-page-command)
  (define-key pdf-view-mode-map (kbd "<C-S-left>") #'pdf-history-backward)
  (define-key pdf-view-mode-map (kbd "<C-S-right>") #'pdf-history-forward)
  (define-key pdf-view-mode-map (kbd "C-S-g") #'pdf-view-goto-label))
