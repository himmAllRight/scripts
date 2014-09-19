;;;; Problem 67. Same as 18, but also has a triangle generator.

;; Simple main function to make running it a slight bit simplier
(defun max-path-sum (filepath)
  (format nil "Maximum path sum: ~d" (sum-next-row (make-triangle filepath))))

;; Builds the triangle as a list of arrays, 1 array for each row.
(defun make-triangle (fileName)
  (with-open-file (iStream fileName :direction :input)
    (let ((i 0)
          (j 0)
          row
          rows '())
      (loop for line = (read iStream nil :eof)
          until (eq line :eof)
          do
            (if (equalp j i)
                (progn 
                  (setf i (1+ i))
                  (when row
                    (push row rows))
                  (setf row (make-array i))
                  (setf (aref row 0) line)
                  (setf j 1))
              (progn
                (setf (aref row j) line)
                (setf j (1+ j)))))
      (push row rows)
      rows)))

;; runs up the list and sums the path from the bottom up, to end up with the max at the top.
(defun sum-next-row (row-list)
  (if (> (length row-list) 1)
      (progn
        (loop for i from 0 to (1- (length (cadr row-list)))
            do
              (if (> (aref (car row-list) i) (aref (car row-list) (1+ i)))
                  (setf (aref (cadr row-list) i) (+ (aref (car row-list) i) (aref (cadr row-list) i)))
                (setf (aref (cadr row-list) i) (+ (aref (car row-list) (1+ i)) (aref (cadr row-list) i)))))
        (sum-next-row (cdr row-list)))
    (aref (pop row-list) 0)))



;; A function to generate a random triangle
(defun generate-triangle (rows outfile &key (max-num 100))
  (when (probe-file outfile)
    (delete-file outfile))
  (loop for i from 1 to rows do
        (with-open-file (oStream outfile :direction :output :if-exists :append :if-does-not-exist :create)
          (loop for j from 1 to i do
                (format oStream "~d " (+ 1 (random max-num))))
          (format oStream "~%"))))

              