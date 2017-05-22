#lang racket
;; If we list all the natural numbers below 10 that
;; are multiples of 3 or 5, we get 3, 5, 6 and 9.
;; The sum of these multiples is 23.
;; Find the sum of all the multiples of 3 or 5 below 1000.

(include "l.rkt")

(define (ep/001/count-multiples-sum . l) ;; rest-id
  (lambda (n)
    (if (ormap (lambda (i)
                 (= (% n i) 0)) l)
        n
        0)))

(define ep/001/count-multiples-once
  (ep/001/count-multiples-sum 3 5))

(define (ep/001/execute n)
  (if (> n 0)
      (+ (ep/001/count-multiples-once n)
         (ep/001/execute (- n 1)))
      0))

(ep/001/execute 999)

