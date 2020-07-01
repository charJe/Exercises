(defn isSum ([value] (isSum value 1 0))
  ([value n sum]
   (cond
     (= sum value) true
     (> sum value) false
     :else (recur value (+ n 1) (+ sum n)))))
