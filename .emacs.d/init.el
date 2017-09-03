;;; init --- My emacs config
;;; Commentary:
;;; MUH EMACS
;;; Code:
;;gc tweaks
(setq gc-cons-threshold 100000000)
;;stuff
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("marmalade" . "http://marmalade-repo.org/packages/")
						 ("melpa-stable" . "https://stable.melpa.org/packages/")
						 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(load "~/.emacs.d/config/big-frameworks")
;;keybindings
(load "~/.emacs.d/config/vanilla-emacs")
;;for editing fish scripts
(load "~/.emacs.d/config/shell-scripting")
;;undo redo
(load "~/.emacs.d/config/undo-redo-tree")
;;for markdown
(load "~/.emacs.d/config/markdown-editing")
;;some quick stuff
(load "~/.emacs.d/config/editing-addons")
;;org mode
(load "~/.emacs.d/config/org-config")
;;rice
(load "~/.emacs.d/config/visuals-rice")
;;google services
(load "~/.emacs.d/config/google-botnet")
;;useless
(load "~/.emacs.d/config/useless")
;;weather reports
(load "~/.emacs.d/config/weather-reports")
;;small but really useful
(load "~/.emacs.d/config/small-but-useful")
;;time to play some games!
(load "~/.emacs.d/config/good-games")
;;docker
(load "~/.emacs.d/config/docker-integration")
;;monitoring
(load "~/.emacs.d/config/system-monitoring")
;;books
(load "~/.emacs.d/config/book-reading")
;;integrations
(load "~/.emacs.d/config/various-integration")
;;brainfuck unironically. i like brainfuck because of its simplicity
(load "~/.emacs.d/config/brainfuck-devel")
;;live preview for web
(load "~/.emacs.d/config/html-live-editing")
;;js development
(load "~/.emacs.d/config/javascript-setup")
;;project management
(load "~/.emacs.d/config/projects-management.el")
;;yaml mode
(load "~/.emacs.d/config/yaml-editing")
;;beautiful dashboard on startup
(load "~/.emacs.d/config/dashboard-startup")
;;jvm shit for memelords
(load "~/.emacs.d/config/jvm-languages")
;;lua mode
(load "~/.emacs.d/config/lua-config")
;;for HUUUGE files
(load "~/.emacs.d/config/very-large-files")
;;really good query replace
(load "~/.emacs.d/config/improved-replace")
;;multiple workspaces and tabbing
(load "~/.emacs.d/config/windowing-config")
;;music
(load "~/.emacs.d/config/emms-config")
;;spell checking
(load "~/.emacs.d/config/syntax-gram-checking")
;;gnus shit not in .gnusrc
(load "~/.emacs.d/config/gnus-init")
;;eshell
(load "~/.emacs.d/config/eshell")
;;packages
(load "~/.emacs.d/config/package-managing")
;;dired
(load "~/.emacs.d/config/dired-config")

;;byte compile everything
(defun byte-compile-init-dir ()
  "Byte-compile all your dotfiles."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))
