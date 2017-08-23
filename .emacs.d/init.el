;;; init --- My emacs config
;;; Commentary:
;;; MUH EMACS
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packa(defalias 'gnus-mark-all-read 'gnus-summary-catchup)
ges/"))
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
  :init (require 'helm-config)
  :config (defalias 'color 'helm-colors)
  :bind (("M-x" . helm-M-x)
		 ("M-o" . helm-find-files)
		 ("M-c" . helm-colors)
		 ("M-w" . helm-buffers-list)
		 ("M-b" . helm-bookmarks)
		 ("C-f" . helm-occur)))
;;git
(use-package magit
  :ensure t)
;;some libs
(use-package dash
  :ensure t)
(use-package cl-lib
  :ensure t)
;;(use-package magithub
;;  :after magit
;;  :config (magithub-feature-autoinject t))
;;autocomplete
(use-package company
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0))
;;snippets
(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1)
  :config
  (defalias 'snippet 'yas-expand)
  (add-to-list 'company-backends 'company-yasnippet t)
  (global-set-key (kbd "M-TAB") 'yas-expand))
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
(global-set-key (kbd "M-S-q") 'kill-buffer)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-M-f") 'list-matching-lines)
(global-set-key (kbd "C-<home>") 'beginning-of-line)
(global-set-key (kbd "C-<end>") 'end-of-line)
(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-g") 'goto-line)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-r") 'query-replace-regexp)
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
;;dired
(define-key dired-mode-map "n" 'find-file)
;;redone backspace and del
(global-set-key (kbd "C-<backspace>") 'ivy-backward-kill-word)

;;custom funcs and aliases
(defun indent-all ()
  (interactive)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-b") 'indent-all)
(defalias 'beautify 'indent-all)

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
(defalias 'open-in-browser 'browse-url-of-file)
(defalias 'browser-preview 'browse-url-of-file)
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
(setq suggest-key-bindings nil)
(setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "luakit")
;;org mode select with shift
(setq org-support-shift-select t)
;; killing messages buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
(setq initial-scratch-message nil)
(if (get-buffer "*scratch*")
	(kill-buffer "*scratch*"))
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
;;minimap
(use-package minimap
  :ensure t
  :config
  (global-set-key (kbd "M-m") 'minimap-mode))
;;it must be by default in emacs
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-<down>") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-S-<up>") 'mc/mark-previous-like-this))
;;for editing fish scripts
(use-package fish-mode
  :ensure t)
(use-package company-shell
  :ensure t
  :init (add-to-list 'company-backends '(company-shell company-shell-env company-fish-shell)))
;;for markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
		 ("\\.md\\'" . markdown-mode)
		 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
(use-package js2-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode)))
(use-package js2-refactor
  :ensure t
  :after js2-mode
  :config (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (define-key js2-refactor-mode-map (kbd "<S-<f1>") 'js2r-rename-var)
  (define-key js2-refactor-mode-map (kbd "C-k") 'js2r-kill)  
  (defalias 'js-rename 'js2r-rename-var)
  (defalias 'js-log 'js2r-log-this)
  (defalias 'js-extract-function 'js2r-extract-function)
  (defalias 'js-extract-var 'js2r-extract-var)
  (defalias 'js-extract-method 'js2r-extract-method)
  (defalias 'js-expand 'js2r-expand-node-at-point)
  (defalias 'js-arguments-object 'js2r-arguments-to-object)

  (defalias 'javascript-rename 'js2r-rename-var)
  (defalias 'javascript-log 'js2r-log-this)
  (defalias 'javascript-extract-function 'js2r-extract-function)
  (defalias 'javascript-extract-var 'js2r-extract-var)
  (defalias 'javascript-extract-method 'js2r-extract-method)
  (defalias 'javascript-expand 'js2r-expand-node-at-point)
  (defalias 'javascript-arguments-object 'js2r-arguments-to-object))

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
;;google services
;;helm google menu
(use-package helm-google
  :ensure t
  :bind (("C-M-g" . helm-google))
  :config (defalias 'google 'helm-google))
;;fast search
(use-package google-this
  :ensure t
  :init (google-this-mode 1)
  :bind (("M-g" . google-this)))
;;google translate
(use-package google-translate
  :ensure t
  :init (require 'google-translate-smooth-ui)
  :bind (("M-t" . google-translate-smooth-translate))
  :config (defalias 'google-translate 'google-translate-smooth-translate)
  (defalias 'translate 'google-translate-smooth-translate))
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
  (defalias 'emmet 'emmet-expand-yas)
  (global-set-key (kbd "M-e") 'emmet-expand-yas))
;;docker
(use-package docker
  :ensure t)
;;org mode downloader
(use-package org-download
  :ensure t)
;;using package without installing it
(use-package try
  :ensure t
  :config
  (defalias 'temporary-package 'try)
  (defalias 'temporary-install 'try)
  (defalias 'try-temporary 'try)
  (defalias 'try-install 'try)
  (defalias 'try-package 'try)
  (defalias 'package-temporary 'try)
  (defalias 'package-try 'try)
  (defalias 'install-temporary 'try)
  (defalias 'install-try 'try))
;;for deps mostly
;;(use-package hydra
;;  :ensure t)
;;pandoc
;;(use-package pandoc-mode
;;  :ensure t
;;  :config
;;  (add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
;;  (add-hook 'markdown-mode-hook 'pandoc-mode)
;;  (add-hook 'html-mode-hook 'pandoc-mode))
;;colorizing
(use-package rainbow-mode
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-mode)
  (add-hook 'text-mode-hook 'rainbow-mode))
(use-package rainbow-delimiters
  :ensure t
  :after rainbow-mode
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'text-mode-hook 'rainbow-delimiters-mode))
;;icons
(use-package all-the-icons
  :ensure t)
;; (use-package mode-icons
;;   :ensure t
;;   :after all-the-icons
;;   :init (mode-icons-mode))
(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
;;aesthetic
(use-package fireplace
  :ensure t)
;; (use-package ace-popup-menu
;;   :ensure t
;;   :init (ace-popup-menu-mode 1))
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode)))
;;indent
(use-package indent-guide
  :ensure t
  :init (indent-guide-global-mode))
(electric-indent-mode)
;;brainfuck unironically. i like brainfuck because of its simplicity
(use-package bfbuilder
  :ensure t
  :config
  (defalias 'brainfuck-mode 'bfbuilder-mode)
  (defalias 'brainfuck-debug 'bfbuilder-debug)
  (add-to-list 'auto-mode-alist '("\\.bf$" . bfbuilder-mode))
  (add-to-list 'auto-mode-alist '("\\.brainfuck$" . bfbuilder-mode))
  (define-key bfbuilder-mode-map (kbd "<M-f4>") 'bfbuilder-debug))
;;live preview for web
(use-package  simple-httpd
  :ensure t)
(use-package impatient-mode
  :ensure t
  :after simple-httpd
  :config (add-hook 'web-mode-hook 'impatient-mode)
  (add-hook 'html-mode-hook 'impatient-mode))
;;js development 
(use-package company-tern
  :ensure t
  :config (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook 'tern-mode)
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil))
(use-package  json-mode
  :ensure t)
(use-package web-beautify
  :ensure t
  :config (define-key js2-mode-map (kbd "C-b") 'web-beautify-js)
  (defun web-beautify-based-on-mode ()
	(if (string-match ".html" (buffer-file-name))
		(progn
		  (web-beautify-html)))
	(if (string-match ".css" (buffer-file-name))
		(progn
		  (web-beautify-css))))
  (define-key web-mode-map (kbd "C-b") '(lambda () (interactive) (web-beautify-based-on-mode)))
  (define-key json-mode-map (kbd "C-b") 'web-beautify-js))
(use-package indium
  :ensure t
  :config (add-hook 'js2-mode-hook #'indium-interaction-mode)
  (setq indium-update-script-on-save t)
  (define-key indium-interaction-mode-map (kbd "<M-f4>") 'indium-connect-to-chrome)
  (define-key indium-interaction-mode-map (kbd "<M-f1>") 'indium-add-breakpoint)
  (define-key indium-interaction-mode-map (kbd "<M-f2>") 'indium-remove-breakpoint)
  (define-key indium-interaction-mode-map (kbd "<M-S-f2>") 'indium-remove-all-breakpoints-from-buffer)
  (defalias 'js-chrome 'indium-connect-to-chrome)
  (defalias 'js-connect-chrome 'indium-connect-to-chrome)
  (defalias 'javascript-chrome 'indium-connect-to-chrome)
  (defalias 'javascript-connect-chrome 'indium-connect-to-chrome)
  (defalias 'js-add-breakpoint 'indium-add-breakpoint)
  (defalias 'js-remove-breakpoint 'indium-remove-breakpoint)
  (defalias 'js-delete-breakpoint 'indium-remove-breakpoint)
  (defalias 'javascript-add-breakpoint 'indium-add-breakpoint)
  (defalias 'javascript-remove-breakpoint 'indium-remove-breakpoint)
  (defalias 'javascript-delete-breakpoint 'indium-remove-breakpoint)
  (defalias 'js-remove-all-breakpoints 'indium-remove-all-breakpoints-from-buffer)
  (defalias 'javascript-remove-all-breakpoints 'indium-remove-all-breakpoints-from-buffer)
  (defalias 'js-breakpoints 'indium-list-breakpoints)
  (defalias 'javascript-breakpoints 'indium-list-breakpoints)
  (defalias 'javascript-scratch 'indium-scratch)
  (defalias 'js-scratch 'indium-scratch)
  (defalias 'js-repl 'indium-switch-to-repl-buffer)
  (defalias 'javascript-repl 'indium-switch-to-repl-buffer))
;;speedbar
(use-package sr-speedbar
  :ensure t
  :config 
  (defalias 'bar 'sr-speedbar-toggle)
  (defalias 'panel 'sr-speedbar-toggle)
  (defalias 'bar-toggle 'sr-speedbar-toggle)
  (defalias 'panel-toggle 'sr-speedbar-toggle)
  :bind (("M-s" . sr-speedbar-toggle)))
;;project management
(use-package projectile
  :ensure t
  :config (projectile-global-mode)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (global-set-key (kbd "C-S-r") 'projectile-replace-regexp)
  (defalias 'project-add 'projectile-add-known-project))
(use-package helm-projectile
  :ensure t
  :after projectile
  :config (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  (global-set-key (kbd "M-p") 'helm-projectile-switch-project)
  (global-set-key (kbd "M-f") 'helm-projectile-find-file)
  (global-set-key (kbd "M-S-f") 'helm-projectile-find-dir)
  (global-set-key (kbd "C-S-f") 'helm-projectile-grep))
;;highlight word
(use-package highlight-thing
  :ensure t
  :init (global-highlight-thing-mode))
;;pass integration
(use-package helm-pass
  :ensure t
  :commands (helm-pass)
  :config (defalias 'pass 'helm-pass)
  (defalias 'passwords 'helm-pass))
;;yaml mode
(use-package yaml-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
  :config (add-hook 'yaml-mode-hook 'whitespace-mode))
;;beautiful dashboard on startup
(use-package page-break-lines
  :ensure t)
(use-package dashboard
  :ensure t
  :after page-break-lines
  :init (dashboard-setup-startup-hook)
  :config (setq dashboard-banner-logo-title "Welcome back!")
  (setq dashboard-items '((recents  . 8)
						  (bookmarks . 8)
						  (projects . 8)
						  (agenda . 8))))
;;services
(use-package prodigy
  :ensure t
  :config
  (defalias 'service 'prodigy)
  (defalias 'services 'prodigy)
  (defalias 'service-start 'prodigy-start)
  (defalias 'service-stop 'prodigy-stop)
  (prodigy-define-service
	:name "Chromium debug mode"
	:command "chromium-browser"
	:args '("--remote-debugging-port=9222" "https://localhost:3000")
	:tags '(web)
	:stop-signal 'sigkill
	:kill-process-buffer-on-stop t))
;;jvm shit for memelords
(use-package kotlin-mode
  :ensure t)
(use-package ensime
  :ensure t
  :pin melpa-stable
  :config
  (setq
   ensime-sbt-command "/usr/bin/sbt"
   sbt:program-name "/usr/bin/sbt"))
;;links hinting
(use-package link-hint
  :ensure t
  :config (defalias 'link-open 'link-hint-open-link)
  (defalias 'link-copy 'link-hint-copy-link)
  :bind
  ("M-l" . link-hint-open-link)
  ("M-S-l" . link-hint-copy-link))
;;like pinboard 
(use-package org-board
  :ensure t
  :config (defalias 'board-new 'org-board-new)
  (defalias 'board-save 'org-board-new)
  (defalias 'link-new 'org-board-new)
  (defalias 'link-save 'org-board-new)
  (defalias 'board-open 'org-board-open)
  (defalias 'board-diff 'org-board-diff)
  (defalias 'board-archive 'org-board-archive))
;;some search improvements for org mode
(use-package deft
  :ensure t
  :config (setq deft-extensions '("txt" "org" "md"))
  (setq deft-directory "~/Dropbox/Org/Wiki")
  (setq deft-recursive t)
  (defalias 'org-wiki-find 'deft)
  (defalias 'org-wiki-find-file 'deft-find-file)
  (defalias 'wiki-find 'deft)
  (defalias 'wiki-find-file 'deft-find-file)
  (defalias 'org-wiki-search-file 'deft-find-file)
  (defalias 'wiki-search 'deft)
  (defalias 'wiki-search-file 'deft-find-file)
  (global-set-key (kbd "C-w") 'deft)
  (global-set-key (kbd "C-S-w") 'deft-find-file))
(use-package helm-org-rifle
  :ensure t
  :config (define-key org-mode-map (kbd "C-f") 'helm-org-rifle-current-buffer)
  (define-key org-mode-map (kbd "C-S-f") 'helm-org-rifle)
  (defalias 'org-mode-search-current-buffer 'helm-org-rifle-current-buffer)
  (defalias 'org-mode-search 'helm-org-rifle)
  (defalias 'mode-search-current-buffer 'helm-org-rifle-current-buffer)
  (defalias 'mode-search 'helm-org-rifle))
;;beacon for not losing cursor
(use-package beacon
  :ensure t
  :config (defalias 'cursor-blink 'beacon-blink)
  (defalias 'caret-blink 'beacon-blink)
  :bind (("<s-f1>" . beacon-blink)))
;;lua mode
(use-package lua-mode
  :ensure t)
(use-package company-lua
  :ensure t
  :config (add-to-list 'company-backends 'company-lua))
;;dired additions
(use-package dired+
  :ensure t
  :config  (diredp-make-find-file-keys-reuse-dirs))
;;rtorrent frontend
(use-package mentor
  :ensure t
  :config (defalias 'rtorrent 'mentor)
  (defalias 'torrent 'mentor)
  (setq mentor-rtorrent-buffer-name "*mentor*")
  ;;(setq mentor-rtorrent-external-rpc "~/.rtorrent-rpc.socket")
  )
;;language guessing
;; (use-package guess-language
;;   :ensure t
;;   :config (setq guess-language-languages '(en ru))
;;   (setq guess-language-langcodes
;;   '((en . ("en_US" "English"))
;;     (ru . ("ru_RU" "Russian"))))
;;   (setq guess-language-min-paragraph-length 10)
;;   (add-hook 'text-mode-hook (lambda () (guess-language-mode 1)))
;;   (add-hook 'prog-mode-hook (lambda () (guess-language-mode 1))))

;;for HUUUGE files
(use-package vlf
  :ensure t
  :init (require 'vlf-setup)
  :config (add-hook 'vlf-mode-hook
					(lambda () (local-set-key (kbd "C-f") #'vlf-occur)
					  (local-set-key (kbd "C-g") #'vlf-goto-line)
					  (local-set-key (kbd "C-r") #'vlf-query-replace)
					  (local-set-key (kbd "<Home>") #'vlf-beginning-of-file)
					  (local-set-key (kbd "<End>") #'vlf-end-of-file))))
;;powerline from spacemacs
;;finally spaceline
(use-package spaceline
  :init (require 'spaceline-config)
  (spaceline-emacs-theme)
  :ensure t)
;; (use-package spaceline-all-the-icons 
;;   :after spaceline
;;   :config (spaceline-all-the-icons-theme)
;;   (spaceline-all-the-icons--setup-package-updates)
;;   (spaceline-all-the-icons--setup-git-ahead))

;;shit from GitHub
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
  :description "markdown drag and drop")
(require 'markdown-dnd-images)
;;wiki!
(el-get-bundle org-wiki
  :url "https://raw.githubusercontent.com/caiorss/org-wiki/master/org-wiki.el"
  :description "Emacs' desktop wiki built with org-mode"
  :features org-wiki)
(require 'org-wiki)
(setq org-wiki-location "~/Dropbox/Org/Wiki")
(defalias 'wiki 'org-wiki-index)
;;my seti fork
(el-get-bundle seti-theme
  :url "https://raw.githubusercontent.com/schvabodka-man/seti-theme/master/seti-theme.el"
  :description "Port of Atom theme"
  :features org-wiki)
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/seti-theme")
(load-theme 'seti t)

;;spell checking
(setq flyspell-issue-message-flag nil)
(setq flyspell-issue-welcome-flag nil)
(mapcar (lambda (mode-hook) (add-hook mode-hook 'flyspell-prog-mode))
		'(c-mode-common-hook tcl-mode-hook emacs-lisp-mode-hook 
							 ruby-mode-hook java-mode-hook fish-mode-hook shell-mode-hook))
(mapcar (lambda (mode-hook) (add-hook mode-hook 'flyspell-mode))
		'(org-mode-hook markdown-mode-hook gfm-mode-hook))

(global-set-key (kbd "<C-f2>") (lambda ()
								 (interactive)
								 (ispell-change-dictionary "russian")))
(global-set-key (kbd "<C-f1>") (lambda ()
								 (interactive)
								 (ispell-change-dictionary "english")))
(global-set-key (kbd "<C-f3>") 'ispell-change-dictionary)
(defalias 'dictionary 'ispell-change-dictionary)
(defalias 'language 'ispell-change-dictionary)

(defface hi-white
  '((((background dark)) (:background "#696969" :foreground "white"))
	(t (:background "#696969")))
  "Face for hi-lock mode."
  :group 'hi-lock-faces)

;;gnus shit not in .gnusrc
(gnus-demon-add-handler 'gnus-demon-scan-news 2 5)
(gnus-demon-init)

(defalias 'email 'gnus)
(defalias 'mail 'gnus)

(use-package eshell-z
  :ensure t)
(use-package eshell-prompt-extras
  :ensure t
  :init (with-eval-after-load "esh-opt"
		  (autoload 'epe-theme-lambda "eshell-prompt-extras")
		  (setq eshell-highlight-prompt nil
				eshell-prompt-function 'epe-theme-lambda)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-thing-case-sensitive-p t)
 '(highlight-thing-delay-seconds 0.1)
 '(highlight-thing-exclude-thing-under-point t)
 '(highlight-thing-excluded-major-modes (quote (special-mode)))
 '(highlight-thing-what-thing (quote sexp))
 '(httpd-port 8088)
 '(js2-highlight-level 3)
 '(js2-idle-timer-delay 0.1)
 '(js2-include-node-externs t)
 '(js2-include-rhino-externs t)
 '(js2-instanceof-has-side-effects t)
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
	(nnir helm yasnippet yascroll seti-theme popup neotree minimap magit ivy el-get company)))
 '(send-mail-function (quote smtpmail-send-it))
 '(spaceline-all-the-icons-highlight-file-name t)
 '(sr-speedbar-right-side nil)
 '(vlf-application (quote dont-ask)))
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
 '(epe-git-face ((t (:inherit font-lock-builtin-face))))
 '(epe-pipeline-delimiter-face ((t (:foreground "lawn green"))))
 '(epe-pipeline-host-face ((t (:foreground "cyan"))))
 '(epe-pipeline-time-face ((t (:foreground "gold"))))
 '(epe-pipeline-user-face ((t (:foreground "orange red"))))
 '(highlight ((t (:background "#FFFFFF" :foreground "#000000"))))
 '(highlight-thing ((t (:inherit (quote hi-white)))))
 '(minimap-active-region-background ((t (:background "#0e1112"))))
 '(minimap-font-face ((t (:height 30 :family "Fira Mono"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "dark magenta"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "dark violet"))))
 '(spaceline-flycheck-error ((t (:distant-foreground "orange red" :foreground "red"))))
 '(spaceline-highlight-face ((t (:background "DarkGoldenrod2" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-modified ((t (:background "SkyBlue2" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-read-only ((t (:background "plum3" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-unmodified ((t (:background "DarkGoldenrod2" :foreground "black" :inherit (quote mode-line))))))
(put 'dired-find-alternate-file 'disabled nil)
;;; init.el ends here

