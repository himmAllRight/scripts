; Finds the sum of the didgets of a number raised to a power.

(defun power-digit-sum (num ex)
  (setq n (expt num ex))
  (loop for c across (write-to-string n)
        sum (digit-char-p c))
  )