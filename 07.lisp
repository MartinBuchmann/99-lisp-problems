(in-package :99-lisp-problems)
;;; (**) Flatten a nested list structure.  
;;; Transform a list, possibly holding lists as elements into a `flat' list by
;;; replacing each list with its elements (recursively).
;;; 
;;; Example:
;;; * (my-flatten '(a (b (c d) e)))
;;; (A B C D E)
;;; 
;;; Hint: Use the predefined functions list and append.
(defun my-flatten (original-list)
  (unless (or (null original-list) (not (listp original-list)))
    (let ((start (first original-list)) (end (rest original-list)))
      (cond ((listp start) (append (my-flatten start) (my-flatten end)))
	    ((atom start) (append (list start) (my-flatten end)))
	    (t nil)))))

(define-test test-my-flatten
  (assert-nil (my-flatten '()))
  (assert-nil (my-flatten "ABCD"))
  (assert-equal '(A B C D E F) (my-flatten '((A) B (C D) (E (F))))))



