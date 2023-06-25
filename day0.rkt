#lang racket
#lang web-server/insta
(define (start request)
  (response/xexpr
   '(html
     (head (title "Blog"))
     (body (h1 "Under construction")))))

;defining the necessary data structures
;(struct post (title body))
 ;title : string?
 ;body : string?

