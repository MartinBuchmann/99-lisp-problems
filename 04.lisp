(in-package :99-lisp-problems)
;;; (*) Find the number of elements of a list.
(defun my-length (list)
  "Recursively calculted the length of a given list."
  (cond ((not (listp list)) nil)
	((null list) 0)
	(t (1+ (my-length (rest list))))))

(define-test test-my-length
  (assert-nil (my-length "ABCD"))
  (assert-equal 0 (my-length '()))
  (assert-equal 3 (my-length '(a b c))))
