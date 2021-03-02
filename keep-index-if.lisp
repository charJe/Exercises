(import 'arrows:-<>>)

(defun keep-if-index (predicate sequence)
  (-<>> (loop for i from 0 below (length sequence) collect i)
    (map 'list 'list sequence)
    (remove-if-not predicate <> :key 'second)
    (map (class-of sequence) 'first)))

(keep-if-index 'evenp "abcdefg")
