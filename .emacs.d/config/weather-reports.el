;;i use yahoo weather for modeline and metno for full fledged reports
(use-package yahoo-weather
  :ensure t)
(use-package weather-metno
  :ensure t
  :config (setq weather-metno-location-name "Uzhhorod, Ukraine"
	  weather-metno-location-latitude 48
	  weather-metno-location-longitude 22)
  (add-hook 'after-init-hook 'weather-metno-update))
