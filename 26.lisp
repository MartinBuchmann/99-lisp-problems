(in-package :99-lisp-problems)
;;; (**) Generate the combinations of K distinct objects chosen from the N
;;; elements of a list. In how many ways can a committee of 3 be chosen from a
;;; group of 12 people? We all know that there are C(12,3) = 220 possibilities
;;; (C(N,K) denotes the well-known binomial coefficients). For pure
;;; mathematicians, this result may be great. But we want to really generate
;;; all the possibilities in a list.
;;; 
;;; Example:
;;; * (combination 3 '(a b c d e f))
;;; ((A B C) (A B D) (A B E) ... )

(defun combination (number-of-elements original-list)
  "Generate the combinations of K distinct objects chosen from the N elements of a list"
  (cond ((= (length original-list) number-of-elements) (list original-list))
	((= number-of-elements 0) (list nil)) ; just nil isn't working here because of mapcar
	(t (let ((first-element (first original-list))
		 (rest-of-list (combination (1- number-of-elements) (rest original-list))))
	     (append (mapcar #'(lambda (x) (cons first-element x)) rest-of-list)
		     (combination number-of-elements (rest original-list)))))))

(define-test test-combination
  (assert-equal (list nil) (combination 0 '(A B C D)))
  (assert-equal 4 (length (combination 3 '(A B C D))))
  (assert-equal 220 (length (combination 3 '(A B C D E F G H I J K L))))
  (assert-false (member (first (combination 3 '(A B C D E F)))
                        (rest (combination 3 '(A B C D E F))))))
