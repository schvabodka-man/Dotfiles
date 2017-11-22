;;services
(use-package prodigy
  :ensure t
  :config
  (defalias 'service 'prodigy)
  (defalias 'services 'prodigy)
  (defalias 'service-start 'prodigy-start)
  (defalias 'service-stop 'prodigy-stop)
  (prodigy-define-service
	:name "Chromium debug mode"
	:command "chromium-browser"
	:args '("--remote-debugging-port=9222" "https://localhost:8080")
	:tags '(web)
	:stop-signal 'sigkill
	:kill-process-buffer-on-stop t)
  (prodigy-define-service
	:name "Chromium debug mode NO GPU"
	:command "chromium-browser"
	:args '("--disable-gpu" "--remote-debugging-port=9222" "https://localhost:8080")
	:tags '(web)
	:stop-signal 'sigkill
	:kill-process-buffer-on-stop t))
;;pass integration
(use-package ivy-pass
  :ensure t
  :config (defalias 'pass 'ivy-pass)
  (defalias 'passwords 'ivy-pass))
(use-package pandoc-mode
  :ensure t
  :config (add-hook 'web-mode-hook 'pandoc-mode)
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  (add-hook 'gfm-mode-hook 'pandoc-mode)
  (add-hook 'html-mode-hook 'pandoc-mode)
  (add-hook 'TeX-mode-hook 'pandoc-mode)
  (add-hook 'LaTeX-mode-hook 'pandoc-mode)
  (add-hook 'doc-view-mode-hook 'pandoc-mode)
  (add-hook 'adoc-mode-hook 'pandoc-mode)
  (defalias 'pandoc 'pandoc-main-hydra/body)
  (defalias 'document-converter 'pandoc-main-hydra/body)
  (defalias 'converter-document 'pandoc-main-hydra/body))
