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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 '(global-linum-mode t)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(tab-width 4)
 '(tool-bar-mode nil))
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

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :demand t)

(use-package yasnippet
  :ensure t
  :config
  (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
  (yas-global-mode 1))

(use-package geiser
  :ensure t
  :config
  (setq geiser-default-implementation 'chicken))


(add-to-list 'load-path "~/.emacs.d/lisp")
(load-library "alarm.com")
(load-library "sidebar")
