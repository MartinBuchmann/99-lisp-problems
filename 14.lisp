(in-package :99-lisp-problems)
;;; (*) Duplicate the elements of a list.
;;; Example:
;;; * (dupli '(a b c c d))
;;; (A A B B C C C C D D)

(defun dupli (original-list)
  "Duplicates the elements of a list."
  (unless (or (null original-list) (not (listp original-list)))
    (append (make-list 2 :initial-element (first original-list))
	    (dupli (rest original-list)))))

(define-test test-dupli
  (assert-nil (dupli '()))
  (assert-equal '(A A B B C C C C D D) (dupli '(a b c c d))))

