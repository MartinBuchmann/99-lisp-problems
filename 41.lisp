(in-package :99-lisp-problems)
;;; A list of Goldbach compositions.
;;; Given a range of integers by its lower and upper limit, print a list of all
;;; even numbers and their Goldbach composition.  Example:
;;; * (goldbach-list 9 20)
;;; 10 = 3 + 7
;;; 12 = 5 + 7
;;; 14 = 3 + 11
;;; 16 = 3 + 13
;;; 18 = 5 + 13
;;; 20 = 3 + 17
;;; 
;;; In most cases, if an even number is written as the sum of two prime
;;; numbers, one of them is very small. Very rarely, the primes are both bigger
;;; than say 50. Try to find out how many such cases there are in the range
;;; 2..3000.
;;; 
;;; Example (for a print limit of 50):
;;; * (goldbach-list 1 2000 50)
;;; 992 = 73 + 919
;;; 1382 = 61 + 1321
;;; 1856 = 67 + 1789
;;; 1928 = 61 + 1867

;;; http://en.wikipedia.org/wiki/Goldbach's_conjecture

(defun goldbach-list (start end &optional (limit 2))
  "Prints the Goldback compositions between START and END and returns
a list with the results."
  (when (and (integerp start) (integerp end) (> end start 0))
    (loop :for n :from start :upto end
          :for goldbach-numbers = (goldbach n)
          :with results = '()
          :when (and (not (null goldbach-numbers)) (>= (first goldbach-numbers) limit))
          :do (format t "~D = ~D + ~D~%" n (first goldbach-numbers) (second goldbach-numbers))
              (push goldbach-numbers results)
          :finally (return (nreverse results)))))

(define-test test-goldbach-list
  (assert-equal '((73 919) (61 1321) (67 1789) (61 1867) (61 2017) (61 2377) (53 2459) (53 2477)
                  (61 2557) (103 2539))
                (goldbach-list 1 3000 50)))
