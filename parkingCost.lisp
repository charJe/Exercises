(require 'split-sequence)
(defun parkingCost (time-in time-out)
  (let ((start-hour (parse-integer (car (split-string time-in ":"))))
        (start-minute (parse-integer (cadr (split-string time-in ":"))))
        (end-hour (parse-integer (car (split-string time-out ":"))))
        (end-minute (parse-integer (cadr (split-string time-out ":")))))
    ))

(defun round10 (num)
  (if (= (mod num 10) 0)
      num
    (* 10 (+ 1 (floor (/ num 10))))))

