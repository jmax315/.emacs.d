;;; docker stuff

;; Docker  commands
(use-package docker :ensure t
  :bind ("C-c d" . docker))

(use-package docker-api :ensure t)

(use-package docker-cli :ensure t)

(use-package docker-compose-mode :ensure t)

;; Extend tramp to handle docker containers
(use-package docker-tramp :ensure t)

(use-package dockerfile-mode :ensure t)
