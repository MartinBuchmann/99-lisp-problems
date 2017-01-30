(in-package :99-lisp-problems)
;;; (**) Eliminate consecutive duplicates of list elements.  If a list contains
;;; repeated elements they should be replaced with a single copy of the
;;; element. The order of the elements should not be changed.
;;; 
;;; Example:
;;; * (compress '(a a a a b c c a a d e e e e))
;;; (A B C A D E)
(defun compress (original-list)
  (unless (or (null original-list) (not (listp original-list)))
    (let ((start (first original-list)) (next (first (rest original-list))))
	     (if (eql start next)
		 (compress (rest original-list))
		 (append (list start) (compress (rest original-list)))))))

(define-test test-compress
  (assert-nil (compress '()))
  (assert-nil (compress "ABCD"))
  (assert-equal '(A B C A D E) (compress '(a a a a b c c a a d e e e e))))
