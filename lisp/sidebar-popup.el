(defun make-popup (side size &optional init-hook)
  "Create a popup"
  (vector nil size nil side init-hook))

(defun popup-window (popup)
  "Get the window for a popup"
  (elt popup 0))

(defun popup-set-window (popup new-value)
  "Set the window for a popup"
  (aset popup 0 new-value))

(defun popup-size (popup)
  "Get the size of a popup"
  (elt popup 1))

(defun popup-set-size (popup new-value)
  "Set the size of a popup"
  (aset popup 1 new-value))

(defun popup-buffer (popup)
  "Get the buffer for a popup"
  (elt popup 2))

(defun popup-set-buffer (popup new-value)
  "Set the buffer for a popup"
  (aset popup 2 new-value))

(defun popup-side (popup)
  "Get the size for a popup"
  (elt popup 3))

(defun popup-set-init-fn (popup new-value)
  "Set the initialization function for a popup"
  (aset popup 4 new-value))

(defun popup-init-fn (popup-value)
  "Get the initialization function for a popup"
  (elt popup 4))

(defun popup-window-size (popup)
  "Get the active window size for a popup"
  (let ((side (popup-side popup))
		(window (popup-window popup)))
    (cond
     ((or (eq side 'left )
		  (eq side 'right))
      (window-total-width window))

     ((or (eq side 'above)
		  (eq side 'below))
      (window-total-height window))

     (t nil))))


(defun toggle-popup (popup)
  "Show or hide a popup"
  (if (popup-window popup)
      (hide-popup popup)
    (show-popup popup)))

(defun show-popup (popup)
  "Show a popup"
  (if (popup-init-fn popup)
	  (funcall (popup-init-fn popup) popup))

  (popup-set-window popup
					(split-window (frame-root-window)
								  (- (popup-size popup))
								  (popup-side popup)))
  (set-window-parameter (popup-window popup)
						'no-other-window
						t)
  (set-window-buffer (popup-window popup)
					 (popup-buffer popup))
  (select-window (popup-window popup)))

(defun hide-popup (popup)
  "Hide a popup"
  (if (and (popup-window popup) (windowp (popup-window popup)))
      (progn
		(popup-set-size popup (popup-window-size popup))
		(popup-set-buffer popup (window-buffer (popup-window popup)))
		(delete-window (popup-window popup))))
  (popup-set-window popup nil))
