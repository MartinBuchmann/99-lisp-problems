(in-package :99-lisp-problems)
;;; (**) Replicate the elements of a list a given number of times.
;;; Example:
;;; * (repli '(a b c) 3)
;;; (A A A B B B C C C)

(defun repli (original-list n &optional (first-n n))
  "Replicates the elements of a list n times."
  (cond ((or (null original-list) (not (listp original-list))) nil)
	((<= n 0) (repli (rest original-list) first-n))
	(t (cons (first original-list) (repli original-list (1- n) first-n)))))

(define-test test-repli
  (assert-nil (repli '() 0))
  (assert-nil (repli '() 1024))
  (assert-nil (repli '(a) 0))
  (assert-nil (repli '(a) -1))
  (assert-nil (repli '() -1))
  (assert-equal '(A) (repli '(a) 1))
  (assert-equal '(A A A B B B C C C) (repli '(a b c) 3)))

