(in-package :99-lisp-problems)
;;; (*) Split a list into two parts; the length of the first part is given.
;;; Do not use any predefined predicates.
;;; 
;;; Example:
;;; * (split '(a b c d e f g h i k) 3)
;;; ((A B C) (D E F G H I K))

;;; Using Common Lisp's internals
(defun split (original-list count)
  (unless (or (not (listp original-list)) (null original-list) (minusp count))
    (list (subseq original-list 0 count)
	  (subseq original-list count))))

(define-test test-split
  (assert-nil (split '() 0))
  (assert-nil (split "ABCD" 1))
  (assert-equal '((A B C) (D E F G H I K)) (split '(a b c d e f g h i k) 3)))
