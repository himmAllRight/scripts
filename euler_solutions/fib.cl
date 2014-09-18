;; Just a simple script I wrote in lisp that will
;; return the nth fibonacci number.
(defun fib (n &key (a 0) (b 1))
  (if (<= n 0)
      b
    (fib (- n 1) :a b :b (+a b))))

