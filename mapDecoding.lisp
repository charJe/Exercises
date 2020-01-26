(defconstant magic-num (+ (expt 10 9) 7))

(defun mapDecoding (message &optional (i 1)
                              (count 1)
                              (previous-count 1))
  (if (and (> (length message) 0)
           (char= #\0 (aref message 0)))
      0
      (if (>= i (length message))
          (mod count magic-num)
          (let ((current (aref message i))
                (previous (aref message (1- i))))
            (cond
              ((and (char= current #\0) ;invalid
                    (not (or (char= previous #\1)
                             (char= previous #\2))))
               0)                       ;return 0
              ((and (or (and (char= previous #\1)
                             (char/= current #\0))
                        (and (char= previous #\2)
                             (char/= current #\0)
                             (char<= current #\6)))
                    (if (< (1+ i) (length message))
                        (char/= (aref message (1+ i)) #\0)
                        t))
               (mapDecoding message (1+ i)
                            (mod (+ count previous-count) magic-num)
                            count))
              (t (mapDecoding message (1+ i)
                              count
                              count)))))))
