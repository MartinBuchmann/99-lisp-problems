;;;; 99-lisp-problems.asd

(asdf:defsystem #:99-lisp-problems
  :description "My solution to 99 programming problems."
  :author "Martin Buchmann <Martin.Buchmann@gmail.com>"
  :license "Public Domain"
  :depends-on (#:lisp-unit)
  :serial t
  :components ((:file "package")
               (:file "01")
               (:file "02")
               (:file "03")
               (:file "04")
               (:file "05")
	       (:file "06")
	       (:file "07")
	       (:file "08")
	       (:file "09")
	       (:file "10")
	       (:file "11")))

