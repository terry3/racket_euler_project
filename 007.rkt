#lang racket
;; 10001st prime
;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
;; What is the 10001st prime number?

(include "l.rkt")

(define (find-n-prime n)
  (let loop ((x 0)
             (sum 0))
    (if (= sum n)
        (sub1 x)
        (loop (add1 x) (if (prime? x)
                           (add1 sum)
                           sum)))))

(find-n-prime 10001)
