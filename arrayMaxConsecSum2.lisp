(defun arrayMaxConsecutiveSum2 (arr)
  (let ((maximum-sum most-negative-fixnum)
        (sum most-negative-fixnum))
    (loop for i from 0 to (1- (length arr)) do
      (let ((n (aref arr i)))
        (setq sum
              (if (> n (+ sum n))
                  n
                  (+ sum n)))
        (when (> sum maximum-sum)
          (setq maximum-sum sum))))
    maximum-sum))
