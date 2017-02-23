(in-package :99-lisp-problems)
;;; Determine the greatest common divisor of two positive integer numbers.
;;; Use Euclid's algorithm.
;;; Example:
;;; * (gcd 36 63)
;;; 9

;;; See for details about the algorithm http://en.wikipedia.org/wiki/Euclidean_algorithm

;;; gcd is already a CL function
(defun my-gcd (a b)
  "Calculates the greatest common divisor using Euclid's algorithm."
  (when (and (integerp a) (integerp b))
    (cond ((or (= a b) (= b 0)) a)
	  (t (my-gcd b (mod a b))))))

(define-test test-gcd
  (assert-equal 9 (my-gcd 36 63))
  (assert-equal 1 (my-gcd 1 0))
  (assert-equal 12 (my-gcd 24 60))
  (assert-equal 12 (my-gcd 60 24)))
