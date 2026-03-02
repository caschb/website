(message "Exporting website")

(require 'ox-html)

(defun read-file (fname)
  (with-temp-buffer
    (insert-file-contents fname)
    (buffer-string)
    ))

(setq org-publish-project-alist
      (list 
       (list "pages"
	     :base-directory "org/"
	     :publishing-directory "html/"
	     :base-extension "org"
	     :auto-sitemap t
	     :sitemap-filename "sitemap.org"
	     :recursive t
	     :with-toc nil
	     :section-numbers nil

	     ;; HTML options
	     :html-doctype "html5"
	     :html-html5-fancy t
	     :html-head-include-default-style nil
	     :html-head-include-scripts nil
	     :html-validation-link t
	     :html-head "<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\">"
	     :html-postamble (read-file "footer.html")
	     :publishing-function 'org-html-publish-to-html)
       ;; (list "blog")
       (list "static"
	     :base-directory "org/"
	     :base-extension "css\\|txt\\|jpg\\|gif\\|png"
	     :recursive t
	     :publishing-directory "html/"
	     :publishing-function 'org-publish-attachment)
       ))
(org-publish-all t)
(message "Website exported")
