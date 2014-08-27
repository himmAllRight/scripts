(defparameter *input* "c:\\xTemp\\problem13Input.txt")

(defun get-file (filename)
              (with-open-file (stream filename)
                (loop for line = (read-line stream nil)
                      while line
                    collect line)))

(defun probMain ()
  (setf numberLines (get-file *input*))
  (loop for i in numberLines
      sum (parse-integer i)))

