;;; init --- My emacs config
;;; Commentary:
;;; MUH EMACS
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(package-refresh-contents)
;;usable with some packages that don't use helm stuff
(use-package ivy
  :ensure t
  :init (ivy-mode))
;;el-get
(use-package el-get
  :ensure t)
;;this is only for stuff like colors and org wiki
(use-package helm
  :ensure t
  :init (require 'helm-config))
;;Git
(use-package magit
  :ensure t)
;;autocomplete
(use-package company
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  	(setq company-dabbrev-downcase 0)
  	(setq company-idle-delay 0))
;;snippets
(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))
;;flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;keybindings
(global-set-key (kbd "<backspace>") 'backward-delete-char)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "M-;") 'execute-extended-command)
(global-set-key (kbd "M-w") 'helm-buffers-list)
(global-set-key (kbd "M-S-q") 'kill-buffer)
(global-set-key (kbd "M-o") 'helm-find-files)
(global-set-key (kbd "C-S-c") 'helm-colors)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-<home>") 'beginning-of-line)
(global-set-key (kbd "C-<end>") 'end-of-line)
(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-b") 'helm-bookmarks)
(global-set-key (kbd "C-g") 'goto-line)
(global-set-key (kbd "C-f") 'helm-occur)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "TAB") 'self-insert-command)
;; windows controls
(global-set-key (kbd "M-,") 'split-window-horizontally)
(global-set-key (kbd "M-.") 'split-window-vertically)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-q") 'delete-window)
(global-set-key (kbd "C-S-q") 'kill-this-buffer)
(define-key dired-mode-map "n" 'find-file)
(define-key dired-mode-map "N" 'dired-create-directory)
;;redone backspace and del
(global-set-key (kbd "C-<backspace>") 'ivy-backward-kill-word)

;;custom funcs and aliases
(defun indent-all ()
  (interactive)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-S-b") 'indent-all)

(defun put-file-name-on-clipboard ()
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
					  default-directory
					(buffer-file-name))))
	(when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
	  (message filename))))
(global-set-key (kbd "C-u") 'put-file-name-on-clipboard)

(global-set-key (kbd "C-l")
				(defun ctrl-l-line-select ()
				  (interactive)
				  (move-beginning-of-line nil)
				  (set-mark (point))
				  (activate-mark)
				  (move-end-of-line nil)))

(defun kill-other-buffers ()
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(global-set-key (kbd "C-S-M-q") 'kill-other-buffers)
;;fast aliases
(defalias 'commit 'magit-commit)
(defalias 'push 'magit-push)
(defalias 'pull 'magit-pull)
(defalias 'snippet 'yas-expand)



;;look and feel
(set-default-font "Fira Mono 12")
(setq-default cursor-type 'bar) 
(set-cursor-color "#ffffff") 
(blink-cursor-mode 0)
(menu-bar-mode -1)
(tool-bar-mode -1) 
(toggle-scroll-bar -1)
(show-paren-mode 1)
(global-linum-mode t)
(setq inhibit-startup-screen t)
(desktop-save-mode 1)
(setq word-wrap t)
(global-visual-line-mode t)
(electric-pair-mode)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")
;;org mode select with shift
(setq org-support-shift-select t)
;; killing messages buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
;;y or n
(fset 'yes-or-no-p 'y-or-n-p)
;;use tabs instead of spaces
;; Turn on tabs
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)
;; Set the tab width
(setq default-tab-width 4)
(setq tabwidth 4)
(setq c-basic-indent 4)
;;cua mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)

;;theming
(use-package seti-theme
  :ensure t
  :init (load-theme 'seti t))


;;minimap
(use-package minimap
  :ensure t
  :config
  (global-set-key (kbd "M-m") 'minimap-mode))
;;file tree
(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'arrow 'arrow))
  (global-set-key (kbd "M-b") 'neotree-toggle))
;;it must be by default in emacs
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-<down>") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-S-<up>") 'mc/mark-previous-like-this))
;;for editing fish scripts
(use-package fish-mode
  :ensure t)
;;for markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
;;diary
(use-package org-journal
  :ensure t
  :config
  	(setq org-journal-dir (expand-file-name "/home/user/Dropbox/Org/Wiki/Personal/Diary"))
	(setq org-journal-date-format '"%d-%m-%Y")
	(defalias 'now 'org-journal-new-entry))
;;nice org mode bullets
(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;;icons instead of mode name
;;(unless (package-installed-p 'mode-icons)
;;	(package-refresh-contents)
;;	(package-install 'mode-icons))
;;(require 'mode-icons)
;;(mode-icons-mode)
;;(setq mode-icons-change-mode-name nil)
;;google services
;;helm google menu
(use-package helm-google
  :ensure t
  :bind (("C-M-g" . helm-google)))
;;fast search
(use-package google-this
  :ensure t
  :init (google-this-mode 1)
  :bind (("M-g" . google-this)))
;;google translate
(use-package google-translate
  :ensure t
  :init (require 'google-translate-smooth-ui)
  :bind (("M-t" . google-translate-smooth-translate)))
;;time to play some games!
;; z machine interpreter
(use-package malyon
  :ensure t
  :init
  :config
  	(defalias 'z-machine 'malyon)
	(defalias 'z-machine-save 'malyon-save-file)
	(defalias 'z-machine-quit 'malyon-quit)
	(defalias 'z-machine-restore 'malyon-restore-file))
;;flyspell
(use-package flyspell-correct
  :ensure t)
(use-package flyspell-correct-helm
  :ensure t
  :config
  (define-key flyspell-mode-map (kbd "C-'") 'flyspell-correct-previous-word-generic))
;;REST client
(use-package restclient
  :ensure t
  :config
  (add-hook 'restclient-mode-hook
			(lambda () (local-set-key (kbd "M-r") #'restclient-http-send-current-stay-in-window)
			  (local-set-key (kbd "M-n") #'restclient-jump-next)
			  (local-set-key (kbd "M-p") #'restclient-jump-prev)))
  (defalias 'restclient 'restclient-mode)
  (defalias 'rest 'restclient-mode)
  (defalias 'restapi 'restclient-mode)
  (defalias 'restclient-curl 'restclient-copy-curl-command)
  (defalias 'rest-curl 'restclient-copy-curl-command)
  (defalias 'restapi-curl 'restclient-copy-curl-command))
;;documents
(use-package emmet-mode
  :ensure t
  :config
  (defalias 'emmet 'emmet-expand-yas))
;;docker
(use-package docker
  :ensure t)
;;org mode ench
(use-package org-download
  :ensure t)
;;using package without installing it
(use-package try
  :ensure t
  :config
  (defalias 'temporary-package 'try)
  (defalias 'try-temporary 'try)
  (defalias 'try-package 'try)
  (defalias 'package-temporary 'try)
  (defalias 'package-try 'try))

;;shit from GitHub
(use-package el-get
  :ensure t)

;;muh books
(el-get-bundle calibre-mode
  :url "https://raw.githubusercontent.com/whacked/calibre-mode/master/calibre-mode.el"
  :description "Calibre library management"
  :features calibre-mode)
(require 'calibre-mode)
(setq sql-sqlite-program "/usr/bin/sqlite3")
(setq calibre-root-dir (expand-file-name "~/Dropbox/Books"))
(setq calibre-db (concat calibre-root-dir "/metadata.db"))
(el-get-bundle dockerfile-mode
  :url "https://raw.githubusercontent.com/spotify/dockerfile-mode/master/dockerfile-mode.el"
  :description "Dockerfile editing"
  :features dockerfile-mode)
(require 'dockerfile-mode)
;;inserting links
(el-get-bundle markdown-dnd-images
  :url "https://raw.githubusercontent.com/mooreryan/markdown-dnd-images/master/markdown-dnd-images.el"
  :description "Dockerfile editing")
(require 'markdown-dnd-images)
;;wiki!
(el-get-bundle org-wiki
  :url "https://raw.githubusercontent.com/caiorss/org-wiki/master/org-wiki.el"
  :description "Emacs' desktop wiki built with org-mode"
  :features org-wiki)
(require 'org-wiki)
(setq org-wiki-location "~/Dropbox/Org/Wiki")
(defalias 'wiki 'org-wiki-index)
;;beautiful todo
(el-get-bundle todotxt-mode
  :url "https://raw.githubusercontent.com/avillafiorita/todotxt-mode/master/todotxt-mode.el"
  :description "Emacs' todo txt mode"
  :features todotxt-mode)
(require 'todotxt-mode)
(setq todotxt-default-file (expand-file-name "/home/user/Dropbox/todo/todo.txt"))
(setq todotxt-default-archive-file (expand-file-name "/home/user/Dropbox/todo/done.txt"))
(defalias 'todo 'todotxt-open-file)
(defalias 'do 'todotxt-add-todo)

;;spell checking
(setq flyspell-issue-message-flag nil)
(setq flyspell-issue-welcome-flag nil)
(mapcar (lambda (mode-hook) (add-hook mode-hook 'flyspell-prog-mode))
        '(c-mode-common-hook tcl-mode-hook emacs-lisp-mode-hook 
							 ruby-mode-hook java-mode-hook fish-mode-hook shell-mode-hook))
(mapcar (lambda (mode-hook) (add-hook mode-hook 'flyspell-mode))
        '(org-mode-hook markdown-mode-hook gfm-mode-hook))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-buffer-name " MINIMAP")
 '(minimap-dedicated-window nil)
 '(minimap-hide-fringes t)
 '(minimap-hide-scroll-bar t)
 '(minimap-major-modes (quote (prog-mode)))
 '(minimap-mode nil)
 '(minimap-width-fraction 0.13)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
	(helm yasnippet yascroll seti-theme popup neotree minimap magit ivy el-get company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#0e1112"))))
 '(company-scrollbar-fg ((t (:background "#FFFFFF"))))
 '(company-tooltip ((t (:background "#0e1112" :foreground "#FFFFFF"))))
 '(company-tooltip-common ((t (:foreground "#Ff0000"))))
 '(company-tooltip-selection ((t (:background "#FFFFFF" :foreground "#000000"))))
 '(highlight ((t (:background "#FFFFFF" :foreground "#000000"))))
 '(minimap-active-region-background ((t (:background "#0e1112"))))
 '(minimap-font-face ((t (:height 30 :family "Fira Mono")))))
;;; init.el ends here
