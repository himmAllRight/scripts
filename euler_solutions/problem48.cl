;; returns the sum of the series 1^1 + 2^2 +...n^2
(defun serriesSum (n)
  (loop for i from 1 to n 
      sum (expt i i)))

;; Returns the last d didgets of a number n
(defun lastDidgets (n d)
  (mod n (expt 10 d)))


;; Optional Recursive solution :)
(defun serriesSumRec (n)
  (if (equalp 1 n)
      1
    (+ (expt n n) (serriesSumRec (1- n)))))
               