(in-package :99-lisp-problems)
;;; (**) Extract a slice from a list.
;;; Given two indices, I and K, the slice is the list containing the elements
;;; between the I'th and K'th element of the original list (both limits
;;; included). Start counting the elements with 1.
;;; 
;;; Example:
;;; * (slice '(a b c d e f g h i k) 3 7)
;;; (C D E F G)

(defun slice (original-list start stop)
  "Extracts a slive from a list."
  (cond ((or (null original-list) (not (listp original-list)) (< stop start)) nil)
	((< 1 start) (slice (rest original-list) (1- start) (1- stop)))
	((and (>= 1 start) (<= 1 stop))
	 (cons (first original-list) (slice (rest original-list) (1- start) (1- stop))))
	(t nil)))

(define-test test-slice
  (assert-nil (slice '() 0 3))
  (assert-nil (slice '(a b c) -3 0))
  (assert-equal '(C D E F G) (slice '(a b c d e f g h i k) 3 7)))
