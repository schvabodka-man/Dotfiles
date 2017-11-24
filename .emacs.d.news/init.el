;;; init.el ---

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(setq user-init-file "~/.emacs.d.news/init.el")
(setq user-emacs-directory "~/.emacs.d.news")
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("melpa-stable" . "https://stable.melpa.org/packages/")
						 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(package-refresh-contents)
(use-package org
  :ensure t
  :pin melpa-stable)
(use-package elfeed
  :ensure t)
(use-package elfeed-org
  :ensure t
  :config (setq rmh-elfeed-org-files (list "~/Org/Util/Rss.org"))
  (elfeed-org))
(defun bjm/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (print "Saving db")
  (elfeed-db-save)
  (quit-window))
(defun bjm/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (print "Loading db")
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force)
  (elfeed-update))
(defun bjm/elfeed-updater ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (print "Updating feed")
  (elfeed-db-save)
  (quit-window)
  (elfeed-db-load)
  (elfeed)
  (elfeed-update)
  (print "Done"))
(bjm/elfeed-updater)
(run-with-timer 0 (* 10 60) 'bjm/elfeed-updater)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (elfeed-org elfeed use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
