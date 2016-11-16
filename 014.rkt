#lang racket
;; Longest Collatz sequence
;; The following iterative sequence is defined for the set of positive integers:
;; n → n/2 (n is even)
;; n → 3n + 1 (n is odd)
;; Using the rule above and starting with 13, we generate the following sequence
;; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
;; It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
;; Which starting number, under one million, produces the longest chain?
;; NOTE: Once the chain starts the terms are allowed to go above one million.

(define (collatz n)
  (if (even? n)
      (/ n 2)
      (+ (* 3 n) 1)))

(define (loop-collatz n)
  (let loop ((start n)
             (sum 0))
    (if (= 1 start)
        sum
        (loop (collatz start)
              (add1 sum)))))

(define (max-collatz-under n)
  (let loop ((start 1)
             (x 0)
             (mark 0))
    (if (> start n)
        mark
        (loop (add1 start)
              (max (loop-collatz start) x)
              (if (> (loop-collatz start) x)
                  start
                  mark)))))

(max-collatz-under 1000000)
