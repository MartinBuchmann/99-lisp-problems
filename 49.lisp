(in-package :99-lisp-problems)
;;; (**) Gray code.
;;; An n-bit Gray code is a sequence of n-bit strings constructed according to
;;; certain rules. For example,
;;; n = 1: C(1) = ['0','1'].
;;; n = 2: C(2) = ['00','01','11','10'].
;;; n = 3: C(3) = ['000','001','011','010','110','111','101','100'].
;;; 
;;; Write a function that produces the Gray codes C(N) for a given number of bits N.
;;;
;;; More Details about gray code can be found here:
;;; http://en.wikipedia.org/wiki/Gray_code

(defun gray (n)
  "Generates the Gray code for n bits as a list of strings. It will build up
the codes recursively."
  (if (= 1 n)
      (list "0" "1") ;; The most simple case.
      ;; If more bits are needed we will call this function recursively until
      ;; only one bit is left.
      (let ((gray-1 (gray (1- n)))) ;; The codes for one bit less.
	;;; Concatenating the codes according to the construction rules.
	(nconc (mapcar #'(lambda (code) (concatenate 'string "0" code)) gray-1)
	       (mapcar #'(lambda (code) (concatenate 'string "1" code)) (nreverse gray-1))))))

(define-test test-gray
  (assert-equal '("0" "1") (gray 1))
  (assert-equal '("00" "01" "11" "10") (gray 2)))
