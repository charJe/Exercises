(defn pendulum [nums]
  (loop [nums (sort nums)
         left true
         pen (list)]
    (if (empty? nums)
      pen
      (recur (rest nums) (not left)
             (if left
               (conj pen (first nums))
               (concat pen (list (first nums))))))))

(println (pendulum [6, 6, 8, 5 ,10, 11])) ;=> (10 6 5 6 8 11)
