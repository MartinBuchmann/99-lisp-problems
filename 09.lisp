(in-package :99-lisp-problems)
;;; (**) Pack consecutive duplicates of list elements into sublists.
;;; If a list contains repeated elements they should be placed in separate sublists.
;;; 
;;; Example:
;;; * (pack '(a a a a b c c a a d e e e e))
;;; ((A A A A) (B) (C C) (A A) (D) (E E E E))
(defun pack (original-list)
  "Packs consecutive duplicates of list elements into sublists."
  (unless (or (null original-list) (not (listp original-list)))
    (cons (pack-aux-1 original-list) (pack (pack-aux-2 original-list)))))

(defun pack-aux-1 (original-list)
  "Creates a new list from atoms of the given list `original-list' until an atom differs
  from the first one."
  (cond ((null original-list) nil)
	((null (rest original-list)) original-list)
	((eql (first original-list) (second original-list))
	 (cons (first original-list) (pack-aux-1 (rest original-list))))
	(t (list (first original-list)))))

(defun pack-aux-2 (original-list)
  "Ignores the first element(s) of a list until an atom differs from the first one."
  (cond ((null original-list) nil)
	((null (rest original-list)) nil)
	((eql (first original-list) (second original-list))
	 (pack-aux-2 (rest original-list)))
	(t (rest original-list))))

(define-test test-pack
  (assert-nil (pack '()))
  (assert-equal '((A A A A) (B) (C C) (A A) (D) (E E E E))
		(pack '(a a a a b c c a a d e e e e))))
