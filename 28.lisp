(in-package :99-lisp-problems)
;;; Sorting a list of lists according to length of sublists
;;; a) We suppose that a list contains elements that are lists themselves. The
;;;    objective is to sort the elements of this list according to their
;;;    length. E.g. short lists first, longer lists later, or vice versa.
;;; 
;;; Example:
;;; * (lsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
;;; ((O) (D E) (D E) (M N) (A B C) (F G H) (I J K L))
;;; 
;;; b) Again, we suppose that a list contains elements that are lists
;;;    themselves. But this time the objective is to sort the elements of this
;;;    list according to their length frequency; i.e., in the default, where
;;;    sorting is done ascendingly, lists with rare lengths are placed first,
;;;    others with a more frequent length come later.
;;; 
;;; Example:
;;; * (lfsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
;;; ((i j k l) (o) (a b c) (f g h) (d e) (d e) (m n))
;;; 
;;; Note that in the above example, the first two lists in the result have
;;; length 4 and 1, both lengths appear just once. The third and forth list
;;; have length 3 which appears twice (there are two list of this length). And
;;; finally, the last three lists have length 2. This is the most frequent
;;; length.

(defun lsort (original-list)
  "Sorting a list according to the length of its elements (sublists) using sort
directly.  `copy-list`is impotant to peserve the original list."
  (when (every #'listp original-list)
    (sort (copy-list original-list) #'< :key #'length)))

(defun lfsort (original-list)
  "Sorting a list according to the length frequency of its
elements (sublists) using a pretty inefficient (a lot of consing) but direct way."
  (when (every #'listp original-list)
    (let* ((list-of-length (mapcar #'(lambda (list) (cons (length list) list)) original-list))
           (lfreq (mapcar
		   #'(lambda (element) (cons (count (first element) list-of-length :key #'first)
					(rest element)))
		   list-of-length)))
      (map 'list #'rest (sort lfreq #'< :key #'first)))))

(define-test test-lsort
  (assert-equal '((O) (D E) (D E) (M N) (A B C) (F G H) (I J K L))
		(lsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o))))
  (assert-equal '((i j k l) (o) (a b c) (f g h) (d e) (d e) (m n))
		(lfsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))))
