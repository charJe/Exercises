
(defn gcd [greatest num]
  ((memoize
   (fn [greatest num]
     (if (zero? num)
       greatest
       (recur num (rem greatest num)))))
   greatest num))

(defn lcm [nums]
  (reduce
   (fn [a b]
     (quot (* a b)
           (gcd a b)))
   1 nums))


(println (lcm [1 2 3])) ;=> 6
(println (lcm [5 4 4])) ;=> 20
(println (lcm [])) ;=> 1
(println (lcm [10])) ;=> 10
(println (lcm [6 8 15])) ;=> 120
(println (lcm [2 3 4 5 7])) ;=> 420
(println (lcm [140 72])) ;=> 2520
(println (lcm [288 420])) ;=> 10080
