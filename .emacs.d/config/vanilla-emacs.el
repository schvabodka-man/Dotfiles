(global-set-key (kbd "<backspace>") 'backward-delete-char)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "M-;") 'execute-extended-command)
(global-set-key (kbd "M-S-q") 'kill-buffer)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-M-f") 'list-matching-lines)
(global-set-key (kbd "C-<home>") 'beginning-of-line)
(global-set-key (kbd "C-<end>") 'end-of-line)
(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-g") 'goto-line)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "TAB") 'self-insert-command)
;; windows controls
(global-set-key (kbd "M-n") 'split-window-horizontally)
(global-set-key (kbd "M-N") 'split-window-vertically)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-q") 'delete-window)
(global-set-key (kbd "C-S-q") 'kill-this-buffer)
;;redone backspace and del
(global-set-key (kbd "C-<backspace>") 'ivy-backward-kill-word)
;;bookmark set
(global-set-key (kbd "M-B") 'bookmark-set)
;;opening new scratch buffer
(defun make-new-buffer ()
  (interactive)
  (let (($buf (generate-new-buffer "*scratch*")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))
(global-set-key (kbd "M-~") 'make-new-buffer)

;;custom funcs and aliases
(defun indent-all ()
  (interactive)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-b") 'indent-all)
(defalias 'beautify 'indent-all)

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
(global-set-key (kbd "C-u") 'put-file-name-on-clipboard)

(global-set-key (kbd "C-l")
				(defun ctrl-l-line-select ()
				  (interactive)
				  (move-beginning-of-line nil)
				  (set-mark (point))
				  (activate-mark)
				  (move-end-of-line nil)))

(defun kill-other-buffers ()
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(global-set-key (kbd "C-S-M-q") 'kill-other-buffers)
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
(global-linum-mode t)
(setq inhibit-startup-screen t)
(desktop-save-mode 1)
(setq word-wrap t)
(global-visual-line-mode t)
(electric-pair-mode)
(setq suggest-key-bindings nil)
(setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "luakit")
;; killing messages buffer
(setq-default message-log-max nil)
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
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(electric-indent-mode)
