;;;; Problem 17

;; Returns a list containing the factors of a number, n.
(defun get-factors (n)
  (setf factors ())
  (loop for i from 1 to (ceiling (sqrt n)) do
        (when (equalp (mod n i) 0)
          (push i factors)
           (push (/ n i) factors)))
  factors)

;;; **** In this current setup, you have to re-define *tri-numbers* before running main ***

(defun main (x)
  (let ((n 0))
    (loop while (<= (length (get-factors n)) x) do
          (setf n (funcall *tri-number*)))
    n))


(defparameter *tri-number*
  (let ((tri 1) (num 2))
    #'(lambda nil (setf tri (+ tri num)) (setf num (1+ num)) tri)))


;;;; ******* Working attempt to fix that limitation. Have to swap some number around...

(defun tri-numbers (&key (tris '(1 1)))
  (push (+ (car tris) (length tris)) tris)
  tris)

(defun main2 (x)
  (let ((tri-nums (tri-numbers)))
    (loop while (< (length (get-factors (car tri-nums))) x) do
          (format t "~%~s" (car tri-nums))
          (setf tri-nums (tri-numbers :tris tri-nums)))
    (car tri-nums)
    (sort (get-factors (car tri-nums)) #'<)))