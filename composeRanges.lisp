(defun composeRanges (nums)
  (if (= 0 (length nums))
      #()
      (let ((min (aref nums 0))
            (ranges '()))
        (loop for i from 1 to (1- (length nums)) do
             (when (not (= (1+ (aref nums (1- i)))
                         (aref nums i)))
                 (setq ranges (append ranges
                                      (list (concatenate 'string
                                                         min
                                                         (if (> (aref nums (1- i))
                                                                min)
                                                             (format nil "~S~D" "->" (aref nums i))
                                                             "")))))
                 (setq min (aref nums (1- i)))))
        ranges)))
