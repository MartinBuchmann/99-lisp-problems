(in-package :99-lisp-problems)
;;; (*) Find the last box of a list.
;;; Example:
;;; * (my-last '(a b c d))
;;; (D)
(defun my-last (list)
  "Returns the last element of a given list as a list."
  (cond ((null list) nil)
	((null (rest list)) list)
	(t (my-last (rest list)))))

(setq *print-failures* t)

(define-test test-my-last
  (assert-equal '(D) (my-last '(a b c d)))
  (assert-equal '(D) (my-last '(d)))
  (assert-nil (my-last nil)))

