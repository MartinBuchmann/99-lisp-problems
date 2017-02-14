(in-package :99-lisp-problems)
;;; (**) Group the elements of a set into disjoint subsets.
;;; a) In how many ways can a group of 9 people work in 3 disjoint subgroups of
;;;    2, 3 and 4 persons? Write a function that generates all the
;;;    possibilities and returns them in a list.
;;; 
;;; Example:
;;; * (group3 '(aldo beat carla david evi flip gary hugo ida))
;;; ( ( (ALDO BEAT) (CARLA DAVID EVI) (FLIP GARY HUGO IDA) )
;;; ... )
;;; 
;;; b) Generalize the above predicate in a way that we can specify a list of
;;;    group sizes and the predicate will return a list of groups.
;;; 
;;; Example:
;;; * (group '(aldo beat carla david evi flip gary hugo ida) '(2 2 5))
;;; ( ( (ALDO BEAT) (CARLA DAVID) (EVI FLIP GARY HUGO IDA) )
;;; ... )
;;; 
;;; Note that we do not want permutations of the group members; i.e. ((ALDO
;;; BEAT) ...) is the same solution as ((BEAT ALDO) ...). However, we make a
;;; difference between ((ALDO BEAT) (CARLA DAVID) ...) and ((CARLA DAVID) (ALDO
;;; BEAT) ...).
;;; 
;;; You may find more about this combinatorial problem in a good book on
;;; discrete mathematics under the term "multinomial coefficients".


;;; After spending a lot of time thinking, c.f. "org/27.org", I discovered that
;;; I copied Pascal's solution, basically
;;; (http://www.informatimago.com/develop/lisp/l99/p27.lisp).

(defun group3 (set)
  (group set '(2 3 4)))

(defun group (set sizes)
  "Returns all disjoint subgroups of a given set according to the list of
      subgroup sizes."
  (cond ((endp sizes)
	 (error "Not enough subgroup sizes given."))
	((endp (rest sizes))
	 (if (= (first sizes) (length set))
	     (list (list set))
	   (error "Mismatch between set size ~D and subgroup size ~D"
		  (length set) (first sizes))))
	(t (mapcan #'(lambda (subgroup)
		       (mapcar #'(lambda (first-group) (cons subgroup first-group))
			       (group (set-difference set subgroup) (rest sizes))))
		   (combination (first sizes) set)))))

(define-test test-group
  (assert-equal 1260 (length (group3 '(aldo beat carla david evi flip gary hugo ida))))
  (assert-equal 756 (length (group '(aldo beat carla david evi flip gary hugo ida) '(2 2 5)))))