(byte-compile-init-dir)
;;gc on emacs idle
(run-with-idle-timer 2 t (lambda () (garbage-collect)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 0)
 '(company-shell-modes (quote (sh-mode fish-mode)))
 '(dired-filter-saved-filters
   (quote
	(("Emacs Lisp"
	  (extension . "el")
	  (omit))
	 ("Pictures"
	  (extension "jpg" "jpeg" "raw" "png" "gif" "tiff" "svg" "bmp")
	  (omit))
	 ("Images"
	  (extension "jpg" "jpeg" "raw" "png" "gif" "tiff" "svg" "bmp")
	  (omit))
	 ("Video"
	  (extension "mp4" "wmv" "avi" "flv" "mkv" "3gp" "rm" "ogv" "mov" "webm")
	  (omit))
	 ("Music"
	  (extension "mp3" "flac" "alac" "wav" "wv" "ape" "ogg" "midi" "aac")
	  (omit))
	 ("Java"
	  (extension "aj" "java" "jsp")
	  (omit))
	 ("JavaScript"
	  (extension . "js")
	  (omit))
	 ("HTML"
	  (extension "html" "jsp")
	  (omit))
	 ("CSS"
	  (extension "css" "less" "sass" "scss")
	  (omit))
	 ("HTML/CSS"
	  (extension "html" "css" "jsp" "sass" "scss" "less")
	  (omit))
	 ("Clojure"
	  (extension "clj" "cljs")
	  (omit))
	 ("Scala"
	  (extension "sbt" "scala")
	  (omit))
	 ("Shell scripts"
	  (extension "sh" "fish")
	  (omit))
	 ("Gradle"
	  (extension "properties" "gradle" "bat")
	  (omit))
	 (#("XML" 0 1
		(idx 0))
	  (extension . "xml")
	  (omit)))))
 '(diredp-image-preview-in-tooltip 300)
 '(diredp-image-show-this-file-use-frame-flag t)
 '(ensime-company-idle-delay 0.1)
 '(ensime-graphical-tooltips t)
 '(ensime-search-interface (quote helm))
 '(ensime-typecheck-idle-interval 1)
 '(ensime-typecheck-interval 1)
 '(global-undo-tree-mode t)
 '(highlight-thing-case-sensitive-p t)
 '(highlight-thing-delay-seconds 0.1)
 '(highlight-thing-exclude-thing-under-point t)
 '(highlight-thing-excluded-major-modes
   (quote
	(Custom-mode org-agenda-mode cfw:calendar-mode minibuffer-inactive-mode eshell-mode shell-mode emms-playlist-mode)))
 '(highlight-thing-what-thing (quote word))
 '(httpd-port 8088)
 '(js2-highlight-level 3)
 '(js2-idle-timer-delay 0.1)
 '(js2-include-node-externs t)
 '(js2-include-rhino-externs t)
 '(js2-instanceof-has-side-effects t)
 '(meghanada-debug t)
 '(meghanada-server-remote-debug t)
 '(minimap-buffer-name " MINIMAP")
 '(minimap-dedicated-window nil)
 '(minimap-hide-fringes t)
 '(minimap-hide-scroll-bar t)
 '(minimap-major-modes (quote (prog-mode)))
 '(minimap-mode nil)
 '(minimap-width-fraction 0.13)
 '(minimap-window-location (quote right))
 '(multi-eshell-name "*eshell*")
 '(multi-eshell-shell-function (quote (eshell)))
 '(neo-theme (quote icons))
 '(org-agenda-confirm-kill t)
 '(package-selected-packages
   (quote
	(nnir helm yasnippet yascroll seti-theme popup neotree minimap magit ivy el-get company)))
 '(paradox-github-token t)
 '(projectile-globally-ignored-directories
   (quote
	(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "gradle" ".gradle" ".meghanada" "build" "out" "libs" "target" ".mvn" "el-get" "elpa" "auto-save-list" "project")))
 '(projectile-globally-ignored-files
   (quote
	("TAGS" ".gitignore" ".projectile" ".ensime" "mvnw" "gradlew" "gradlew.bat" "mvnw.cmd")))
 '(send-mail-function (quote smtpmail-send-it))
 '(spaceline-all-the-icons-highlight-file-name t)
 '(sr-speedbar-right-side nil)
 '(symon-delay 0)
 '(symon-mode t)
 '(symon-monitors
   (quote
	(symon-linux-network-rx-monitor symon-linux-network-tx-monitor time-date)))
 '(symon-sparkline-thickness 1)
 '(symon-sparkline-type (quote plain))
 '(vlf-application (quote dont-ask))
 '(yahoo-weather-location "Uzhhorod")
 '(yahoo-weather-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "firebrick" :foreground "white"))))
 '(bm-fringe-persistent-face ((t (:background "forest green" :foreground "white"))))
 '(bm-persistent-face ((t (:background "forest green" :foreground "white"))))
 '(cfw:face-grid ((t (:foreground "white"))))
 '(cfw:face-toolbar ((t (:foreground "white"))))
 '(cfw:face-toolbar-button-off ((t (:foreground "white" :weight bold))))
 '(company-preview ((t (:foreground "gold"))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-preview-search ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "#0e1112"))))
 '(company-scrollbar-fg ((t (:background "#FFFFFF"))))
 '(company-template-field ((t (:foreground "gold"))))
 '(company-tooltip ((t (:background "#0e1112" :foreground "#FFFFFF"))))
 '(company-tooltip-annotation ((t (:foreground "gold"))))
 '(company-tooltip-annotation-selection ((t (:foreground "dark green"))))
 '(company-tooltip-common ((t (:foreground "gold"))))
 '(company-tooltip-common-selection ((t (:foreground "dark green"))))
 '(company-tooltip-selection ((t (:background "#FFFFFF" :foreground "#000000"))))
 '(emms-browser-album-face ((t (:foreground "spring green" :weight extra-bold :height 1.1))))
 '(emms-browser-artist-face ((t (:foreground "deep sky blue" :weight bold :height 1.3))))
 '(emms-browser-track-face ((t (:foreground "white" :height 1.0))))
 '(emms-browser-year/genre-face ((t (:foreground "spring green" :weight extra-bold :height 1.5))))
 '(ensime-breakpoint-face ((t (:background "red"))))
 '(epe-git-face ((t (:inherit font-lock-builtin-face))))
 '(epe-pipeline-delimiter-face ((t (:foreground "lawn green"))))
 '(epe-pipeline-host-face ((t (:foreground "cyan"))))
 '(epe-pipeline-time-face ((t (:foreground "gold"))))
 '(epe-pipeline-user-face ((t (:foreground "orange red"))))
 '(eshell-git-prompt-powerline-clean-face ((t (:background "lawn green" :foreground "black"))))
 '(eshell-git-prompt-powerline-dir-face ((t (:background "dim gray" :foreground "white"))))
 '(eshell-git-prompt-powerline-not-clean-face ((t (:background "indian red" :foreground "black"))))
 '(highlight ((t (:background "#FFFFFF" :foreground "#000000"))))
 '(highlight-thing ((t (:inherit (quote hi-white)))))
 '(minimap-active-region-background ((t (:background "#0e1112"))))
 '(minimap-font-face ((t (:height 30 :family "Fira Mono"))))
 '(perspeen-selected-face ((t (:background "DarkGoldenRod1" :foreground "Black" :weight bold))))
 '(perspeen-tab--header-line-active ((t (:inherit mode-line :background "DarkGoldenrod1" :foreground "black"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "dark magenta"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "dark violet"))))
 '(spaceline-flycheck-error ((t (:distant-foreground "orange red" :foreground "red"))))
 '(spaceline-highlight-face ((t (:background "DarkGoldenrod2" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-modified ((t (:background "SkyBlue2" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-read-only ((t (:background "plum3" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-unmodified ((t (:background "DarkGoldenrod2" :foreground "black" :inherit (quote mode-line)))))
 '(weather-metno-date ((t (:inherit header-line :foreground "lawn green"))))
 '(weather-metno-date-range ((t (:inherit font-lock-function-name-face :foreground "lawn green"))))
 '(weather-metno-entry ((t (:inherit font-lock-variable-name-face :foreground "deep sky blue")))))
(put 'dired-find-alternate-file 'disabled nil)
;;; init.el ends here
