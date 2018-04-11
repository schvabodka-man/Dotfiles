(use-package lua-mode
  :ensure t
  :config (define-key lua-mode-map (kbd "C-,") 'lua-backwards-to-block-begin-or-end)
  (define-key lua-mode-map (kbd "C-.") 'lua-forward-sexp))
;; (el-get-bundle lua2-mode
;;   :url "http://www.enyo.de/fw/software/lua-emacs/lua2-mode.el")
;; (load "~/.emacs.d/el-get/lua2-mode/lua2-mode")
;; (add-hook 'lua-mode-hook 'lua2-mode)
(use-package company-lua
  :ensure t
  :config (add-to-list 'company-backends 'company-lua))
