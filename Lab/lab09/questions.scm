(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  (map (lambda (x) (cons first x)) rests)  
)

(define (first-lst pairs)
  (cond ((or (null? pairs) (null? (car pairs))) nil)
        (else (cons (caar pairs) (first-lst (cdr pairs))))
  )
)

(define (second-lst pairs)
  (cond ((or (null? pairs) (null? (car pairs))) nil)
        (else (cons (cadr (car pairs)) (second-lst (cdr pairs))))
  )
)

(define (zip pairs)
  (cond ((or (null? pairs) (null? (car pairs))) (cons nil (cons nil nil)))
        (else (cons (first-lst pairs) (cons (second-lst pairs) nil)))
  )
)

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (define (index lst cur_i)
    (if (null? lst) 
        ()
        (cons (cons cur_i (cons (car lst) nil)) (index (cdr lst) (+ cur_i 1))))
  ) 
  (index s 0)
)
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  (cond ((null? denoms) nil)
        ((> (car denoms) total) (list-change total (cdr denoms)))
        ((= total (car denoms)) (cons (cons (car denoms) nil)
                                      (list-change total (cdr denoms))))
        (else (append (cons-all (car denoms) (list-change (- total (car denoms)) denoms))
                (cond ((null? (cdr denoms)) ())
                      (else (list-change total (cdr denoms)))))
        )
  )
)
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         (cons (let-to-lambda (car expr)) 
               (cons ((let-to-lambda (cdr expr)))) nil))
         ; END PROBLEM 19
        ((or (lambda? expr) (define? expr))
             (let ((form   (car expr))
                   (params (cadr expr))
                   (body   (cddr expr)))
              ; BEGIN PROBLEM 19
              (cons form 
                    (cons (let-to-lambda params) 
                          (cons (let-to-lambda body) nil)))
              ; END PROBLEM 19
              )
        )
        ((let? expr)
               (let ((values (cadr expr))
                     (body   (cddr expr)))
               ; BEGIN PROBLEM 19
               (define vars (first-lst values)) 
               (define nums (second-lst values)) 
               (cons (cons 'lambda (cons vars (cons body nil))) nums)
               ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )))
