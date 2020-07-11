;; A binary tree is defined like this:
(define sample
  '(1 (3 (6 ()
            ())
         ())
      (2 (5 ()
            ())
         (4 (8 ()
               ())
            (7 ()
               (9 ()
                  ()))))))

(define (bfs tree)
  (let sub-bfs ((order (list)) (queue (list tree)))
    (if (null? queue)
        order
        (let ((tree (car queue)))
          (if (null? tree)
              (sub-bfs order (cdr queue))
              (sub-bfs (append order (list (car tree)))
                       (append (cdr queue)
                               (list (cadr tree)
                                     (caddr tree)))))))))
