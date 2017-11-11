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

			  (local-set-key (kbd "<") nil)
			  (local-set-key (kbd ">") nil)
			  (local-set-key (kbd "A") nil)
			  (local-set-key (kbd "B") nil)
			  (local-set-key (kbd "C") nil)
			  (local-set-key (kbd "D") nil)
			  (local-set-key (kbd "E") nil)
			  (local-set-key (kbd "F") nil)
			  (local-set-key (kbd "G") nil)
			  (local-set-key (kbd "H") nil)
			  (local-set-key (kbd "I") nil)
			  (local-set-key (kbd "J") nil)
			  (local-set-key (kbd "K") nil)
			  (local-set-key (kbd "L") nil)
			  (local-set-key (kbd "M") nil)
			  (local-set-key (kbd "N") nil)
			  (local-set-key (kbd "O") nil)
			  (local-set-key (kbd "P") nil)
			  (local-set-key (kbd "Q") nil)
			  (local-set-key (kbd "R") nil)
			  (local-set-key (kbd "S") nil)
			  (local-set-key (kbd "T") nil)
			  (local-set-key (kbd "U") nil)
			  (local-set-key (kbd "V") nil)
			  (local-set-key (kbd "W") nil)
			  (local-set-key (kbd "X") nil)
			  (local-set-key (kbd "Y") nil)
			  (local-set-key (kbd "Z") nil)
			  (local-set-key (kbd "a") nil)
			  (local-set-key (kbd "b") nil)
			  (local-set-key (kbd "c") nil)
			  (local-set-key (kbd "d") nil)
			  (local-set-key (kbd "e") nil)
			  (local-set-key (kbd "f") nil)
			  (local-set-key (kbd "g") nil)
			  (local-set-key (kbd "h") nil)
			  (local-set-key (kbd "i") nil)
			  (local-set-key (kbd "j") nil)
			  (local-set-key (kbd "k") nil)
			  (local-set-key (kbd "l") nil)
			  (local-set-key (kbd "m") nil)
			  (local-set-key (kbd "n") nil)
			  (local-set-key (kbd "o") nil)
			  (local-set-key (kbd "p") nil)
			  (local-set-key (kbd "q") nil)
			  (local-set-key (kbd "r") nil)
			  (local-set-key (kbd "s") nil)
			  (local-set-key (kbd "t") nil)
			  (local-set-key (kbd "u") nil)
			  (local-set-key (kbd "v") nil)
			  (local-set-key (kbd "w") nil)
			  (local-set-key (kbd "x") nil)
			  (local-set-key (kbd "y") nil)
			  (local-set-key (kbd "z") nil)
			  (local-set-key (kbd "M->") nil)
			  (local-set-key (kbd "M-<") nil)

			  (local-set-key (kbd "C-f") #'pdf-occur)
			  (local-set-key (kbd "C-S-f") #'pdf-links-isearch-link)
			  (local-set-key (kbd "C-g") #'pdf-view-goto-page)
			  (local-set-key (kbd "M-g") #'pdf-links-action-perform)
			  (local-set-key (kbd "<home>") #'pdf-view-first-page)
			  (local-set-key (kbd "<end>") #'pdf-view-last-page)
			  (local-set-key (kbd "M-i") #'pdf-virtual-edit-mode)
			  (local-set-key (kbd "<C-left>") #'pdf-view-previous-page-command)
			  (local-set-key (kbd "<C-right>") #'pdf-view-next-page-command)
			  (local-set-key (kbd "<C-S-left>") #'pdf-history-backward)
			  (local-set-key (kbd "<C-S-right>") #'pdf-history-forward)
			  (local-set-key (kbd "C-S-g") #'pdf-view-goto-label))))
;;; document-viewers.el ends here
