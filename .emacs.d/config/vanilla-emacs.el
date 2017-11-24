(defun escape-key-work ()
  (interactive)
  (keyboard-escape-quit)
  (company-abort))
(global-set-key (kbd "<backspace>") 'backward-delete-char)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)
(global-set-key (kbd "<escape>") 'escape-key-work)
(global-set-key (kbd "C-S-q") 'kill-buffer)
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)
(define-key emacs-lisp-mode-map (kbd "<return>") 'newline-and-indent)
(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)
(global-set-key (kbd "M-x") nil)
(global-set-key (kbd "C-S-g") 'goto-line)
(global-set-key (kbd "C-/") 'comment-line)
;; (global-set-key (kbd "C-,") 'customize-group)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
;; windows controls
;; (global-set-key (kbd "M-n") (lambda ()
;; 							  (interactive)
;; 							  (split-window-horizontally)
;; 							  (other-window 1)))
;; (global-set-key (kbd "M-N") (lambda ()
;; 							  (interactive)
;; 							  (split-window-vertically)
;; 							  (other-window 1)))
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-q") 'delete-window)
(global-set-key (kbd "C-q") 'kill-this-buffer)
(global-set-key (kbd "M-r") 'revert-buffer)

(global-set-key (kbd "M-u") nil)
(global-set-key (kbd "M-l") nil)

(global-set-key (kbd "C-\\") 'upcase-region)
(global-set-key (kbd "C-S-\\") 'downcase-region)

;; (global-set-key (kbd "TAB") 'self-insert-command)
;;bookmark set
(global-set-key (kbd "C-M-b") 'bookmark-set)
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
(global-set-key (kbd "C-b") 'indent-buffers)
(defun indent-and-save ()
  (interactive)
  (indent-buffers)
  (save-buffer))
(global-set-key (kbd "C-s") 'indent-and-save)
(add-hook 'conf-space-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-s") #'save-buffer)))
(add-hook 'yaml-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-s") #'save-buffer)))
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
(global-set-key (kbd "C-y") 'put-file-name-on-clipboard)

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
(set-default-font "Fira Mono for Powerline 12")
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
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(electric-indent-mode)
;;vim like selection
(transient-mark-mode 1)
(global-set-key (kbd "<M-SPC>") 'cua-rectangle-mark-mode)
(global-set-key (kbd "<C-SPC>") 'cua-set-mark)
;;nice selection
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
(define-key emacs-lisp-mode-map (kbd "C-S-e") #'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-e") #'eval-region)
;;run without promt yes or no. From here 
;;https://emacs.stackexchange.com/questions/19077/how-to-programmatically-answer-yes-to-those-commands-that-prompt-for-a-decisio
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

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-M-o") 'sudo-edit)
(defalias 'su-edit 'sudo-edit)
(defalias 'root-edit 'sudo-edit)
(defalias 'superuser-edit 'sudo-edit)
(defalias 'edit-sudo 'sudo-edit)
(defalias 'edit-su 'sudo-edit)
(defalias 'edit-root 'sudo-edit)
(defalias 'edit-superuser 'sudo-edit)

(defun my-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun my-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (my-delete-word (- arg)))

(defun my-delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(defun my-delete-line-backward ()
  "Delete text between the beginning of the line to the cursor position.
This command does not push text to `kill-ring'."
  (interactive)
  (let (p1 p2)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2)))

(global-set-key (kbd "C-k") 'my-delete-line-backward) 
(global-set-key (kbd "C-S-k") 'my-delete-line)
(global-set-key (kbd "<C-delete>") 'my-delete-word)
(global-set-key (kbd "<C-backspace>") 'my-backward-delete-word)

;;from this thread https://emacs.stackexchange.com/questions/7653/elisp-code-to-check-for-internet-connection
(defun internet-up-p (&optional host)
  (= 0 (call-process "ping" nil nil nil "-c" "1" "-W" "1" 
					 (if host host "www.google.com"))))
(defun null-all-bindings ()
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
  (local-set-key (kbd "a") nil)
  (local-set-key (kbd "b") nil)
  (local-set-key (kbd "c") nil)
  (local-set-key (kbd "d") nil)
  (local-set-key (kbd "e") nil)
  (local-set-key (kbd "f") nil)
  (local-set-key (kbd "g") nil)
  (local-set-key (kbd "h") nil)
  (local-set-key (kbd "i") nil)
  (local-set-key (kbd "j") nil)
  (local-set-key (kbd "k") nil)
  (local-set-key (kbd "l") nil)
  (local-set-key (kbd "m") nil)
  (local-set-key (kbd "n") nil)
  (local-set-key (kbd "o") nil)
  (local-set-key (kbd "p") nil)
  (local-set-key (kbd "q") nil)
  (local-set-key (kbd "r") nil)
  (local-set-key (kbd "s") nil)
  (local-set-key (kbd "t") nil)
  (local-set-key (kbd "u") nil)
  (local-set-key (kbd "v") nil)
  (local-set-key (kbd "w") nil)
  (local-set-key (kbd "x") nil)
  (local-set-key (kbd "y") nil)
  (local-set-key (kbd "z") nil)
  (local-set-key (kbd "]") nil)
  (local-set-key (kbd "[") nil))
;;auto indent copypasted
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
		   (and (not current-prefix-arg)
				(member major-mode '(emacs-lisp-mode lisp-mode
													 clojure-mode    scheme-mode
													 haskell-mode    ruby-mode
													 rspec-mode      python-mode
													 c-mode          c++-mode
													 objc-mode       latex-mode
													 plain-tex-mode))
				(let ((mark-even-if-inactive transient-mark-mode))
				  (indent-region (region-beginning) (region-end) nil))))))
;;ssh instead of some old crap
(setq tramp-default-method "ssh")
;;scroll speed
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
;;focus follows mouse
(setq mouse-autoselect-window t)
;;resizing windows
(global-set-key (kbd "s-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<up>") 'enlarge-window)
(defalias 'resize-window-right 'shrink-window-horizontally)
(defalias 'resize-window-left 'enlarge-window-horizontally)
(defalias 'resize-window-down 'shrink-window)
(defalias 'resize-window-up 'enlarge-window)
;;backtrace on error
;;(setq debug-on-error t)
;;nice frame names
(setq-default frame-title-format '("%f [%m]"))
