;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname BSL_day0) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; create a new data structure called pet
; pet params:
;  id->number, type->string, age->number,
; color->string, name->string, weight->number

(define-struct pet [id type age color name weight])

; create a new pet with id of 1
(define pet1 (make-pet 1 "cat" 3 "orange" "Col Mustard" 11.4))
; create a new pet with id of 2
(define pet2 (make-pet 2 "dog" 10 "black" "Duke" 25))
; create a new pet with id of 3
(define pet3 (make-pet 3 "fish" 5 "gold" "Mr.Fish" .3))

; we can create a list of structures
; listofpets (lop)
; note: NO commas, only spaces
(define lop (list pet1 pet2 pet3))

; Example: syntax of a basic function
; given a list of pets as "lop" from prior example
; "lop" has a cat, a dog, and a fish

; 1st attempt - pass some parameters to a function
; just to see if it works

; get-pets is the function name
; we pass the "lop" to a-list in get-pets
; the following function will return the pet-type of the first pet structure 
#|
(define (get-pets a-list)
  (pet-type (first a-list)))
|#
; Example: function with an if-statement
; Given a list of pets as lop from prior example
; lop has a cat, a dog, and a fish

; 2nd attempt - add a param and see the if-statement
; Test how string equality works

#|
(define (get-pets a-list pet-property)
  ; for the first pet in the list, if the type is
  ; equal to the second param pet-property, then
  (if (string=? (pet-type (first a-list))
                pet-property)
      "something if true" ; replace later w/function
      "something if false")) ; replace later w/function
; if given pets and a cat, then true and do something
; if fish, then false and do something else

(get-pets lop "cat") ; -> "something if true"
(get-pets lop "fish") ; -> "something if false"
|#

; Example: a recursive function in BSL
; Given a list of pets as lop from prior example
; lop has a cat, a dog, and a fish

; 3rd attempt - add recursive steps
; return only the selected type, if matching

; get-pets() matches a-string to a pet struct
; [a-list, a-string]->[pet-struct]
; a-list is a list of pet structures
; a-string is one of a pet property
; pet properties: [id type age color name weight]

(define (get-pets a-list pet-property)
  ; for the first pet in the list, if the type is
  ; equal to the second param pet-property, then
  (if (string=? (pet-type (first a-list))
               pet-property)
      (first a-list) ; if match, then return the current pet
      (get-pets (rest a-list) pet-property)))
      ; else: recursively pass the rest of the list
; if given a pets struct and cat, return the cat
; if fish, then recurse over list until a match
(get-pets lop "cat")
(get-pets lop "fish")
