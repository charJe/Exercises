(defn sum3 ([nums] (sum3 nums 0))
  ([nums goal]
   (let [nums (into (vector) (sort nums))
         length (count nums)
         solutions
         , (loop [solutions (hash-set)
                  i 0, left 0, right (- length 1)]
             (cond
               (>= i length) solutions
               (> left right)
               , (recur solutions (+ i 1) (+ i 2) (- length 1))
               :else 
               , (let [sum (+ (nums i) (nums left) (nums right))]
                   (recur (if (and (= goal sum) (not= i left) (not= i right) (not= left right))
                            (conj solutions
                                  (sort (list (nums i) (nums left) (nums right))))
                            solutions)
                          i (if (< sum goal)
                              (+ left 1)
                              left)
                          (if (>= sum goal)
                            (- right 1)
                            right)))))]
      (into (list) solutions))))

(defn sum3-test [result goal]
  (loop [result result, pass true]
             (if (or (empty? result) (not pass))
               pass
               (recur (rest result)
                      (and pass
                           (= goal (+ (nth (first result) 0)
                                   (nth (first result) 1)
                                   (nth (first result) 2))))))))

(println (sum3-test (sum3 [-1, 0, 1, 2, -1, -4]) 0))
(println (let [result (sum3 (read-string (slurp "message.txt")))]
           (sum3-test result 0)))
   
