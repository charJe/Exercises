(defn rbinary-search [nums target]
  (loop [left 0
         middle (int (/ (count nums) 2))
         right (- (count nums) 1)]
    (cond
      ;; solution
      (and (<= 0 right)
           (= target (nums middle)))
      , middle
      ;; no solution
      (<= right left) -1
      ;; left
      (or (<= (nums left) target (nums middle) (nums right))
          (<= (nums right) (nums left) target (nums middle))
          (<= (nums middle) (nums right) (nums left) target)
          (<= target (nums middle) (nums right) (nums left))
          (<= (nums middle) (nums right) target (nums left))
          (<= target (nums left) (nums middle) (nums right)))
      , (recur left (int (/ (+ left middle) 2)) (- middle 1))
      :else ;; right
      , (recur (+ middle 1) (int (/ (+ middle 1 right) 2)) right))))

;; right cases:
;; (or (<= (nums left) (nums middle) target (nums right))
;;     (<= (nums right) (nums left) (nums middle) target)
;;     (<= target (nums right) (nums left) (nums middle))
;;     (<= (nums middle) target (nums right) (nums left))
;;     (<= (nums left) (nums middle) (nums right) target)
;;     (<= (nums right) target (nums left) (nums middle)))

;;; tests
(defn rbtest [nums target]
  (let [result (rbinary-search nums target)
        actual (. nums indexOf target)]
    (println (if (= result actual)
             "pass"
             (str "FAIL: " result  " /= " actual)))))
(rbtest [1 2 3 4 5] 2)
(rbtest [1 2 3 4 5] 4)
(rbtest [2 3 4 5 1] 3)
(rbtest [2 3 4 5 1] 5)
(rbtest [3 4 5 1 2] 4)
(rbtest [3 4 5 1 2] 1)
(rbtest [4 5 1 2 3] 5)
(rbtest [4 5 1 2 3] 2)
(rbtest [5 1 2 3 4] 1)
(rbtest [5 1 2 3 4] 3)

(rbtest [4,5,6,7,0,1,2] 5)
(rbtest [8,0,1,4,7] 8)
(rbtest [7,8,0,1,4,6] 8)
(rbtest [8,0,1,4,7] 0)
(rbtest [4,5,6,7,0,1,2] 0)
(rbtest [4,5,6,7,0,1,2] 3)
(rbtest [4,5,6,7,0,1,2] 7)
(rbtest [4,5,6,7,0,1,2] 6)
(rbtest [1] 0)
(rbtest [1 2 4 5 6 7 0] 0)
(rbtest [] 3)
(rbtest [2 1] 1)
(rbtest [2 1] 2)
(rbtest [4,5,6,7,8,1,2,3] 8)
(rbtest [3,4,5,6,7,8,0,1,2] 8)
(rbtest [5,1,2,3,4] 1)
