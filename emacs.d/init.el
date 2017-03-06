(require 'package)
(package-initialize)
(require 'org)
(org-babel-load-file "~/mydotfiles/emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (use-package twittering-mode smex powerline pdf-tools pcache paradox paperless org2blog org-tree-slide org-ref org-projectile org-plus-contrib org-gcal ob-translate ob-sagemath ob-ipython magithub ivy-bibtex helm-swoop helm-spotify helm-sage helm-projectile google-contacts ess epresent elpy djvu dired-k dired+ diff-hl counsel-projectile common-lisp-snippets calfw-gcal calfw bbdb auto-complete-sage auto-compile all-ext 2048-game)))
 '(paperless-capture-directory "/home/oscar/Documents/SCANS/")
 '(paperless-root-directory "/home/oscar/Documents/Dropbox/")
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
