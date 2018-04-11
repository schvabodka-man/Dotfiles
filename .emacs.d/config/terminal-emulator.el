;;; terminal-emulator.el

;;; Copyright (C) 2018 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
;; (use-package eterm-256color
;;   :ensure t
;;   :config (add-hook 'term-mode-hook #'eterm-256color-mode))
;; (use-package multi-term
;;   :ensure t)
(setq explicit-shell-file-name "/usr/bin/fish")
;;http://joelmccracken.github.io/entries/switching-between-term-mode-and-line-mode-in-emacs-term/
;;(defun jnm/term-toggle-mode ()
;;  "Toggles term between line mode and char mode"
;;  (interactive)
;;  (if (term-in-line-mode)
;;	  (term-char-mode)
;;	(term-line-mode)))
;;(define-key term-mode-map (kbd "M-\\") 'jnm/term-toggle-mode)
;;(define-key term-raw-map (kbd "M-\\") 'jnm/term-toggle-mode)
;;http://echosa.github.io/blog/2012/06/06/improving-ansi-term/
;;(defadvice ansi-term (before force-bash)
;;; terminal-emulator.el ends here
