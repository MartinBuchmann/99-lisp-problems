(in-package :99-lisp-problems)
;;; (*) Truth tables for logical expressions (2).
;;; Continue problem P46 by defining and/2, or/2, etc as being operators. This
;;; allows to write the logical expression in the more natural way, as in the
;;; example: A and (A or not B). Define operator precedence as usual; i.e. as
;;; in Java.
;;; Example:
;;; * table(A,B, A and (A or not B)).
;;; true true true
;;; true fail true
;;; fail true fail
;;; fail fail fail

(defun swap-operators (expression)
  "A simple function manipulating the order of operator and parameter in simple
  logical expression. (A opr B) --> (opr A B) It is designed to walk down a
  nested listed structure consisting of three-element list."
  (if (and (listp expression) (= (length expression) 3))
      ;;; We are only dealing with valid logical expressions and will not signal any error.
    (let ((first-element (first expression)) (second-element (second expression))
	  (third-element (third expression)))
      (cond ((atom first-element)
	     (list second-element first-element (swap-operators third-element)))
	    (t (list second-element (swap-operators first-element)
		     (swap-operators third-element)))))
    expression))

;; (table a b (swap-operators '(a and/2 b)))

(define-test test-swap-operators
  (assert-equal '(OP A B) (swap-operators '(A OP B)))
  (assert-equal '(OP (OP A B) B) (swap-operators '((A OP B) OP B))))
