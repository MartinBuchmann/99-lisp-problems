(in-package :99-lisp-problems)
;;; (*) Insert an element at a given position into a list.
;;; Example:
;;; * (insert-at 'alfa '(a b c d) 2)
;;; (A ALFA B C D)

(defun insert-at (insert original-list k)
  "Insert an element at a given postion into a list."
  (unless (or (null original-list) (not (listp original-list)) (not (integerp k)))
    (cond ((> k (length original-list))
	   (if (listp insert)
	       (append original-list insert)
	       (append original-list (list insert))))
	  ((<= k 1)
	   (if (listp insert)
	       (append insert original-list)
	       (append (list insert) original-list)))
	  (t (cons (first original-list) (insert-at insert (rest original-list) (1- k)))))))

(define-test test-insert-at
  (assert-nil (insert-at 'A '(B C D) 'A))
  (assert-nil (insert-at 'A "BCD" 2))
  (assert-equal '(A ALFA B C D) (insert-at 'alfa '(a b c d) 2)))
