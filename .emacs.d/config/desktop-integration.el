;;; desktop-integration.el --- functions for neat integration

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(defun lock ()
  (interactive)
  (shell-command "i3lock -i ~/.wallpapers/space-flat-2.png"))
(defalias 'desktop-lock 'lock)
(defalias 'lock-desktop 'lock)
(defun reboot ()
  (interactive)
  (shell-command "/sbin/reboot"))
(defun poweroff ()
  (interactive)
  (shell-command "/sbin/poweroff"))
(defalias 'power-off 'poweroff)
(defun wifi-on ()
  (interactive)
  (start-process-shell-command "nmcli radio wifi on" nil "nmcli radio wifi on"))
(defalias 'wireless-on 'wifi-on)
(defun wifi-off ()
  (interactive)
  (start-process-shell-command "nmcli radio wifi off" nil "nmcli radio wifi off"))
(defalias 'wireless-off 'wifi-off)
;; (defun xfce4-terminal ()
;;   (interactive)
;;   (start-process-shell-command "xfce4-terminal -x \"tmux\"" nil "xfce4-terminal -x \"tmux\""))
;; (defun qutebrowser ()
;;   (interactive)
;;   (start-process-shell-command "qutebrowser" nil "qutebrowser"))
;; (defun firefox ()
;;   (interactive)
;;   (start-process-shell-command "firefox" nil "firefox"))
;; (defun rofi-desktop ()
;;   (interactive)
;;   (start-process-shell-command "rofi -show window -hide-scrollbar -fullscreen" nil "rofi -show window -hide-scrollbar -fullscreen"))
;;; desktop-integratioff.el ends here
