(in-package :99-lisp-problems)
;;; Determine the prime factors of a given positive integer (2).
;;; Construct a list containing the prime factors and their multiplicity.
;;; Example:
;;; * (prime-factors-mult 315)
;;; ((3 2) (5 1) (7 1))
;;; Hint: The problem is similar to problem 13.

(defun prime-factors-mult (n)
  (encode (prime-factors n) :reversed t))

(define-test test-prime-factor-mult
  (assert-equal '((3 2) (5 1) (7 1))
                (prime-factors-mult 315))
  (assert-equal  '((3 1) (11 1) (113 1) (130267 1))
                 (prime-factors-mult 485765643))
  (assert-equal '((11 1)) (prime-factors-mult 11)))
