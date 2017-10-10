;;; sauron-notify.el --- sauron notifications system

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package sauron
  :ensure t
  :pin melpa-stable
  :bind ("M-s" . sauron-toggle-hide-show)
  :init (sauron-start-hidden)
  :commands (sauron-toggle-hide-show)
  :config (setq sauron-separate-frame nil)
  (setq sauron-hide-mode-line t))
;;; sauron-notify.el ends here
