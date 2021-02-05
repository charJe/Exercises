(defn consec [string]
  (some
   (fn [num]
     (loop [nums (list (Integer/parseInt (subs string 0 num)))
            num-string (subs string num)]
       (let [num (first nums)]
         (cond
           (and (empty? num-string)
                (< 1 (count nums)))
           , (reverse nums)
           :else
           , (let [next-num (Integer/parseInt (subs num-string 0 (count (str (+ 1 num)))))]
               (when (and (count (str (+ 1 num)))
                          (= (+ 1 num)
                             next-num))
                 (recur (cons next-num nums)
                        (subs num-string (count (str (+ 1 num)))))))))))
   (range 1 (+ 1 (quot (count string) 2)))))


(println (consec "121314")) ;=> [12 13 14]
(println (consec "121315")) ;=> nil
(println (consec "444445")) ;=> [444 445]
(println (consec "12")) ;=> [1 2]
(println (consec "7891011")) ;=> [7 8 9 10 11]
(println (consec "99100")) ;=> [99 100]
(println (consec "1")) ; throws error
