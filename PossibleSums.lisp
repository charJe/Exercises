(defun possible-sums (coins quants)
  (let ((track (make-hash-table))
  (- (list-length )))


(defun powerset (set &optional powers)
  (if (null set)
      powers
    (powerset (car set)
              (cons powers
                    (map #'(lambda (subset)
                            (cons (car set)
                                  (subset))) power)))))

(defun num-coins (coins quants &optional combos)
  (cond
   ((null coins)
    combos)
   ((/= 1 (car(quants)))
    (num-coins coins
              (cons (- (car quants) 1)
                    (cdr quants))
              (cons (car coins) combos)))
   (t
    (num-coins (cdr coins)
               (cdr quants)
               (cons (car coins)
                     combos)))))
