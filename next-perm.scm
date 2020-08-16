(define (vector-reverse v)
  (list->vector (reverse (vector->list v))))

(define (next-perm nums)
  (cond
   ((null? nums) nums)
   ((apply >= (vector->list nums)) (vector-reverse nums))
   (else
    (let* ((the-one
            (let loop ((index (- (vector-length nums) 1)))
              (cond
               ((= index 0) 0)
               ((< (vector-ref nums (- index 1))
                   (vector-ref nums index))
                (- index 1))
               (else (loop (- index 1))))))
           (the-other-one
            (let loop ((index (- (vector-length nums) 1)))
              (if (> (vector-ref nums index)
                     (vector-ref nums the-one))
                  index
                  (loop (- index 1))))))
      (vector-append
       (subvector nums 0 the-one)
       (subvector nums the-other-one (+ the-other-one 1))
       (vector-reverse (vector-append
                        (subvector nums (+ the-one 1) the-other-one)
                        (subvector nums the-one (+ the-one 1))
                        (subvector nums (+ the-other-one 1) (vector-length nums)))))))))
           
(define (main #!rest command-line)
  (map (lambda (num)
         (print num)
         (print " "))
       (vector->list
        (next-perm
         (list->vector
          (map string->number command-line)))))
  (println)
  0)
