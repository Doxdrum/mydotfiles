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
 '(package-selected-packages
   (quote
    (org-noter org-pdfview smart-mode-line better-defaults ein flycheck flycheck-pycheckers github-theme material-theme py-autopep8 org2web ox-reveal yasnippet-snippets twittering-mode spotify smex powerline pcache paradox paperless org2blog org-tree-slide org-ref org-projectile org-plus-contrib org-gcal org-bullets ob-translate ob-sagemath ob-ipython magithub ivy-bibtex helm-swoop helm-spotify-plus helm-spotify helm-sage helm-projectile google-contacts gnuplot-mode ess epresent elpy djvu dired-k dired+ diff-hl counsel-projectile calfw-gcal calfw bbdb auto-complete-sage auto-compile all-ext 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
