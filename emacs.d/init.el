(require 'package)
(package-initialize)
(require 'org)
(org-babel-load-file "~/Software/git.src/mydotfiles/emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(org-agenda-files
   (quote
    ("~/Documents/Dropbox/GDH-gravitones/Org-mode/GDH-gravitons.org" "/home/oscar/Documents/Dropbox/Org/Getting Started with Orgzly.org" "/home/oscar/Documents/Dropbox/Org/HEP_school_2018.org" "/home/oscar/Documents/Dropbox/Org/PAG.org" "/home/oscar/Documents/Dropbox/Org/QFT.org" "/home/oscar/Documents/Dropbox/Org/RefNotes.org" "/home/oscar/Documents/Dropbox/Org/Seminaries.org" "/home/oscar/Documents/Dropbox/Org/agenda.org" "/home/oscar/Documents/Dropbox/Org/archive.org" "/home/oscar/Documents/Dropbox/Org/computer.org" "/home/oscar/Documents/Dropbox/Org/condominio.org" "/home/oscar/Documents/Dropbox/Org/geometry.org" "/home/oscar/Documents/Dropbox/Org/gmail-agenda.org" "/home/oscar/Documents/Dropbox/Org/important.org" "/home/oscar/Documents/Dropbox/Org/interest.org" "/home/oscar/Documents/Dropbox/Org/reduction.org" "/home/oscar/Documents/Dropbox/Org/refile.org")))
 '(package-selected-packages
   (quote
    (common-lisp-snippets company-quickhelp company-shell company-web zerodark-theme transpose-frame typing org-noter org-pdfview smart-mode-line better-defaults ein flycheck flycheck-pycheckers github-theme material-theme py-autopep8 org2web ox-reveal yasnippet-snippets twittering-mode spotify smex powerline pcache paradox paperless org2blog org-tree-slide org-ref org-projectile org-plus-contrib org-gcal org-bullets ob-translate ob-sagemath ob-ipython magithub ivy-bibtex helm-swoop helm-spotify-plus helm-spotify helm-sage helm-projectile google-contacts gnuplot-mode ess epresent elpy djvu dired-k dired+ diff-hl counsel-projectile calfw-gcal calfw bbdb auto-complete-sage auto-compile all-ext 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
