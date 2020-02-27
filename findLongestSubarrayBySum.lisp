(defun findLongestSubarrayBySum (goal arr &optional (start-i 0) (end-i 0) (sum nil)
                                            (max-start-i 0) (max-end-i 0))
  (cond
    ;; end
    ((or (< goal 0)
         (and (= start-i end-i)
              (>= end-i (length arr))))
     (if (and (= max-start-i 0)
              (= max-end-i 0))
         ;; fail
         (vector -1)
         ;; success
         (vector (1+ max-start-i) max-end-i)))
    ;; success
    ((and sum
          (= goal sum))
     (let ((new-end-i (if (< end-i (1+ start-i))
                          (1+ start-i)
                          end-i))
           (longer (> (- end-i start-i)
                      (- max-end-i max-start-i))))
       (findLongestSubarrayBySum goal arr (1+ start-i) new-end-i (- sum (aref arr start-i))
                                 (if longer
                                     start-i
                                     max-start-i)
                                 (if longer
                                     end-i
                                     max-end-i))))
    ;; move start-i forward
    ((and sum
          (or (> sum goal)
              (= end-i (length arr))))
     (findLongestSubarrayBySum goal arr (1+ start-i) end-i
                               (- sum (aref arr start-i)) max-start-i max-end-i))
    ;; move end-i forward
    (:else
     (let ((new-end-i (or (first
                           (last
                            (loop :for i :from (1+ end-i) :to (length arr)
                                  :collect i
                                  :while (and (< i (length arr))
                                              (= 0 (aref arr i))))))
                          (length arr))))
       (findLongestSubarrayBySum goal arr start-i new-end-i
                                 (if sum
                                     (+ sum (aref arr end-i))
                                     (aref arr end-i))
                                 max-start-i
                                 max-end-i)))))

;; (defun findLongestSubarrayBySum (goal arr)
;;   (let ((start-i 0)
;;         (end-i 0)
;;         (sum 0))
;;     (loop do
;;       ;; check conditions and modify indexes
;;       ;; and modify sum
;;       (cond
;;         ((and (= start-i end-i)
;;               (= end-i (length arr)))
;;          (return-from findLongestSubarrayBySum
;;            (vector -1)))
;;         ;; move start-i forward
;;         ((or (> sum goal)
;;              (= end-i (length arr)))
;;          (progn
;;            (decf sum (aref arr start-i))
;;            (incf start-i)))
;;         (:else
;;          (progn
;;            (incf sum (aref arr end-i))
;;            (incf end-i)
;;            (loop while (and (< end-i (length arr))
;;                             (= 0 (aref arr end-i)))
;;                  do (incf end-i)))))
;;       ;; check sum
;;       (when (= sum goal)
;;         (return-from findLongestSubarrayBySum
;;           (vector (1+ start-i) end-i))))))
