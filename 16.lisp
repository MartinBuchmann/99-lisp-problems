(in-package :99-lisp-problems)
;;; (**) Drop every N'th element from a list.
;;; Example:
;;; * (drop '(a b c d e f g h i k) 3)
;;; (A B D E G H K)

(defun drop (original-list n &optional (m 1))
  "Drops every n'th element from a list."
  (cond ((or (null original-list) (not (listp original-list))) nil)
	((= n m) (drop (rest original-list) n))
	(t (cons (first original-list) (drop (rest original-list) n (1+ m))))))

(define-test test-drop
  (assert-nil (drop '() 1))
  (assert-nil (drop '(a b c) 1))
  (assert-equal '(A B C) (drop '(a b c) 0))
  (assert-equal '(A B D E G H K) (drop '(a b c d e f g h i k) 3)))
