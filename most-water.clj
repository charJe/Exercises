(defn water-volume [heights left right]
  (* (min (heights left) (heights right))
     (- right left)))

(defn most-water [heights]
  (loop [beg 0, end (- (count heights) 1), maximum 0]
    (cond
      (>= beg end) maximum
      (< (heights beg) (heights end))
      ,(recur (+ beg 1) end (max maximum (water-volume heights beg end)))
      :else
      ,(recur beg (- end 1) (max maximum (water-volume heights beg end))))))

(println "result:" 49 (most-water [1,8,6,2,5,4,8,3,7]))
(println "result:" 45 (most-water [3,9,2,4,7,2,12,6]))
(println "result:" 48 (most-water [3,9,100,12,7,2,12,6]))
(println "result:" 17 (most-water [2,3,4,5,18,17,6]))
(println "result:" 100 (most-water [3,9,100,100,7,2,12,6]))
(println "result:" 100 (most-water [6 12 2 7 100 100 9 3]))
(println "result:" 18048 (most-water [76,155,15,188,180,154,84,34,187,142,22,5,27,183,111,128,50,58,2,112,179,2,100,111,115,76,134,120,118,103,31,146,58,198,134,38,104,170,25,92,112,199,49,140,135,160,20,185,171,23,98,150,177,198,61,92,26,147,164,144,51,196,42,109,194,177,100,99,99,125,143,12,76,192,152,11,152,124,197,123,147,95,73,124,45,86,168,24,34,133,120,85,81,163,146,75,92,198,126,191]))
(println "result:" 4 (most-water [1,2,4,3]))
