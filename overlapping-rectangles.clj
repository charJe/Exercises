(require '[clojure.set :as set])

(defn spots [rect]
  (let [startx (:x (:top-left rect))
        starty (:y (:top-left rect))
        endx (:x (:bottom-right rect))
        endy (:y (:bottom-right rect))]
    (flatten
     (map (fn [x]
            (map (fn [y]
                   (symbol (str x "," y)))
                 (range starty endy)))
          (range startx endx)))))

(defn overlap-area [rectangles]
  (->>
   rectangles
   (map spots)
   (map set)
   (reduce set/intersection)
   (count)))

(println
 (overlap-area [{:top-left {:x 0 :y 0}
                 :bottom-right {:x 10 :y 10}}
                {:top-left {:x 5 :y 5}
                 :bottom-right {:x 15 :y 15}}])) ;=> 25

;; 2 identical rectangles
(println
 (overlap-area [{:top-left {:x 0 :y 0}
                 :bottom-right {:x 1 :y 1}}
                {:top-left {:x 0 :y 0}
                 :bottom-right {:x 1 :y 1}}])) ;=> 1

;; no overlap
(println
 (overlap-area [{:top-left {:x 0 :y 0}
                 :bottom-right {:x 1 :y 1}}
                {:top-left {:x 6 :y 6}
                 :bottom-right {:x 8 :y 8}}])) ;=> 0

;; enclosing rectangles
(println
 (overlap-area [{:top-left {:x 0 :y 0}
                 :bottom-right {:x 1 :y 1}}
                {:top-left {:x -1 :y -1}
                 :bottom-right {:x 2 :y 2}}])) ;=> 1
