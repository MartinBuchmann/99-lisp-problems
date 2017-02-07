(in-package :99-lisp-problems)
;;; (**) Extract a given number of randomly selected elements from a list.
;;; The selected items shall be returned in a list.
;;; Example:
;;; * (rnd-select '(a b c d e f g h) 3)
;;; (E D A)

;;; Using the functions `element-at` and `remove-at` definied in 03.lisp and
;;; 20.lisp, respectively.

(defun rnd-select (original-list number)
  "Extract a given number of randomly selected elements from a list."
  (when (and (listp original-list) (integerp number))
    (cond ((>= number (length original-list)) original-list)
	  ((<= number 0) nil)
	  (t (let ((position (1+ (random (length original-list)))))
	       (cons (element-at original-list position)
		     (rnd-select (remove-at original-list position) (1- number))))))))

(define-test test-rnd-select
  (assert-nil (rnd-select "ABCD" 1))
  (assert-equal 3 (length (rnd-select '(a b c d e f g h) 3))))
