(defun bmi-calc (feet inches lbs)
  (let* ((h (+ (* feet 12) inches))
	 (bmi (* (/ lbs (expt h 2)) 703)))
    
    bmi))


(bmi-calc 6 0 162)

(defun under-weight (w h)
  (/ (* 18.5 h) 703))

(defun over-weight (w h)
  (/ (* 25 h) 703))

(defun obese (w h)
  (/ (* 30 h) 703))