(in-package :99-lisp-problems)
;;; (*) Find out whether a list is a palindrome.
(defun palindromep (list)
  "A simple predicate to check if a list is a palindrome."
  (cond ((equal list (reverse list)) t)
	(t nil)))

(define-test test-palindromep
  (assert-true  (palindromep '(A B B A)))
  (assert-false (palindromep '(A B C D)))
  (assert-true  (palindromep '())))
