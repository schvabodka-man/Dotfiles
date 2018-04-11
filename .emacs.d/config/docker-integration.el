;; (use-package docker
;;   :ensure t)
(el-get-bundle dockerfile-mode
  :url "https://raw.githubusercontent.com/spotify/dockerfile-mode/master/dockerfile-mode.el"
  :description "Dockerfile editing"
  :features dockerfile-mode)
(require 'dockerfile-mode)
(use-package docker-compose-mode
  :ensure t
  :pin melpa-stable
  :mode (("docker-compose.yml" . docker-compose-mode)
		 ("docker-compose.yaml" . docker-compose-mode)))
;;ends here n stuff
