(in-package :99-lisp-problems)
;;; (**) Run-length encoding of a list (direct solution).
;;; Implement the so-called run-length encoding data compression method
;;; directly. I.e. don't explicitly create the sublists containing the
;;; duplicates, as in problem P09, but only count them. As in problem P11,
;;; simplify the result list by replacing the singleton lists (1 X) by X.
;;; 
;;; Example:
;;; * (encode-direct '(a a a a b c c a a d e e e e))
;;; ((4 A) B (2 C) (2 A) D (4 E))
(defun encode-direct (original-list)
  "Run-length encoding of list `original-list', direct solution."
  (unless (or (null original-list) (not (listp original-list)))
    (let ((count    0)
	  (result  '())
	  (last-element nil))
      (labels ((new-element (element)
		 (setf count 1
		       last-element element))
	       (collect-result ()
		 (push (if (= 1 count) last-element
				    ;; If only one element than skip the count
				    (list count last-element))
				result)))
	(loop :for element :in original-list
	      :do
		 (cond ( ;; Nothing was counted so far
			(zerop count) (new-element element))
		       ;; The same element as before
		       ((eql element last-element) (incf count)) 
		       ;; A different element. Pushing the results and resetting the counter
		       (t (collect-result)
			  (new-element element)))
	      :finally
		 ;; The last element has to be collected
		 (collect-result)
		 (return (nreverse result)))))))

(define-test test-encode-direct
  (assert-nil (encode-direct '()))
  (assert-equal '(A) (encode-direct '(a)))
  (assert-equal '((4 A) B (2 C) (2 A) D (4 E))
		(encode-direct '(a a a a b c c a a d e e e e)))
  (assert-equal '(A (3 B) (2 C) (2 A) D (4 E))
		(encode-direct '(a b b b c c a a d e e e e))))

