;; packages
(require 'package)
(add-to-list 'package-archives
    '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
(eval-when-compile
    (require 'use-package))
(require 'use-package)

;;helm
(unless (package-installed-p 'helm)
    (package-refresh-contents)
    (package-install 'helm))
(require 'helm)
(require 'helm-config)
(helm-mode 1)

;;esc not close frames and windows
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))

;;markdown-mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;theme
(unless (package-installed-p 'seti-theme)
    (package-refresh-contents)
    (package-install 'seti-theme))
(load-theme 'seti t)

;;fira font
(set-default-font "Fira Mono 12")

;;and nice cursor because it's not MS DOS
(setq-default cursor-type 'bar)
(set-cursor-color "#ffffff")
(blink-cursor-mode 0)

;;disable gui elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;;highlight two brackets
(show-paren-mode 1)

;;and enable line numbers
(global-linum-mode t)

;;this one is for fish shell
(unless (package-installed-p 'fish-mode)
    (package-refresh-contents)
    (package-install 'fish-mode))
(use-package fish-mode
    :mode "\\.fish\\'")

;; keybindings
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-;") 'helm-M-x)
(global-set-key (kbd "M-w") 'ibuffer)
(global-set-key (kbd "M-S-q") 'kill-buffer)
(global-set-key (kbd "M-o") 'helm-find-files)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-<home>") 'beginning-of-line)
(global-set-key (kbd "C-<end>") 'end-of-line)
(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)
;; windows controls
(global-set-key (kbd "M-,") 'split-window-horizontally)
(global-set-key (kbd "M-.") 'split-window-vertically)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-q") 'delete-window)

;;disable greeting
(setq inhibit-startup-screen t)

;; cua-mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands

;;nice scroll bar instead of ugly one
(unless (package-installed-p 'yascroll)
    (package-refresh-contents)
    (package-install 'yascroll))
(require 'yascroll)
(global-yascroll-bar-mode 1)

;;nerdtree like file browser.
(unless (package-installed-p 'neotree)
    (package-refresh-contents)
    (package-install 'neotree))
(require 'neotree)
(global-set-key (kbd "M-b") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'arrow 'arrow))

;;autocomplete
(unless (package-installed-p 'company)
    (package-refresh-contents)
    (package-install 'company))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

;;and nice snippets
(unless (package-installed-p 'yasnippet)
    (package-refresh-contents)
    (package-install 'yasnippet))
(require 'yasnippet)
(yas-global-mode 1)

;;use tabs instead of spaces
;; Turn on tabs
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)
;; Set the tab width
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)
;;clean tab not 4 spaces
(global-set-key (kbd "<backspace>") 'backward-delete-char)

;;el-get
(unless (package-installed-p 'el-get)
    (package-refresh-contents)
    (package-install 'el-get))
(require 'el-get)

;;org-wiki
(el-get-bundle org-wiki
  :url "https://raw.githubusercontent.com/caiorss/org-wiki/master/org-wiki.el"
  :description "Emacs' desktop wiki built with org-mode"
  :features org-wiki
  )
(require 'org-wiki)
(setq org-wiki-location "~/Dropbox/Org/Wiki")

;;automatic line folding
(setq word-wrap t)
(global-visual-line-mode t)

;;maGIT
(unless (package-installed-p 'magit)
    (package-refresh-contents)
    (package-install 'magit))
(require 'magit)

;;aliases
(defalias 'wiki 'org-wiki-index)
(defalias 'bookmarks 'helm-bookmark)
(defalias 'commit 'magit-commit)

;evil
(unless (package-installed-p 'evil)
    (package-refresh-contents)
    (package-install 'evil))
(require 'evil)
(evil-mode)
;keys
(define-key evil-normal-state-map (kbd "u") 'evil-visual-char)
(define-key evil-normal-state-map (kbd "b") 'helm-bookmarks)
(define-key evil-normal-state-map (kbd "S-/") 'comment-line)
(define-key evil-normal-state-map (kbd "a") 'mark-whole-buffer)
(define-key evil-normal-state-map (kbd "S-l") 'evil-delete-whole-line)
(define-key evil-normal-state-map (kbd "?") 'helm-occur)
(define-key evil-normal-state-map (kbd "/") 'helm-occur)
(define-key evil-normal-state-map (kbd "g") 'goto-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nil nil t)
 '(package-selected-packages
   (quote
	(evil yasnippet yascroll use-package tabbar seti-theme powerline octicons neotree monokai-theme material-theme markdown-mode magit helm fontawesome fish-mode elscreen el-get cyberpunk-theme company all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
