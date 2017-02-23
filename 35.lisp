(in-package :99-lisp-problems)
;;; Determine the prime factors of a given positive integer.
;;; Construct a flat list containing the prime factors in ascending order.
;;; Example:
;;; * (prime-factors 315)
;;; (3 3 5 7)
(defun prime-factors (n &optional (m 2))
  "Returns a flat list containing the prime factors of `n'."
  (cond ((or (not (integerp n)) (< n 0)) 0)
	((or (is-prime n) (= n 2)) (list n))
	((= (mod n m) 0) (cons m (prime-factors (/ n m) m)))
	(t (prime-factors n (1+ m)))))

(define-test test-prime-factors
  (assert-equal '(3 3 5 7) (prime-factors 315))
  (assert-equal 0 (prime-factors -1))
  (assert-equal '(11) (prime-factors 11)))
