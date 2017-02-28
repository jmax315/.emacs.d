(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(async-bytecomp-package-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(ruby-align-chained-calls t)
 '(ruby-insert-encoding-magic-comment nil)
 '(smie-indent-basic 2)
 '(standard-indent 2)
 '(tab-width 2)
 '(truncate-lines t)
 '(web-mode-attr-indent-offset nil)
 '(web-mode-block-padding 2)
 '(web-mode-enable-auto-closing nil)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)

(global-set-key (kbd "C-x g") 'magit-status)

(add-to-list 'auto-mode-alist '("\\.prawn$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))

(add-hook 'after-init-hook 'projectile-rails-global-mode)
