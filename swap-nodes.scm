(define (swap-nodes lst)
  (if (< (length lst) 2)
      lst
      (cons (cadr lst) (cons (car lst) (swap-nodes (cddr lst))))))
