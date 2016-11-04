#lang racket
;; The prime factors of 13195 are 5, 7, 13 and 29.
;; What is the largest prime factor of the number 600851475143 ?

(include "l.rkt")

(define (find-max-factor n)
  (define (find-iter i)
    (if (factor? i n)
      (if (prime? i)
        (inexact->exact i)
        (find-iter (- i 2)))
      (find-iter (- i 2))))
  (if (factor? 2 (floor (sqrt n)))
    (find-iter (+ (floor (sqrt n)) 1))
    (find-iter (floor (sqrt n)))))

(find-max-factor 600851475143)




