;; (use-package perspeen
;;   :ensure t
;;   :init (setq perspeen-use-tab t)
;;   :config (perspeen-mode)
;;   (defalias 'ws-delete 'perspeen-delete-ws)
;;   (defalias 'ws-remove 'perspeen-delete-ws)
;;   (defalias 'workspace-delete 'perspeen-delete-ws)
;;   (defalias 'workspace-remove 'perspeen-delete-ws)
;;   (defalias 'ws-kill 'perspeen-delete-ws)
;;   (defalias 'workspace-kill 'perspeen-delete-ws)
;;   (defalias 'ws-create 'perspeen-create-ws)
;;   (defalias 'ws-new 'perspeen-create-ws)
;;   (defalias 'workspace-create 'perspeen-create-ws)
;;   (defalias 'workspace-new 'perspeen-create-ws)
;;   :bind (("M-RET" . perspeen-tab-create-tab)
;;		 ("M-Q" . perspeen-tab-del)
;;		 ("M-," . perspeen-tab-prev)
;;		 ("M-." . perspeen-tab-next)
;;		 ("M-[" . perspeen-previous-ws)
;;		 ("M-]" . perspeen-next-ws)
;;		 ("M-r" . perspeen-rename-ws)
;;		 ("<C-M-return>" . perspeen-create-ws)))
;; (use-package helm-perspeen
;;   :ensure t
;;   :bind (("M-w" . helm-perspeen)))
(use-package ace-window
  :ensure t
  :bind (("M-w" . ace-window)))
(use-package window-purpose
  :ensure t
  :config (purpose-mode)
  (add-to-list 'purpose-user-mode-purposes '(scala-mode . scala))
  (add-to-list 'purpose-user-mode-purposes '(java-mode . java))
  (add-to-list 'purpose-user-regexp-purposes '("\\.aj\\'" . aspectj))
  (add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . emacs-lisp))
  (add-to-list 'purpose-user-name-purposes '("pom.XML" . maven))
  (add-to-list 'purpose-user-regexp-purposes '("\\.gradle\\'" . gradle))
  (add-to-list 'purpose-user-mode-purposes '(markdown-mode . markdown))
  (add-to-list 'purpose-user-mode-purposes '(gfm-mode . markdown))
  (add-to-list 'purpose-user-mode-purposes '(json-mode . json))
  (add-to-list 'purpose-user-mode-purposes '(js2-mode . js))
  (add-to-list 'purpose-user-mode-purposes '(javascript-mode . js))
  (add-to-list 'purpose-user-mode-purposes '(web-mode . html))
  (add-to-list 'purpose-user-mode-purposes '(css-mode . css))
  (add-to-list 'purpose-user-mode-purposes '(html-mode . html))
  (add-to-list 'purpose-user-mode-purposes '(fish-mode . shell-scripts))
  (add-to-list 'purpose-user-mode-purposes '(sh-mode . shell-scripts))
  (add-to-list 'purpose-user-name-purposes '(nxml-mode . xml))
  (add-to-list 'purpose-user-name-purposes '(yaml-mode . yaml))
  (add-to-list 'purpose-user-name-purposes '(eshell-mode . eshell))
  (add-to-list 'purpose-user-mode-purposes '(shell-mode . shell))
  (add-to-list 'purpose-user-name-purposes '(org-mode . org))
  (add-to-list 'purpose-user-name-purposes '(cfw:calendar-mode . org))
  (add-to-list 'purpose-user-name-purposes '(org-agenda-mode . org))
  (add-to-list 'purpose-user-mode-purposes '(lua-mode . lua))
  (add-to-list 'purpose-user-mode-purposes '(desktop-entry-mode . desktop-entry))
  (add-to-list 'purpose-user-mode-purposes '(conf-mode . configs))
  (add-to-list 'purpose-user-mode-purposes '(conf-unix-mode . configs))
  (add-to-list 'purpose-user-mode-purposes '(conf-windows-mode . configs))
  (add-to-list 'purpose-user-mode-purposes '(conf-colon-mode . configs))
  (add-to-list 'purpose-user-mode-purposes '(conf-ppd-mode . configs))
  (add-to-list 'purpose-user-mode-purposes '(image-dired-thumbnail-mode . pictures))
  (add-to-list 'purpose-user-mode-purposes '(image-dired-display-image-mode . pictures))
  (add-to-list 'purpose-user-mode-purposes '(image-mode . pictures))
  (add-to-list 'purpose-user-mode-purposes '(conf-space-keywords . configs))
  (add-to-list 'purpose-user-mode-purposes '(conf-xdefaults-mode . x11-xorg-configs))
  (add-to-list 'purpose-user-mode-purposes '(conf-javaprop-mode . java-properties))
  (add-to-list 'purpose-user-mode-purposes '(erc-mode . erc))
  (add-to-list 'purpose-user-regexp-purposes '("*Group*" . email))
  (add-to-list 'purpose-user-regexp-purposes '("*Article .+" . email))
  (add-to-list 'purpose-user-regexp-purposes '("*Summary .+" . email))
  (add-to-list 'purpose-user-regexp-purposes '("*unsent mail to" . email))
  (add-to-list 'purpose-user-regexp-purposes '("*elfeed-search*" . news))
  (add-to-list 'purpose-user-regexp-purposes '("*elfeed-entry*" . news))
  (add-to-list 'purpose-user-regexp-purposes '("*elfeed-log*" . news))
  (add-to-list 'purpose-user-regexp-purposes '("timemachine" . git-timemachine))
  (add-to-list 'purpose-user-regexp-purposes '("tern-project" . js))
  (purpose-compile-user-configuration)
  (purpose-x-kill-setup)
  (purpose-x-magit-single-on))
(use-package ivy-purpose
  :ensure t
  :config (define-key evil-normal-state-map (kbd "w") 'ivy-purpose-switch-buffer-with-some-purpose)
  (define-key evil-normal-state-map (kbd "W") 'ivy-purpose-switch-buffer-with-purpose))
;; (use-package golden-ratio
;;   :ensure t
;;   :config (golden-ratio-mode 1)
;;   (setq golden-ratio-auto-scale t)
;;   (setq golden-ratio-adjust-factor .8
;;		golden-ratio-wide-adjust-factor .8)
;;   (purpose-x-golden-ratio-setup))
(use-package buffer-move
  :ensure t
  :bind ("<M-S-left>" . buf-move-left)
  ("<M-S-right>" . buf-move-right)
  ("<M-S-up>" . buf-move-up)
  ("<M-S-down>" . buf-move-down))
;; (use-package sauron
;;   :ensure t
;;   :config (setq sauron-separate-frame nil)
;;   (sauron-start-hidden)
;;   (sauron-elfeed-start)
;;   (defalias 'events 'sauron-toggle-hide-show)
;;   (defalias 'notifications 'sauron-toggle-hide-show))
;; (use-package frames-only-mode
;;   :ensure t
;;   :config (frames-only-mode))
;; (setq pop-up-frames t)
(use-package centered-window-mode
  :ensure t
  :config (centered-window-mode t))
;; (use-package popwin
;;   :ensure t
;;   :config (popwin-mode 1))
;; (use-package auto-dim-other-buffers
;;   :ensure t
;;   :config (add-hook 'after-init-hook (lambda ()
;;									   (when (fboundp 'auto-dim-other-buffers-mode)
;;										 (auto-dim-other-buffers-mode t)))))
