(in-package :99-lisp-problems)
;;; (*) Modified run-length encoding.
;;; Modify the result of problem P10 in such a way that if an element has no
;;; duplicates it is simply copied into the result list. Only elements with
;;; duplicates are transferred as (N E) lists.
;;; 
;;; Example:
;;; * (encode-modified '(a a a a b c c a a d e e e e))
;;; ((4 A) B (2 C) (2 A) D (4 E))
(defun encode-modified (original-list)
  "Run-length encoding of a list."
  (mapcar (lambda (item)
            (if (= 1 (first item))
                (second item)
                item))
          (encode original-list)))

(define-test test-encode-modified
  (assert-nil (encode-modified '()))
  (assert-equal '(A) (encode-modified '(a)))
  (assert-equal '((4 A) B (2 C) (2 A) D (4 E))
		(encode-modified '(a a a a b c c a a d e e e e)))
  (assert-equal '(A (3 B) (2 C) (2 A) D (4 E))
		(encode-modified '(a b b b c c a a d e e e e))))
