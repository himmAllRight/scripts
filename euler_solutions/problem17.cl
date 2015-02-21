;; problem 17
(defparameter *num-names* '((0 . 0) (1 . 3) (2 . 3) (3 . 5) (4 . 4) (5 . 4) (6 . 3) (7 . 5) (8 . 5)
			    (9 . 4) (10 . 3) (11 . 6) (12 . 6) (13 . 8) (14 . 8) (15 . 7) (16 . 7)
			    (17 . 9) (18 . 8) (19 . 8) (20 . 6) (30 . 6) (40 . 5) (50 . 5) (60 . 5)
			    (70 . 7) (80 . 6) (90 . 6) (hundred . 7) (thousand . 8) (and . 3)))

(defun num-name-count (n)
  (let ((total 0))
    (when (>= (/ n 1000) 1)
      (setf total (+ total (cdr (assoc (floor (/ n 1000)) *num-names*))
		     (cdr (assoc 'thousand *num-names*))))
      (setf n (mod n 1000))
      (when (< (mod n 100) 100)
	(setf total (+ total (cdr (assoc 'and *num-names*))))))

    (when (>= (/ n 100) 1)
      (setf total (+ total (cdr (assoc (floor (/ n 100)) *num-names* ))
		     (cdr (assoc 'hundred *num-names*))))
      (when (eq (mod n 100) 0)
	(setf total (+ total (cdr (assoc 'and *num-names*))))))

    (setf n (mod n 100))

    (if (> n 20)
	(setf total (+ total (cdr (assoc (* 10 (floor (/ n 10))) *num-names*))
		       (cdr (assoc (mod n 10) *num-names*))))
      (setf total (+ total (cdr (assoc n *num-names*)))))

    total))


(defun prob17 (i &key (sum 0))
  (if (<= i 0)
      sum
    (prob17b (1- i) :sum (+ sum (num-name-count i)))))