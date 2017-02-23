(in-package :99-lisp-problems)
;;; Calculate Euler's totient function phi(m) (improved).  
;;; See problem 32 for the definition of Euler's totient function. If the list
;;; of the prime factors of a number m is known in the form of problem 34 then
;;; the function phi(m) can be efficiently calculated as follows: Let ((p1 m1)
;;; (p2 m2) (p3 m3) ...) be the list of prime factors (and their
;;; multiplicities) of a given number m. Then phi(m) can be calculated with the
;;; following formula: phi(m) = (p1 - 1) * p1 ** (m1 - 1) * (p2 - 1) * p2 **
;;; (m2 - 1) * (p3 - 1) * p3 ** (m3 - 1) * ...
;;; 
;;; Note that a ** b stands for the b'th power of a.

;;; https://en.wikipedia.org/wiki/Euler's_totient_function#Computing_Euler.27s_function
(defun phi (m)
  "Calculates Euler's totient function phi(m) using
`prime-factors-mult`."
  (let ((prime-factors (prime-factors-mult m)))
    (labels ((calculate-totient (list-of-prime-factors)
	       (if (null list-of-prime-factors) 1
		   (let ((factor (caar list-of-prime-factors))
			 (multiplicity (cadar list-of-prime-factors)))
		     (* (* (1- factor) (expt factor (1- multiplicity)))
			(calculate-totient (rest list-of-prime-factors)))))))
      (calculate-totient prime-factors))))

(define-test test-phi
  (assert-equal 40 (phi 88))
  (assert-equal 60 (phi 99))
  (assert-equal 144 (phi 315)))
