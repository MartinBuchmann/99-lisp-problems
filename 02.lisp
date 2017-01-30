(in-package :99-lisp-problems)
;;; (*) Find the last but one box of a list.
;;; Example:
;;; * (my-but-last '(a b c d))
;;; (C D)
(defun my-but-last (list)
  "Returns the second last and the last element of a list."
  (when (listp list)
    (let ((tsil (reverse list)))
      (cond ((null tsil) nil)
	    ((<= (length tsil) 2) list)
	    (t (list (second tsil) (first tsil)))))))

(define-test test-my-but-last
  (assert-nil (my-but-last '()))
  (assert-equal '(a b) (my-but-last '(a b)))
  (assert-equal '(c d) (my-but-last '(a b c d))))
