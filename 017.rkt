#lang racket
;; Number letter counts
;; If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
;; If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
;; NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

(include "l.rkt")

(define base (map (lambda (x)
                    (string-length x))
                  '("one" "two" "three" "four" "five" "six" "seven" "eight"
                    "nine" "ten" "eleven" "twelve" "thirteen" "fourteen"
                    "fifteen" "sixteen" "seventeen" "eighteen" "nineteen")))
(define tys (map (lambda (x)
                   (string-length x))
                 '("twenty" "thirty" "forty" "fifty" "sixty" "seventy"
                   "eighty" "ninety")))
(define hundred (string-length "hundred"))

(define (number->word-sum n)
  (let loop ((x n)
             (sum 0))
    (cond
      [(and (>= x 100) (> 1000 x))
       (loop (% x 100)
             (if (= 0 (% x 100))
                 (+ hundred sum (list-ref base (sub1 (->exact (/ x 100)))))
                 (+ hundred 3 sum (list-ref base (sub1 (->exact (/ x 100)))))))]
      [(and (> x 19) (> 100 x))
       (loop (% x 10)
             (+ sum (list-ref tys (- (->exact (/ x 10)) 2))))]
      [(= x 0)  sum]
      [else
       (+ sum (list-ref base (sub1 x)))])))

(define (calc-word-length-under-one-thousand)
  (let loop ((n 1)
             (sum 0))
    (if (>= n 1000)
        (+ sum (string-length "onethousand"))
        (loop (add1 n)
              (+ sum (number->word-sum n))))))

(calc-word-length-under-one-thousand)
