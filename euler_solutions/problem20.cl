;; Recursive function that finds the factorial of a number
(defun factorial (n)
  (if (equalp n 1)
      1
    (* n (factorial (1- n)))))

;; Rescursive function that sums the didgets of a number
(defun sumNum (n)
  (if (<= n 0)
      n
    (+ (mod n 10) (sumNum (floor (/ n 10))))))