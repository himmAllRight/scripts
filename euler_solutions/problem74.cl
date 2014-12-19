;; Simple recursive factorial function
(defun ! (n)
  (if (<= n 0)
      1
    (* n (! (1- n)))))

;; Converts a number to a list of its didgets
(defun num2didgetL (n l)
  (if (<= n 0)
      l
    (num2didgetL (/ n 10) (push (mod n 10) l))))

;; Sums the factorials of the didgets of a number
(defun factDidgets (n)
  (apply '+ (mapcar #'! (num2didgetL n nil))))

;; Returns the chain length
(defun countChain (n l)
  (if (member n l)
      (1+ (length l))
    (countChain (factDidgets n) (push n l))))

(defun make-list (n l)
  (if (<= n 0)
      l
    (make-list (1- n) (push (countChain n nil) l))))

