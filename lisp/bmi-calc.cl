(defun bmi-calc (feet inches lbs)
  (let* ((h (+ (* feet 12) inches))
	 (bmi (* (/ lbs (expt h 2)) 703))
	 (bmi-list '(18.5 25 30))
	 (weights-list  (mapcar 
			 #'(lambda (bmiL) 
			     (round (/ (* bmiL (expt h 2)) 703)))  bmi-list)))
    
    (format t "~%Your BMI is: ~d, (calculated from ~dft. ~din. at ~d lbs)." (float bmi) feet inches lbs)
    (format t "~%Underweight: ~d or under. ~%Overweight: ~d or over.~%Obese: ~d or over."  (nth 0 weights-list) (nth 1 weights-list) (nth 2 weights-list))))