;;downloaders
(use-package transmission
  :ensure t
  :config (defalias 'torrent 'transmission)
  (add-hook 'transmission-files-mode-hook
			'null-all-bindings)
  (add-hook 'transmission-info-mode-hook
			'null-all-bindings)
  (add-hook 'transmission-mode-hook
			(lambda ()
			  (null-all-bindings)
			  (local-set-key "o" 'transmission-files)
			  (local-set-key "i" 'transmission-add)
			  (local-set-key "d" 'transmission-set-download)
			  (local-set-key (kbd "RET") 'transmission-info)
			  (local-set-key "m" 'transmission-toggle-mark)
			  (local-set-key (kbd "<delete>") 'transmission-remove)
			  (local-set-key "\\" 'transmission-toggle)
			  (local-set-key (kbd "C-q") 'transmission-quit)
			  (local-set-key (kbd "<escape>") 'transmission-quit)
			  (local-set-key "U" 'transmission-unmark-all)))
  (add-hook 'transmission-info-mode-hook
			(lambda ()
			  (null-all-bindings)
			  (local-set-key (kbd "C-q") 'transmission-quit)
			  (local-set-key (kbd "<escape>") 'transmission-quit)))
  (add-hook 'transmission-files-mode-hook
			(lambda ()
			  (null-all-bindings)
			  (local-set-key (kbd "M-f") 'transmission-find-file)
			  (local-set-key (kbd "M-S-o") 'transmission-find-file-other-window)
			  (local-set-key (kbd "M-o") 'transmission-display-file)
			  (local-set-key (kbd "C-q") 'transmission-quit)
			  (local-set-key (kbd "<escape>") 'transmission-quit)
			  (local-set-key (kbd "C-`") 'transmission-files-command)
			  (local-set-key (kbd "M-S-g") 'transmission-browse-url-of-file)
			  (local-set-key (kbd "C-y") 'transmission-copy-file)
			  (local-set-key (kbd "RET") 'transmission-info)
			  (local-set-key (kbd "C-S-m") 'transmission-toggle-mark)
			  (local-set-key (kbd "C-u") 'transmission-files-unwant)
			  (local-set-key (kbd "C-m") 'transmission-files-want)
			  (local-set-key (kbd "C-S-u") 'transmission-unmark-all)
			  (local-set-key (kbd "C-p") 'transmission-files-priority))))
;; (use-package aria2
;;   :ensure t)
;;htop/top
(use-package top-mode
  :ensure t
  :config (defun htop ()
			(interactive)
			(make-new-buffer)
			(top-mode)
			(top))
  (defun top-auto-refresh (rate)
	(interactive "nTop refresh rate (seconds): ")
	(progn
	  (cancel-function-timers 'top)
	  (if (not (zerop rate))
		  (setq *top-refresh-timer*
				(run-with-timer 2 rate 'top)))))
  (defalias 'process-manager 'htop)
  (defalias 'htop-auto-refresh 'top-auto-refresh)
  (define-key top-mode-map (kbd "C-k") #'top-mode-kill)
  (define-key top-mode-map (kbd "C-S-k") #'top-mode-kill-noconfirm)
  (define-key top-mode-map (kbd "C-u") #'top-mode-unmark)
  (define-key top-mode-map (kbd "C-m") #'top-mode-mark)
  (define-key top-mode-map (kbd "M-g") #'top-mode-goto-pid)
  (define-key top-mode-map (kbd "M-S-r") #'top-auto-refresh)
  (define-key top-mode-map (kbd "M-r") #'top)
  (define-key top-mode-map (kbd "<C-delete>") 'top-mode-kill-noconfirm)
  (define-key top-mode-map (kbd "<delete>") 'top-mode-kill)
  (define-key top-mode-map (kbd "<") nil)
  (define-key top-mode-map (kbd ">") nil)
  (define-key top-mode-map (kbd "A") nil)
  (define-key top-mode-map (kbd "B") nil)
  (define-key top-mode-map (kbd "C") nil)
  (define-key top-mode-map (kbd "D") nil)
  (define-key top-mode-map (kbd "E") nil)
  (define-key top-mode-map (kbd "F") nil)
  (define-key top-mode-map (kbd "G") nil)
  (define-key top-mode-map (kbd "H") nil)
  (define-key top-mode-map (kbd "I") nil)
  (define-key top-mode-map (kbd "J") nil)
  (define-key top-mode-map (kbd "K") nil)
  (define-key top-mode-map (kbd "L") nil)
  (define-key top-mode-map (kbd "M") nil)
  (define-key top-mode-map (kbd "N") nil)
  (define-key top-mode-map (kbd "O") nil)
  (define-key top-mode-map (kbd "P") nil)
  (define-key top-mode-map (kbd "Q") nil)
  (define-key top-mode-map (kbd "R") nil)
  (define-key top-mode-map (kbd "S") nil)
  (define-key top-mode-map (kbd "T") nil)
  (define-key top-mode-map (kbd "U") nil)
  (define-key top-mode-map (kbd "V") nil)
  (define-key top-mode-map (kbd "W") nil)
  (define-key top-mode-map (kbd "X") nil)
  (define-key top-mode-map (kbd "Y") nil)
  (define-key top-mode-map (kbd "Z") nil)
  (define-key top-mode-map (kbd "a") nil)
  (define-key top-mode-map (kbd "b") nil)
  (define-key top-mode-map (kbd "c") nil)
  (define-key top-mode-map (kbd "d") nil)
  (define-key top-mode-map (kbd "e") nil)
  (define-key top-mode-map (kbd "f") nil)
  (define-key top-mode-map (kbd "g") nil)
  (define-key top-mode-map (kbd "h") nil)
  (define-key top-mode-map (kbd "i") nil)
  (define-key top-mode-map (kbd "j") nil)
  (define-key top-mode-map (kbd "k") nil)
  (define-key top-mode-map (kbd "l") nil)
  (define-key top-mode-map (kbd "m") nil)
  (define-key top-mode-map (kbd "n") nil)
  (define-key top-mode-map (kbd "o") nil)
  (define-key top-mode-map (kbd "p") nil)
  (define-key top-mode-map (kbd "q") nil)
  (define-key top-mode-map (kbd "r") nil)
  (define-key top-mode-map (kbd "s") nil)
  (define-key top-mode-map (kbd "t") nil)
  (define-key top-mode-map (kbd "u") nil)
  (define-key top-mode-map (kbd "v") nil)
  (define-key top-mode-map (kbd "w") nil)
  (define-key top-mode-map (kbd "x") nil)
  (define-key top-mode-map (kbd "y") nil)
  (define-key top-mode-map (kbd "z") nil))
;;calibre
(el-get-bundle calibre-mode
  :url "https://raw.githubusercontent.com/whacked/calibre-mode/master/calibre-mode.el"
  :description "Great sidebar"
  :features calibre-mode)
(require 'calibre-mode)
;;steam
(use-package steam
  :ensure t
  :config (defun steam ()
			(interactive)
			(find-file "~/Org/Util/Steam.org"))
  (setq steam-username "vasyan6664")
  (setq steam-logo-dir "~/Org/Util/Steam"))
