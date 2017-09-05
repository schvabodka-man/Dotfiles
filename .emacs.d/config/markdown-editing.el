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
