#lang racket
;; If we list all the natural numbers below 10 that
;; are multiples of 3 or 5, we get 3, 5, 6 and 9.
;; The sum of these multiples is 23.
;; Find the sum of all the multiples of 3 or 5 below 1000.

(include "l.rkt")

(define (ep/001/count-multiples-sum a b)
  (lambda (n)
    (if (or (= (% n a) 0)
            (= (% n b) 0))
        n
        0)))

(define ep/001/count-multiples-once
  (ep/001/count-multiples-sum 3 5))

(define (ep/001/execute n)
  (if (> n 0)
      (let ((ret 0))
        (set! ret (ep/001/count-multiples-once n))
        (+ ret (ep/001/execute (- n 1))))
      0))

(ep/001/execute 999)

