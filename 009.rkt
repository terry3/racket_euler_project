#lang racket
;; Special Pythagorean triplet
;; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which
;; a2 + b2 = c2
;; For example, 32 + 42 = 9 + 16 = 25 = 52.
;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;; Find the product abc.

(last
 (for*/list ([x (build-list 999 add1)]
             [y (build-list 999 add1)]
             [z (build-list 999 add1)]
             #:when (and (= 1000 (+ x y z))
                         (= (expt x 2) (+ (expt y 2) (expt z 2)))))
   (* x y z)))
