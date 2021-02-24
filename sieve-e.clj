(require '[clojure.set :as set])

(defn sieve-e [max]
  (let [nums (set (range 2 (+ max 1)))]
    (->> nums
         (map (fn [n] (set (range (* n n) (+ max 1) n))))
         (apply set/difference nums)
         (into (list))
         (sort))))


(println (sieve-e 120))
