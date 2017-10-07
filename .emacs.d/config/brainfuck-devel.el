(use-package bfbuilder
  :ensure t
  :config
  (defalias 'brainfuck-mode 'bfbuilder-mode)
  (defalias 'brainfuck-debug 'bfbuilder-debug)
  (add-to-list 'auto-mode-alist '("\\.bf$" . bfbuilder-mode))
  (add-to-list 'auto-mode-alist '("\\.brainfuck$" . bfbuilder-mode))
  (evil-define-key 'normal conf-space-mode-map (kbd "<f1>") 'bfbuilder-debug))
