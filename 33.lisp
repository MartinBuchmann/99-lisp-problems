(in-package :99-lisp-problems)
;;; Determine whether two positive integer numbers are coprime.
;;; Two numbers are coprime if their greatest common divisor equals 1.
;;; Example:
;;; * (coprime 35 64)
;;; T

(defun coprime (a b)
  "Determines whether two positive integers are coprime."
  (when (and (> a 0) (> b 0))
    (= 1 (my-gcd a b))))

(define-test test-coprime
  (assert-true (coprime 35 64))
  (assert-false (coprime 36 63)))
