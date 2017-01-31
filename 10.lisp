(in-package :99-lisp-problems)
;;; (*) Run-length encoding of a list.  Use the result of problem P09 to
;;; implement the so-called run-length encoding data compression
;;; method. Consecutive duplicates of elements are encoded as lists (N E) where
;;; N is the number of duplicates of the element E.
;;; 
;;; Example:
;;; * (encode '(a a a a b c c a a d e e e e))
;;; ((4 A) (1 B) (2 C) (2 A) (1 D) (4 E))
(defun encode (original-list)
  "Run-length encoding of a list."
  (labels ((encode-elements (element count list)
             (cond
               ((null list) (list (list count element)))
               ((eql element (first list))
		(encode-elements element (1+ count) (rest list)))
               (t (cons (list count element) (encode-elements (first list) 1 (rest list)))))))
    (unless (null original-list)
      (encode-elements (first original-list) 1 (rest original-list)))))

(define-test test-encode
  (assert-nil (encode '()))
  (assert-equal '((4 A) (1 B) (2 C) (2 A) (1 D) (4 E))
		(encode '(a a a a b c c a a d e e e e))))
