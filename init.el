(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" .        "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" .          "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(async-bytecomp-package-mode t)
 '(auto-package-update-interval 1)
 '(auto-package-update-prompt-before-update t)
 '(compilation-scroll-output t)
 '(explicit-bash-args '("--noediting" "-i" "-l"))
 '(geiser-active-implementations '(chicken))
 '(geiser-implementations-alist
   '(((regexp "\\.scm$")
      chicken)
     ((regexp "\\.meta$")
      chicken)
     ((regexp "\\.setup$")
      chicken)
     ((regexp "\\.page$")
      chicken)))
 '(global-linum-mode t)
 '(gnus-secondary-select-methods '((nnmaildir "" (directory "~/.maildir"))))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-enable-at-startup nil)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   '((geiser-chicken-binary . "/home/jmax/.dust/user/jmax/active/bin/csi")
     (geiser-chicken--binary . "/home/jmax/.dust/user/jmax/active/bin/csi")))
 '(same-window-buffer-names '("*shell*"))
 '(scheme-mit-dialect nil)
 '(scheme-program-name "csi")
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(vc-svn-global-switches nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 143 :width normal)))))

;; Python code navigation etc.
(use-package anaconda-mode :ensure t)

;; Package auto-updater
(use-package auto-package-update :ensure t
  :config
  (setq auto-package-update-interval 1)
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-hide-results nil))

;; IRC client
(use-package circe :ensure t)

(use-package coffee-mode :ensure t)

;; Auto-completion
(use-package company :ensure t
  :config
  (global-company-mode t)
  (setq company-backends (delete 'company-semantic company-backends)))

(use-package company-inf-ruby :ensure t)

;; Docker  commands
(use-package docker :ensure t
  :bind ("C-c d" . docker))

(use-package docker-api :ensure t)

(use-package docker-cli :ensure t)

(use-package docker-compose-mode :ensure t)

;; Extend tramp to handle docker containers
(use-package docker-tramp :ensure t)

(use-package dockerfile-mode :ensure t)

(use-package enh-ruby-mode :ensure t)

;; workspace tool
(use-package eyebrowse :ensure t
  :config
  (global-set-key (kbd "<kp-4>") 'eyebrowse-switch-to-window-config-0)
  (global-set-key (kbd "<kp-5>") 'eyebrowse-switch-to-window-config-1)
  (global-set-key (kbd "<kp-6>") 'eyebrowse-switch-to-window-config-2)
  (setq eyebrowse-new-workspace t)
  (eyebrowse-mode t))

(use-package flycheck :ensure t)

(use-package gcode-mode :ensure t)

;; inferior scheme package
(use-package geiser :ensure t
  :config
  (setq geiser-default-implementation 'chicken)
  (setq geiser-mode-smart-tab-p t)
  (setq geiser-mode-start-repl-p t))

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

;; tags package
(use-package ggtags :ensure t
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode)
                (ggtags-mode 1)))))

(use-package haml-mode :ensure t)

(use-package helm-rails :ensure t)

(use-package helm-rb :ensure t)

(use-package helm-rubygems-local :ensure t)

(use-package helm-rubygems-org :ensure t)

;; adds macro expansion to geiser
(use-package macrostep-geiser :ensure t)

(use-package magit :ensure t
  :bind ("C-x g" . magit-status)
  :demand t)

(use-package markdown-mode :ensure t)

(use-package markdown-mode+ :ensure t)

(use-package markdown-preview-eww :ensure t)

(use-package markup :ensure t)

(use-package markup-faces :ensure t)

(use-package php-mode :ensure t)

(use-package projectile :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package projectile-rails :ensure t
  :bind (:map projectile-rails-command-map ("C-c r")))

(use-package python-mode :ensure t)

;;
(use-package restclient :ensure t)

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

(use-package sr-speedbar :ensure t
  :config
  (global-set-key [kp-6] 'sr-speedbar-toggle))

(use-package string-inflection :ensure t)

(use-package web-mode :ensure t
  :mode ("/\\(components\\|containers\\|src\\)/.*\\.js[x]?\\'")
  :config (progn
            (setq
             web-mode-content-types-alist
             '(("jsx" . "/\\(components\\|containers\\|src\\)/.*\\.js[x]?\\'")))))

(use-package yaml-mode :ensure t)

(use-package ztree :ensure t)

(auto-package-update-maybe)
(put 'narrow-to-region 'disabled nil)
(global-prettify-symbols-mode t)
(add-hook 'compilation-mode-hook
          (lambda ()
            (setq truncate-lines t)))

(add-to-list 'auto-mode-alist '("\\.cspec\\'" . c-mode))

(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))

(add-to-list 'auto-mode-alist '("\\.page\\'" . scheme-mode))
(add-hook 'scheme-mode-hook
          (lambda ()
            (dolist (kw '(describe it before after))
              (put kw 'scheme-indent-function 'defun))
            (font-lock-add-keywords
             nil
             '(("(\\(describe\\) " . font-lock-keyword-face)
               ("(\\(context\\) " . font-lock-keyword-face)
               ("(\\(it\\) "       . font-lock-keyword-face)
               ("(\\(before\\) "   . font-lock-keyword-face)
               ("(\\(after\\) "    . font-lock-keyword-face)))))


(add-hook 'before-save-hook
          (lambda ()
            (unless (derived-mode-p 'makefile-mode)
              (untabify (point-min) (point-max)))
            (delete-trailing-whitespace (point-min) (point-max))))

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'load-path "~/.emacs.d/lisp")

(unless (display-graphic-p) (load "./text-mode-customizations.el"))
