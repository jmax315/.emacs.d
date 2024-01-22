;;; package --- jmax's emacs setup
;;; Commentary:
;;; Code:
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
 '(compilation-error-regexp-alist
   '(absoft ada aix ant bash borland python-tracebacks-and-caml cmake cmake-info comma msft edg-1 edg-2 epc ftnchek gradle-kotlin iar ibm irix java javac jikes-file maven jikes-line clang-include gcc-include ruby-Test::Unit gmake gnu cucumber lcc makepp mips-1 mips-2 omake oracle perl php rxp shellcheck sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint guile-file guile-line
            ("^ *# \\(.*_spec/[^:]*\\):\\([0-9]+\\)" 1 2)))
 '(compilation-scroll-output t)
 '(explicit-bash-args '("--noediting" "-i" "-l"))
 '(geiser-chicken-binary "/home/jmax/.asdf/shims/csi")
 '(global-linum-mode t)
 '(gnus-secondary-select-methods '((nnmaildir "" (directory "~/.maildir"))))
 '(indent-tabs-mode nil)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(js-jsx-syntax t)
 '(markdown-command "markdown_py")
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-targets org-agenda-files)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(treemacs-tab-bar treemacs-projectile treemacs-magit treemacs-icons-dired treemacs web-mode helm-rb ztree zpresent use-package string-inflection rvm rustic ruby-refactor ruby-interpolation ruby-hash-syntax rspec-mode robe restclient python-mode projectile-rails php-mode org-tree-slide markup-faces markup markdown-preview-eww magit macrostep-geiser lsp-ui jupyter json-mode js2hl js2-highlight-vars helm-rubygems-org helm-rubygems-local helm-rails helm-projectile helm-flycheck haml-mode ggtags geiser-stklos geiser-racket geiser-mit geiser-kawa geiser-guile geiser-gauche geiser-gambit geiser-chicken geiser-chibi geiser-chez gcode-mode flycheck-jest flycheck-elixir flycheck-dogma flycheck-dialyxir flycheck-credo flycheck-color-mode-line expand-region enh-ruby-mode elixir-yasnippets dockerfile-mode docker-tramp docker-compose-mode docker-cli docker-api docker discover-js2-refactor company-inf-ruby circe auto-package-update anaconda-mode alchemist))
 '(projectile-rails-custom-server-command "bash -i -c 'bundle exec rails server'")
 '(projectile-rails-global-mode t)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(same-window-buffer-names '("*shell*"))
 '(scheme-mit-dialect nil)
 '(scheme-program-name "csi")
 '(show-paren-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 143 :width normal))))
 '(zpresent-whole-screen-face ((t nil))))

;; Package auto-updater
(use-package auto-package-update :ensure t
  :config
  (setq auto-package-update-interval 1)
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-hide-results t))

;; Auto-completion
(use-package company :ensure t
  :config
  (global-company-mode t)
  (setq company-backends (delete 'company-semantic company-backends)))

;; Semantic region expansion
(use-package expand-region :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

(use-package flycheck :ensure t
	:init (global-flycheck-mode))
(use-package flycheck-color-mode-line :ensure t)
(use-package helm-flycheck :ensure t)

(use-package gcode-mode :ensure t)

(use-package haml-mode :ensure t)

(use-package magit :ensure t
  :bind ("C-x g" . magit-status)
  :demand t)

(use-package projectile :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))
(use-package helm-projectile :ensure t)

(use-package string-inflection :ensure t
	:bind ("C-," . string-inflection-all-cycle))

(use-package yaml-mode :ensure t)

(use-package ztree :ensure t)


(auto-package-update-maybe)
(put 'narrow-to-region 'disabled nil)
(global-prettify-symbols-mode t)
(helm-mode 1)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'asdf)
(asdf-enable)

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(load "chunks")

(provide 'init)
;;; init.el ends here

