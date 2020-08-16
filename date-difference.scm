(define month-days (vector 0 31 28 31 30 31 30 31 31 30 31 30 31))

(define (leap-year? year)
  "Return #t if year is a leap year."
  (cond
   ((not (= (modulo year 4) 0)) #f)
   ((not (= (modulo year 100) 0)) #t)
   ((not (= (modulo year 400) 0)) #f)
   (else #t)))

(define (date-difference earlier later)
  "Retrun the number of days between earlier date and later date.
A date is a list of (day month year)."
  (let loop ((days 0) (day (car earlier)) (month (cadr earlier))
             (year (caddr earlier)))
    (cond
     ((equal? (list day month year) later) days)
     ((= day (+ (vector-ref month-days month)
                (if (and (= month 2) (leap-year? year)) 1 0)))
      (loop (+ days 1) 1 (+ (modulo month 12) 1)
            (if (= month 12) (+ year 1) year)))
     (else (loop (+ days 1) (+ day 1) month year)))))
        
(define (add2 one two)
  (+ one two))
