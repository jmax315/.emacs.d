;;; javascript-init-chunk --- Set up for javascript
;;; Commentary:
;;; Code:
(use-package discover-js2-refactor :ensure t)
(use-package flycheck-jest :ensure t)
(use-package js2-mode :ensure t)
(use-package js2-highlight-vars :ensure t)
(use-package js2hl :ensure t)
(use-package js2-refactor :ensure t
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-m"))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(provide 'javascript)
;;; javascript.el ends here

