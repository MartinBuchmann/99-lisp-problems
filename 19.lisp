(in-package :99-lisp-problems)
;;; (**) Rotate a list N places to the left.
;;; Examples:
;;; * (rotate '(a b c d e f g h) 3)
;;; (D E F G H A B C)
;;; 
;;; * (rotate '(a b c d e f g h) -2)
;;; (G H A B C D E F)

(defun rotate (original-list count)
  "Rotates a list n places to the left."
  (unless (or (not (listp original-list)) (null original-list))
    (if (minusp count)
	(rotate original-list (+ (length original-list) count))
	(let* ((splitted-list (split original-list count)) 
	       (left (first splitted-list))
	       (right (second splitted-list)))
	  (append right left)))))


(define-test test-rotate
  (assert-nil (rotate '() 0))
  (assert-equal '(D E F G H A B C) (rotate '(a b c d e f g h) 3))
  (assert-equal '(G H A B C D E F) (rotate '(a b c d e f g h) -2)))
