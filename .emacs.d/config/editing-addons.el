(use-package drag-stuff
  :ensure t
  :config (drag-stuff-global-mode 1)
  (define-key evil-normal-state-map (kbd "S-<up>") 'drag-stuff-up)
  (define-key evil-normal-state-map (kbd "S-<down>") 'drag-stuff-down)
  (define-key evil-normal-state-map (kbd "S-<left>") 'drag-stuff-left)
  (define-key evil-normal-state-map (kbd "S-<right>") 'drag-stuff-right))
(use-package dumb-jump
  :ensure t
  :config (defalias 'jump-to-definition 'dumb-jump-go)
  (defalias 'jump-definition 'dumb-jump-go)
  (defalias 'undo-jump-definition 'dumb-jump-back)
  (defalias 'undo-jump-to-definition 'dumb-jump-back)
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-aggressive nil)
  ;;(setq dumb-jump-use-visible-window nil)
  :config (define-key evil-normal-state-map (kbd "j") 'dumb-jump-go)
  (define-key evil-normal-state-map (kbd "J") 'dumb-jump-back))
(use-package avy
  :ensure t
  :config (define-key evil-normal-state-map (kbd "g") 'avy-goto-word-0))
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
