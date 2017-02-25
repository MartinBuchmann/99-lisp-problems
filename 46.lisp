(in-package :99-lisp-problems)
;;; (**) Truth tables for logical expressions.
;;; Define predicates and/2, or/2, nand/2, nor/2, xor/2, impl/2 and equ/2 (for
;;; logical equivalence) which succeed or fail according to the result of their
;;; respective operations; e.g. (and A B) will succeed, if and only if both A
;;; and B succeed. Note that A and B can be lisp symbols (not only the
;;; constants true and fail).  A logical expression in two variables can then
;;; be written in prefix notation, as in the following example:
;;; (and (or A B) (nand A B)).
;;; 
;;; Now, write a function table which prints the truth table of a given
;;; logical expression in two variables.
;;; 
;;; Example:
;;; * (table A B (and A (or A B)))
;;; true true true
;;; true fail true
;;; fail true fail
;;; fail fail fail

(defun and/2 (a b)
  "A predicate which returns 'true if both arguments are non-nil."
  (cond ((and a b) 'true)
	(t 'fail)))

(defun or/2 (a b)
  "A predicate which returns 'true if one or both arguments are non-nil."
  (cond ((or a b) 'true)
	(t 'fail)))

(defun nand/2 (a b)
  "A predicate for 'not and' of two arguments."
  (cond ((not (and a b)) 'true)
	(t 'fail)))

(defun nor/2 (a b)
  "A predicate for 'not or' of two arguments."
  (cond ((not (or a b)) 'true)
	(t 'fail)))

(defun xor/2 (a b)
  "A predicate for xor of two arguments."
  (cond ((and a (not b)) 'true)
	((and (not a) b) 'true)
	(t 'fail)))

(defun impl/2 (a b)
  "A predicate which returns only fail if a is t and b nil."
  (cond ((or (not a) b) 'true)
	(t 'fail)))

(defun equ/2 (a b)
  "A predicate which returns true only if both arguments are either both true or fail."
  (cond ((or (and a b) (and (not a) (not b))) 'true)
	(t 'fail)))

(defmacro table (a b expression)
  "Prints the truth table of a given logical expression in two variables."
  `(loop :for ,a :in '(t t nil nil)
	    :for ,b :in '(t nil t nil)
	    :do (format t "~{~:[Fail~;True~]~^~T~}~%"
	   	     ;; A bit awkward but I wanted to use True/Fail instead of
		     ;; Lisp's t/nil but also wanted to use format's iteration
		     ;; and conditional printing feature.
		     (list ,a ,b (unless (equal ,expression 'fail) t)))))

;;; Just some tests
(define-test test-logic
  (assert-equal 'true (and/2 t t))
  (assert-equal 'fail (and/2 t nil))
  (assert-equal 'true (impl/2 nil t))
  (assert-equal 'true (impl/2 nil nil))
  (assert-equal 'fail (equ/2 nil t))
  (assert-equal 'fail (equ/2 t nil))
  (assert-equal 'true (equ/2 nil nil)))
