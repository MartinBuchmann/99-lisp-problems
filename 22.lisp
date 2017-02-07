(in-package :99-lisp-problems)
;;; (*) Create a list containing all integers within a given range.
;;; If first argument is smaller than second, produce a list in decreasing order.
;;; Example:
;;; * (range 4 9)
;;; (4 5 6 7 8 9)

;;; A simple recursive solution
(defun range (start end)
  "Create a list containing all integers with a given range.  If END is greater
than START returns the range in reverse order."
  (when (and (integerp start) (integerp end))
    (cond ((= start end) (list end))
	  ((< start end)
	   (cons start (range (1+ start) end)))
	  (t (cons start (range (1- start) end))))))

;;; TCO recursive version
(defun range-tco (start end)
  "Create a list containing all integers with a given range."
  (labels ((range-acc (number result)
	     (if (<= number end)
		 (range-acc (1+ number) (cons number result))
		 (nreverse result))))
    (range-acc start '())))

;;; Iterative version
(defun range-iter (start end)
  "Create a list containing all integers with a given range."
  (loop :for i :from start :to end :collect i))

(define-test test-range
  (assert-nil (range 'A 'B))
  (assert-equal '(4 5 6 7 8 9) (range 4 9))
  (assert-equal '(9 8 7 6 5 4) (range 9 4))
  (assert-equal '(4 5 6 7 8 9) (range-tco 4 9))
  (assert-equal '(4 5 6 7 8 9) (range-iter 4 9)))
