#lang racket
;; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
;; Find the largest palindrome made from the product of two 3-digit numbers.
(include "l.rkt")

(define (palindrome? n)
  (equal? (number->string n) (string-reverse (number->string n))))

(define (find-largest-palindrome-product low high)
  (apply max (for*/list ([x (in-range high low -1)]
               [y (in-range high low -1)]
               #:when (palindrome? (* x y)))
    (* x y))))

(find-largest-palindrome-product 100 999)
