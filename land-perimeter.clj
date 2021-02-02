(defn spot [world row column]
  (if (and (< -1 row (count world))
           (< -1 column (count (world row))))
    ((world row) column)
    0))

(defn neighbors [world row column]
  (map (fn [r c]
         (spot world r c))
       (list (- row 1) (+ row 1) row row)
       (list column column (- column 1) (+ column 1))))

(defn perimeter [world]
  (->>
   (map
    (fn [row]
      (map
       (fn [column]
         (if (= 1 (spot world row column))
           (->>
            (neighbors world row column)
            (filter zero?)
            (count))
           0))
       (range 0 (count (world row)))))
    (range 0 (count world)))
   (map (fn [row]
          (reduce + row)))
   (reduce +)))


(print (= 0 (perimeter [[0]])))
(print (= 4 (perimeter [[1]])))
(print (= 6 (perimeter [[1 1]])))
(print (= 8
          (perimeter [[1 1]
                      [1 1]])
          (perimeter [[0 0 0 0]
                      [0 1 1 0]
                      [0 1 1 0]
                      [0 0 0 0]])))
(print (= 42 (perimeter [[1 1 1 1 1 1]
                         [1 0 0 0 0 1]
                         [1 0 1 1 0 1]
                         [1 0 0 0 0 1]
                         [1 1 1 1 1 1]])))
(print (= 16 (perimeter [[0 1 0 0]
                         [1 1 1 0]
                         [0 1 0 0]
                         [1 1 0 0]])))
