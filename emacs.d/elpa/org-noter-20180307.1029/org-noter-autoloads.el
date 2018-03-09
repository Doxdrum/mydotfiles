;;; org-noter-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "org-noter" "org-noter.el" (23202 36688 711662
;;;;;;  215000))
;;; Generated autoloads from org-noter.el

(autoload 'org-noter "org-noter" "\
Start `org-noter' session.

This will open a session for taking your notes, with indirect
buffers to the document and the notes side by side. Your current
window configuration won't be changed, because this opens in a
new frame.

You only need to run this command inside a heading (which will
hold the notes for this document). If no document path property is found,
this command will ask you for the target file.

With a prefix universal argument ARG, only check for the property
in the current heading, don't inherit from parents.

With a prefix number ARG, only open the document like `find-file'
would if ARG >= 0, or open the folder containing the document
when ARG < 0.

\(fn ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; org-noter-autoloads.el ends here
