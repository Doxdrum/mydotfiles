(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
             '("org" . "http://orgmode.org/elpa/") t)

(setq-default frame-title-format '("%f [%m]"))

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
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(setq user-full-name "Oscar Castillo-Felisola"
      user-mail-address "o.castillo.felisola@gmail.com"
      calendar-latitude -33.66
      calendar-longitude -71.51
      calendar-location-name "Valparaiso, CHILE")

(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "/home/oscar/Software/git.src/mydotfiles/emacs.d/backups")))

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

(set-register ?c '(file . "~/Software/git.src/mydotfiles/emacs.d/configuration.org"))
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

(require 'yasnippet)
(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)



(mapc (lambda (x)
        (add-to-list 'completion-ignored-extensions x))
      '(".aux" ".bbl" ".blg" ".exe"
        ".log" ".meta" ".out" ".pyg"
        ".synctex.gz" ".tdo" ".toc"
        "-pkg.el" "_latexmk" ".fls"))

(fset 'ocf/inline-eq
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([92 40 92 41 67108914 2] 0 "%d")) arg)))

(global-set-key (kbd "C-¿") 'ocf/inline-eq)

(fset 'ocf/displaymode
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([92 91 return return 92 93 16] 0 "%d")) arg)))

(global-set-key (kbd "C-¡") 'ocf/displaymode)

(setq send-mail-function 'smtpmail-send-it)

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
                          "dmath" "dmath*" "split" "cdbexample"
			  "cdbexample*"))

(global-set-key (kbd "C-x g") 'magit-status)

(require 'magithub)

;; (add-to-list 'load-path "/home/oscar/mydotfiles/emacs.d/org-mode/lisp/")
;; (add-to-list 'load-path "/home/oscar/mydotfiles/emacs.d/org-mode/contrib/lisp/" )

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.tex$" . latex-mode))

(global-set-key "\C-cl" 'org-store-link) 
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(setq org-use-speed-commands t)

(add-to-list 'org-speed-commands-user (cons "m" 'org-mark-subtree))

(add-to-list 'org-speed-commands-user (cons "P" 'org-set-property))
(add-to-list 'org-speed-commands-user (cons "d" 'org-deadline))

(setq org-indirect-buffer-display 'current-window)
(setq org-startup-indented t)
(setq org-src-preserve-indentation nil)
(setq org-edit-src-content-indentation 0)
(setq org-src-tab-acts-natively t)

; add <p for python expansion
(add-to-list 'org-structure-template-alist
	     '("p" "#+BEGIN_SRC python :results output org drawer\n?\n#+END_SRC"
	       "<src lang=\"python\">\n?\n</src>"))

;; add <por for python expansion with raw output
(add-to-list 'org-structure-template-alist
	     '("por" "#+BEGIN_SRC python :results output raw\n?\n#+END_SRC"
	       "<src lang=\"python\">\n?\n</src>"))

;; add <pv for python expansion with value
(add-to-list 'org-structure-template-alist
	     '("pv" "#+BEGIN_SRC python :results value\n?\n#+END_SRC"
	       "<src lang=\"python\">\n?\n</src>"))

;; add <el for emacs-lisp expansion
(add-to-list 'org-structure-template-alist
	     '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"
	       "<src lang=\"emacs-lisp\">\n?\n</src>"))

(add-to-list 'org-structure-template-alist
	     '("ell" "#+BEGIN_SRC emacs-lisp :lexical t\n?\n#+END_SRC"
	       "<src lang=\"emacs-lisp\">\n?\n</src>"))

;; add <sh for shell
(add-to-list 'org-structure-template-alist
	     '("sh" "#+BEGIN_SRC sh\n?\n#+END_SRC"
	       "<src lang=\"shell\">\n?\n</src>"))

