;;; init --- My emacs config
;;; Commentary:
;;; MUH EMACS
;;; Code:
;;gc tweaks
;;from here https://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
;;this hack works awesome
;; (defun my-minibuffer-setup-hook ()
;;	(setq gc-cons-threshold 100000000))
;; (defun my-minibuffer-exit-hook ()
;;	(setq gc-cons-threshold 800000))
;; (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
;; (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
(setq gc-cons-threshold 200000000)
;; ;;stuff
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
						 ("marmalade" . "http://marmalade-repo.org/packages/")
						 ("melpa-stable" . "https://stable.melpa.org/packages/")
						 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(defun clean-elc-files ()
  (shell-command "/bin/rm ~/.emacs.d/*.elc")
  (shell-command "/bin/rm ~/.emacs.d/config/*.elc"))
(clean-elc-files)
(load "~/.emacs.d/config/vanilla-emacs")
;;keybindings
(load "~/.emacs.d/config/big-frameworks")
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
(load "~/.emacs.d/config/visuals-useful")
;;google services
(load "~/.emacs.d/config/google-botnet")
;;useless
(load "~/.emacs.d/config/useless")
;;git
(load "~/.emacs.d/config/git-stuff")
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
;;live preview for web
(load "~/.emacs.d/config/html-live-editing")
;;js development
(load "~/.emacs.d/config/javascript-setup")
;;project management
(load "~/.emacs.d/config/projects-management.el")
;;python stuff
(load "~/.emacs.d/config/python")
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
;;music
;; (load "~/.emacs.d/config/emms-config")
;;spell checking
(load "~/.emacs.d/config/syntax-gram-checking")
;;eshell and stuff
(load "~/.emacs.d/config/eshell")
(load "~/.emacs.d/config/terminal-emulator")
;;packages
(load "~/.emacs.d/config/package-managing")
;;dired
(load "~/.emacs.d/config/dired-config")
;;realgud
(load "~/.emacs.d/config/realgud-debugger")
;;LaTeX
(load "~/.emacs.d/config/latex-editing")
;;integrations
(load "~/.emacs.d/config/various-integration")
;;elfeed
;; (load "~/.emacs.d/config/rss-reading")
;;document viewing
(load "~/.emacs.d/config/document-viewers")
;;im
;; (load "~/.emacs.d/config/im-social")
;;integration with some desktop stuff
;; (load "~/.emacs.d/config/desktop-integration")
;;calculator
(load "~/.emacs.d/config/calculators")
;;emails, gnus is obsolete and replaced by mu4e for me
;; (load "~/.emacs.d/config/gnus-init")
;; (load "~/.emacs.d/config/mu4e-config")
;;web
;; (load "~/.emacs.d/config/web-browsing")
;;clang with irony
(load "~/.emacs.d/config/clang")
;;blogging and shit
(load "~/.emacs.d/config/blogging")
;;multiple workspaces and tabbing
(load "~/.emacs.d/config/windowing-config")
;;byte compile everything
(defun byte-compile-init-dir ()
  "Byte-compile all your dotfiles."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))
(byte-compile-init-dir)
;;gc on emacs idle
(run-with-idle-timer 3 t (lambda () (garbage-collect)))
(set-charset-priority 'unicode)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
;;font lock optimization
(global-font-lock-mode t)
;;bigger key bit
(setq gnutls-min-prime-bits 4096)

(shell-command "notify-send -a Emacs \"Emacs startup finished\"")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(battery-update-interval 10)
 '(bbdb-file "~/Bbdb/bbdb")
 '(bbdb-file-remote nil)
 '(ccm-step-delay 0)
 '(ccm-step-size 1)
 '(cider-lein-command "~/.sdkman/candidates/leiningen/current/bin/lein")
 '(company-auto-complete-chars (quote (46)))
 '(company-fish-shell-modes (quote (fish-mode)))
 '(company-minimum-prefix-length 1)
 '(company-shell-modes (quote (sh-mode fish-mode)))
 '(company-show-numbers t)
 '(counsel-mode t)
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
	  (extension "mp3" "flac" "alac" "wav" "wv" "ape" "ogg" "midi" "aac" "opus")
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
 '(ebdb-info-file nil)
 '(emms-playing-time-display-short-p t)
 '(ensime-company-idle-delay 0.1)
 '(ensime-graphical-tooltips t)
 '(ensime-search-interface (quote helm))
 '(ensime-typecheck-idle-interval 1)
 '(ensime-typecheck-interval 1)
 '(erc-email-userid "scvh")
 '(fancy-battery-show-percentage t)
 '(frames-only-mode-use-window-functions
   (quote
	(report-emacs-bug checkdoc-show-diagnostics checkdoc)))
 '(gac-shell-and " ; ")
 '(git-messenger:use-magit-popup t)
 '(global-centered-cursor-mode nil)
 '(global-undo-tree-mode t)
 '(golden-ratio-exclude-buffer-names (quote ("MINIMAP")))
 '(golden-ratio-exclude-modes (quote (neotree-mode)))
 '(helm-boring-buffer-regexp-list
   (quote
	("\\*Compile-Log\\*" "\\*Warnings\\*" "\\\\*Echo Area" "\\\\*Minibuf" "\\*helm" "\\*server\\*" "\\*code-conversion-work\\*" "\\*Custom-Work\\*" "\\*Messages\\*" "\\*Compiler Input\\*" "\\*Compiler Output\\*" "\\*Completions\\*" "\\\\*Flycheck error" "\\\\*ENSIME-" "\\*ensime-connection\\*" ".newsrc-dribble" "\\*nntpd\\*" "\\*mm\\*" "\\*canonical address\\*" "\\*gnus work\\*" "\\*Gnus Backlog\\*" "\\\\*Async Prefetch" "\\\\*Gnus agent" "\\\\*extract address" "\\\\*Original Article" "\\*temp\\*" "\\*Process List\\*" "\\*Metahelp\\*" "\\*Help\\*")))
 '(highlight-thing-case-sensitive-p t)
 '(highlight-thing-delay-seconds 0.1)
 '(highlight-thing-exclude-thing-under-point t)
 '(highlight-thing-excluded-major-modes
   (quote
	(Custom-mode org-agenda-mode cfw:calendar-mode minibuffer-inactive-mode eshell-mode shell-mode emms-playlist-mode)))
 '(highlight-thing-what-thing (quote word))
 '(hl-paren-background-colors nil)
 '(hl-paren-colors (quote ("magenta")))
 '(httpd-port 8088)
 '(js2-highlight-level 3)
 '(js2-idle-timer-delay 0.1)
 '(js2-include-node-externs t)
 '(js2-include-rhino-externs t)
 '(js2-instanceof-has-side-effects t)
 '(meghanada-debug t)
 '(meghanada-server-jvm-option
   "-Xms128m -Xmx750m -XX:ReservedCodeCacheSize=240m -XX:+UseConcMarkSweepGC -XX:SoftRefLRUPolicyMSPerMB=50 -ea -Dsun.io.useCanonCaches=false -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=4123,suspend=n")
 '(meghanada-server-remote-debug t)
 '(minimap-buffer-name "MINIMAP")
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
 '(nlinum-highlight-current-line t)
 '(org-agenda-confirm-kill t)
 '(org-agenda-files
   (quote
	("/home/ivan/Org/Agenda/Diary/2017-08-24.org" "/home/ivan/Org/Agenda/Diary/2017-08-26.org" "/home/ivan/Org/Agenda/Diary/2017-09-03.org" "/home/ivan/Org/Agenda/Diary/2017-10-01.org" "/home/ivan/Org/Agenda/Diary/2017-11-07.org" "/home/ivan/Org/Agenda/Diary/2017-11-10.org" "/home/ivan/Org/Agenda/Diary/2017-11-11.org" "/home/ivan/Org/Agenda/Diary/2017-11-13.org" "/home/ivan/Org/Agenda/Diary/2017-12-04.org" "/home/ivan/Org/Agenda/Diary/2017-12-24.org")))
 '(org-board-default-browser (quote system))
 '(org-vcard-default-export-file "~/Org/Contacts/contacts.vcf")
 '(org-vcard-default-import-file "~/Org/Contacts/contacts.vcf")
 '(package-selected-packages
   (quote
	(mastodon url-shortener flycheck-ledger ledger-mode ebdb docker-compose-mode polymode org-vcard frames-only-mode ranger peep-dired cider flycheck-popup-tip py-autopep8 steam top-mode guess-language conkeror-minor-mode dired-toggle-sudo flycheck-kotlin inf-groovy groovy-imports org-ehtml nnir helm yasnippet yascroll seti-theme popup neotree minimap magit ivy el-get company)))
 '(paradox-github-token t)
 '(popwin:adjust-other-windows nil)
 '(projectile-globally-ignored-directories
   (quote
	(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "gradle" ".gradle" ".meghanada" "build" "out" "libs" "target" ".mvn" "el-get" "elpa" "auto-save-list" "project")))
 '(projectile-globally-ignored-files
   (quote
	("TAGS" ".gitignore" ".projectile" ".ensime" "mvnw" "gradlew" "gradlew.bat" "mvnw.cmd")))
 '(rmh-elfeed-org-files (quote ("~/Org/Util/Rss.org")) t)
 '(send-mail-function (quote smtpmail-send-it))
 '(spaceline-all-the-icons-highlight-file-name t)
 '(sr-speedbar-right-side nil)
 '(symon-delay 10)
 '(symon-mode t)
 '(symon-monitors
   (quote
	(symon-linux-network-rx-monitor symon-linux-network-tx-monitor time-date wifi eth-monitor)))
 '(symon-sparkline-thickness 1)
 '(symon-sparkline-type (quote plain))
 '(undo-tree-auto-save-history t)
 '(vlf-application (quote dont-ask))
 '(vlf-forbidden-modes-list
   (quote
	(archive-mode tar-mode jka-compr git-commit-mode image-mode doc-view-mode doc-view-mode-maybe pdf-view-mode ebrowse-tree-mode)))
 '(w3m-default-display-inline-images t)
 '(w3m-treat-image-size nil)
 '(yahoo-weather-location "Uzhhorod")
 '(yahoo-weather-mode t)
 '(yascroll:delay-to-hide nil))

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
 '(cider-fringe-good-face ((t (:foreground "chartreuse"))))
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
 '(dired-k-added ((t (:foreground "magenta" :weight bold))))
 '(dired-k-commited ((t (:foreground "lawn green" :weight bold))))
 '(dired-k-directory ((t (:foreground "sky blue"))))
 '(dired-k-ignored ((t (:foreground "red" :weight bold))))
 '(dired-k-modified ((t (:foreground "yellow" :weight bold))))
 '(dired-k-untracked ((t (:foreground "white" :weight bold))))
 '(dired-subtree-depth-1-face ((t nil)))
 '(dired-subtree-depth-2-face ((t nil)))
 '(dired-subtree-depth-3-face ((t nil)))
 '(dired-subtree-depth-4-face ((t nil)))
 '(dired-subtree-depth-5-face ((t nil)))
 '(dired-subtree-depth-6-face ((t nil)))
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
 '(hl-paren-face ((t (:underline t))) t)
 '(link ((t (:foreground "cyan1"))))
 '(minimap-active-region-background ((t (:background "#0e1112"))))
 '(minimap-font-face ((t (:height 30 :family "Fira Mono"))))
 '(nlinum-current-line ((t (:foreground "yellow"))))
 '(org-level-4 ((t (:foreground "magenta"))))
 '(perspeen-selected-face ((t (:background "DarkGoldenRod1" :foreground "Black" :weight bold))))
 '(perspeen-tab--header-line-active ((t (:inherit mode-line :background "DarkGoldenrod1" :foreground "black"))))
 '(popup-face ((t (:background "white" :foreground "black"))))
 '(popup-tip-face ((t (:background "white" :foreground "black"))))
 '(q4/gray-face ((t (:foreground "dim gray"))))
 '(q4/greentext-face ((t (:foreground "lawn green"))))
 '(q4/id-face ((t (:foreground "yellow"))))
 '(q4/quote-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "dark magenta"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "dark violet"))))
 '(region ((t (:background "white" :foreground "black"))))
 '(spaceline-evil-emacs ((t (:background "SkyBlue2" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-evil-insert ((t (:background "chartreuse3" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-evil-motion ((t (:background "plum3" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-evil-normal ((t (:background "DarkGoldenrod2" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-evil-replace ((t (:background "chocolate" :foreground "white" :inherit (quote mode-line)))))
 '(spaceline-evil-visual ((t (:background "purple" :foreground "#FFFFFF" :inherit (quote mode-line)))))
 '(spaceline-flycheck-error ((t (:foreground "red"))))
 '(spaceline-flycheck-info ((t (:foreground "deep sky blue"))))
 '(spaceline-flycheck-warning ((t (:foreground "yellow"))))
 '(spaceline-highlight-face ((t (:background "green" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-modified ((t (:background "SkyBlue2" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-read-only ((t (:background "plum3" :foreground "black" :inherit (quote mode-line)))))
 '(spaceline-unmodified ((t (:background "DarkGoldenrod2" :foreground "black" :inherit (quote mode-line)))))
 '(w3m-arrived-anchor ((t (:foreground "MediumOrchid2"))))
 '(w3m-current-anchor ((t (:foreground "cyan" :underline t :weight bold))))
 '(w3m-form-button ((t (:background "white" :foreground "black"))))
 '(w3m-form-button-mouse ((t (:background "red" :foreground "black"))))
 '(w3m-form-button-pressed ((t (:background "MediumOrchid2" :foreground "black" :box (:line-width 2 :style pressed-button)))))
 '(w3m-tab-background ((t nil)))
 '(w3m-tab-mouse ((t (:background "Gray75" :foreground "white"))))
 '(w3m-tab-selected ((t (:background "white" :foreground "black"))))
 '(w3m-tab-selected-retrieving ((t (:background "white" :foreground "red"))))
 '(w3m-tab-unselected ((t (:background "black" :foreground "white"))))
 '(w3m-tab-unselected-retrieving ((t (:background "black" :foreground "orange red"))))
 '(w3m-tab-unselected-unseen ((t nil)))
 '(weather-metno-date ((t (:inherit header-line :foreground "lawn green"))))
 '(weather-metno-date-range ((t (:inherit font-lock-function-name-face :foreground "lawn green"))))
 '(weather-metno-entry ((t (:inherit font-lock-variable-name-face :foreground "deep sky blue"))))
 '(yascroll:thumb-fringe ((t (:background "white" :foreground "white"))))
 '(yascroll:thumb-text-area ((t (:background "white")))))
(put 'dired-find-alternate-file 'disabled nil)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
