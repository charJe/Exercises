(defn abs [n] (max n (-' n)))
(defn zig-zag [s rows]
  (loop [row 0, space (- rows 2), zagged ""]
    (cond
      (= rows 1) s
      (>= row rows) zagged
      :else (recur (+ row 1) (if (= space 0) (- rows 2) (- space 1))
                   (str zagged (loop [index row, space space, zig ""]
                                 (if (>= index (count s))
                                   zig
                                   (recur (+ index (* 2 (+ space 1)))
                                          (if (or (= row 0) (= row (- rows 1)))
                                            space
                                            (abs (- rows 2 space 1)))
                                          (str zig (subs s index (+ index 1)))))))))))

(println (zig-zag "PAYPALISHIRING" 1))

;; "
;; P...H.
;; A..SI.
;; Y.I.R.
;; PL..IG
;; A...N.
;; "
