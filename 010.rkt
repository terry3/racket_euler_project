#lang racket
;; Summation of primes
;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;; Find the sum of all the primes below two million.

(include "l.rkt")

(define (find-prime base)
  (let loop ((x (add1 base)))
    (if (prime? x)
        x
        (loop (add1 x)))))

(define (sum-of-prime-below max)
  (let loop ((x 0)
             (sum 0))
    (if (< x max)
        (loop (find-prime x) (+ sum x))
        sum)))

(sum-of-prime-below 2000000)

