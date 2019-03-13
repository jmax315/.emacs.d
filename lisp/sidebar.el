(load "sidebar-popup.el")

(defun make-sidebar-dired-popup (new-popup)
  (save-window-excursion
	(save-mark-and-excursion
	 (save-current-buffer
	   (let ((dired-buffer (if (package-installed-p 'projectile)
							   (projectile-dired)
							 (dired-noselect "."))))
		 (popup-set-buffer new-popup dired-buffer)
		 (set-buffer dired-buffer)
		 (setq truncate-lines t))))))

(defun make-sidebar-magit-popup (new-popup)
  (if (and (package-installed-p 'magit)
		   (magit-toplevel))
	  (progn
  		(save-window-excursion
		  (save-mark-and-excursion
		   (save-current-buffer
			 (magit-mode-setup #'magit-status-mode))
		   (popup-set-buffer new-popup
							 (magit-mode-get-buffer 'magit-status-mode)))))))

(defun make-sidebar-shell-popup (new-popup)
  (save-window-excursion
	(save-mark-and-excursion
	 (save-current-buffer
	   (popup-set-buffer new-popup
						 (if (package-installed-p 'projectile)
							 (projectile-run-shell)
						   (shell)))))))

(defun make-sidebar-compile-popup (new-popup)
  (save-window-excursion
	(save-mark-and-excursion
	 (save-current-buffer
 	   (if (package-installed-p 'projectile)
  	   	   (projectile-compile-project 1))
	   (popup-set-buffer new-popup (get-buffer-create "*compilation*"))))))


(defvar left-popup  (make-popup 'left 32 (function make-sidebar-magit-popup)))
;; ToDo: Integrate with sr-speedbar
;(defvar right-popup   (make-popup 'left  64 (function make-sidebar-dired-popup)))
(defvar top-popup    (make-popup 'above 10 (function make-sidebar-compile-popup)))
(defvar bottom-popup (make-popup 'below 10 (function make-sidebar-shell-popup)))

(defun toggle-left-popup ()
  "Pop up a window on the left, or hide it"
  (interactive)
  (toggle-popup left-popup))

;; ToDo: Integrate with sr-speedbar
;; (defun toggle-right-popup ()
;;   "Pop up a window on the right, or hide it"
;;   (interactive)
;;   (toggle-popup right-popup))

(defun toggle-top-popup ()
  "Pop up a window on the top, or hide it"
  (interactive)
  (toggle-popup top-popup))

(defun toggle-bottom-popup ()
  "Pop up a window on the bottom, or hide it"
  (interactive)
  (toggle-popup bottom-popup))

(defun hide-all-popups ()
  "Hide all popup windows"
  (interactive)
  (hide-popup top-popup)
  (hide-popup bottom-popup)
  (hide-popup left-popup)
  (hide-popup right-popup))

(global-set-key [kp-2] 'toggle-bottom-popup)
(global-set-key [kp-4] 'toggle-left-popup)
(global-set-key [kp-5] 'hide-all-popups)
;; (global-set-key [kp-6] 'toggle-right-popup)
(global-set-key [kp-8] 'toggle-top-popup)

