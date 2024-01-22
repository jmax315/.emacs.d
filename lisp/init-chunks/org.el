(setq org-agenda-files '("~/Free_Energy/House.org" "~/Free_Energy/Chores.org"))
(setq org-babel-load-languages '((emacs-lisp . t) (scheme . t) (ditaa . t)))
(setq org-confirm-babel-evaluate nil)
(setq org-ditaa-jar-path "/usr/share/ditaa/lib/ditaa.jar")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
	 (forth . t)
	 (emacs-lisp . t)
	 (scheme . t)))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
