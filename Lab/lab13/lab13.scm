; Q1
(define (compose-all funcs)
  ;'YOUR-CODE-HERE
  (define (my_func value)
     (define (helper rest_func cur_func value)
     	(if (null? rest_func)
     		(if (null? cur_func)
     			value
     			(cur_func value)
     		)
     		(helper (cdr rest_func) (car rest_func) (cur_func value))
     	)
     )
     (if (null? funcs)
     	 (helper funcs funcs value)
     	 (helper (cdr funcs) (car funcs) value)
     )
  )
  my_func
)



; Q2
(define (tail-replicate x n)
  'YOUR-CODE-HERE
)