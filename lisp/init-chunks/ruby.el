;;; init chunk for ruby stuff

(setq ruby-insert-encoding-magic-comment nil)

(use-package company-inf-ruby :ensure t)

(use-package enh-ruby-mode :ensure t)

(use-package helm-rails :ensure t)

(use-package helm-rb :ensure t)

(use-package helm-rubygems-local :ensure t)

(use-package helm-rubygems-org :ensure t)

(use-package projectile-rails :ensure t
  :bind (:map projectile-rails-command-map ("C-c r")))

(use-package robe :ensure t
  :config (add-hook 'ruby-mode-hook 'robe-mode)
          (add-hook 'enh-ruby-mode-hook 'robe-mode)
          (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
            (rvm-activate-corresponding-ruby)))

(use-package rspec-mode :ensure t
  :config (add-hook 'dired-mode-hook 'rspec-dired-mode)
          (setq rspec-use-rvm t))

(use-package ruby-hash-syntax :ensure t)

(use-package ruby-interpolation :ensure t)

(use-package ruby-refactor :ensure t)

(use-package rvm :ensure t)

