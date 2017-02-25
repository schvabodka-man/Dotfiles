(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'ivy)
	 (package-refresh-contents)
     (package-install 'ivy))
(require 'ivy)
(ivy-mode)

(unless (package-installed-p 'magit)
	 (package-refresh-contents)
     (package-install 'magit))
(require 'magit)

(unless (package-installed-p 'company)
    (package-refresh-contents)
    (package-install 'company))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

(unless (package-installed-p 'yasnippet)
    (package-refresh-contents)
    (package-install 'yasnippet))
(require 'yasnippet)
(yas-global-mode 1)

;;use tabs instead of spaces
;; Turn on tabs
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)
;; Set the tab width
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)
;;clean tab not 4 spaces
(global-set-key (kbd "<backspace>") 'backward-delete-char)


  (global-set-key (kbd "<home>") 'beginning-of-buffer)
  (global-set-key (kbd "<end>") 'end-of-buffer)
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  (global-set-key (kbd "M-;") 'M-x)
  (global-set-key (kbd "M-w") 'helm-buffers-list)
  (global-set-key (kbd "M-S-q") 'kill-buffer)
  (global-set-key (kbd "M-o") 'find-file)
  (global-set-key (kbd "C-S-c") 'helm-colors)
  (global-set-key (kbd "C-s") 'save-buffer)
  (global-set-key (kbd "C-<home>") 'beginning-of-line)
  (global-set-key (kbd "C-<end>") 'end-of-line)
  (global-set-key (kbd "C-<left>") 'left-word)
  (global-set-key (kbd "C-<right>") 'right-word)
  (global-set-key (kbd "S-/") 'comment-line)
  (global-set-key (kbd "C-b") 'helm-bookmarks)
  ;; windows controls
  (global-set-key (kbd "M-,") 'split-window-horizontally)
  (global-set-key (kbd "M-.") 'split-window-vertically)
  (global-set-key (kbd "M-<up>") 'windmove-up)
  (global-set-key (kbd "M-<down>") 'windmove-down)
  (global-set-key (kbd "M-<left>") 'windmove-left)
  (global-set-key (kbd "M-<right>") 'windmove-right)
  (global-set-key (kbd "M-q") 'delete-window)
  (global-set-key (kbd "C-S-q") 'kill-this-buffer)

(defun put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
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

(set-default-font "Fira Mono 12")
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

(cua-mode t)
(setq cua-auto-tabify-rectangles nil)

(unless (package-installed-p 'seti-theme)
     (package-refresh-contents)
     (package-install 'seti-theme))
(load-theme 'seti t)

(unless (package-installed-p 'minimap)
    (package-refresh-contents)
    (package-install 'minimap))
(require 'minimap)
(global-set-key (kbd "M-m") 'minimap-mode)

(unless (package-installed-p 'neotree)
    (package-refresh-contents)
    (package-install 'neotree))
(require 'neotree)
(global-set-key (kbd "M-b") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'arrow 'arrow))

(unless (package-installed-p 'yascroll)
    (package-refresh-contents)
    (package-install 'yascroll))
(require 'yascroll)
(global-yascroll-bar-mode 1)

(unless (package-installed-p 'el-get)
    (package-refresh-contents)
    (package-install 'el-get))
(require 'el-get)

;;this is only for stuff like colors and org wiki
(unless (package-installed-p 'helm)
    (package-refresh-contents)
    (package-install 'helm))
(require 'helm)
(require 'helm-config)


(el-get-bundle org-wiki
  :url "https://raw.githubusercontent.com/caiorss/org-wiki/master/org-wiki.el"
  :description "Emacs' desktop wiki built with org-mode"
  :features org-wiki
  )
(require 'org-wiki)
(setq org-wiki-location "~/Dropbox/Org/Wiki")


(defalias 'wiki 'org-wiki-index)
(defalias 'commit 'magit-commit)
(defalias 'push 'magit-push)
(defalias 'pull 'magit-pull)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-buffer-name " MINIMAP")
 '(minimap-dedicated-window nil)
 '(minimap-hide-fringes t)
 '(minimap-hide-scroll-bar t)
 '(minimap-major-modes (quote (prog-mode)))
 '(minimap-mode nil)
 '(minimap-width-fraction 0.13)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
	(helm yasnippet yascroll seti-theme popup neotree minimap magit ivy el-get company)))
 '(yascroll:delay-to-hide nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#0e1112"))))
 '(company-scrollbar-fg ((t (:background "#FFFFFF"))))
 '(company-tooltip ((t (:background "#0e1112" :foreground "#FFFFFF"))))
 '(company-tooltip-common ((t (:foreground "#Ff0000"))))
 '(company-tooltip-selection ((t (:background "#FFFFFF" :foreground "#000000"))))
 '(highlight ((t (:background "#FFFFFF" :foreground "#000000"))))
 '(minimap-active-region-background ((t (:background "#0e1112"))))
 '(minimap-font-face ((t (:height 30 :family "Fira Mono"))))
 '(yascroll:thumb-face ((t (:background "white")))))
