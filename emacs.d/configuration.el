(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
             '("org" . "http://orgmode.org/elpa/") t)

(setq inhibit-splash-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-prettify-symbols-mode t)

(global-hl-line-mode 1)

(setq hrs/default-font "Inconsolata")
(setq hrs/default-font-size 14)
(setq hrs/current-font-size hrs/default-font-size)

(setq hrs/font-change-increment 1.1)

(defun hrs/set-font-size ()
  "Set the font to `hrs/default-font' at `hrs/current-font-size'."
  (set-frame-font
   (concat hrs/default-font "-" (number-to-string hrs/current-font-size))))

(defun hrs/reset-font-size ()
  "Change font size back to `hrs/default-font-size'."
  (interactive)
  (setq hrs/current-font-size hrs/default-font-size)
  (hrs/set-font-size))

(defun hrs/increase-font-size ()
  "Increase current font size by a factor of `hrs/font-change-increment'."
  (interactive)
  (setq hrs/current-font-size
	(ceiling (* hrs/current-font-size hrs/font-change-increment)))
  (hrs/set-font-size))

(defun hrs/decrease-font-size ()
  "Decrease current font size by a factor of `hrs/font-change-increment', down to a minimum size of 1."
  (interactive)
  (setq hrs/current-font-size
	(max 1
	     (floor (/ hrs/current-font-size hrs/font-change-increment))))
  (hrs/set-font-size))

(define-key global-map (kbd "C-)") 'hrs/reset-font-size)
(define-key global-map (kbd "C-+") 'hrs/increase-font-size)
(define-key global-map (kbd "C--") 'hrs/decrease-font-size)

(hrs/reset-font-size)

(load-theme 'deeper-blue)

(powerline-center-theme)

(require 'diff-hl)

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(setq user-full-name "Oscar Castillo-Felisola"
      user-mail-address "o.castillo.felisola@gmail.com"
      calendar-latitude -33.66
      calendar-longitude -71.51
      calendar-location-name "Valparaiso, CHILE")

(setq backup-directory-alist '(("." . "/home/oscar/mydotfiles/emacs.d/backups")))

(ispell-change-dictionary "british" t)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(define-key global-map (kbd "<f10>") 'shell)

(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode t)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(transient-mark-mode 1)
(show-paren-mode 1)
(setq show-paren-style 'expression)

(setq-default truncate-lines nil)
;; Even for org-mode
;; (setq org-startup-truncated nil)

(define-key global-map "\C-x\t" 'pcomplete)

(defun 2-windows-vertical-to-horizontal ()
  (let ((buffers (mapcar 'window-buffer (window-list))))
    (when (= 2 (length buffers))
      (delete-other-windows)
      (set-window-buffer (split-window-horizontally) (cadr buffers)))))

(add-hook 'emacs-startup-hook '2-windows-vertical-to-horizontal)

(set-register ?c '(file . "~/mydotfiles/emacs.d/configuration.org"))
(set-register ?a '(file . "~/Documents/Dropbox/Org/agenda.org"))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(global-set-key (kbd "C-c q") 'auto-fill-mode)

(defun ocf/unfill-paragraph ()
    "Takes a multi-line paragraph and makes it into a single line of text."
    (interactive)
    (let ((fill-column (point-max)))
      (fill-paragraph nil)))

(defun ocf/toggle-fill-paragraph ()
  "Toggle fill paragraph Version 2016-09-20"
  (interactive)
  ;; use a property “state”. Value is t or nil
  (if (get 'ocf/toggle-fill-paragraph 'state)
      (progn (ocf/unfill-paragraph)
             (put 'ocf/toggle-fill-paragraph 'state nil))
    (progn
      (fill-paragraph)
      (put 'ocf/toggle-fill-paragraph 'state t))))

(global-set-key (kbd "M-q") 'ocf/toggle-fill-paragraph)

(subword-mode 1)

(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)



(setq python-indent 2)

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)))

(setq latex-block-names '("theorem" "corollary" "proof"
                          "frame" "block" "alertblock"
                          "definition" "example" "align"
                          "align*" "columns" "tikzpicture"
                          "axis" "cases" "matrix" "pmatrix"
                          "vmatrix" "parts" "questions"
                          "solution" "Ebox" "WEbox" "widetext"
                          "dmath" "dmath*" "split"))

(global-set-key (kbd "C-x g") 'magit-status)

;; (add-to-list 'load-path "/home/oscar/mydotfiles/emacs.d/org-mode/lisp/")
;; (add-to-list 'load-path "/home/oscar/mydotfiles/emacs.d/org-mode/contrib/lisp/" )

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.tex$" . latex-mode))

(global-set-key "\C-cl" 'org-store-link) 
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(setq org-indirect-buffer-display 'current-window)
(setq org-startup-indented t)
(setq org-src-preserve-indentation nil)
(setq org-edit-src-content-indentation 0)

(require 'org-bullets)
(setq org-bullets-bullet-list '("◉" "◎" "⚫" "○" "►" "◇"))
(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode 1)))

(setq org-hide-leading-stars t)

(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-window-setup 'current-window)

;;(require 'ob-ipython)
(org-babel-do-load-languages 'org-babel-load-languages 
  '((R . t) 
    (emacs-lisp . t) 
    (latex . t)
    (python . t)
    (shell . t)
    (gnuplot . t)
    (maxima . t)
    (ledger . t)
    (org . t)
    (octave . t)
    (ipython . t)
    (mathematica . t)
))

(setq org-confirm-babel-evaluate nil)

(setq org-log-done 'note)

(setq org-directory "/home/oscar/Documents/Dropbox/Org")

(defun org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

;; (setq org-inbox-file "/home/oscar/Documents/Dropbox/inbox.org")
;; (setq org-index-file (org-file-path "index.org"))
(setq org-archive-location
      (concat (org-file-path "archive.org") "::* From %s"))

(defvar ocf/organization-task-id "c047fc98-58f3-4291-87e3-99465facb9aa")

(defun ocf/clock-in-organization-task-as-default ()
  (interactive)
  (org-with-point-at (org-id-find ocf/organization-task-id 'marker)
                     (org-clock-in '(16))))

(global-set-key (kbd "<f9> I")
                'ocf/clock-in-organization-task-as-default)

(setq org-use-fast-todo-selection t)

(setq org-todo-keywords     
      '((sequence "TODO(t)" "STARTED(s!)" "NEXT(n)" "FEEDBACK(f@/!)" "VERIFY(v)" "WAITING(w@/!)" 
                  "|" "DONE(d)" "DELEGATED(l@/!)" "CANCELLED(c@/!)")))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("STARTED" :foreground "yellow" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("FEEDBACK" :foreground "blue" :weight bold)
              ("VERIFY" :foreground "magenta" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("DELEGATED" :foreground "forest green" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("FEEDBACK" ("WAITING") ("FEEDBACK" . t))
              (done ("WAITING") ("FEEDBACK"))
              ("TODO" ("WAITING") ("CANCELLED") ("FEEDBACK"))
              ("NEXT" ("WAITING") ("CANCELLED") ("FEEDBACK"))
              ("DONE" ("WAITING") ("CANCELLED") ("FEEDBACK")))))

(setq org-agenda-files (quote ("/home/oscar/Documents/Dropbox/Org")))

(setq org-default-notes-file "~/git/org/refile.org")

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

(setq org-refile-allow-creating-parent-nodes (quote confirm))

(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Documents/Dropbox/Org/refile.org")
               "* TODO %?\n%U\n%a\n")
              ("r" "respond" entry (file "~/Documents/Dropbox/Org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n")
              ("n" "note" entry (file "~/Documents/Dropbox/Org/refile.org")
               "* %? :NOTE:\n%U\n%a\n")
              ("j" "Journal" entry (file+datetree "~/Documents/Dropbox/Org/diary.org")
               "* %?\n%U\n")
              ("w" "org-protocol" entry (file "~/Documents/Dropbox/Org/refile.org")
               "* TODO Review %c\n%U\n" )
              ("m" "Meeting" entry (file "~/Documents/Dropbox/Org/refile.org")
               "* MEETING with %? :MEETING:\n%U" )
              ("p" "Phone call" entry (file "~/Documents/Dropbox/Org/refile.org")
               "* PHONE %? :PHONE:\n%U" )
              ("h" "Habit" entry (file "~/Documents/Dropbox/Org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

(eval-after-load "org"
  '(add-to-list 'org-structure-template-alist
                '("E" "\\begin\{equation\}\n?\n\\end\{equation\}" "")))
(eval-after-load "org"
  '(add-to-list 'org-structure-template-alist
                '("j" "\\begin\{split\}\n?\n\\end\{split\}" "")))
(eval-after-load "org"
  '(add-to-list 'org-structure-template-alist
                '("C" "#+BEGIN_COMMENT\n?\n#+END_COMMENT" "")))
(eval-after-load "org"
  '(add-to-list 'org-structure-template-alist   
                '("G" "\\begin\{align\}\n?\n\\end\{align\}" "")))

(setq org-image-actual-width nil)

(global-unset-key (kbd "C-c ["))

(require 'org-ref)

(setq reftex-default-bibliography '("/home/oscar/Documents/LatexFiles/References.bib"))

(setq org-ref-bibliography-notes"/home/oscar/Documents/Dropbox/Org/RefNotes.org"
      org-ref-default-bibliography '("/home/oscar/Documents/LatexFiles/References.bib")
      org-ref-pdf-directory "/home/oscar/Bibliography/bibtex-pdf/")

(setq bibtex-completion-bibliography "/home/oscar/Documents/LatexFiles/References.bib"
      bibtex-completion-library-path "/home/oscar/Bibliography/bibtex-pdf/")

(setq  helm-bibtex-pdf-field "file")
(setq helm-bibtex-pdf-open-function
  (lambda (fpath)
    (start-process "evince" "*helm-bibtex-evince*" "/usr/bin/evince" fpath)))

(require 'org-ref-arxiv)

(require 'org-ref-isbn)

(require 'org-ref-latex)

(setq helm-bibtex-notes-path "/home/oscar/Documents/Dropbox/Org/RefNotes.org")

(require 'calfw)
(require 'calfw-org)

(require 'org-gcal) 
(setq org-gcal-client-id "459480878076-s0md9sb6s3tq7irlhmmk7hjt7r391o6n.apps.googleusercontent.com" 
      org-gcal-client-secret "-SphSdn3WDrZJ1Z_JFTXEkcc" 
      org-gcal-file-alist '(("aetptsksd2rroqmq5ealbd9oec@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Personal
			    ("ok0q79kgahqiu6mkp7uplamahk@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Research Ideas
			    ("mfrmolv12h6sjdfbo8iobd1h1o@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Seminaries
			    ("q6pkpsevenacdctgcj9dur1c8o@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Lecture prep.
			    ("j10hh2p19p7j7qmh3bvvn32ilg@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Work meeting
			    )
      )

(setq org-file-apps
      (quote
       ((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ("\\.pdf\\'" . "evince %s"))))

(setq org-latex-prefer-user-labels t)

(require 'ox-latex)
(setq org-export-latex-listings t)
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "xcolor"))
(add-to-list 'org-latex-packages-alist '("" "tikz" t))
(setq org-latex-listings-langs
      (quote ((emacs-lisp "Lisp")
              (lisp "Lisp")
              (clojure "Lisp")
              (c "C")
              (cc "C++")
              (fortran "fortran")
              (perl "Perl")
              (cperl "Perl")
              (python "Python")
              (ruby "Ruby")
              (html "HTML")
              (xml "XML")
              (tex "TeX")
              (latex "[LaTeX]TeX")
              (shell-script "bash")
              (gnuplot "Gnuplot")
              (ocaml "Caml")
              (caml "Caml")
              (sql "SQL")
              (sqlite "sql")
              (R-mode "R"))))

(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))

(setq org-latex-create-formula-image-program 'imagemagick)

(setq org-latex-pdf-process (list "latexmk -pdf -bibtex %f"))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.4))

(setq org-publish-project-alist
      '( ("paper"
          :base-directory "~/Documents/Dropbox/Org"
          :base-extension "org"
          :publishing-directory "~/Documents/Dropbox/Org/export"
          :publishing-function org-latex-publish-to-pdf)
         )
      )

(pdf-tools-install)

(require 'google-contacts)
(require 'google-contacts-gnus)
;; (require 'google-contacts-message) ; for message-mode (not yet installed)

;(auth-source-save-behavior nil)
;(send-mail-function (quote smtpmail-send-it))

(setq sage-shell:sage-executable "/home/oscar/Software/sage/sage")

(sage-shell:define-alias)
;; Turn on eldoc-mode
(add-hook 'sage-shell-mode-hook #'eldoc-mode)
(add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)

(setq sage-shell:completion-function 'pcomplete)

;; Ob-sagemath supports only evaluating with a session.
(setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "output")))

;; C-c c for asynchronous evaluating (only for SageMath code blocks).
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c c") 'ob-sagemath-execute-async))

;; Do not confirm before evaluation
(setq org-confirm-babel-evaluate nil)

;; Do not evaluate code blocks when exporting.
(setq org-export-babel-evaluate nil)

;; Show images when opening a file.
(setq org-startup-with-inline-images t)

;; Show images after evaluating code blocks.
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

(eval-after-load "sage-shell-mode"
  '(sage-shell:define-keys sage-shell-mode-map
     "C-c C-i"  'helm-sage-complete
     "C-c C-h"  'helm-sage-describe-object-at-point
     "M-r"      'helm-sage-command-history
     "C-c o"    'helm-sage-output-history))

;; ;; Start .emacs


;; ;; After installation of the spkg, you must add something like the
;; ;; following to your .emacs:

;; (add-to-list 'load-path "/home/oscar/Software/sage/local/share/emacs/site-lisp/sage-mode")
;; (require 'sage "sage")
;; (setq sage-command "/home/oscar/Software/sage/sage")

;; ;; If you want sage-view to typeset all your output and display plot()
;; ;; commands inline, uncomment the following line and configure sage-view:
;; ;; (add-hook 'sage-startup-after-prompt-hook 'sage-view)
;; ;; In particular customize the variables `sage-view-default-commands'
;; ;; and `sage-view-inline-plots-method'.
;; ;; Using sage-view to typeset output requires a working LaTeX
;; ;; installation with the preview package.

;; ;; Also consider running (customize-group 'sage) to see more options.

;; ;; End .emacs

(setq paradox-github-token "c9b5c0c7c8ec912862ce5da3b186722a661aa914")
(setq paradox-automatically-star t)
