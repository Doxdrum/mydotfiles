;;; org2web-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "org2web" "org2web.el" (23144 33431 715488
;;;;;;  669000))
;;; Generated autoloads from org2web.el

(autoload 'org2web-add-project "org2web" "\
Add `project-config' to `org2web-projects'

\(fn PROJECT-CONFIG)" nil nil)

(autoload 'org2web-select-project "org2web" "\
Let user select a project then return its name.

\(fn PROMPT &optional PROJECT-NAME)" nil nil)

(autoload 'org2web-publish "org2web" "\


\(fn &optional PROJECT-NAME PUBLISHING-DIRECTORY JOB-NUMBER UPDATE-TOP-N)" t nil)

(autoload 'org2web-new-post "org2web" "\
Setup a new post.

PROJECT-NAME: which project do you want to export
CATEGORY:     this post belongs to
FILENAME:     the file name of this post

Note that this function does not verify the category and filename, it is users'
responsibility to guarantee the two parameters are valid.

\(fn &optional PROJECT-NAME CATEGORY FILENAME INSERT-FALLBACK-TEMPLATE)" t nil)

;;;***

;;;### (autoloads nil nil ("org2web-config.el" "org2web-devtools.el"
;;;;;;  "org2web-el2org.el" "org2web-export.el" "org2web-pkg.el"
;;;;;;  "org2web-resource.el" "org2web-template.el" "org2web-util.el"
;;;;;;  "org2web-vars.el" "org2web-webserver.el") (23144 33431 919491
;;;;;;  754000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; org2web-autoloads.el ends here
