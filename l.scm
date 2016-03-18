;; basic
(define % remainder)

(define (even? n)
  (if (= 1 (% n 2))
      #t
      #f))

(load "001_multiples_of_3_and_5.scm")
(load "002_even_fibonacci_numbers.scm")
