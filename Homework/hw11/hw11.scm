(define (find s predicate)
  ;'YOUR-CODE-HERE
  (cond ((null? s) #f)
          ((predicate (car s)) (car s))
          (else (find (cdr-stream s) predicate))
  )
)

(define (scale-stream s k)
  'YOUR-CODE-HERE
)

(define (has-cycle s)
  'YOUR-CODE-HERE
)
(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
