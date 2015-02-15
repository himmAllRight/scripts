(defun bmi-calc (feet inches lbs)
  (let* ((h (+ (* feet 12) inches))
	 (bmi (* (/ lbs (expt h 2)) 703)))
    
    (format t "~%Your BMI is: ~d, (calculated from ~dft. ~din. at ~d lbs)." bmi feet inches lbs)
    (format t "~%To be considered underweight, you need a weight of ~d or under." (bmi-weight lbs h 18.5))
    (format t "~%To be considered overweight, you need a weight of ~d or over." (bmi-weight lbs h 25))
    (format t "~%To be considered obese, you need a weight of ~d or over." (bmi-weight lbs h 30))))


(bmi-calc 6 0 162)

(defun bmi-weight (w h bmi)
  (/ (* bmi  h) 703))
