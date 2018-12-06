;;; publish --- Publish org files to GitLab Pages

;;; Commentary:

;; This file takes care of exporting org files to the public directory.
;; Images and such are also exported without any processing.

;;; Code:

(require 'package)
(package-initialize)
(unless package-archive-contents
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents))
(dolist (pkg '(org-plus-contrib htmlize))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'org)
(require 'ox-publish)
(require 'ox-rss)

(defvar rw-root
  (let ((dir default-directory))
    (while (not (file-directory-p (expand-file-name ".git" dir)))
      (setq dir (expand-file-name ".." dir)))
    dir)
  "The root directory of this project.")

(defvar rw--layouts-directory
  (expand-file-name "layouts" rw-root)
  "Directory where layouts are found.")

(defun rw--pre/postamble-format (type)
  "Return the content for the pre/postamble of TYPE."
  `(("en" ,(with-temp-buffer
             (insert-file-contents (expand-file-name (format "%s.html" type) rw--layouts-directory))
             (buffer-string)))))

(defvar rw--site-attachments
  (regexp-opt '("jpg" "jpeg" "gif" "png" "svg"
                "ico" "cur" "css" "js"
                "eot" "woff" "woff2" "ttf"
                "html" "pdf"))
  "File types that are published as static files.")

(defun rw/format-date-subtitle (file project)
  "Format the date found in FILE of PROJECT."
  (format-time-string "posted on %Y-%m-%d" (org-publish-find-date file project)))

(defun rw/org-html-publish-to-html (plist filename pub-dir)
  "Wrapper function to publish an file to html.

PLIST contains the properties, FILENAME the source file and
  PUB-DIR the output directory."
  (plist-put plist :subtitle
             (rw/format-date-subtitle filename (cons 'rw plist)))
  (org-html-publish-to-html plist filename pub-dir))

(defun rw/org-publish-sitemap (title list)
  "Generate site map, as a string.
LIST is an internal representation for the files to include, as
returned by `org-list-to-lisp'.  PROJECT is the current project."
  (concat "#+TITLE: " title "\n"
          "#+OPTIONS: title:nil\n\n"
          "#+ATTR_HTML: :class sitemap\n"
          ; TODO use org-list-to-subtree instead
          (org-list-to-org list)))

(defun rw/org-publish-sitemap-entry (entry style project)
  "Format for sitemap ENTRY, as a string.
ENTRY is a file name.  STYLE is the style of the sitemap.
PROJECT is the current project."
  (format "[[file:%s][%s]] /%s/"
          entry
          (org-publish-find-title entry project)
          (rw/format-date-subtitle entry project)))

(defun rw/format-rss-feed-entry (entry style project)
  "Format ENTRY for the RSS feed.
ENTRY is a file name.  PROJECT is the current project."
  (cond ((not (directory-name-p entry))
         (let* ((file (org-publish--expand-file-name entry project))
                (title (org-publish-find-title entry project))
                (date (format-time-string "%Y-%m-%d" (org-publish-find-date entry project)))
                (link (concat (file-name-sans-extension entry) ".html")))
           (with-temp-buffer
             (insert (format "* [[file:%s][%s]]\n" file title))
             (org-set-property "RSS_PERMALINK" link)
             (org-set-property "PUBDATE" date)
             ;; to avoid second update to rss.org by org-icalendar-create-uid
             (org-id-get-create)
             (insert-file-contents file)
             (buffer-string))))
        ((eq style 'tree)
         ;; Return only last subdir.
         (file-name-nondirectory (directory-file-name entry)))
        (t entry)))

(defun rw/format-rss-feed (title list)
  "Generate RSS feed, as a string.
TITLE is the title of the RSS feed.  LIST is an internal
representation for the files to include, as returned by
`org-list-to-lisp'.  PROJECT is the current project."
  (concat "#+TITLE: " title "\n\n"
          (org-list-to-subtree list '(:icount "" :istart ""))))

(defun rw/org-rss-publish-to-rss (plist filename pub-dir)
  "Only publish rss.org to rss.
When FILENAME is anything else, ignore"
  (if (string-match-p "/rss\\.org$" filename)
      (org-rss-publish-to-rss plist filename pub-dir)))

(defvar rw-url "https://writepermission.com")
(defvar rw-title "rw-r--r-- | writepermission.com")

(makunbound 'rw--publish-project-alist)

(defvar rw--publish-project-alist
      (list
       (list "blog-posts"
             :base-directory "posts"
             :base-extension "org"
             :recursive nil
             :exclude "rss.org"
             :publishing-function 'rw/org-html-publish-to-html
             :publishing-directory "./public"
             :html-head-include-default-style nil
             :html-head-include-scripts nil
             :html-htmlized-css-url "css/style.css"
             :html-head-extra
             "<link rel=\"icon\" type=\"image/x-icon\" href=\"/favicon.ico\" />"
             :html-preamble-format (rw--pre/postamble-format 'preamble)
             :html-postamble t
             :html-postamble-format (rw--pre/postamble-format 'postamble)
             :auto-sitemap t
             :sitemap-filename "index.org"
             :sitemap-title rw-title
             :sitemap-style 'list
             :sitemap-sort-files 'anti-chronologically
             :sitemap-function 'rw/org-publish-sitemap
             :sitemap-format-entry 'rw/org-publish-sitemap-entry)
       (list "blog-rss"
             :base-directory "posts"
             :base-extension "org"
             :recursive nil
             :exclude "index.org"
             :publishing-function 'rw/org-rss-publish-to-rss
             :publishing-directory "./public"
             :rss-extension "xml"
             :html-link-home rw-url
             :html-link-use-abs-url t
             :html-link-org-files-as-html t
             :auto-sitemap t
             :sitemap-filename "rss.org"
             :sitemap-title rw-title
             :sitemap-style 'list
             :sitemap-sort-files 'anti-chronologically
             :sitemap-function 'rw/format-rss-feed
             :sitemap-format-entry 'rw/format-rss-feed-entry)
       (list "blog-static"
             :base-directory "."
             :exclude (regexp-opt '("public/" "layouts/" "redirects/"))
             :base-extension rw--site-attachments
             :publishing-directory "./public"
             :publishing-function 'org-publish-attachment
             :recursive t)
       (list "blog-redirects"
             :base-directory "redirects"
             :base-extension "html"
             :publishing-directory "./public"
             :publishing-function 'org-publish-attachment
             :recursive t)
       (list "site"
             :components '("blog-posts" "blog-rss"))
       ))

(defun rw-publish-all ()
  "Publish the blog to HTML."
  (interactive)
  (let ((org-publish-project-alist       rw--publish-project-alist)
        (org-publish-timestamp-directory "./.timestamps/")
        (org-export-with-section-numbers nil)
        (org-export-with-smart-quotes    t)
        (org-export-with-toc             nil)
        (org-html-divs '((preamble  "header" "top")
                         (content   "main"   "content")
                         (postamble "footer" "postamble")))
        (org-html-container-element         "section")
        (org-html-metadata-timestamp-format "%Y-%m-%d")
        (org-html-checkbox-type             'html)
        (org-html-html5-fancy               t)
        (org-html-validation-link           nil)
        (org-html-doctype                   "html5")
        (org-html-htmlize-output-type       'css))
    (org-publish-all)))

;;; publish.el ends here
