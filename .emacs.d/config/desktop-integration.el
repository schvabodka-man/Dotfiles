;;; desktop-integration.el --- functions for neat integration

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(defun lock ()
  (interactive)
  (shell-command "i3lock -c \"0e1112\""))
(defalias 'desktop-lock 'lock)
(defalias 'lock-desktop 'lock)
;;; desktop-integration.el ends here
