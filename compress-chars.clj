(defn compress-chars [chars]
  (->>
   chars
   (reduce
    (fn [alist char]
       (let [current-char (second (first alist))
             count (first (first alist))]
         (if (or (nil? current-char)
                 (= current-char char))
           ;; char is same or unset
           (cons (list (+ (or count 0) 1)
                       char)
                 (rest alist))
           ;; else, char is different
           (cons (list 1 char)
                 alist))))
    (list))
   (reverse)))

(print (compress-chars (list)))
(print (compress-chars (list \t, \t, \t, \t, \b, \c, \c, \a, \a, \d, \r, \r, \r, \r)))
