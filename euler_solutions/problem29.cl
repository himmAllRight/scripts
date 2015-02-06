(defun problem29 (a1 a2 b1 b2)
  ;; Make hash-table
  (let ((a (make-hash-table))
	(ind)
	(count 0))

  (loop for i from a1 to a2 do
	(loop for j from b1 to b2 do
	      (setf ind (expt i j))
	      (unless (gethash ind a)
		(setf (gethash ind a) t)
		(setf count (1+ count)))))
  count))