;;; git-stuff.el --- git config

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package magit
  :ensure t)
(use-package git-gutter-fringe
  :ensure t
  :config (set-face-foreground 'git-gutter-fr:modified "yellow")
  (set-face-foreground 'git-gutter-fr:added    "green")
  (set-face-foreground 'git-gutter-fr:deleted  "red")
  (global-git-gutter-mode +1))
;;; git-stuff.el ends here
