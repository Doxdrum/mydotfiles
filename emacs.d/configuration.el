
;; (require 'package)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/")
               t)
  (add-to-list 'load-path "/home/oscar/mydotfiles/emacs.d/org-mode/lisp")
  (add-to-list 'load-path "/home/oscar/mydotfiles/emacs.d/org-mode/contrib/lisp" t)
  (package-initialize))
;; (package-initialize)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(setq user-full-name "Oscar Castillo-Felisola"
      user-mail-address "o.castillo.felisola@gmail.com"
      calendar-latitude -33.66
      calendar-longitude -71.51
      calendar-location-name "Valparaiso, CHILE")

;; (require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (package-initialize t)
;; (unless (assoc-default "melpa" package-archives)
;;   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; ;  (package-refresh-contents)
;; )
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (setq use-package-always-ensure t)
  (require 'use-package)
)

(setq inhibit-splash-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-prettify-symbols-mode t)

(global-hl-line-mode 1)

(setq hrs/default-font "Inconsolata")
(setq hrs/default-font-size 12)
(setq hrs/current-font-size hrs/default-font-size)

;; (if (hrs/mac?)
;;     (setq hrs/default-font-size 18)
;;   (setq hrs/default-font-size 12))

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
;; (define-key global-map (kbd "C-=") 'hrs/increase-font-size)
;; (define-key global-map (kbd "C-_") 'hrs/decrease-font-size)
(define-key global-map (kbd "C--") 'hrs/decrease-font-size)

(load-theme 'deeper-blue)
; (custom-safe-themes
;    (quote
;     ("a301332a57e8de1b2996ee2d0b2439c18bd0cec9f8cc6ccaa73fac6e239462a8"
;  "0aca3a26459bbb43a77f34bc22851c05c0a5d70d3230cbcdbda4fec20fef77e6" default)))

(setq backup-directory-alist '(("." . "/home/oscar/mydotfiles/emacs.d/backups")))

(ispell-change-dictionary "british" t)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(define-key global-map (kbd "<f10>") 'shell)

(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode t)

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

(setq-default tab-width 2)

(setq python-indent 2)

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)))

(setq latex-block-names '("theorem" "corollary" "proof" "frame" "block" "alertblock"
 "definition" "example" "align" "align*" "columns" "tikzpicture" "axis"
 "cases" "matrix" "pmatrix" "vmatrix" "parts" "questions" "solution" "Ebox" "WEbox"
 "widetext" "dmath" "dmath*" "split"))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (setq load-path (cons "/home/oscar/Software/org-mode/lisp" load-path))
;; (setq load-path (cons "/home/oscar/Software/org-mode/contrib/lisp" load-path))
;; (add-to-list 'load-path "/home/oscar/mydotfiles/emacs.d/org-mode/lisp")
;; (add-to-list 'load-path "/home/oscar/mydotfiles/emacs.d/org-mode/contrib/lisp" t)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(global-set-key "\C-cl" 'org-store-link) 
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-indirect-buffer-display 'current-window)
(setq org-startup-indented t)
(setq org-src-preserve-indentation nil)
(setq org-edit-src-content-indentation 0)

(use-package org-bullets
  :init
  (setq org-bullets-bullet-list '("◉" "◎" "⚫" "○" "►" "◇"))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
)
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (org-bullets-mode t)))

(setq org-hide-leading-stars t)

(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-window-setup 'current-window)

(setq org-log-done 'note)

(setq org-directory "/home/oscar/Documents/Dropbox/Org")

(defun org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

;; (setq org-inbox-file "/home/oscar/Documents/Dropbox/inbox.org")
;; (setq org-index-file (org-file-path "index.org"))
(setq org-archive-location
      (concat (org-file-path "archive.org") "::* From %s"))

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
