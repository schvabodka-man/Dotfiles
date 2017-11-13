;;; org-config --- My emacs config for org-mode
;;; Commentary:
;;; MUH ORG-MODE
;;; Code:
(setq org-agenda-files (list "~/Dropbox/Org/Agenda/Todo"
							 "~/Dropbox/Org/Agenda/Util"
							 "~/Dropbox/Org/Agenda/Diary"))
(setq org-archive-location "~/Dropbox/Org/Wiki/Agenda/Archive/todo.org::* TASKS")
(setq org-support-shift-select t)
(setq org-startup-with-inline-images t)
(defalias 'todo 'org-todo-list)
(defalias 'agenda 'org-agenda-list)
(defalias 'year 'org-agenda-year-view)
(defalias 'month 'org-agenda-month-view)
(defalias 'week 'org-agenda-week-view)
(defalias 'day 'org-agenda-day-view)
(defalias 'org-time 'org-time-stamp)

(add-hook 'org-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-t") 'org-time-stamp)
			(local-set-key (kbd "M-\\") 'org-shiftright)
			(local-set-key (kbd "M-f") 'deft-find-file)
			(local-set-key (kbd "M-S-f") 'deft)
			(local-set-key (kbd "<S-left>") nil)
			(local-set-key (kbd "<S-right>") nil)
			(local-set-key (kbd "<S-up>") nil)
			(local-set-key (kbd "<S-down>") nil)
			))
(add-hook 'org-agenda-mode-hook
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
			(local-set-key (kbd "P") nil)
			(local-set-key (kbd "Q") nil)
			(local-set-key (kbd "R") nil)
			(local-set-key (kbd "S") nil)
			(local-set-key (kbd "T") nil)
			(local-set-key (kbd "U") nil)
			(local-set-key (kbd "V") nil)
			(local-set-key (kbd "W") nil)
			(local-set-key (kbd "X") nil)
			(local-set-key (kbd "Y") nil)
			(local-set-key (kbd "Z") nil)
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
			(local-set-key (kbd "P") nil)
			(local-set-key (kbd "Q") nil)
			(local-set-key (kbd "R") nil)
			(local-set-key (kbd "S") nil)
			(local-set-key (kbd "T") nil)
			(local-set-key (kbd "U") nil)
			(local-set-key (kbd "V") nil)
			(local-set-key (kbd "W") nil)
			(local-set-key (kbd "X") nil)
			(local-set-key (kbd "Y") nil)
			(local-set-key (kbd "Z") nil)
			(local-set-key (kbd "a") nil)
			(local-set-key (kbd "b") nil)
			(local-set-key (kbd "c") nil)
			(local-set-key (kbd "e") nil)
			(local-set-key (kbd "f") nil)
			(local-set-key (kbd "g") nil)
			(local-set-key (kbd "h") nil)
			(local-set-key (kbd "i") nil)
			(local-set-key (kbd "j") nil)
			(local-set-key (kbd "k") nil)
			(local-set-key (kbd "l") nil)
			(local-set-key (kbd "n") nil)
			(local-set-key (kbd "o") nil)
			(local-set-key (kbd "p") nil)
			(local-set-key (kbd "q") nil)
			(local-set-key (kbd "r") nil)
			(local-set-key (kbd "s") nil)
			(local-set-key (kbd "t") nil)
			(local-set-key (kbd "u") nil)
			(local-set-key (kbd "v") nil)
			(local-set-key (kbd "x") nil)
			(local-set-key (kbd "z") nil)
			
			(local-set-key (kbd "m") #'org-agenda-month-view)
			(local-set-key (kbd "y") #'org-agenda-year-view)
			(local-set-key (kbd "C-g") #'org-agenda-goto-date)
			(local-set-key (kbd "<return>") #'org-agenda-goto)
			(local-set-key (kbd "M-f") #'org-agenda-filter-by-tag)
			(local-set-key (kbd "C-S-f") #'org-agenda-filter-by-regexp)
			(local-set-key (kbd "M-i") #'org-attach)
			(local-set-key (kbd "C-e") #'org-agenda-archive)
			(local-set-key (kbd "M-\\") #'org-agenda-todo)
			(local-set-key (kbd "C-m") #'org-agenda-bulk-mark)
			(local-set-key (kbd "C-S-m") #'org-agenda-bulk-mark-all)
			(local-set-key (kbd "C-u") #'org-agenda-bulk-unmark)
			(local-set-key (kbd "C-S-u") #'org-agenda-bulk-unmark-all)
			(local-set-key (kbd "M-z") #'org-agenda-undo)
			(local-set-key (kbd "M-Z") #'org-agenda-redo)))
;;diary
(use-package org-journal
  :ensure t
  :pin melpa-stable
  :config
  (setq org-journal-dir (expand-file-name "/home/user/Dropbox/Org/Agenda/Diary"))
  (setq org-journal-date-format '"<%Y-%m-%d %a>")
  (setq org-journal-time-format '"<%Y-%m-%d %a %R>")
  (setq org-journal-file-format '"%Y-%m-%d.org")
  (defalias 'now 'org-journal-new-entry))
;;nice org mode bullets
(use-package org-bullets
  :ensure t
  :pin melpa-stable
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package org-download
  :ensure t
  :pin melpa-stable)
;;like pinboard 
(use-package org-board
  :ensure t
  :pin melpa-stable
  :config 
  (defalias 'org-board-save 'org-board-new)
  (defalias 'org-link-new 'org-board-new)
  (defalias 'org-link-save 'org-board-new)
  (defalias 'org-link-add 'org-board-new)
  (defalias 'org-url-save 'org-board-new)
  (defalias 'org-uri-save 'org-board-new)
  (defalias 'org-url-new 'org-board-new)
  (defalias 'org-uri-new 'org-board-new)
  (defalias 'org-url-add 'org-board-new)
  (defalias 'org-uri-add 'org-board-new)
  (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-M-i") #'org-board-new))))
;;some search improvements for org mode
(use-package deft
  :ensure t
  :pin melpa-stable
  :bind ("C-M-f" . deft)
  :config (setq deft-extensions '("txt" "org" "md"))
  (setq deft-directory "~/Dropbox/Org/")
  (setq deft-recursive t)
  (defalias 'org-find 'deft)
  (defalias 'org-find-files 'deft-find-file)
  (defalias 'org-find-files 'deft-find-file)
  (defalias 'org-search-file 'deft-find-file)
  (defalias 'org-search 'deft)
  (defalias 'org-search-files 'deft-find-file)
  (deft-setup))
(use-package calfw
  :ensure t
  :pin melpa-stable
  :config (add-hook 'cfw:calendar-mode-hook
					(lambda () (local-set-key (kbd "d") #'cfw:change-view-day)
					  (local-set-key (kbd "w") #'cfw:change-view-week)
					  (local-set-key (kbd "W") #'cfw:change-view-two-weeks)
					  (local-set-key (kbd "m") #'cfw:change-view-month)
					  (local-set-key (kbd "]") #'cfw:navi-next-month-command)
					  (local-set-key (kbd "[") #'cfw:navi-previous-month-command)
					  (local-set-key (kbd ",") #'cfw:navi-previous-week-command)
					  (local-set-key (kbd ".") #'cfw:navi-next-week-command)
					  (local-set-key (kbd "C-<left>") #'cfw:navi-prev-item-command)
					  (local-set-key (kbd "C-<right>") #'cfw:navi-next-item-command)
					  (local-set-key (kbd "C-<up>") #'cfw:navi-prev-item-command)
					  (local-set-key (kbd "C-<down>") #'cfw:navi-next-item-command)))) 
(use-package calfw-org
  :ensure t
  :pin melpa-stable
  :config (defalias 'cal 'cfw:open-org-calendar)
  (defalias 'calendar-org 'cfw:open-org-calendar))
;; org-config.el ends here
