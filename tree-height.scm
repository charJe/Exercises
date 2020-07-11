;; A binary tree is defined like this:
(define sample
  '(value (value (leaf-node ()
                            ())
                 ())
          (value (leaf-node ()
                            ())
                 (value (leaf-node ()
                                   ())
                        (value ()
                               (leaf-node ()
                                          ()))))))

(define (tree-height tree)
  (let dfs ((depth -1) (tree tree))
    (cond
     ((null? tree) depth)               ;leaf node
     (else (max (dfs (+ depth 1) (cadr tree))
                (dfs (+ depth 1) (caddr tree)))))))
