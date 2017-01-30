(in-package :99-lisp-problems)
;;; (*) Find the K'th element of a list.
;;; The first element in the list is number 1.
;;; Example:
;;; * (element-at '(a b c d e) 3)
;;; C
(defun element-at (list position)
  "Returns the element of a list at a given position."
  (when (and (listp list) (> position 0))
    (if (eql position 1)
	(first list)
	(element-at (rest list) (1- position)))))

(define-test test-element-at
  (assert-equal 'C (element-at '(a b c d e) 3))
  (assert-equal 'A (element-at '(a b c d e) 1))
  (assert-nil (element-at '(a b c d e) -1))
  (assert-nil (element-at "ABCD" 1)))
