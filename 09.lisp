(in-package :99-lisp-problems)
;;; (**) Pack consecutive duplicates of list elements into sublists.
;;; If a list contains repeated elements they should be placed in separate sublists.
;;; 
;;; Example:
;;; * (pack '(a a a a b c c a a d e e e e))
;;; ((A A A A) (B) (C C) (A A) (D) (E E E E))
(defun pack (original-list)
  "Packs/groups consecutive duplicates of list elements into sublists."
  (labels ((group-elements (element group list)
             (cond
               ((null list) (list (cons element group)))
               ((eql element (first list)) (group-elements element (cons element group) (rest list)))
               (t (cons (cons element group) (group-elements (first list) '() (rest list)))))))
    (unless (null original-list)
      (group-elements (first original-list) '() (rest original-list)))))

(define-test test-pack
  (assert-nil (pack '()))
  (assert-equal '((A A A A) (B) (C C) (A A) (D) (E E E E))
		(pack '(a a a a b c c a a d e e e e))))
