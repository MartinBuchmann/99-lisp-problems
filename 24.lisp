(in-package :99-lisp-problems)
;;; (*) Lotto: Draw N different random numbers from the set 1..M.
;;; The selected numbers shall be returned in a list.
;;; Example:
;;; * (lotto-select 6 49)
;;; (23 1 17 33 21 37)

;;; Using the functions `element-at`, `remove-at`, `range` and `rnd-select`
;;; definied in 03.lisp, 20.lisp, 22.lisp and 23.lisp, respectively.
(defun lotto-select (n m)
  "Draw N different random numbers from the set 1..M."
  (when (and (integerp n) (integerp m) (> m n))
    (rnd-select (range 1 m) n)))

(define-test test-lotto
  (assert-nil (lotto-select 2 1))
  (assert-equal 6 (length (lotto-select 6 49)))
  (assert-equal 1 (length (lotto-select 1 2)))
  (assert-equal 4 (length (lotto-select 4 49))))
