(use-package bfbuilder
  :ensure t
  :config
  (defalias 'brainfuck-mode 'bfbuilder-mode)
  (defalias 'brainfuck-debug 'bfbuilder-debug)
  (add-to-list 'auto-mode-alist '("\\.bf$" . bfbuilder-mode))
  (add-to-list 'auto-mode-alist '("\\.brainfuck$" . bfbuilder-mode))
  (define-key bfbuilder-mode-map (kbd "<f1>") 'bfbuilder-debug))
