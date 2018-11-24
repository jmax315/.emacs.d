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
 '(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 '(global-linum-mode t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(package-archives
   (quote
	(("melpa" . "https://melpa.org/packages/")
	 ("gnus" . "http://elpa.gnu.org/packages/"))))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(vc-svn-global-switches nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(put 'narrow-to-region 'disabled nil)
(global-prettify-symbols-mode t)


(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-hide-results t)
  (auto-package-update-maybe))

(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (push 'company-robe company-backends))

(use-package eyebrowse
  :ensure t
  :config
  (global-set-key (kbd "<M-kp-1>") 'eyebrowse-switch-to-window-config-1)
  (global-set-key (kbd "<M-kp-3>") 'eyebrowse-switch-to-window-config-2)
  (global-set-key (kbd "<M-kp-7>") 'eyebrowse-switch-to-window-config-3)
  (global-set-key (kbd "<M-kp-9>") 'eyebrowse-switch-to-window-config-4)
  (setq eyebrowse-new-workspace t)
  (eyebrowse-mode t))

(use-package flycheck
  :ensure t)

(use-package flycheck-mmark
  :ensure t)

(use-package flymake-ruby
  :ensure t)

(use-package flymake-yaml
  :ensure t)

(use-package flyparens
  :ensure t)

(use-package geiser
  :ensure t
  :config
  (setq geiser-default-implementation 'chicken))

(use-package helm-rails
  :ensure t)

(use-package helm-rb
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :demand t)

(use-package markdown-mode
  :ensure t)

p(use-package markdown-mode+
  :ensure t)

p(use-package markdown-preview-eww
  :ensure t)

(use-package markup
  :ensure t)

(use-package markup-faces
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

(use-package projectile-rails
  :ensure t)

(use-package rails-log-mode
  :ensure t)

(use-package robe
  :ensure t
  :config (add-hook 'rubymode-hook 'robe-mode))

(use-package yaml-mode
  :ensure t)

(use-package yasnippet
  :ensure t
  :config
  (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
  (yas-global-mode 1))


(add-to-list 'load-path "~/.emacs.d/lisp")
(load-library "alarm.com")
(load-library "sidebar")