(add-to-list 'org-structure-template-alist
	     '("lh" "#+latex_header: " ""))

(add-to-list 'org-structure-template-alist
	     '("lc" "#+latex_class: " ""))

(add-to-list 'org-structure-template-alist
	     '("lco" "#+latex_class_options: " ""))

(add-to-list 'org-structure-template-alist
	     '("ao" "#+attr_org: " ""))

(add-to-list 'org-structure-template-alist
	     '("al" "#+attr_latex: " ""))

(add-to-list 'org-structure-template-alist
	     '("ca" "#+caption: " ""))

(add-to-list 'org-structure-template-alist
	     '("tn" "#+tblname: " ""))

(add-to-list 'org-structure-template-alist
	     '("n" "#+name: " ""))

(add-to-list 'org-structure-template-alist
	     '("o" "#+options: " ""))

(add-to-list 'org-structure-template-alist
	     '("ti" "#+title: " ""))

;; ;; table expansions
;; (loop for i from 1 to 6
;;       do
;;       (let ((template (make-string i ?t))
;; 	    (expansion (concat "|"
;; 			       (mapconcat
;; 				'identity
;; 				(loop for j to i collect "   ")
;; 				"|"))))
;; 	(setf (substring expansion 2 3) "?")
;; 	(add-to-list 'org-structure-template-alist
;; 		     '(,template ,expansion ""))))

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
    (fortran . t)
    (C . t)
    (ipython . t)
    (mathematica . t)
))

(setq org-confirm-babel-evaluate nil)

(setq org-src-block-faces '(("emacs-lisp" (:background "DarkSlateGrey"))
			    ("python" (:background "DarkOrange4"))
			    ("ipython" (:background "AntiqueWhite4"))
			    ("latex" (:background "MidnightBlue"))
			    ("shell" (:background "DarkGreen"))))

(define-derived-mode cadabra-mode python-mode "cadabra"
  ; make #a symbol constituent
  (modify-syntax-entry ?# "_" cadabra-mode-syntax-table))

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
                  "|" "DONE(d)" "DELEGATED(l@/!)" "CANCELLED(c@/!)")
	(sequence "TASK(f)" "|" "DONE(d)")
	(sequence "MAYBE(m)" "|" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
	("MAYBE" . (:foreground "sea green"))
	("TASK" . (:foreground "blue"))
	("STARTED" :foreground "yellow" :weight bold)
	("NEXT" :foreground "blue" :weight bold)
	("FEEDBACK" :foreground "blue" :weight bold)
	("VERIFY" :foreground "magenta" :weight bold)
	("WAITING" :foreground "orange" :weight bold)
	("DONE" :foreground "forest green" :weight bold)
	("DELEGATED" :foreground "forest green" :weight bold)
	("CANCELLED" :foreground "forest green" :weight bold)))

(setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
	("WAITING" ("WAITING" . t))
	("FEEDBACK" ("WAITING") ("FEEDBACK" . t))
	(done ("WAITING") ("FEEDBACK"))
	("TODO" ("WAITING") ("CANCELLED") ("FEEDBACK"))
	("NEXT" ("WAITING") ("CANCELLED") ("FEEDBACK"))
	("DONE" ("WAITING") ("CANCELLED") ("FEEDBACK"))))

(setq org-agenda-files (quote ("/home/oscar/Documents/Dropbox/Org")))

(setq org-agenda-custom-commands
      '(("h" "Work todos" tags-todo
         "-personal-doat={.+}-dowith={.+}/!-TASK"
         ((org-agenda-todo-ignore-scheduled t)))
        ("H" "All work todos" tags-todo "-personal/!-TASK-MAYBE"
         ((org-agenda-todo-ignore-scheduled nil)))
        ("A" "Work todos with doat or dowith" tags-todo
         "-personal+doat={.+}|dowith={.+}/!-TASK"
         ((org-agenda-todo-ignore-scheduled nil)))
        ("j" "TODO dowith and TASK with"
         ((org-sec-with-view "TODO dowith")
          (org-sec-where-view "TODO doat")
          (org-sec-assigned-with-view "TASK with")
          (org-sec-stuck-with-view "STUCK with")))
        ("J" "Interactive TODO dowith and TASK with"
         ((org-sec-who-view "TODO dowith")))))

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
               "* PHONE %? :PHONE:\n%U\n" )
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

(setq org-startup-with-inline-images "inlineimages")

(setq org-image-actual-width nil)

(add-hook 'org-babel-after-execute-hook
	  'org-display-inline-images)

;; Suggested on the org-mode maillist by Julian Burgos
(add-to-list 'image-file-name-extensions "pdf")
(add-to-list 'image-file-name-extensions "eps")

(add-to-list 'image-type-file-name-regexps '("\\.eps\\'" . imagemagick))
(add-to-list 'image-file-name-extensions "eps")
(add-to-list 'image-type-file-name-regexps '("\\.pdf\\'" . imagemagick))
(add-to-list 'image-file-name-extensions "pdf")

(setq imagemagick-types-inhibit (remove 'PDF imagemagick-types-inhibit))

(require 'ivy-bibtex)

(setq bibtex-completion-bibliography "/home/oscar/Documents/LatexFiles/References.bib")
(setq bibtex-completion-library-path "/home/oscar/Documents/Bibliography/bibtex-pdfs/")

;; using bibtex path reference to pdf file
(setq bibtex-completion-pdf-field "File")

(setq ivy-bibtex-default-action 'bibtex-completion-insert-citation)

(global-unset-key (kbd "C-c ["))

(setq org-ref-completion-library 'org-ref-ivy-cite)
(require 'org-ref)

(setq reftex-default-bibliography '("/home/oscar/Documents/LatexFiles/References.bib"))

(setq org-ref-bibliography-notes "/home/oscar/Documents/Dropbox/Org/RefNotes.org"
      org-ref-default-bibliography '("/home/oscar/Documents/LatexFiles/References.bib")
      org-ref-pdf-directory "/home/oscar/Documents/Bibliography/bibtex-pdfs/")

(setq bibtex-completion-bibliography "/home/oscar/Documents/LatexFiles/References.bib"
      bibtex-completion-library-path "/home/oscar/Documents/Bibliography/bibtex-pdfs/")

(setq  helm-bibtex-pdf-field "file")
(setq helm-bibtex-pdf-open-function
  (lambda (fpath)
    (start-process "evince" "*helm-bibtex-evince*" "/usr/bin/evince" fpath)))

(require 'org-ref-arxiv)

(require 'org-ref-isbn)

(require 'org-ref-latex)

(setq helm-bibtex-notes-path "/home/oscar/Documents/Dropbox/Org/RefNotes.org")

(require 'ox-reveal)

(setq org-reveal-root "file:///home/oscar/Software/git.src/reveal.js")

(setq package-check-signature nil)

(require 'org-gcal) 

(setq org-gcal-client-id "985116132042-bhd0v4athudjc6mjoi0u0knlqpnjep6s.apps.googleusercontent.com"
	org-gcal-client-secret "_tYU0MGrYsFjqjm5GrjmeOfN"
	org-gcal-file-alist '(("o.castillo.felisola@gmail.com" .  "~/Documents/Dropbox/Org/gmail-agenda.org")))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

;; (require 'calfw)
;; (require 'calfw-org)

;; (require 'org-gcal) 
;; (setq org-gcal-client-id "459480878076-s0md9sb6s3tq7irlhmmk7hjt7r391o6n.apps.googleusercontent.com" 
;;       org-gcal-client-secret "-SphSdn3WDrZJ1Z_JFTXEkcc" 
;;       org-gcal-file-alist '(("aetptsksd2rroqmq5ealbd9oec@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Personal
;; 			    ("ok0q79kgahqiu6mkp7uplamahk@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Research Ideas
;; 			    ("mfrmolv12h6sjdfbo8iobd1h1o@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Seminaries
;; 			    ("q6pkpsevenacdctgcj9dur1c8o@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Lecture prep.
;; 			    ("j10hh2p19p7j7qmh3bvvn32ilg@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Work meeting
;; 			    )
;;       )

;; (setq package-check-signature nil)

;; (setq org-gcal-client-id "471626867829-v6jolihkoha5oiinftb5d7kksvr4ev3e.apps.googleusercontent.com"
;;       org-gcal-client-secret "cFzd9lSj2R37Qr-Ln7P6o1Rm"
;;       org-gcal-file-alist '(("aetptsksd2rroqmq5ealbd9oec@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Personal
;; 			    ;; ("ok0q79kgahqiu6mkp7uplamahk@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Research Ideas
;; 			    ;; ("mfrmolv12h6sjdfbo8iobd1h1o@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Seminaries
;; 			    ;; ("q6pkpsevenacdctgcj9dur1c8o@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Lecture prep.
;; 			    ;; ("j10hh2p19p7j7qmh3bvvn32ilg@group.calendar.google.com" . "~/Documents/Dropbox/Org/gmail-agenda.org") ;; Work meeting
;; 			    ))

;; (require 'calfw) 
;; (require 'calfw-org)
;; (setq cfw:org-overwrite-default-keybinding t)
;; (require 'calfw-ical)

;; ;; (defun mycalendar ()
;; ;;   (interactive)
;; ;;   (cfw:open-calendar-buffer
;; ;;    :contents-sources
;; ;;    (list
;; ;;     ;; (cfw:org-create-source "Green")  ; orgmode source
;; ;;     (cfw:ical-create-source "gcal" "https://calendar.google.com/calendar/ical/aetptsksd2rroqmq5ealbd9oec%40group.calendar.google.com/public/basic.ics" "IndianRed") ; Personal calender
;; ;;     (cfw:ical-create-source "gcal" "https://calendar.google.com/calendar/ical/ok0q79kgahqiu6mkp7uplamahk%40group.calendar.google.com/public/basic.ics" "IndianRed") ; Research ideas
;; ;;     ))) 
;; (setq cfw:org-overwrite-default-keybinding t)

;; (require 'calfw-gcal)

(setq org-file-apps
      (quote
       ((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ("\\.pdf\\'" . "evince %s"))))

(setq org-latex-prefer-user-labels t)

;; avoid getting \maketitle right after begin{document}
;; you should put \maketitle if and where you want it.
(setq org-latex-title-command "")

(require 'ox)
(require 'ox-latex)
(setq org-latex-create-formula-image-program 'imagemagick)
;; (setq org-preview-latex-process-alist 'imagemagick)

(setq org-export-latex-listings t)
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))
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

(setq org-latex-pdf-process (list "latexmk -pdf -bibtex -f %f"))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.6))

(require 'ox-latex)

(add-to-list 'org-latex-classes
	     '("book"
	       "\\documentclass{book}"
	       ("\\part{%s}" . "\\part*{%s}")
	       ("\\chapter{%s}" . "\\chapter*{%s}")
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	     )

(add-to-list 'org-latex-classes
	     '("report"
	       "\\documentclass{report}"
	       ("\\part{%s}" . "\\part*{%s}")
	       ("\\chapter{%s}" . "\\chapter*{%s}")
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	     )

(add-to-list 'org-latex-classes
	     '("ws-mpla"
	       "\\documentclass{ws-mpla}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	     )

;; (add-to-list 'org-latex-classes
;; 		 '("usm-thesis"
;; 		   "\\documentclass{usm-thesis}"
;; 		   ("\\part{%s}" . "\\part*{%s}")
;; 		   ("\\chapter{%s}" . "\\chapter*{%s}")
;; 		   ("\\section{%s}" . "\\section*{%s}")
;; 		   ("\\subsection{%s}" . "\\subsection*{%s}")
;; 		   ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
;; 		 )
;; )

(require 'org-tree-slide)

(global-set-key (kbd "<f8>") 'org-tree-slide-mode)
(global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)

(setq org-publish-project-alist
      '( ("paper"
          :base-directory "~/Documents/Dropbox/Org"
          :base-extension "org"
          :publishing-directory "~/Documents/Dropbox/Org/export"
          :publishing-function org-latex-publish-to-pdf)
         )
      )

(define-key org-mode-map "\C-cn" 'org-mactions-new-numbered-action)

(defcustom org-mactions-numbered-action-format "TODO Action #%d "
  "Default structure of the headling of a new action.
    %d will become the number of the action."
  :group 'org-edit-structure
  :type 'string)

(defcustom org-mactions-change-id-on-copy t
  "Non-nil means make new IDs in copied actions.
If an action copied with the command `org-mactions-collect-todos-in-subtree'
contains an ID, that ID will be replaced with a new one."
  :group 'org-edit-structure
  :type 'string)

(defun org-mactions-new-numbered-action (&optional inline)
  "Insert a new numbered action, using `org-mactions-numbered-action-format'.
    With prefix argument, insert an inline task."
  (interactive "P")
  (let* ((num (let ((re "\\`#\\([0-9]+\\)\\'"))
                (1+ (apply 'max 0
                           (mapcar
                            (lambda (e)
                              (if (string-match re (car e))
                                  (string-to-number (match-string 1 (car e)))
                                0))
                            (org-get-buffer-tags))))))
         (tag (concat "#" (number-to-string num))))
    (if inline
        (org-inlinetask-insert-task)
      (org-insert-heading 'force))
    (unless (eql (char-before) ?\ ) (insert " "))
    (insert (format org-mactions-numbered-action-format num))
    (org-toggle-tag tag 'on)
    (if (= (point-max) (point-at-bol))
        (save-excursion (goto-char (point-at-eol)) (insert "\n")))
    (unless (eql (char-before) ?\ ) (insert " "))))

(defun org-mactions-collect-todos-in-subtree ()
  "Collect all TODO items in the current subtree into a flat list."
  (interactive)
  (let ((buf (get-buffer-create "Org TODO Collect"))
        (cnt 0) beg end string s)
    (with-current-buffer buf (erase-buffer) (org-mode))
    (org-map-entries
     (lambda ()
       (setq beg (point) end (org-end-of-subtree t t) cnt (1+ cnt)
             string (buffer-substring beg end)
             s 0)
       (when org-mactions-change-id-on-copy
         (while (string-match "^\\([ \t]*:ID:\\)[ \t\n]+\\([^ \t\n]+\\)[ \t]*$"
                              string s)
           (setq s (match-end 1)
                 string (replace-match (concat "\\1 "
                                               (save-match-data (org-id-new)))
                                       t nil string))))
       (with-current-buffer buf (org-paste-subtree 1 string)
                            (goto-char (point-max))))
     (format "TODO={%s}" (regexp-opt org-not-done-keywords))
     'tree)
    (if (= cnt 0)
        (message "No TODO items in subtree")
      (message "%d TODO entries copied to kill ring" cnt)
      (prog1 (with-current-buffer buf
               (kill-new (buffer-string)))
        (kill-buffer buf)))))

(require 'org-secretary)
(setq org-tags-exclude-from-inheritance '("prj")
      org-stuck-projects '("+prj/-MAYBE-DONE"
			   ("TODO" "TASK") ()))

(setq org-sec-me "OCF")

(pdf-tools-install)

;; (setq auto-revert-interval 0.5)
;; (auto-revert-set-timer)

(defun prelude-google ()
  "Googles a region, if any, or prompts for a Google search string."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))
; (global-set-key (kbd "C-x C-g") 'prelude-google)
(global-set-key (kbd "M-g M-g") 'prelude-google)
;; (global-set-key (kbd "M-g g")   'prelude-google)

(defun google-scholar ()
  "Googles a region, if any, or prompts for a Google search string."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/scholar?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google Scholar: ")))))

(global-set-key (kbd "M-g M-s") 'google-scholar)
;; (global-set-key (kbd "M-g s")   'google-scholar)

;; (require 'google-contacts)
;; (require 'google-contacts-gnus)
;; (require 'google-contacts-message) ; for message-mode (not yet installed)

;; (auth-source-save-behavior nil)
;; (send-mail-function (quote smtpmail-send-it))

(setq sage-shell:sage-executable "/usr/bin/sage")

(sage-shell:define-alias)
;; Turn on eldoc-mode
(add-hook 'sage-shell-mode-hook #'eldoc-mode)
(add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)

(setq sage-shell:use-prompt-toolkit t)

(setq sage-shell:completion-function 'pcomplete)

;; Ob-sagemath supports only evaluating with a session.
(setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "output")))

;; C-c s for asynchronous evaluating (only for SageMath code blocks).
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c s") 'ob-sagemath-execute-async))

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

(setq sage-shell:input-history-cache-file "~/.emacs.d/.sage_shell_input_history")

(add-hook 'sage-shell-after-prompt-hook #'sage-shell-view-mode)

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

(setq paradox-github-token "8311678a7da07f0b250436cfcce5db58015a657a")
(setq paradox-automatically-star t)

(setq paperless-capture-directory "/home/oscar/Documents/SCANS/")
(setq paperless-root-directory "/home/oscar/Documents/Dropbox/")

(global-set-key (kbd "s-<down>") #'spotify-playpause)
(global-set-key (kbd "s-<right>") #'spotify-next)

(spotify-enable-song-notifications)

(require 'helm-spotify-plus)
