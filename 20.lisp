(in-package :99-lisp-problems)
;;;  (*) Remove the K'th element from a list.
;;; Example:
;;; * (remove-at '(a b c d) 2)
;;;(A C D)

(defun remove-at (original-list k)
  "Remove the K'th element from a list."
  (unless (or (null original-list) (not (listp original-list)) (not (integerp k)))
    (cond ((> k (length original-list)) original-list)
	  ((<= k 0) original-list)
	  ((= k 1) (rest original-list))
	  (t (cons (first original-list) (remove-at (rest original-list) (1- k)))))))

(define-test test-remove-at
  (assert-nil (remove-at '(a b c) 'A))
  (assert-equal '(A B C) (remove-at '(a b c) -1))
  (assert-equal '(A B C) (remove-at '(a b c) 4))
  (assert-equal '(B C D) (remove-at '(a b c d) 1))
  (assert-equal '(A C D) (remove-at '(a b c d) 2)))
