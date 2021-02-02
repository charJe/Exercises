(defn word? [term]
  (and (<= 2 (count term))
       (<= 65 (int (. term charAt 0)) 90)
       (every?
        (fn [character]
          (or (<= 65 character 90)
              (<= 97 character 122)))
        (map int term))))

(defn initial? [term]
  (and (= 2 (count term))
       (<= 65 (int (. term charAt 0)) 91)
       (= \. (. term charAt 1))))

(defn valid-name? [name]
  (let [parts (. name split " ")]
    (and (<= 2 (count parts))
         (every?
          (fn [term]
            (or (word? term)
                (initial? term)))
          parts)
         (word? (last parts)))))


;; valid 
(every? valid-name?
        (list "George R. R. Martin"
              "Abraham Lincoln"
              "J. R. Bob Dobbs"
              "H. G. Wells"))
;; invalid
(every? (fn [name]
          (not (valid-name? name)))
       (list "J R Tolkien"
             "J. F. K."
             "Franklin"))
