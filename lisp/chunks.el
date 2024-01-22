;;; chunks --- Load the init-chunks

;;; Commentary:
;;;   loads up some or all of the language support

;;; Code:
(load "init-chunks/c.el")
(load "init-chunks/docker.el")
(load "init-chunks/elixir.el")
(load "init-chunks/javascript.el")
(load "init-chunks/markdown.el")
(load "init-chunks/org.el")
(load "init-chunks/python.el")
(load "init-chunks/ruby.el")
(load "init-chunks/rust.el")
(load "init-chunks/scheme.el")
(load "init-chunks/web-mode.el")

(provide 'chunks)
;;; chunks.el ends here
