;;; git-stuff.el --- git config

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "m") #'magit-status)
  (evil-set-initial-state 'magit-mode 'emacs)
  (add-hook 'magit-mode-hook
			(lambda ()
			  (local-set-key (kbd "<") nil)
			  (local-set-key (kbd ">") nil)
			  (local-set-key (kbd "A") nil)
			  (local-set-key (kbd "B") nil)
			  (local-set-key (kbd "C") nil)
			  (local-set-key (kbd "D") nil)
			  (local-set-key (kbd "E") nil)
			  (local-set-key (kbd "F") nil)
			  (local-set-key (kbd "G") nil)
			  (local-set-key (kbd "H") nil)
			  (local-set-key (kbd "I") nil)
			  (local-set-key (kbd "J") nil)
			  (local-set-key (kbd "K") nil)
			  (local-set-key (kbd "L") nil)
			  (local-set-key (kbd "M") nil)
			  (local-set-key (kbd "N") nil)
			  (local-set-key (kbd "O") nil)
			  (local-set-key (kbd "Q") nil)
			  (local-set-key (kbd "R") nil)
			  (local-set-key (kbd "T") nil)
			  (local-set-key (kbd "U") nil)
			  (local-set-key (kbd "V") nil)
			  (local-set-key (kbd "W") nil)
			  (local-set-key (kbd "X") nil)
			  (local-set-key (kbd "Y") nil)
			  (local-set-key (kbd "Z") nil)
			  (local-set-key (kbd "e") nil)
			  (local-set-key (kbd "f") nil)
			  (local-set-key (kbd "i") nil)
			  (local-set-key (kbd "j") nil)
			  (local-set-key (kbd "k") nil)
			  (local-set-key (kbd "n") nil)
			  (local-set-key (kbd "o") nil)
			  (local-set-key (kbd "q") nil)
			  (local-set-key (kbd "t") nil)
			  (local-set-key (kbd "u") nil)
			  (local-set-key (kbd "v") nil)
			  (local-set-key (kbd "w") nil)
			  (local-set-key (kbd "x") nil)
			  (local-set-key (kbd "y") nil)
			  (local-set-key (kbd "z") nil)
			  (local-set-key (kbd ":a") nil)
			  (local-set-key (kbd ":b") nil)
			  (local-set-key (kbd ":c") nil)
			  (local-set-key (kbd ":d") nil)
			  (local-set-key (kbd ":e") nil)
			  (local-set-key (kbd ":f") nil)
			  (local-set-key (kbd ":g") nil)
			  (local-set-key (kbd ":h") nil)
			  (local-set-key (kbd ":i") nil)
			  (local-set-key (kbd ":j") nil)
			  (local-set-key (kbd ":k") nil)
			  (local-set-key (kbd ":l") nil)
			  (local-set-key (kbd ":m") nil)
			  (local-set-key (kbd ":n") nil)
			  (local-set-key (kbd ":o") nil)
			  (local-set-key (kbd ":p") nil)
			  (local-set-key (kbd ":q") nil)
			  (local-set-key (kbd ":r") nil)
			  (local-set-key (kbd ":s") nil)
			  (local-set-key (kbd ":t") nil)
			  (local-set-key (kbd ":u") nil)
			  (local-set-key (kbd ":v") nil)
			  (local-set-key (kbd ":w") nil)
			  (local-set-key (kbd ":x") nil)
			  (local-set-key (kbd ":y") nil)
			  (local-set-key (kbd ":z") nil)
			  (local-set-key (kbd ":A") nil)
			  (local-set-key (kbd ":B") nil)
			  (local-set-key (kbd ":C") nil)
			  (local-set-key (kbd ":D") nil)
			  (local-set-key (kbd ":E") nil)
			  (local-set-key (kbd ":F") nil)
			  (local-set-key (kbd ":G") nil)
			  (local-set-key (kbd ":H") nil)
			  (local-set-key (kbd ":I") nil)
			  (local-set-key (kbd ":J") nil)
			  (local-set-key (kbd ":K") nil)
			  (local-set-key (kbd ":L") nil)
			  (local-set-key (kbd ":M") nil)
			  (local-set-key (kbd ":N") nil)
			  (local-set-key (kbd ":O") nil)
			  (local-set-key (kbd ":P") nil)
			  (local-set-key (kbd ":Q") nil)
			  (local-set-key (kbd ":R") nil)
			  (local-set-key (kbd ":S") nil)
			  (local-set-key (kbd ":T") nil)
			  (local-set-key (kbd ":U") nil)
			  (local-set-key (kbd ":V") nil)
			  (local-set-key (kbd ":W") nil)
			  (local-set-key (kbd ":X") nil)
			  (local-set-key (kbd ":Y") nil)
			  (local-set-key (kbd ":Z") nil)

			  (local-set-key (kbd "q") #'kill-this-buffer)
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
  (setenv "GIT_PAGER" "")
  (if (file-exists-p  "/usr/local/bin/emacsclient")
	  (setq magit-emacsclient-executable "/usr/local/bin/emacsclient")
	(setq magit-emacsclient-executable (executable-find "emacsclient"))))
(use-package magithub
  :after magit
  :ensure t
  :config (magithub-feature-autoinject t)
  :config (add-hook 'magit-mode-hook (lambda ()
									   (local-set-key (kbd "g") #'magithub-dispatch-popup))))
(use-package git-gutter-fringe
  :ensure t
  :config (set-face-foreground 'git-gutter-fr:modified "yellow")
  (set-face-foreground 'git-gutter-fr:added    "green")
  (set-face-foreground 'git-gutter-fr:deleted  "red")
  (global-git-gutter-mode +1))
(use-package git-timemachine
  :ensure t
  :config (evil-set-initial-state 'git-timemachine-mode 'emacs)
  (define-key git-timemachine-mode-map (kbd ",") #'git-timemachine-show-previous-revision)
  (define-key evil-normal-state-map (kbd "M") 'git-timemachine)
  (define-key git-timemachine-mode-map (kbd ".") #'git-timemachine-show-next-revision)
  (define-key git-timemachine-mode-map (kbd "q") #'git-timemachine-quit)
  (define-key git-timemachine-mode-map (kbd "n") nil)
  (define-key git-timemachine-mode-map (kbd "p") nil)
  (define-key git-timemachine-mode-map (kbd "b") nil))
(use-package git-messenger
  :ensure t
  :commands git-messenger:popup-message
  :config (setq git-messenger:show-detail t))
(use-package git-link
  :ensure t
  :config (define-key evil-normal-state-map (kbd "Y") 'git-link)
  (add-hook 'with-editor-mode-hook
			(lambda ()
			  (local-set-key (kbd "s") #'with-editor-finish)
			  (local-set-key (kbd "C-c C-c") nil))))
;;; git-stuff.el ends here
