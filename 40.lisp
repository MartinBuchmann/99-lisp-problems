(in-package :99-lisp-problems)
;;; (**) Goldbach's conjecture.

;;; Goldbach's conjecture says that every positive even number greater than 2
;;; is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of the
;;; most famous facts in number theory that has not been proved to be correct
;;; in the general case. It has been numerically confirmed up to very large
;;; numbers (much larger than we can go with our Prolog system). Write a
;;; predicate to find the two prime numbers that sum up to a given even
;;; integer.  

;;; Example:
;;; * (goldbach 28)
;;; (5 23)
(defun goldbach (n)
  "Following the Goldbach's conjecture every positive even number greater than
  is the sum of two prime numbers."
  (when (and (integerp n) (evenp n))
    (let ((list-of-primes (range-of-primes 2 n)))
      (labels ((goldbach-aux (primes)
		 (let ((first-element (first primes)) (rest-of-list (rest primes)))
                   (cond ((null primes) nil)
                         ((member (- n first-element) rest-of-list) (list first-element (- n first-element)))
                         (t (goldbach-aux (rest primes)))))))
	(goldbach-aux list-of-primes)))))

(define-test test-goldbach
  (assert-equal '(5 23) (goldbach 28)))
