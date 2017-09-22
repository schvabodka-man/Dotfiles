;;; eshell --- My emacs config for eshell
;;; Commentary:
;;; MUH ESHELL
;;; Code:
(setq eshell-banner-message "")
(use-package eshell-z
  :ensure t)
(use-package eshell-up
  :ensure t)
(use-package eshell-git-prompt
  :ensure t
  :init (eshell-git-prompt-use-theme 'powerline))
(use-package multi-eshell
  :ensure t
  :config (defalias 'eshell-next 'multi-eshell-switch)
  (defalias 'eshell-prev 'multi-eshell-go-back)
  (defalias 'eshell-previous 'multi-eshell-go-back)
  (defalias 'multi-eshell-next 'multi-eshell-switch)
  (defalias 'multi-eshell-prev 'multi-eshell-go-back)
  (defalias 'multi-eshell-previous 'multi-eshell-go-back)
  :bind (("M-`" . multi-eshell)
		 ("M-2" . multi-eshell-switch)
		 ("M-1" . multi-eshell-go-back)))
;;bookmarks for eshell
(el-get-bundle eshell-bmk
  :url "https://gist.githubusercontent.com/kkatsuyuki/fa930411a86169c3bb1f03337d4af280/raw/be5bcc2e519a3ab9e67ea0f5238a3e0b75b0084e/eshell-bmk.el"
  :description "Eshell bokmarks integration")
(load "~/.emacs.d/el-get/eshell-bmk/eshell-bmk")
(use-package with-editor
  :ensure t
  :config (add-hook 'shell-mode-hook  'with-editor-export-editor)
  (add-hook 'term-exec-hook   'with-editor-export-editor)
  (add-hook 'eshell-mode-hook 'with-editor-export-editor))
;;this is for killing cli buffers made for small tasks
(defun kill-buffer-when-frame-delete-dwim (frame)
  (if (string-match "*eshell*" (buffer-name))
	  (unless (delq nil (mapcar #'(lambda (x)
									(memq (current-buffer)
										  (mapcar #'window-buffer x)))
								(mapcar #'window-list
										(delq frame (frame-list)))))
		(kill-buffer (current-buffer)))))
(add-hook 'delete-frame-functions 'kill-buffer-when-frame-delete-dwim)
(setenv "PAGER" "cat")
(setq eshell-visual-commands '("vi" "screen" "top" "less" "more" "lynx"
							   "ncftp" "pine" "tin" "trn" "elm" "vim"
							   "nmtui" "alsamixer" "htop" "el" "elinks"
							   "ssh" "nethack" "dtop" "dstat"))
(setq eshell-visual-subcommands '(("git" "log" "diff" "show")
								  ("vagrant" "ssh")))
;;from stackoverflow
(defun new-shell ()
  (interactive)
  (let (
		(currentbuf (get-buffer-window (current-buffer)))
		(newbuf     (generate-new-buffer-name "*shell*")))
	(generate-new-buffer newbuf)
	(set-window-dedicated-p currentbuf nil)
	(set-window-buffer currentbuf newbuf)
	(shell newbuf)))
(global-set-key (kbd "M-~") 'new-shell)
(setenv "JAVA_HOME" "/usr/lib/jvm/java")
(setenv "GRADLE_HOME" "/usr/share/gradle")
(setenv "GOPATH" "/home/user/Go")
(setenv "BROWSER" "luakit")
(setenv "ANDROID_HOME" "/home/user/Android/Sdk")
;;; eshell ends here
