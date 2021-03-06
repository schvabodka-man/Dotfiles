(use-package drag-stuff
  :ensure t
  :config (drag-stuff-global-mode 1)
  :bind (("<C-up>" . drag-stuff-up)
		 ("<C-down>" . drag-stuff-down)
		 ("<C-M-left>" . drag-stuff-left)
		 ("<C-M-right>" . drag-stuff-right)))
(use-package dumb-jump
  :ensure t
  :config (defalias 'jump-to-definition 'dumb-jump-go)
  (defalias 'jump-definition 'dumb-jump-go)
  (defalias 'undo-jump-definition 'dumb-jump-back)
  (defalias 'undo-jump-to-definition 'dumb-jump-back)
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-aggressive nil)
  ;;(setq dumb-jump-use-visible-window nil)
  :bind (("C-j" . dumb-jump-go)
		 ("C-S-j" . dumb-jump-back)))
(use-package avy
  :ensure t
  :bind (("C-g" . avy-goto-word-0)
		 ;; ("C-S-g" . avy-goto-line)
		 ))
(use-package highlight-parentheses
  :ensure t
  :config (global-highlight-parentheses-mode t))
;; (use-package centered-cursor-mode
;;   :ensure t
;;   :config (add-hook 'after-init-hook
;;					(lambda ()
;;					  (global-centered-cursor-mode t))))
(use-package nlinum
  :ensure t
  :config (global-nlinum-mode t))
