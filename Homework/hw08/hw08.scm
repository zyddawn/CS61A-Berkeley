(define (cddr s)
  ;'YOUR-CODE-HERE
  (cdr (cdr s)))

(define (cadr s)
  ;'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  ;'YOUR-CODE-HERE
  (car (cdr (cdr s)))
)

(define (sign x)
  ;'YOUR-CODE-HERE
  (cond ((< x 0) -1) 
        ((= x 0) 0) 
        (else 1)) 
)

(define (square x) (* x x))

(define (pow b n)
  ;'YOUR-CODE-HERE
  (cond ((= n 0) 1)  ;don't forget base case
        ((even? n) (square (pow b (/ n 2))))
        (else (* b (square (pow b (/ (- n 1) 2))))))
)

(define (ordered? s)
  ;'YOUR-CODE-HERE
  (cond ((or (null? s) (null? (cdr s))) #t)          ;hard to debug...
        ((<= (car s) (cadr s)) (ordered? (cdr s)))
        (else #f))
)

(define (nodots s)              ;not quite understand this function
  ;'YOUR-CODE-HERE
  (cond ((null? s) nil)
        ((number? s) (list s))    
        ((pair? (car s)) (cons (nodots (car s)) (nodots (cdr s))))
        (else (cons (car s) (nodots (cdr s)))))
)

; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond ((empty? s) #f)
          ;'YOUR-CODE-HERE
          ((= (car s) v) #t)
          ((> (car s) v) #f)
          (else (contains? (cdr s) v)))
)

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond ((empty? s) (list v))
          ;'YOUR-CODE-HERE
          ((= (car s) v) s)
          ((> (car s) v) (cons v s))
          (else (cons (car s) (add (cdr s) v))))
)



(define (intersect s t)
    (cond ((or (empty? s) (empty? t)) nil)
          ;'YOUR-CODE-HERE
          ((= (car s) (car t)) (cons (car s) (intersect (cdr s) (cdr t))))
          ((> (car s) (car t)) (intersect s (cdr t)))
          (else (intersect (cdr s) t)))
)

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)


(define (union s t)
    (cond ((empty? s) t)
          ((empty? t) s)
          ;'YOUR-CODE-HERE
          ((= (car s) (car t)) (cons (car s) (union (cdr s) (cdr t))))
          ((> (car s) (car t)) (cons (car t) (union s (cdr t))))
          (else (cons (car s) (union (cdr s) t))))
)


