(in-package :99-lisp-problems)
;;; (*) Generate a random permutation of the elements of a list.
;;; Example:
;;; * (rnd-permu '(a b c d e f))
;;; (B A D C E F)

;;; Using the functions `element-at` and `remove-at` definied in
;;; 03.lisp and 20.lisp, respectively.
(defun rnd-permu (original-list)
  "Returns a random permutation of the elements of `original-list`."
  (unless (null original-list)
    (let ((position (1+ (random (length original-list)))))
      (cons (element-at original-list position) (rnd-permu (remove-at original-list position))))))

(define-test test-rnd-permu
  (assert-nil (rnd-permu '()))
  (assert-equal 6 (length (rnd-permu '(a b c d e f)))))
