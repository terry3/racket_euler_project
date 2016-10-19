;; basic
(define % remainder)

(define (even? n)
  (if (= 1 (% n 2))
      #t
      #f))
