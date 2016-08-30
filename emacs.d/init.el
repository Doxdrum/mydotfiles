(require 'package)
(package-initialize)
(require 'org)
(org-babel-load-file "~/mydotfiles/emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Documents/Dropbox/Org/geometry.org" "/home/oscar/Documents/Dropbox/Org/PAG.org" "/home/oscar/Documents/Dropbox/Org/agenda.org" "/home/oscar/Documents/Dropbox/Org/archive.org" "/home/oscar/Documents/Dropbox/Org/computer.org" "/home/oscar/Documents/Dropbox/Org/interest.org" "/home/oscar/Documents/Dropbox/Org/reduction.org" "/home/oscar/Documents/Dropbox/Org/refile.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
