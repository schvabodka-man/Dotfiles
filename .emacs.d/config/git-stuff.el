;;; git-stuff.el --- git config

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :pin melpa-stable
  :bind ("M-m" . magit-status)
  :config (add-hook 'magit-mode-hook
					(lambda ()
					  (null-all-bindings)
					  (local-set-key (kbd "C-S-q") #'kill-this-buffer)
					  (local-set-key (kbd "/") #'magit-popup-help)
					  (local-set-key (kbd "c") #'magit-commit-popup)
					  (local-set-key (kbd "p") #'magit-push-popup)
					  (local-set-key (kbd "P") #'magit-pull-popup)
					  (local-set-key (kbd "r") #'magit-reset-popup)
					  (local-set-key (kbd "m") #'magit-merge-popup)
					  (local-set-key (kbd "s") #'magit-stash-popup)
					  (local-set-key (kbd "d") #'magit-diff-popup)
					  (local-set-key (kbd "b") #'magit-branch-popup)
					  (local-set-key (kbd "a") #'magit-stage)
					  (local-set-key (kbd "A") #'magit-unstage)
					  (local-set-key (kbd "S") #'magit-stage)
					  (local-set-key (kbd "l") #'magit-log-popup)
					  (local-set-key (kbd "h") #'magit-log-popup)))
  (define-key magit-popup-mode-map (kbd "q") #'magit-popup-quit)
  (define-key magit-popup-mode-map (kbd "C-S-q") #'kill-this-buffer)
  (define-key magit-status-mode-map (kbd "C-S-q") #'kill-this-buffer)
  (define-key magit-diff-mode-map (kbd "C-S-q") #'kill-this-buffer)
  (defalias 'magit-file-history 'magit-log-buffer-file)
  (defalias 'magit-file-log 'magit-log-buffer-file)
  (defalias 'magit-history-file 'magit-log-buffer-file)
  (defalias 'magit-history-log 'magit-log-buffer-file)
  (defalias 'magit-history-file-popup 'magit-log-buffer-file-popup)
  (defalias 'magit-log-file-popup 'magit-log-buffer-file-popup)
  (defalias 'magit-history-file-popup 'magit-log-buffer-file-popup)
  (defalias 'magit-file-history-popup 'magit-log-buffer-file-popup)
  (defalias 'magit-file-log-popup 'magit-log-buffer-file-popup)
  (setenv "GIT_PAGER" "")
  (if (file-exists-p  "/usr/local/bin/emacsclient")
	  (setq magit-emacsclient-executable "/usr/local/bin/emacsclient")
	(setq magit-emacsclient-executable (executable-find "emacsclient"))))
;; (use-package magithub
;;   :after magit
;;   :ensure t
;;   :config (magithub-feature-autoinject t)
;;   :config (add-hook 'magit-mode-hook (lambda ()
;;									   (local-set-key (kbd "g") #'magithub-dispatch-popup))))
(use-package git-gutter-fringe
  :ensure t
  :config (set-face-foreground 'git-gutter-fr:modified "yellow")
  (set-face-foreground 'git-gutter-fr:added    "green")
  (set-face-foreground 'git-gutter-fr:deleted  "red")
  (global-git-gutter-mode +1))
(use-package git-timemachine
  :ensure t
  ;; :bind ("M-t" . git-timemachine)
  :config   (define-key git-timemachine-mode-map (kbd ",") #'git-timemachine-show-previous-revision)
  (define-key git-timemachine-mode-map (kbd ".") #'git-timemachine-show-next-revision)
  (define-key git-timemachine-mode-map (kbd "q") #'git-timemachine-quit)
  (defalias 'git-history 'git-timemachine)
  (defalias 'git-log 'git-timemachine)
  (define-key git-timemachine-mode-map (kbd "n") nil)
  (define-key git-timemachine-mode-map (kbd "p") nil)
  (define-key git-timemachine-mode-map (kbd "b") nil))
;; (use-package git-messenger
;;   :ensure t
;;   :commands git-messenger:popup-message
;;   :config (setq git-messenger:show-detail t))
(use-package git-link
  :ensure t
  :config
  (add-hook 'with-editor-mode-hook
			(lambda ()
			  (local-set-key (kbd "C-s") #'with-editor-finish)
			  (local-set-key (kbd "C-c C-c") nil))))
(use-package git-auto-commit-mode
  :ensure t
  :config (add-hook 'org-mode-hook 'git-auto-commit-mode))
;;; git-stuff.el ends here
