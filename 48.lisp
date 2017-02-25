(in-package :99-lisp-problems)
;;; (**) Truth tables for logical expressions (3).

;;; Generalize problem P47 in such a way that the logical expression may
;;; contain any number of logical variables. Define table/2 in a way that
;;; table(List,Expr) prints the truth table for the expression Expr, which
;;; contains the logical variables enumerated in List.

;;; Example:
;;; * table([A,B,C], A and (B or C) equ A and B or A and C).
;;; true true true true
;;; true true fail true
;;; true fail true true
;;; true fail fail true
;;; fail true true true
;;; fail true fail true
;;; fail fail true true
;;; fail fail fail true

;; http://www.informatimago.com/develop/lisp/l99/p46.lisp
(defun evaluate-boolean (expression bindings)
  "Evaluates the boolean expression.  Returns t or NIL.

expression := variable | constant | '(' operator expression expression ')' | '(' 'not' expression ')' .
constant   := 'true' | 'fail' .
variable   := symbol .
operator   := 'and/2' | 'or/2' | 'nand/2' | 'nor/2' | 'xor/2' | 'impl/2' | 'equ/2' .

bindings   is a list of pairs (variable . constant).
"
  (cond
    ((eq expression 'true) t)
    ((eq expression 'fail) nil)
    ((symbolp expression) (let ((pair (assoc expression bindings)))
                            (if pair
                                (progn
                                  (assert (member (cdr pair) '(true fail)))
                                  (eql 'true (cdr pair)))
                                (error "No variable named ~A in the bindings." expression))))
    ((atom expression) (error "Invalid atom ~A in the expression." expression))
    (t (case (length expression)
         ((2) (destructuring-bind (op subexpression) expression
                (case op
                  ((not) (not (evaluate-boolean subexpression bindings)))
                  (otherwise (error "Invalid operator ~A" op)))))
         ((3) (destructuring-bind (op left right) expression
                (case op
                  ((and/2)  (and  (evaluate-boolean left bindings) (evaluate-boolean right bindings)))
                  ((or/2)   (or   (evaluate-boolean left bindings) (evaluate-boolean right bindings)))
                  ((nand/2) (nand (evaluate-boolean left bindings) (evaluate-boolean right bindings)))
                  ((nor/2)  (nor  (evaluate-boolean left bindings) (evaluate-boolean right bindings)))
                  ((xor/2)  (xor  (evaluate-boolean left bindings) (evaluate-boolean right bindings)))
                  ((impl/2) (impl (evaluate-boolean left bindings) (evaluate-boolean right bindings)))
                  ((equ/2)  (equ  (evaluate-boolean left bindings) (evaluate-boolean right bindings)))
                  (otherwise (error "Invalid operator ~A" op)))))
         (otherwise (error "Invalid expression ~A" expression))))))

(defun table/2 (variables expression)
  "Prints the truth table of a given logical expression in any number of variables."
  ;; This is very close to Pascal Bourguignon's solution. All acknowledgment
  ;; belongs to him!  http://www.informatimago.com/develop/lisp/l99/p48.lisp
  ;; The idea is to first define all bindings of the variables to the values
  ;; true and nil and then evaluate the expression using these bindings. The
  ;; actual evaluation is then done by the function evaluate-boolean.
  (loop
    :with width = (length variables)
    :with size  = (expt 2 width)
    :for i :from (1- size) :downto 0 ; Getting the order right from true to fail.
    :do (let* ((bindings (loop
			  :for bit :downfrom (1- width)
			  :for var :in variables
			  :collect (cons var (if (logbitp bit i)
						 'true
						 'fail))))
	       (result (evaluate-boolean expression bindings)))
	  (format t "~{~:[Fail~;True~]~T~}~:[Fail~;True~]~%"
		  (mapcar (lambda (binding) (eql 'true (cdr binding))) bindings) result))))
