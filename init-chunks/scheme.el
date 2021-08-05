;;; init chunk for scheme stuff

;; inferior scheme package
(use-package geiser :ensure t
  :config
  (setq geiser-default-implementation 'chicken)
  (setq geiser-mode-smart-tab-p t)
  (setq geiser-mode-start-repl-p t)
  (setq geiser-active-implementations '(chicken))
  (setq geiser-implementations-alist '(((regexp "\\.scm$")
                                        chicken))))

(use-package geiser-chez :ensure t)
(use-package geiser-chibi :ensure t)
(use-package geiser-chicken :ensure t)
(use-package geiser-gambit :ensure t)
(use-package geiser-gauche :ensure t)
(use-package geiser-guile :ensure t)
(use-package geiser-kawa :ensure t)
(use-package geiser-mit :ensure t)
(use-package geiser-racket :ensure t)
(use-package geiser-stklos :ensure t)

;; adds macro expansion to geiser
(use-package macrostep-geiser :ensure t)
