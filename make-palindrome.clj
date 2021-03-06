(require '[clojure.string :as str])

(defn palindrome? [word]
  (= word (str/reverse word)))

(defn make-palindrome-lazy [word]
  (loop [possible word, index 1]
    (if (palindrome? possible)
      possible
      (recur (str word (str/reverse (subs word 0 (min index))))
             (+ index 1)))))

(defn make-palindrome [word]
  (->> (reductions str "" word)
       (map str/reverse)
       (map (partial str word))
       (filter palindrome?)
       (first)))

(println (make-palindrome-lazy "race"))
(println (make-palindrome "race"))
(println (make-palindrome-lazy "mad"))
(println (make-palindrome "mad"))
(println (make-palindrome-lazy "mirror"))
(println (make-palindrome "mirror"))


