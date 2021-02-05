(defn nest [items times]
  (map
   (fn [item]
     (repeat times item))
   items))


(println (nest [:a :b :c] 2)) ;=> ((:a :a) (:b :b) (:c :c))
(println (nest [] 10)) ;=> ()
(println (nest [1 2 3 4] 1)) ;=> ((1) (2) (3) (4))
(println (nest [1 2 3] 0)) ;=> (()()())
