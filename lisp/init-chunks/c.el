;;; init chunk for C/C++ stuff

;; tags package
(use-package ggtags :ensure t
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode)
                (ggtags-mode 1)))))
