;;; exwm.el --- emacs wm setup

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package exwm
  :ensure t
  :config (setq exwm-workspace-number 10)
  (exwm-input-set-key (kbd "s-r") #'exwm-reset)
  (exwm-input-set-key (kbd "s-n") #'new-window-horizontally)
  (exwm-input-set-key (kbd "s-N") #'new-window-vertically)
  (exwm-input-set-key (kbd "s-q") #'delete-window)
  (exwm-input-set-key (kbd "s-Q") #'kill-this-buffer)
  (exwm-input-set-key (kbd "s--") #'exwm-workspace-switch)
  (exwm-input-set-key (kbd "s-x") #'counsel-M-x)
  (exwm-input-set-key (kbd "s-W") #'ace-window)
  (exwm-input-set-key (kbd "<s-up>") #'windmove-up)
  (exwm-input-set-key (kbd "<s-down>") #'windmove-down)
  (exwm-input-set-key (kbd "<s-left>") #'windmove-left)
  (exwm-input-set-key (kbd "<s-right>") #'windmove-right)
  (exwm-input-set-key (kbd "<S-s-up>") #'buf-move-up)
  (exwm-input-set-key (kbd "<S-s-down>") #'buf-move-down)
  (exwm-input-set-key (kbd "<S-s-left>") #'buf-move-left)
  (exwm-input-set-key (kbd "<S-s-right>") #'buf-move-right)
  (exwm-input-set-key (kbd "<C-s-right>") #'shrink-window-horizontally)
  (exwm-input-set-key (kbd "<C-s-left>") #'enlarge-window-horizontally)
  (exwm-input-set-key (kbd "<C-s-down>") #'shrink-window)
  (exwm-input-set-key (kbd "<C-s-up>") #'enlarge-window)
  (exwm-input-set-key (kbd "s-B") #'ivy-purpose-switch-buffer-with-purpose)
  (exwm-input-set-key (kbd "C-s-b") #'ivy-switch-buffer)
  (exwm-input-set-key (kbd "s-b") #'ivy-purpose-switch-buffer-with-some-purpose)
  (exwm-input-set-key (kbd "s-=") #'exwm-workspace-move-window)
  (exwm-input-set-key (kbd "s-+") #'exwm-workspace-move)
  (exwm-input-set-key (kbd "s-`") #'multi-eshell)

  (define-key exwm-mode-map (kbd "C-q") 'kill-region)

  (dotimes (i 10)
	(exwm-input-set-key (kbd (format "s-%d" i))
						`(lambda ()
						   (interactive)
						   (exwm-workspace-switch-create ,i))))
  (exwm-input-set-key (kbd "<s-return>")
					  (lambda (command)
						(interactive (list (read-shell-command "$ ")))
						(start-process-shell-command command nil command)))
  (add-hook 'exwm-update-class-hook
			(lambda ()
			  (exwm-workspace-rename-buffer exwm-class-name)))
  ;;without this the mouse cursor is fucked
  (setq mouse-autoselect-window nil)
  (exwm-enable))
;;; exwm.el ends here
