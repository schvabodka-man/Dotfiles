;;; latex-editing.el --- LaTeX

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(use-package company-math
  :ensure t
  :config (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-to-list 'company-backends 'company-math-symbols-latex))
;;; latex-editing.el ends here
