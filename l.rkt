;; basic
(define % remainder)

(define (prime? n)
  (if (= 1 n)
      #f
      (let loop ((x (floor (sqrt n))))
        (cond [(= 1 x) #t]
              [(= 0 (% n x)) #f]
              [else (loop (sub1 x))]))))

(define (factorial x)
  (let loop ((x x)
             (acc 1))
    (if (zero? x)
        acc
        (loop (sub1 x) (* x acc)))))

(define (primes-up-to n)
  (define (helper x)
    (cond ((= x 0) '())
          ((prime? x)
           (cons x (helper (- x 1))))
          (else
           (helper (- x 1)))))
  (reverse (helper n)))
