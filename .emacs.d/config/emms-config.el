(use-package emms
  :ensure t
  :config (require 'emms-setup)
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/")

  (defalias 'emms 'emms-smart-browse)
  (defalias 'music 'emms-smart-browse)
  
  (define-key emms-browser-mode-map (kbd "C-o") #'emms-add-directory-tree)
  (define-key emms-browser-mode-map (kbd "C-S-o") #'emms-add-file)
  (define-key emms-browser-mode-map (kbd "C-M-o") #'emms-add-playlist)
  (define-key emms-browser-mode-map (kbd "M-o") #'helm-emms)
  (define-key emms-browser-mode-map (kbd "C-k") #'emms-browser-clear-playlist)
  (define-key emms-browser-mode-map (kbd "C-1") #'emms-browse-by-genre)
  (define-key emms-browser-mode-map (kbd "C-2") #'emms-browse-by-artist)
  (define-key emms-browser-mode-map (kbd "C-3") #'emms-browse-by-album)
  (define-key emms-browser-mode-map (kbd "C-4") #'emms-browse-by-year)
  (define-key emms-browser-mode-map (kbd "C-5") #'emms-browse-by-composer)
  (define-key emms-browser-mode-map (kbd "C-6") #'emms-browse-by-performer)
  (define-key emms-browser-mode-map (kbd "C-f") #'emms-browser-search-by-title)
  (define-key emms-browser-mode-map (kbd "C-S-f") #'emms-browser-search-by-album)
  (define-key emms-browser-mode-map (kbd "C-M-f") #'emms-browser-search-by-artist)
  (define-key emms-browser-mode-map (kbd "C-S-M-f") #'emms-browser-search-by-composer)
  (define-key emms-browser-mode-map (kbd "<return>") #'emms-browser-add-tracks)
  (define-key emms-browser-mode-map (kbd "<C-return>") #'emms-browser-add-tracks-and-play)
  (define-key emms-browser-mode-map (kbd "<C-spc>") #'emms-browser-expand-to-level-4)
  (define-key emms-browser-mode-map (kbd "<C-S-spc>") #'emms-browser-collapse-all)
  
  (define-key emms-browser-mode-map (kbd "C-m") #'emms-mark-forward)
  (define-key emms-browser-mode-map (kbd "C-S-m") #'emms-mark-all)
  (define-key emms-browser-mode-map (kbd "C-M-m") #'emms-mark-regexp)
  (define-key emms-browser-mode-map (kbd "C-S-u") #'emms-mark-unmark-all)
  (define-key emms-browser-mode-map (kbd "C-u") #'emms-mark-unmark-forward)
  
  (define-key emms-playlist-mode-map (kbd "k") nil)
  (define-key emms-playlist-mode-map (kbd "r") nil)
  
  (define-key emms-playlist-mode-map (kbd "C-k") #'emms-playlist-mode-current-kill)
  (define-key emms-playlist-mode-map (kbd "C-S-k") #'emms-mark-delete-marked-tracks)
  (define-key emms-playlist-mode-map (kbd "<delete>") #'emms-playlist-mode-current-kill)
  (define-key emms-playlist-mode-map (kbd "<C-delete>") #'emms-mark-delete-marked-tracks)
  (define-key emms-playlist-mode-map (kbd "M-o") #'helm-emms)
  (define-key emms-playlist-mode-map (kbd "<Home>") #'emms-playlist-mode-first)
  (define-key emms-playlist-mode-map (kbd "<End>") #'emms-playlist-mode-last)
  (define-key emms-playlist-mode-map (kbd "<down>") #'emms-playlist-mode-next)
  (define-key emms-playlist-mode-map (kbd "<up>") #'emms-playlist-mode-previous)
  (define-key emms-playlist-mode-map (kbd "C-s") #'emms-playlist-save)
  (define-key emms-playlist-mode-map (kbd "C-m") #'emms-mark-forward)
  (define-key emms-playlist-mode-map (kbd "C-S-m") #'emms-mark-forward)
  (define-key emms-playlist-mode-map (kbd "C-M-m") #'emms-mark-regexp)
  (define-key emms-playlist-mode-map (kbd "C-M-o") #'emms-add-playlist)
  (define-key emms-playlist-mode-map (kbd "C-n") #'emms-playlist-new)
  (define-key emms-playlist-mode-map (kbd "C-S-u") #'emms-mark-unmark-all)
  (define-key emms-playlist-mode-map (kbd "C-u") #'emms-mark-unmark-forward))
(use-package emms-player-mpv
  :ensure t
  :after emms
  :config (add-to-list 'emms-player-list 'emms-player-mpv))
(use-package helm-emms
  :ensure t
  :after emms)
(use-package emms-info-mediainfo
  :ensure t
  :config (add-to-list 'emms-info-functions #'emms-info-mediainfo)
  :after emms)
