(require '[clojure.string :as str])

(defn first-before? [phrase first-letter second-letter]
  (let [phrase (str/lower-case phrase)]
    (< (str/last-index-of phrase first-letter)
       (str/index-of phrase second-letter))))

(println (first-before? "A rabbit jumps joyfully" \a \j)) ;=> true
(println (not (first-before? "A jolly rabbit jumps joyfully" \a \j))) ;=> false
(println (first-before? "Don't tread on me" \t \m)) ;=> true
(println (not (first-before? "Every React podcast" \t \d))) ;=> false
