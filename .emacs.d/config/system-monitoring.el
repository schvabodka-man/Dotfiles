(use-package symon
  :ensure t)
(define-symon-monitor time-date
  :display (format-time-string "%H:%M %Y/%d/%m %A"))
