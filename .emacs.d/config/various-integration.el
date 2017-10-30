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
;;calibre
(el-get-bundle calibre-mode
  :url "https://raw.githubusercontent.com/whacked/calibre-mode/master/calibre-mode.el"
  :description "Great sidebar"
  :features calibre-mode)
(require 'calibre-mode)
