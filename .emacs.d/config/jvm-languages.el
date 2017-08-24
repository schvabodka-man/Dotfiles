(use-package kotlin-mode
  :ensure t)
(use-package ensime
  :ensure t
  :pin melpa-stable
  :config
  (setq
   ensime-sbt-command "/usr/bin/sbt"
   sbt:program-name "/usr/bin/sbt"))
