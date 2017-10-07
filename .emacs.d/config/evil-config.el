;;; evil-config.el --- evil mode config

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package evil
  :ensure t
  :config (evil-mode 1)
  (setq evil-move-beyond-eol t)
  (setq evil-move-cursor-back nil)
  (setq evil-visual-state-cursor '(box "purple"))
  (setq evil-normal-state-cursor '(box "white"))
  (setq evil-insert-state-cursor '((bar . 2) "green"))
  ;; УДОЛИЛ
  (define-key evil-motion-state-map (kbd "a") nil)
  (define-key evil-visual-state-map (kbd "a") nil)
  (define-key evil-motion-state-map (kbd "b") nil)
  (define-key evil-visual-state-map (kbd "b") nil)
  (define-key evil-motion-state-map (kbd "c") nil)
  (define-key evil-visual-state-map (kbd "c") nil)
  (define-key evil-motion-state-map (kbd "d") nil)
  (define-key evil-visual-state-map (kbd "d") nil)
  (define-key evil-motion-state-map (kbd "e") nil)
  (define-key evil-visual-state-map (kbd "e") nil)
  (define-key evil-motion-state-map (kbd "f") nil)
  (define-key evil-visual-state-map (kbd "f") nil)
  (define-key evil-motion-state-map (kbd "g") nil)
  (define-key evil-visual-state-map (kbd "g") nil)
  (define-key evil-motion-state-map (kbd "h") nil)
  (define-key evil-visual-state-map (kbd "h") nil)
  (define-key evil-motion-state-map (kbd "i") nil)
  (define-key evil-visual-state-map (kbd "i") nil)
  (define-key evil-motion-state-map (kbd "j") nil)
  (define-key evil-visual-state-map (kbd "j") nil)
  (define-key evil-motion-state-map (kbd "k") nil)
  (define-key evil-visual-state-map (kbd "k") nil)
  (define-key evil-motion-state-map (kbd "l") nil)
  (define-key evil-visual-state-map (kbd "l") nil)
  (define-key evil-motion-state-map (kbd "m") nil)
  (define-key evil-visual-state-map (kbd "m") nil)
  (define-key evil-motion-state-map (kbd "n") nil)
  (define-key evil-visual-state-map (kbd "n") nil)
  (define-key evil-motion-state-map (kbd "o") nil)
  (define-key evil-visual-state-map (kbd "o") nil)
  (define-key evil-motion-state-map (kbd "p") nil)
  (define-key evil-visual-state-map (kbd "p") nil)
  (define-key evil-motion-state-map (kbd "q") nil)
  (define-key evil-visual-state-map (kbd "q") nil)
  (define-key evil-motion-state-map (kbd "r") nil)
  (define-key evil-visual-state-map (kbd "r") nil)
  (define-key evil-motion-state-map (kbd "s") nil)
  (define-key evil-visual-state-map (kbd "s") nil)
  (define-key evil-motion-state-map (kbd "t") nil)
  (define-key evil-visual-state-map (kbd "t") nil)
  (define-key evil-motion-state-map (kbd "u") nil)
  (define-key evil-visual-state-map (kbd "u") nil)
  (define-key evil-motion-state-map (kbd "v") nil)
  (define-key evil-visual-state-map (kbd "v") nil)
  (define-key evil-motion-state-map (kbd "w") nil)
  (define-key evil-visual-state-map (kbd "w") nil)
  (define-key evil-motion-state-map (kbd "x") nil)
  (define-key evil-visual-state-map (kbd "x") nil)
  (define-key evil-motion-state-map (kbd "y") nil)
  (define-key evil-visual-state-map (kbd "y") nil)
  (define-key evil-motion-state-map (kbd "z") nil)
  (define-key evil-visual-state-map (kbd "z") nil)
  (define-key evil-motion-state-map (kbd "A") nil)
  (define-key evil-visual-state-map (kbd "A") nil)
  (define-key evil-motion-state-map (kbd "B") nil)
  (define-key evil-visual-state-map (kbd "B") nil)
  (define-key evil-motion-state-map (kbd "C") nil)
  (define-key evil-visual-state-map (kbd "C") nil)
  (define-key evil-motion-state-map (kbd "D") nil)
  (define-key evil-visual-state-map (kbd "D") nil)
  (define-key evil-motion-state-map (kbd "E") nil)
  (define-key evil-visual-state-map (kbd "E") nil)
  (define-key evil-motion-state-map (kbd "F") nil)
  (define-key evil-visual-state-map (kbd "F") nil)
  (define-key evil-motion-state-map (kbd "G") nil)
  (define-key evil-visual-state-map (kbd "G") nil)
  (define-key evil-motion-state-map (kbd "H") nil)
  (define-key evil-visual-state-map (kbd "H") nil)
  (define-key evil-motion-state-map (kbd "I") nil)
  (define-key evil-visual-state-map (kbd "I") nil)
  (define-key evil-motion-state-map (kbd "J") nil)
  (define-key evil-visual-state-map (kbd "J") nil)
  (define-key evil-motion-state-map (kbd "K") nil)
  (define-key evil-visual-state-map (kbd "K") nil)
  (define-key evil-motion-state-map (kbd "L") nil)
  (define-key evil-visual-state-map (kbd "L") nil)
  (define-key evil-motion-state-map (kbd "M") nil)
  (define-key evil-visual-state-map (kbd "M") nil)
  (define-key evil-motion-state-map (kbd "N") nil)
  (define-key evil-visual-state-map (kbd "N") nil)
  (define-key evil-motion-state-map (kbd "O") nil)
  (define-key evil-visual-state-map (kbd "O") nil)
  (define-key evil-motion-state-map (kbd "P") nil)
  (define-key evil-visual-state-map (kbd "P") nil)
  (define-key evil-motion-state-map (kbd "Q") nil)
  (define-key evil-visual-state-map (kbd "Q") nil)
  (define-key evil-motion-state-map (kbd "R") nil)
  (define-key evil-visual-state-map (kbd "R") nil)
  (define-key evil-motion-state-map (kbd "S") nil)
  (define-key evil-visual-state-map (kbd "S") nil)
  (define-key evil-motion-state-map (kbd "T") nil)
  (define-key evil-visual-state-map (kbd "T") nil)
  (define-key evil-motion-state-map (kbd "U") nil)
  (define-key evil-visual-state-map (kbd "U") nil)
  (define-key evil-motion-state-map (kbd "V") nil)
  (define-key evil-visual-state-map (kbd "V") nil)
  (define-key evil-motion-state-map (kbd "W") nil)
  (define-key evil-visual-state-map (kbd "W") nil)
  (define-key evil-motion-state-map (kbd "X") nil)
  (define-key evil-visual-state-map (kbd "X") nil)
  (define-key evil-motion-state-map (kbd "Y") nil)
  (define-key evil-visual-state-map (kbd "Y") nil)
  (define-key evil-motion-state-map (kbd "Z") nil)
  (define-key evil-visual-state-map (kbd "Z") nil)
  (define-key evil-motion-state-map (kbd "(") nil)
  (define-key evil-visual-state-map (kbd "(") nil)
  (define-key evil-motion-state-map (kbd ")") nil)
  (define-key evil-visual-state-map (kbd ")") nil)
  (define-key evil-motion-state-map (kbd "-") nil)
  (define-key evil-visual-state-map (kbd "-") nil)
  (define-key evil-motion-state-map (kbd "+") nil)
  (define-key evil-visual-state-map (kbd "+") nil)
  (define-key evil-motion-state-map (kbd "[") nil)
  (define-key evil-visual-state-map (kbd "[") nil)
  (define-key evil-motion-state-map (kbd "]") nil)
  (define-key evil-visual-state-map (kbd "]") nil)
  (define-key evil-motion-state-map (kbd "'") nil)
  (define-key evil-visual-state-map (kbd "'") nil)
  (define-key evil-motion-state-map (kbd "{") nil)
  (define-key evil-visual-state-map (kbd "{") nil)
  (define-key evil-motion-state-map (kbd "[ [") nil)
  (define-key evil-visual-state-map (kbd "[ [") nil)
  (define-key evil-motion-state-map (kbd "]") nil)
  (define-key evil-visual-state-map (kbd "]") nil)
  (define-key evil-motion-state-map (kbd "}") nil)
  (define-key evil-motion-state-map (kbd "$") nil)
  (define-key evil-visual-state-map (kbd "$") nil)
  (define-key evil-visual-state-map (kbd "}") nil)
  (define-key evil-motion-state-map (kbd "] ]") nil)
  (define-key evil-visual-state-map (kbd "] ]") nil)
  (define-key evil-motion-state-map (kbd "[ ]") nil)
  (define-key evil-visual-state-map (kbd "[ ]") nil)
  (define-key evil-motion-state-map (kbd "] [") nil)
  (define-key evil-visual-state-map (kbd "] [") nil)

  (define-key evil-normal-state-map (kbd "<backspace>") 'backward-delete-char)
  (define-key evil-normal-state-map (kbd "C-<home>") 'beginning-of-buffer)
  (define-key evil-normal-state-map (kbd "C-<end>") 'end-of-buffer)
  (define-key evil-normal-state-map (kbd "q") 'kill-this-buffer)
  (define-key evil-normal-state-map (kbd "S-q") 'kill-buffer)
  (define-key evil-normal-state-map (kbd "<escape>") 'escape-key-work)
  (define-key evil-normal-state-map (kbd "<home>") 'beginning-of-line)
  (define-key evil-normal-state-map (kbd "<end>") 'end-of-line)
  (define-key evil-normal-state-map (kbd "C-<left>") 'left-word)
  (define-key evil-normal-state-map (kbd "C-<right>") 'right-word)
  (define-key evil-normal-state-map (kbd "/") 'comment-line)
  (define-key evil-normal-state-map (kbd "<return>") 'newline-and-indent)
  (define-key evil-normal-state-map (kbd "C-,") 'customize-group)
  (define-key evil-normal-state-map (kbd "M-<up>") 'windmove-up)
  (define-key evil-normal-state-map (kbd "M-<down>") 'windmove-down)
  (define-key evil-normal-state-map (kbd "M-<left>") 'windmove-left)
  (define-key evil-normal-state-map (kbd "M-<right>") 'windmove-right)
  (define-key evil-normal-state-map (kbd "C-<backspace>") 'ivy-backward-kill-word)
  (define-key evil-normal-state-map (kbd "B") 'bookmark-set)
  (define-key evil-normal-state-map (kbd "V") 'evil-paste-after)
  (define-key evil-normal-state-map (kbd "k") 'evil-delete-char)
  (define-key evil-normal-state-map (kbd "v") 'evil-paste-before)
  (define-key evil-normal-state-map (kbd "s") 'indent-and-save)
  (define-key evil-visual-state-map (kbd "c") 'counsel-colors-emacs)
  (define-key evil-visual-state-map (kbd "C") 'counsel-colors-web)
  (define-key evil-normal-state-map (kbd "S") 'save-buffer)
  (define-key evil-visual-state-map (kbd "K") 'evil-delete-backward-char)
  (define-key evil-normal-state-map (kbd "y") 'put-file-name-on-clipboard)
  (evil-define-key 'normal conf-space-mode-map (kbd "s") 'save-buffer)
  (evil-define-key 'normal yaml-mode-map (kbd "s") 'put-file-name-on-clipboard)
  (define-key evil-normal-state-map (kbd ".") 'evil-forward-section-begin)
  (define-key evil-normal-state-map (kbd ",") 'evil-backward-section-begin)
  (define-key evil-normal-state-map (kbd ">") 'evil-forward-section-end)
  (define-key evil-normal-state-map (kbd "<") 'evil-backward-section-end)

  (define-key evil-normal-state-map (kbd "C-<up>") 'evil-previous-line-first-non-blank)
  (define-key evil-normal-state-map (kbd "C-<down>") 'evil-next-line-first-non-blank)
  (define-key evil-visual-state-map (kbd "C-<up>") 'evil-previous-line-first-non-blank)
  (define-key evil-visual-state-map (kbd "C-<down>") 'evil-next-line-first-non-blank)

  (define-key evil-visual-state-map (kbd "a") 'mark-whole-buffer)
  (define-key evil-visual-state-map (kbd "l") 'ctrl-l-line-select)
  (define-key evil-visual-state-map (kbd "c") 'evil-yank)
  (define-key evil-visual-state-map (kbd "<return>") 'evil-yank)
  (define-key evil-visual-state-map (kbd "k") 'evil-delete)
  (define-key evil-visual-state-map (kbd "K") 'evil-delete-backward-char)
  (define-key evil-visual-state-map (kbd "SPC") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "V") 'evil-paste-after)
  (define-key evil-visual-state-map (kbd "v") 'evial-paste-before)
  (define-key evil-visual-state-map (kbd "x") 'clipboard-kill-region)

  (define-key evil-visual-state-map (kbd "/") 'comment-line)

  (define-key evil-insert-state-map (kbd "C-<backspce>") 'ivy-backward-kill-word)
  (define-key evil-insert-state-map (kbd "C-<left>") 'left-word)
  (define-key evil-insert-state-map (kbd "C-<right>") 'right-word)

  (define-key evil-insert-state-map (kbd "<return>") 'newline-and-indent)

  (define-key evil-normal-state-map (kbd "<tab>") 'evil-insert-state)
  (define-key evil-normal-state-map (kbd "SPC") 'evil-visual-state)

  (evil-define-key 'normal emacs-lisp-mode-map (kbd "E") 'eval-buffer)
  (evil-define-key 'normal emacs-lisp-mode-map (kbd "e") 'eval-region)
  (evil-define-key 'visual emacs-lisp-mode-map (kbd "E") 'eval-buffer)
  (evil-define-key 'visual emacs-lisp-mode-map (kbd "e") 'eval-region)

  (define-key evil-insert-state-map (kbd "S-<up>") 'evil-visual-state)
  (define-key evil-insert-state-map (kbd "S-<down>") 'evil-visual-state)
  (define-key evil-insert-state-map (kbd "S-<left>") 'evil-visual-state)
  (define-key evil-insert-state-map (kbd "S-<right>") 'evil-visual-state)

  (define-key evil-motion-state-map (kbd "C-z") nil)
  (define-key evil-motion-state-map (kbd "C-v") nil)
  (define-key evil-motion-state-map (kbd "M-.") nil)
  (define-key evil-motion-state-map (kbd "C-e") nil)
  (define-key ivy-minibuffer-map (kbd "C-v") 'evil-paste-before))
(use-package key-chord
  :ensure t
  :config (key-chord-mode 1)
  (setq key-chord-one-key-delay 0.4)
  (key-chord-define evil-normal-state-map "kl" 'evil-delete-whole-line)
  (key-chord-define evil-normal-state-map "ka" 'evil-delete-buffer)
  (key-chord-define evil-normal-state-map "kw" 'evil-delete-backward-word))

;;; evil-config.el ends here
