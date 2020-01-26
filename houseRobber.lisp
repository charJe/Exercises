(defun houseRobber (houses)
  (let ((previous-max 0)
        (current-max 0))
    (loop for i from 0 to (1- (length houses)) do
      (let ((new-max (max current-max
                          (+ previous-max
                             (aref houses i)))))
        (setq previous-max current-max)
        (setq current-max new-max)))
    current-max))
