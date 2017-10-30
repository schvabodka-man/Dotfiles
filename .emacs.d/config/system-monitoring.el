;; (defun get-wifi-address (&optional dev)
;;   (setq wifi (let ((dev (if dev dev "wlo1")))
;;			   (format-network-address (car (network-interface-info dev)) t)))
;;   (if (= (length wifi) 0)
;;	  (print "-")
;;	(print wifi)))

;; (defun get-ethernet-address (&optional dev)
;;   (setq ip (let ((dev (if dev dev "eth0")))
;;			 (format-network-address (car (network-interface-info dev)) t)))
;;   (if (= (length ip) 0)
;;	  (print "-")
;;	(print ip)))

;; (use-package symon
;;   :ensure t
;;   :config (symon-mode))
;; (define-symon-monitor time-date
;;   :display (format-time-string "%H:%M %Y/%d/%m %A"))
;; (define-symon-monitor eth-monitor
;;   :display (concat " " (get-ethernet-address)))
;; (define-symon-monitor wifi
;;   :display (concat " " (get-wifi-address)))
(use-package fancy-battery
  :ensure t
  :config (fancy-battery-mode))
