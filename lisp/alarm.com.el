(defconst alarm-dot-com-c-style
  '((inline-open . 0))
  "Alarm.com linux group style")
(c-add-style "alarm.com" alarm-dot-com-c-style)

(defun my-c-mode-hook ()
  (c-set-style "alarm.com" alarm-dot-com-c-style))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ccspec\\'" . c++-mode))
