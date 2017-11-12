;;; contacts.el --- contacts man.

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(el-get-bundle org-contacts
  :url "http://orgmode.org/w/?p=org-mode.git;a=blob_plain;f=contrib/lisp/org-contacts.el")
(load "~/.emacs.d/el-get/org-contacts/org-contacts")
(setq org-contacts-files (list "~/Dropbox/Org/Contacts/Contacts.org"))
(defalias 'contacts 'org-contacts)
;;; contacts.el ends here
