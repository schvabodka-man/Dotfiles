(defun escape-key-work ()
  (interactive)
  (keyboard-escape-quit)
  (company-abort))
;; (global-set-key (kbd "<backspace>") 'backward-delete-char)
;; (global-set-key (kbd "<home>") 'beginning-of-buffer)
;; (global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<escape>") 'escape-key-work)
;; (global-set-key (kbd "M-;") 'execute-extended-command)
;; (global-set-key (kbd "C-S-q") 'kill-buffer)
;; (global-set-key (kbd "C-<home>") 'beginning-of-line)
;; (global-set-key (kbd "C-<end>") 'end-of-line)
;; (global-set-key (kbd "C-<left>") 'left-word)
;; (global-set-key (kbd "C-<right>") 'right-word)
;; (global-set-key (kbd "C-/") 'comment-line)
;; (global-set-key (kbd "M-,") 'customize-group)
;; (global-set-key (kbd "C-a") 'mark-whole-buffer)
;; windows controls
(global-set-key (kbd "M-n") (lambda ()
							  (interactive)
							  (split-window-horizontally)
							  (other-window 1)))
(global-set-key (kbd "M-N") (lambda ()
							  (interactive)
							  (split-window-vertically)
							  (other-window 1)))
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-q") 'delete-window)
(global-set-key (kbd "M-x") nil)
;; (global-set-key (kbd "C-q") 'kill-this-buffer)
;; (global-set-key (kbd "TAB") 'self-insert-command)
;;redone backspace and del
;; (global-set-key (kbd "C-<backspace>") 'ivy-backward-kill-word)
;;bookmark set
;; (global-set-key (kbd "M-B") 'bookmark-set)
;;opening new scratch buffer
(defun make-new-buffer ()
  (interactive)
  (let (($buf (generate-new-buffer "*scratch*")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))
(global-set-key (kbd "<M-return>") 'make-new-buffer)

;;custom funcs and aliases
(defun indent-buffers ()
  (interactive)
  (indent-region (point-min) (point-max)))
(defalias 'beautify 'indent-all)
;; (global-set-key (kbd "C-b") 'indent-buffers)
(defun indent-and-save ()
  (interactive)
  (indent-buffers)
  (save-buffer))
;; (global-set-key (kbd "C-s") 'indent-and-save)
;; (add-hook 'conf-space-mode-hook
;; 		  (lambda ()
;; 			(local-set-key (kbd "C-s") #'save-buffer)))
;; (add-hook 'yaml-mode-hook
;; 		  (lambda ()
;; 			(local-set-key (kbd "C-s") #'save-buffer)))
(defun put-file-name-on-clipboard ()
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
					  default-directory
					(buffer-file-name))))
	(when filename
	  (with-temp-buffer
		(insert filename)
		(clipboard-kill-region (point-min) (point-max)))
	  (message filename))))
;; (global-set-key (kbd "C-y") 'put-file-name-on-clipboard)
(defun ctrl-l-line-select ()
  (interactive)
  (move-beginning-of-line nil)
  (set-mark (point))
  (activate-mark)
  (move-end-of-line nil))

(defun kill-other-buffers ()
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
;;fast aliases
(defalias 'open-in-browser 'browse-url-of-file)
(defalias 'browser-preview 'browse-url-of-file)
;;look and feel
(set-default-font "Fura Mono Powerline 12")
(setq-default cursor-type 'bar) 
(set-cursor-color "#ffffff") 
(blink-cursor-mode 0)
(menu-bar-mode -1)
(tool-bar-mode -1) 
(toggle-scroll-bar -1)
(show-paren-mode 1)
(setq inhibit-startup-screen t)
(desktop-save-mode 1)
(setq word-wrap t)
(global-visual-line-mode t)
(electric-pair-mode)
(setq suggest-key-bindings nil)
(setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "qutebrowser")
;; killing messages buffer
(kill-buffer "*Messages*")
(setq initial-scratch-message nil)
;;y or n
(fset 'yes-or-no-p 'y-or-n-p)
;;use tabs instead of spaces
;; Turn on tabs
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)
;; Set the tab width
(setq default-tab-width 4)
(setq tabwidth 4)
(setq c-basic-indent 4)
;;nice windows undo redo
(when (fboundp 'winner-mode)
  (winner-mode 1))
(global-set-key (kbd "M-z") 'winner-undo)
(global-set-key (kbd "M-Z") 'winner-redo)
;;cua mode
;;(cua-mode t)
;;(setq cua-auto-tabify-rectangles nil)
(electric-indent-mode)
;;pretty symbols
(defalias 'beautiful-symbols-mode 'prettify-symbols-mode)
(defalias 'beautiful-characters-mode 'prettify-symbols-mode)
(defalias 'beautiful-chars-mode 'prettify-symbols-mode)
(defalias 'prettify-characters-mode 'prettify-symbols-mode)
(defalias 'prettify-chars-mode 'prettify-symbols-mode)
(global-prettify-symbols-mode +1)
(add-hook 'prog-mode-hook
		  (lambda ()
			(push '(">=" . ?≥) prettify-symbols-alist)
			(push '("<=" . ?≤) prettify-symbols-alist)
			(push '("->" . ?→) prettify-symbols-alist)
			(push '("<-" . ?←) prettify-symbols-alist)
			(push '("=!" . ?≠) prettify-symbols-alist)
			(push '("!=" . ?≠) prettify-symbols-alist)
			(push '("=/=" . ?≠) prettify-symbols-alist)
			(push '("==" . ?≡) prettify-symbols-alist)
			(push '("lambda" . ?λ) prettify-symbols-alist)))
(add-hook 'text-mode-hook
		  (lambda ()
			(push '(">=" . ?≥) prettify-symbols-alist)
			(push '("<=" . ?≥) prettify-symbols-alist)
			(push '("->" . ?→) prettify-symbols-alist)
			(push '("<-" . ?←) prettify-symbols-alist)
			(push '("=!" . ?≠) prettify-symbols-alist)
			(push '("!=" . ?≠) prettify-symbols-alist)
			(push '("=/=" . ?≠) prettify-symbols-alist)
			(push '("==" . ?≡) prettify-symbols-alist)
			(push '("lambda" . ?λ) prettify-symbols-alist)))

;;backups and auto saves. no cluttering
(setq backup-directory-alist '(("." . "~/.emacs.d/Backup")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/Autosave" t)))
;;run without promt yes or no. From here https://emacs.stackexchange.com/questions/19077/how-to-programmatically-answer-yes-to-those-commands-that-prompt-for-a-decisio
(defmacro my/with-advice (adlist &rest body)
  "Execute BODY with temporary advice in ADLIST.

Each element of ADLIST should be a list of the form
  (SYMBOL WHERE FUNCTION [PROPS])
suitable for passing to `advice-add'.  The BODY is wrapped in an
`unwind-protect' form, so the advice will be removed even in the
event of an error or nonlocal exit."
  (declare (debug ((&rest (&rest form)) body))
           (indent 1))
  `(progn
     ,@(mapcar (lambda (adform)
                 (cons 'advice-add adform))
               adlist)
     (unwind-protect (progn ,@body)
       ,@(mapcar (lambda (adform)
                   `(advice-remove ,(car adform) ,(nth 2 adform)))
                 adlist))))

(defun my/bypass-confirmation-all (function &rest args)
  "Call FUNCTION with ARGS, bypassing all prompts.
This includes both `y-or-n-p' and `yes-or-no-p'."
  (my/with-advice
	  ((#'y-or-n-p    :override (lambda (prompt) t))
	   (#'yes-or-no-p :override (lambda (prompt) t)))
	(apply function args)))
