(in-package :99-lisp-problems)
;;; (*) Reverse a list.
(defun my-reverse (original-list)
  "A simple recursive implementation of reverse."
  (cond ((or (null original-list) (not (listp original-list))) nil)
	(t (append (my-reverse (rest original-list)) (list (first original-list))))))

(define-test test-my-reverse
  (assert-nil (my-reverse '()))
  (assert-nil (my-reverse "ABCD"))
  (assert-equal '(D C B A) (my-reverse '(a b c d))))
