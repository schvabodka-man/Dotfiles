(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
		 ("\\.md\\'" . markdown-mode)
		 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  :config (define-key markdown-mode-map (kbd "M-p") #'projectile-switch-project)
  (define-key gfm-mode-map (kbd "M-p") #'projectile-switch-project))
(el-get-bundle markdown-dnd-images
  :url "https://raw.githubusercontent.com/mooreryan/markdown-dnd-images/master/markdown-dnd-images.el"
  :description "markdown drag and drop")
(require 'markdown-dnd-images)
;;not markdown but who cares
(use-package adoc-mode
  :ensure t
  :config (defalias 'asciidoc-mode 'adoc-mode)
  (defalias 'asciidoc-calc 'adoc-calc)
  (defalias 'asciidoc-demote 'adoc-demote)
  (defalias 'asciidoc-promote 'adoc-promote)
  (defalias 'asciidoc-mode-menu 'adoc-mode-menu)
  (defalias 'asciidoc-demote-title 'adoc-demote-title)
  (defalias 'asciidoc-promote-tile 'adoc-promote-title)
  (defalias 'asciidoc-goto-ref-lable 'adoc-goto-ref-label)
  (defalias 'asciidoc-demote-title 'adoc-demote-title)
  (defalias 'asciidoc-adjust-title-del 'adoc-adjust-title-del)
  (defalias 'asciidoc-toggle-title-type 'adoc-toggle-title-type))
