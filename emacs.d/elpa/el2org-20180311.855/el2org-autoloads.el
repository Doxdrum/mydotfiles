;;; el2org-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "el2org" "el2org.el" (23206 14845 565220 706000))
;;; Generated autoloads from el2org.el

(autoload 'el2org-generate-readme "el2org" "\
Generate README from current emacs-lisp file.

If BACKEND is set then use-it else use `el2org-default-backend'.
If FILE-EXT is nil deduce it from BACKEND.

\(fn &optional BACKEND FILE-EXT)" t nil)

(autoload 'el2org-generate-html "el2org" "\
Generate html file from current elisp file and browse it.

\(fn)" t nil)

(autoload 'el2org-generate-org "el2org" "\
Generate org file from current elisp file.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; el2org-autoloads.el ends here
