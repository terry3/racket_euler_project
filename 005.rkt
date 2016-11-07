#lang racket
;; Smallest multiple
;; 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
;; What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

(define (mygcd a b)
  (if (= 0 b)
      a
      (mygcd b (remainder a b))))

(apply lcm (build-list 20 add1))
