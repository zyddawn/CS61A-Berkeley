(define (find s predicate)
  ;'YOUR-CODE-HERE
  (cond ((null? s) #f)
          ((predicate (car s)) (car s))
          (else (find (cdr-stream s) predicate))
  )
)

(define (scale-stream s k)
  ;'YOUR-CODE-HERE
  (cond ((null? s) nil)
  		(else (cons-stream (* 2 (car s)) (scale-stream (cdr-stream s) k)))
  )
)

(define (has-cycle s)
  ;'YOUR-CODE-HERE
  (define (is-equal s sub_s step1 step2)
    (cond ((null? sub_s) #f)
          ((eq? s sub_s) 
          	(if (= step1 step2)
          		(is-equal s (cdr-stream sub_s) 0 (+ step2 1))
          		#t
          	)
          )
          (else (is-equal (cdr-stream s) sub_s (+ 1 step1) step2))
    )
  )
  (is-equal s (cdr-stream s) 0 1)
)


(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
