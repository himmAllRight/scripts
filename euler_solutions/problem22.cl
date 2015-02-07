(defun problem22 (&key (name-file "~/Downloads/names.txt") (np 938))
  (with-open-file (names name-file :direction :input)
    (let* ((name-string (read-line names))
	   (name-list (delimited-string-to-list name-string ","))
	   (ht (make-letter-ind-hash))
	   (name-score-sum 0))
      
      ;; Remove \" from name strings
      (setf name-list (mapcar #'(lambda (n) (remove #\" n)) name-list))
      
      ;; Sort name list
      (setf name-list (sort name-list #'string-lessp))
      
      ;; Sum all name scores in list
      (loop for i from 1 to  (length name-list) do
	    (setf name-score-sum (+ name-score-sum 
				    (* i (name-num (nth (1- i) name-list) ht)))))
      ;; return name score sum
       name-score-sum)))

;; Makes a has table to get letter values
(defun make-letter-ind-hash ()
  (let ((ht (make-hash-table))
	(az '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")))
    
    (loop for i from 1 to 26 do
	  (setf (gethash (char (nth (1- i) az) 0) ht) i))
    
    ht))

;; simple char to int convert with the hash table
(defun char2int (ch ht)
  (gethash ch ht))

;; converts a name to a name score
(defun name-num (name ht)
  (let ((name-sum 0))
    (loop for l from 0 to (1- (length name)) do
	  (setf name-sum (+ name-sum (char2int (char name l) ht))))
    name-sum))