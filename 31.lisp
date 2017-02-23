(in-package :99-lisp-problems)
;;; Determine whether a given integer number is prime.
;;; Example:
;;; * (is-prime 7)
;;; T
;;; 
;;; I will use the Sieve of Eratosthenes
;;; (http://primes.utm.edu/prove/prove2_1.html) for determining if an integer
;;; is prime or not.
;;; Alpha is pretty neat for testing
;;; http://www.wolframalpha.com

(defun is-prime (n &optional (divisor 2))
  "Determine whether a given integer number is prime using a simple recursive way."
  (cond ((not (integerp n)) nil)
	((= 1 n) nil)
	((= 2 n) t)
	((> divisor (isqrt n)) t)
	((= (mod n divisor) 0) nil)
	(t (is-prime n (1+ divisor)))))

(define-test test-is-prime
  (assert-nil (is-prime 1))
  (assert-true (is-prime 2))
  (assert-true (is-prime 553462691))
  (assert-true (is-prime 553462733))
  (assert-nil (is-prime 553462716)))
