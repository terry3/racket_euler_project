#lang racket
;; Sum square difference
;; The sum of the squares of the first ten natural numbers is,
;; 12 + 22 + ... + 102 = 385
;; The square of the sum of the first ten natural numbers is,
;; (1 + 2 + ... + 10)2 = 552 = 3025
;; Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
;; Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

(include "l.rkt")

(define (sum-of-square list)
  (define (sub-handler n list)
    (if (null? list)
        n
        (sub-handler (+ n (expt (car list) 2)) (cdr list))))
  (sub-handler 0 list))

(define (square-of-sum list)
  (define (sub-handler n list)
    (if (null? list)
        n
        (sub-handler (+ n (car list)) (cdr list))))
  (expt (sub-handler 0 list) 2))

(- (expt (foldl + 0 (build-list 100 add1)) 2)
   (foldl (lambda (a b) (+ (expt a 2) b)) 0 (build-list 100 add1)))
