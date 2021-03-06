;;; emms-config --- My emacs config for emms
;;; Commentary:
;;; Best mediaplayer out there
;;; Code:
(use-package emms
  :ensure t
  :config (require 'emms-setup)
  ;; (require 'emms-player-mpd)
  (require 'emms-volume)
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/")

  ;; (add-to-list 'emms-info-functions 'emms-info-mpd)
  ;; (add-to-list 'emms-player-list 'emms-player-mpd)
  ;; (setq emms-volume-change-function 'emms-volume-mpd-change)

  (defalias 'emms 'emms-smart-browse)
  (defalias 'music 'emms-smart-browse)
  (defalias 'music-pause-play 'emms-pause)
  (defalias 'music-stop 'emms-stop)
  (defalias 'music-next 'emms-next)
  (defalias 'music-prev 'emms-previous)
  (defalias 'music-forward 'emms-seek-forward)
  (defalias 'music-backward 'emms-seek-backward)
  (defalias 'emms-forward 'emms-seek-forward)
  (defalias 'emms-backward 'emms-seek-backward)
  (defalias 'music-seek-forward 'emms-seek-forward)
  (defalias 'music-seek-backward 'emms-seek-backward)
  (defalias 'music-previous 'emms-previous)
  (defalias 'emms-repeat-track 'emms-toggle-repeat-track)
  (defalias 'music-repeat-track 'emms-toggle-repeat-track)
  (defalias 'emms-repeat-playlist 'emms-toggle-repeat-playlist)
  (defalias 'music-repeat-playlist 'emms-toggle-repeat-playlist)
  (defalias 'emms-playlist 'emms-browser-display-playlist)
  (defalias 'music-playlist 'emms-browser-display-playlist)
  (defalias 'music-tag-editor 'emms-tag-editor-edit)
  (defalias 'music-tag-edit 'emms-tag-editor-edit)
  (defalias 'emms-tag-editor 'emms-tag-editor-edit)
  (defalias 'emms-tag-edit 'emms-tag-editor-edit)

  (define-key emms-browser-mode-map (kbd "M-r") #'emms-add-directory-tree)
  (define-key emms-browser-mode-map (kbd "C-o") #'emms-add-directory-tree)
  (define-key emms-browser-mode-map (kbd "C-M-o") #'emms-add-url)
  ;; (define-key emms-browser-mode-map (kbd "M-o") #'helm-emms)
  (define-key emms-browser-mode-map (kbd "C-k") #'emms-browser-clear-playlist)
  (define-key emms-browser-mode-map (kbd "C-<delete>") #'emms-browser-clear-playlist)
  (define-key emms-browser-mode-map (kbd "M-1") #'emms-browse-by-genre)
  (define-key emms-browser-mode-map (kbd "M-2") #'emms-browse-by-artist)
  (define-key emms-browser-mode-map (kbd "M-3") #'emms-browse-by-album)
  (define-key emms-browser-mode-map (kbd "M-4") #'emms-browse-by-year)
  (define-key emms-browser-mode-map (kbd "M-5") #'emms-browse-by-composer)
  (define-key emms-browser-mode-map (kbd "M-6") #'emms-browse-by-performer)
  (define-key emms-browser-mode-map (kbd "C-f") #'emms-browser-search-by-title)
  (define-key emms-browser-mode-map (kbd "C-p") #'emms-browser-display-playlist)
  (define-key emms-browser-mode-map (kbd "C-S-f") #'emms-browser-search-by-album)
  (define-key emms-browser-mode-map (kbd "M-f") #'emms-browser-search-by-artist)
  (define-key emms-browser-mode-map (kbd "C-S-M-f") #'emms-browser-search-by-composer)
  (define-key emms-browser-mode-map (kbd "<return>") #'emms-browser-add-tracks)
  (define-key emms-browser-mode-map (kbd "<C-return>") #'emms-browser-add-tracks-and-play)
  (define-key emms-browser-mode-map (kbd "<C-SPC>") #'emms-browser-expand-to-level-4)
  (define-key emms-browser-mode-map (kbd "M-SPC") #'emms-browser-collapse-all)

  (define-key emms-browser-mode-map (kbd "C-m") #'emms-mark-forward)
  (define-key emms-browser-mode-map (kbd "C-S-m") #'emms-mark-all)
  (define-key emms-browser-mode-map (kbd "C-M-m") #'emms-mark-regexp)
  (define-key emms-browser-mode-map (kbd "C-S-u") #'emms-mark-unmark-all)
  (define-key emms-browser-mode-map (kbd "C-u") #'emms-mark-unmark-forward)

  (define-key emms-playlist-mode-map (kbd "k") nil)
  (define-key emms-playlist-mode-map (kbd "r") nil)
  (define-key emms-playlist-mode-map (kbd "D") nil)
  (define-key emms-playlist-mode-map (kbd "E") nil)
  (define-key emms-playlist-mode-map (kbd "s") nil)
  (define-key emms-playlist-mode-map (kbd "P") nil)
  (define-key emms-playlist-mode-map (kbd "n") nil)
  (define-key emms-playlist-mode-map (kbd "p") nil)

  (define-key emms-playlist-mode-map (kbd "<return>") #'emms-playlist-mode-play-smart)
  (define-key emms-playlist-mode-map (kbd "<C-left>") #'emms-previous)
  (define-key emms-playlist-mode-map (kbd "<C-right>") #'emms-next)
  (define-key emms-playlist-mode-map (kbd ",") #'emms-previous)
  (define-key emms-playlist-mode-map (kbd ".") #'emms-next)
  (define-key emms-playlist-mode-map (kbd "C-k") #'emms-playlist-mode-current-kill)
  (define-key emms-playlist-mode-map (kbd "C-S-k") #'emms-mark-delete-marked-tracks)
  (define-key emms-playlist-mode-map (kbd "<delete>") #'emms-playlist-mode-kill-track)
  (define-key emms-playlist-mode-map (kbd "<C-delete>") #'emms-mark-delete-marked-tracks)
  (define-key emms-playlist-mode-map (kbd "<Home>") #'emms-playlist-mode-first)
  (define-key emms-playlist-mode-map (kbd "<End>") #'emms-playlist-mode-last)
  (define-key emms-playlist-mode-map (kbd "C-s") #'emms-playlist-save)
  (define-key emms-playlist-mode-map (kbd "C-m") #'emms-mark-forward)
  (define-key emms-playlist-mode-map (kbd "C-S-m") #'emms-mark-forward)
  (define-key emms-playlist-mode-map (kbd "C-M-m") #'emms-mark-regexp)
  (define-key emms-playlist-mode-map (kbd "C-o") #'emms-add-playlist)
  (define-key emms-playlist-mode-map (kbd "C-n") #'emms-playlist-new)
  (define-key emms-playlist-mode-map (kbd "C-S-u") #'emms-mark-unmark-all)
  (define-key emms-playlist-mode-map (kbd "C-u") #'emms-mark-unmark-forward)
  (define-key emms-playlist-mode-map (kbd "C-t") #'emms-tag-editor-edit)

  (define-key emms-browser-mode-map (kbd "<M-RET>") #'make-new-buffer)
  (define-key emms-playlist-mode-map (kbd "<M-RET>") #'make-new-buffer)

  (define-key emms-browser-mode-map (kbd "]") #'emms-seek-forward)
  (define-key emms-browser-mode-map (kbd "[") #'emms-seek-backward)
  (define-key emms-playlist-mode-map (kbd "]") #'emms-seek-forward)
  (define-key emms-playlist-mode-map (kbd "[") #'emms-seek-backward)
  (define-key emms-browser-mode-map (kbd "\\") #'emms-seek)
  (define-key emms-playlist-mode-map (kbd "\\") #'emms-seek)
  (define-key emms-browser-mode-map (kbd "|") #'emms-seek-to)
  (define-key emms-playlist-mode-map (kbd "|") #'emms-seek-to)

  (define-key emms-browser-mode-map (kbd "'") #'emms-toggle-repeat-track)
  (define-key emms-playlist-mode-map (kbd "'") #'emms-toggle-repeat-track)
  (define-key emms-browser-mode-map (kbd "\"") #'emms-toggle-repeat-playlist)
  (define-key emms-playlist-mode-map (kbd "\"") #'emms-toggle-repeat-playlist)

  (require 'emms-playing-time)
  (emms-playing-time 1)
  (emms-mode-line-disable)
  (add-hook 'kill-emacs-hook 'emms-stop)
  ;; (add-hook 'kill-emacs-hook 'emms-player-mpd-stop)
  ;; (add-hook 'kill-emacs-hook 'emms-player-mpd-disconnect)

  (defun kill-emms ()
	(interactive)
	(flet ((kill-buffer-ask (buffer) (kill-buffer buffer)))
	  (kill-matching-buffers "*EMMS Playlist*")
	  (kill-matching-buffers "*EMMS-TAGS*")
	  (kill-matching-buffers "EMMS")
	  (kill-matching-buffers "Browsing by:")))
  (defalias 'emms-kill 'kill-emms)
  (defalias 'music-kill 'kill-emms)
  (defalias 'kill-music 'kill-emms)

  (defun emms-replay-track ()
	(interactive)
	(emms-stop)
	(emms-pause))
  ;; (emms-player-mpd-connect)
  )
(use-package emms-info-mediainfo
  :ensure t
  :config (add-to-list 'emms-info-functions #'emms-info-mediainfo)
  :after emms)
;; (use-package emms-player-mpv
;;   :ensure t
;;   :config (add-to-list 'emms-player-list 'emms-player-mpv)
;;   :after emms)
