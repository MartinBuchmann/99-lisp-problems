(in-package :99-lisp-problems)
;;; (*) A list of prime numbers.  
;;; Given a range of integers by its lower and upper limit, construct a list of
;;; all prime numbers in that range.

;;; Direct solution
(defun range-of-primes (start end)
  "Constructs a list of all pimes in the range `[start:end]'."
  (cond ((> start end) nil)
        ((is-prime start) (cons start (range-of-primes (1+ start) end)))
        (t (range-of-primes (1+ start) end))))

(define-test test-range-of-primes
  (assert-nil (range-of-primes 3 1))
  (assert-equal '(2 3 5 7) (range-of-primes 1 10))
  (assert-equal 94 (length (range-of-primes 23 557))))
