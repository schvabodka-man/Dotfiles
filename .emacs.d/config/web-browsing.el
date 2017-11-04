;;; web-browsing.el --- w3m and stuff

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package w3m
  :ensure t
  :config (defun w3m-enable-cookies ()
			(interactive)
			(setq w3m-use-cookies t))
  (defun w3m-disable-cookies ()
	(interactive)
	(setq w3m-use-cookies nil))
  (setq w3m-use-cookies nil)
  (defalias 'w3m-cookies-disable 'w3m-disable-cookies)
  (defalias 'w3m-cookies-enable 'w3m-enable-cookies)
  (setq w3m-coding-system 'utf-8
		w3m-file-coding-system 'utf-8
		w3m-file-name-coding-system 'utf-8
		w3m-input-coding-system 'utf-8
		w3m-output-coding-system 'utf-8
		w3m-terminal-coding-system 'utf-8)
  (add-hook 'w3m-mode-hook
			(lambda ()
			  (null-all-bindings)))
  (define-key w3m-mode-map (kbd "<M-return>") #'w3m-create-empty-session)
  (define-key w3m-mode-map (kbd "<C-return>") #'w3m-submit-form)
  (define-key w3m-mode-map (kbd "M-.") #'w3m-tab-next-buffer)
  (define-key w3m-mode-map (kbd "M-,") #'w3m-tab-previous-buffer)
  (define-key w3m-mode-map (kbd "M-S-.") #'w3m-tab-move-right)
  (define-key w3m-mode-map (kbd "M-S-,") #'w3m-tab-move-left)
  (define-key w3m-mode-map (kbd "<S-return>") #'w3m-view-this-url-new-session)
  (define-key w3m-mode-map (kbd "<right>") #'right-char)
  (define-key w3m-mode-map (kbd "<left>") #'left-char)
  (define-key w3m-mode-map (kbd "<up>") #'previous-line)
  (define-key w3m-mode-map (kbd "<down>") #'next-line)
  (define-key w3m-mode-map (kbd "<C-up>") #'w3m-previous-anchor)
  (define-key w3m-mode-map (kbd "<C-down>") #'w3m-next-anchor)
  (define-key w3m-mode-map (kbd "M-o") #'w3m-goto-url)
  (define-key w3m-mode-map (kbd "M-r") #'w3m-reload-this-page)
  (define-key w3m-mode-map (kbd "M-S-r") #'w3m-reload-all-pages)
  (define-key w3m-mode-map (kbd "C-M-o") #'w3m-goto-url-new-session))
(el-get-bundle q4
  :url "https://github.com/desvox/q4.git")
(load "~/.emacs.d/el-get/q4/q4")
(defalias '4chan 'q4/browse-board)
(defalias '4chan-boards 'q4/board-overview)
(add-hook 'q4-mode-hook
		  (lambda ()
			(null-all-bindings)))
(define-key q4-mode-map (kbd "M-r") #'q4/refresh-page)
(define-key q4-mode-map (kbd "<return>") #'q4/open-item)
(define-key q4-mode-map (kbd "<C-up>") #'q4/point-to-previous-post)
(define-key q4-mode-map (kbd "<C-down>") #'q4/point-to-next-post)
(define-key q4-mode-map (kbd ",") #'q4/point-to-previous-post)
(define-key q4-mode-map (kbd ".") #'q4/point-to-next-post)
(define-key q4-mode-map (kbd "C-y") #'q4/list-urls)
(define-key q4-mode-map (kbd "M-|") #'q4/show-replies)
(define-key q4-mode-map (kbd "M-\\") #'q4/expand-quotes)
(define-key q4-mode-map (kbd "C-M-\\") #'q4/unexpand-quotes)
(define-key q4-mode-map (kbd "C-q") #'q4/go-back)
;; (el-get-bundle w3m-session
;;   :url "https://www.emacswiki.org/emacs/download/w3m-session.el")
;; (load "~/.emacs.d/el-get/w3m-session/w3m-session")
;; (setq w3m-session-file "~/.emacs.d/w3m-session")
;; (setq w3m-session-save-always nil)
;; (setq w3m-session-load-always t)
;; (setq w3m-session-show-titles t)
;; (setq w3m-session-duplicate-tabs 'never)
;;; web-browsing.el ends here
