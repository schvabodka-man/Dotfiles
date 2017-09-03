(use-package symon
  :ensure t
  :config (symon-mode))
(define-symon-monitor time-date
  :display (format-time-string "%H:%M %Y/%d/%m %A"))
(use-package fancy-battery
  :ensure t
  :config (fancy-battery-mode))
