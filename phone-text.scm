(define (phone-text num-str)
  (map list->string
       (let loop-nums ((nums (string->list num-str))
                       (combos (list)))
         (if (null? nums)
             combos
             (let ((options (num->text (car nums))))
               (loop-nums
                (cdr nums)
                (if (null? combos)
                    (map list options)
                    (apply append
                           (map (lambda (combo)
                                  (map (lambda (option)
                                         (append combo (list option)))
                                       options))
                                combos)))))))))

(define (num->text num)
  (cond
   ((char=? num #\2) (list #\a #\b #\c))
   ((char=? num #\3) (list #\d #\e #\f))
   ((char=? num #\4) (list #\g #\h #\i))
   ((char=? num #\5) (list #\j #\k #\l))
   ((char=? num #\6) (list #\m #\n #\o))
   ((char=? num #\7) (list #\p #\q #\r #\s))
   ((char=? num #\8) (list #\t #\u #\v))
   ((char=? num #\9) (list #\w #\x #\y #\z))
   ((char=? num #\*) (list #\*))
   ((char=? num #\#) (list #\# #\+))))
