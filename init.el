(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" .   "https://elpa.gnu.org/packages/"))
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
 '(compilation-scroll-output t)
 '(explicit-bash-args '("--noediting" "-i" "-l"))
 '(global-linum-mode t)
 '(gnus-secondary-select-methods '((nnmaildir "" (directory "~/.maildir"))))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(package-enable-at-startup nil)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(safe-local-variable-values
   '((org-babel-load-languages
      (ditaa . t)
      (emacs-lisp)
      (scheme . t))))
 '(same-window-buffer-names '("*shell*"))
 '(scheme-mit-dialect nil)
 '(scheme-program-name "csi")
 '(show-paren-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 143 :width normal)))))

;; Package auto-updater
(use-package auto-package-update :ensure t
  :config
  (setq auto-package-update-interval 1)
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-hide-results nil))

;; IRC client
(use-package circe :ensure t)

;; Auto-completion
(use-package company :ensure t
  :config
  (global-company-mode t)
  (setq company-backends (delete 'company-semantic company-backends)))

(use-package flycheck :ensure t)

(use-package gcode-mode :ensure t)

(use-package haml-mode :ensure t)

(use-package magit :ensure t
  :bind ("C-x g" . magit-status)
  :demand t)

(use-package php-mode :ensure t)

(use-package projectile :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package python-mode :ensure t)

(use-package restclient :ensure t)

(use-package string-inflection :ensure t)

(use-package yaml-mode :ensure t)

(use-package ztree :ensure t)

(auto-package-update-maybe)
(put 'narrow-to-region 'disabled nil)
(global-prettify-symbols-mode t)
(add-hook 'compilation-mode-hook
          (lambda () (setq truncate-lines t)))

(add-hook 'before-save-hook
          (lambda ()
            (unless (derived-mode-p 'makefile-mode)
              (untabify (point-min) (point-max)))
            (delete-trailing-whitespace (point-min) (point-max))))

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'load-path "~/.emacs.d/lisp")

(load "chunks")
