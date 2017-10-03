;;rtorrent frontend
(use-package mentor
  :ensure t
  :config (defalias 'rtorrent 'mentor)
  (defalias 'torrent 'mentor)
  (setq mentor-rtorrent-buffer-name "*mentor*")
  ;;(setq mentor-rtorrent-external-rpc "~/.rtorrent-rpc.socket")
  )
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
;;calibre
(el-get-bundle calibre-mode
  :url "https://raw.githubusercontent.com/whacked/calibre-mode/master/calibre-mode.el"
  :description "Great sidebar"
  :features calibre-mode)
(require 'calibre-mode)
