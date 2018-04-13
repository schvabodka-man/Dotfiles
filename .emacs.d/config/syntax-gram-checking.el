(use-package flyspell-correct
  :ensure t)
;; (use-package flyspell-correct-helm
;;   :ensure t
;;   :config
;;   (define-key flyspell-mode-map (kbd "C-'") 'flyspell-correct-previous-word-generic))
(use-package flyspell-correct-ivy
  :ensure t
  :config (define-key flyspell-mode-map (kbd "C-'") 'flyspell-correct-previous-word-generic)
  (define-key flyspell-mode-map (kbd "C-;") 'counsel-M-x))
(setq flyspell-issue-message-flag nil)
(setq flyspell-issue-welcome-flag nil)
(mapcar (lambda (mode-hook) (add-hook mode-hook 'flyspell-prog-mode))
		'(c-mode-common-hook tcl-mode-hook emacs-lisp-mode-hook 
							 ruby-mode-hook java-mode-hook fish-mode-hook shell-mode-hook))
(mapcar (lambda (mode-hook) (add-hook mode-hook 'flyspell-mode))
		'(org-mode-hook markdown-mode-hook gfm-mode-hook))

;; (global-set-key (kbd "<C-f2>") (lambda ()
;; 								 (interactive)
;; 								 (ispell-change-dictionary "russian")))
;; (global-set-key (kbd "<C-f1>") (lambda ()
;; 								 (interactive)
;; 								 (ispell-change-dictionary "english")))
;; (global-set-key (kbd "<C-f3>") 'ispell-change-dictionary)
;; (defalias 'dictionary 'ispell-change-dictionary)
;; (defalias 'language 'ispell-change-dictionary)
;; (defalias 'lang 'ispell-change-dictionary)
;;language guessing
(use-package guess-language
  :ensure t
  :bind ("s-l" . guess-language)
  :config (setq guess-language-languages '(en ru))
  (setq guess-language-langcodes
		'((en . ("en_US" "English"))
		  (ru . ("ru_RU" "Russian"))))
  (setq guess-language-min-paragraph-length 10)
  (add-hook 'text-mode-hook (lambda () (guess-language-mode 1)))
  (add-hook 'prog-mode-hook (lambda () (guess-language-mode 1)))
  (defalias 'dictionary 'guess-language)
  (defalias 'language 'guess-language)
  (defalias 'lang 'guess-language))
(use-package dictionary
  :ensure t
  :pin melpa
  :config (defalias 'd 'dictionary-search))
;;ends here
