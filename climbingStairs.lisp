(defvar *options* (make-hash-table))
(setf (gethash 2 *options*) 2)
(setf (gethash 1 *options*) 1)
(setf (gethash 0 *options*) 0)
(setf (gethash -1 *options*) 0)

(defun climbingStairs (n)
  (let ((value (gethash n *options*)))
    (if value
        value
      (setf (gethash n *options*) (+ (climbingStairs (- n 1))
                                     (climbingStairs (- n 2)))))))
        
            
