(define (accumulate combiner start n term)
  (if (= n 0)
      start
      ;'YOUR-CODE-HERE
      (combiner (term n) (accumulate combiner start (- n 1) term))
  )
)

(define (accumulate-tail combiner start n term)
  ;'YOUR-CODE-HERE
  (if (= n 0)
      start
      (accumulate-tail combiner (combiner start (term n)) (- n 1) term)
  )
)

(define-macro (list-of expr for var in seq if filter-fn)
  'YOUR-CODE-HERE
)