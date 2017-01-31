(in-package :99-lisp-problems)
;;; (**) Decode a run-length encoded list.  
;;; Given a run-length code list generated as specified in problem
;;; P11. Construct its uncompressed version.
(defun decode-list (original-list)
  "Decode a run-length encoded list."
  (unless (or (null original-list) (not (listp original-list)))
    (let ((first-element (first original-list)))
      (if (atom first-element)
	  (cons first-element (decode-list (rest original-list)))
	  (append (make-list (first first-element)
			     :initial-element (first (rest first-element))) 
		  (decode-list (rest original-list)))))))

(define-test test-decode-list
  (assert-nil (decode-list '()))
  (assert-equal '(A) (decode-list '(a)))
  (assert-equal '(A A A B C C C C) (decode-list '((3 a) (1 b) (4 c)))))
