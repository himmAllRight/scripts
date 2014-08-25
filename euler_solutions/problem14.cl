
; Returns the number of steps of a Collatz sequence for a starting number
(defun collatz-seq (n i)
  (format t "n: ~d i: ~d ~%" n i)
  (cond ((equal n 1) 
         i)
        ((oddp n) 
         (collatz-seq (1+ (* 3 n)) (1+ i)))
        ((evenp n)
         (collatz-seq (/ n 2) (1+ i)))))

; Loop through numbers to find longest seq
(defun find-longest (s e)
  (defparameter *maxChain* 1)
  (defparameter *maxStart* 1)
  
  (loop for i from s to e do
        (setf tempVal (collatz-seq i 1))
        (princ tempVal)
        (fresh-line)
        (if (> tempVal *maxChain*) 
            (progn((setf *maxChain* tempVal)
                   (setf *maxStart* i))))
        )
      (format t "Max collatz-seq contains ~d terms and starts with the number ~d" maxChain maxStart)
      )
            
