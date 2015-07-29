(setf moves-alist '((1 (4 . 2) (6 . 3)) 
		     (2 (7 . 4) (9 . 5))
		     (3 (8 . 5) (10 . 6))
		     (4 (11 . 7) (1 . 2) (13 . 8))
		     (5 (14 . 9) (12 . 8))
		     (6 (1 . 3) (15 . 10) (13 . 9))
		     (7 (2 . 4) (9 . 8))
		     (8 (3 . 5) (10 . 9))
		     (9 (2 . 5) (7 . 8))
		     (10 (3 . 6) (8 . 9))
		     (11 (4 . 7) (13 . 12))
		     (12 (5 . 8) (14 . 13))
		    (13 (4 . 8) (11 . 12) (6 . 9) (15 . 14))))

(setf board '(nil t t t t t t t t t t t t t t))

(defun potential-moves (n)
  (cdr (assoc n moves-alist)))

(defun valid-jump (new-spot remove-spot board)
  (and (not (nth (1- new-spot) board)) (nth (1- remove-spot) board)))

(defun valid-moves (n board)
  (remove nil (mapcar (lambda (pair) 
				(if (nth (1- (car pair)) board)
				    nil
				  pair)) (potential-moves n))))
    

(defun make-move (n pair board)
  (setf (nth (1- n) board) nil)
  (setf (nth (1- (car pair)) board) t)
  (setf (nth (1- (cdr pair)) board) nil)
  board)


	    
(defun done (board)
  (let ((find-t (member t board)))
    (unless find-t
      (error "No Pegs found. It is not possible to remove all the pegs..."))
    (when find-t
	(not (member t (cdr find-t))))))



(defun main-loop (input-board &key move-list)
  (format t "~%~%~a~%~%" input-board)
  (if (done input-board)
      (format t "~%Solutions: ~a" (reverse move-list))
    (loop for i from 1 to (length board) do
	  (mapc (lambda (pair) (main-loop (make-move i pair input-board) :move-list (cons pair move-list))) (valid-moves i input-board)))))