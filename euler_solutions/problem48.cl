;; returns the sum of the series 1^1 + 2^2 +...n^2
(defun serriesSum (n)
  (loop for i from 1 to n 
      sum (expt i i)))

;; Returns the last d didgets of a number n
(defun lastDidgets (n d)
  (mod n (expt 10 d)))