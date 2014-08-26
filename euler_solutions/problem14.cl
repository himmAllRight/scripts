; Ryan Himmelwright - Project Euler problem 14 Lisp Solution

; Returns the number of steps of a Collatz sequence for a starting number
(defun collatz-seq (n i)
  (cond ((equal n 1) 
         i)
        ((oddp n) 
         (collatz-seq (1+ (* 3 n)) (1+ i)))
        ((evenp n)
         (collatz-seq (/ n 2) (1+ i)))))

; Loop through numbers to find longest seq
(defun find-longest (s e)
  (let ((maxChain 5)
        (maxStart 1))
  
  (loop for i from s to e by 1 do
        (setf tempVal (collatz-seq i 1))
        
        (if (> tempVal maxChain)
            (progn (princ "True")
              (setf maxChain tempVal)
              (setf maxStart i)
              (fresh-line))))
    
    (format t "The longest Collatz-Seq from ~d to ~d,~%is of length ~d, found with the starting value of ~d." s e maxChain maxStart)))