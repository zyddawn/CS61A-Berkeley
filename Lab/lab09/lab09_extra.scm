;; Extra Scheme Questions ;;


; Q5
(define lst
  ;'YOUR-CODE-HERE
  (cons (cons 1 ()) (cons 2 (cons (cons 3 4) (cons 5 ()))))
)

; Q6
(define (composed f g)
  ;'YOUR-CODE-HERE
  (define (inner x)
  	(f (g x))
  )
  inner
)

; Q7
(define (remove item lst)
  ;'YOUR-CODE-HERE
  (cond ((null? lst) nil)
  		((= (car lst) item) (remove item (cdr lst)))
  		(else (cons (car lst) (remove item (cdr lst)))))
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (max a b) (if (> a b) a b))
(define (min a b) (if (> a b) b a))

(define (gcd a b)
  ;'YOUR-CODE-HERE
  (cond ((= 0 (min a b)) (max a b))
  		((= 0 (/ (max a b) (min a b))) (min a b))
  		(else (gcd (- (max a b) (min a b)) (min a b))))
)

;;; Tests
(gcd 24 60)
; expect 12
(gcd 1071 462)
; expect 21

; Q9
(define (no-repeats s)
  ;'YOUR-CODE-HERE
  (cond ((null? s) nil)
  		(else (cons (car s) (no-repeats (remove (car s) (cdr s))))))  ;666!
)


; Q10
(define (substitute s old new)
  ;'YOUR-CODE-HERE
  (define first_v nil)
  (cond ((null? s) nil)
  		((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
  		((equal? (car s) old) (cons new (substitute (cdr s) old new)))
  		(else (cons (car s) (substitute (cdr s) old new))))
)

; Q11
(define (sub-all s olds news)
  ;'YOUR-CODE-HERE
  (cond ((null? olds) s)
  		(else (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))))
)








