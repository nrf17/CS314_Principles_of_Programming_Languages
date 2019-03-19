;;_____________________________________________________________________________________________________________________________________________



;;problem 1.1
 (cons ;;CONS_1

  'a ;; CONS_1->ARG_1 = A
  (cons ;; CONS_1->ARG_2 = CONS_2
   
   (cons 'b (cons 'c '())) ;; CONS_2->ARG_1 = B&C
   (cons ;; CONS_2->ARG_2 = CONS_3

    'd ;; CONS_3->ARG 1 = D
    (cons ;; CONS_3->ARG_2 = CONS_4

     (cons ;; CONS_4->ARG_1 = CONS_5
      (cons 'e (cons 'f '())) ;; CONS_5->ARG_1 = E&F
      (cons (cons 'g '()) '()) ;; CONS_5->ARG 2 = G
      );; ENDS CONS 5

     '() ;; CONS_4->ARG 2 = ()

     );; ENDS CONS 4
    );; ENDS CONS 3
   );; ENDS CONS 2
  );; ENDS CONS 1
;(newline)



;;problem 1.2
(display (
  (car ;;get the fist element of the list '*'
   (cons * (cons ;;arg 1 &2
     'a (cons 4 '() );;arg 1 & 2
     )));;ends car
  3 5);;outside the list
 );;ends print
(newline)



;;____________________________________________________________________________________________________________________________________



;; problem 2.1
(define flatten
  (lambda (X)
    (cond
     ( (null? X) '() ) ;;is the list empty?
     ( (list? (car X)) ;;if a list
      (append (flatten (car X))
              (flatten (cdr X))
              ) ;;append arg1 & arg2
      );;ends work block
     (else
      (cons (car X) (flatten (cdr X)) )
      );; ends else
     ) ;; ends condition statement
    )) ;;ends method
;(flatten '(a((b)(c d)(((e)))))) ;;test case



;;problem 2.2
(define rev
  (lambda (X)
    (cond
      ((null? X)'()) ;;is the list empty
      ( (list? (car X)) ;;is it a list?
       (append (rev(cdr X))
               (cons (rev(car X)) '())
               );;arg1 & 2 for append
       ) ;;ends if statement
      (else
       (append
        (rev(cdr X))
        (cons (car X) '() )
        );;arg1&2 for append
       );;ends else
      );;ends condition
    ));;ends method
;(rev '(a((b)(c d)(((e)))))) ;;test case



;; problem 2.3
(define delete
  (lambda(X Y)
    (cond
      ( (null? Y) '() ) ;;is the list empty??
      ( (list? (car Y)) ;;if statement
        (cons
          (delete X (car Y) );;arg 1
          (delete X (cdr Y) );; arg 2
         );;ends cons
        );;ends if statement
      (else
       (if (eq? X(car Y))
                (delete X (cdr Y))
                (cons
                  (car Y)
                  (delete X (cdr Y))
                  );;ends cons
                );;ends extra condition
       );;ends else
      );;ends intital condition
    ));;ends method
;(delete 'c '(a((b)(c d)(((e))))));;test case 1
;(delete 'f '(a((b)(c d)(((e))))));;test case 2


(define merge-sorted
  (lambda (X Y)
    (cond
      ((null? X) Y);;is X empty?
      ((null? Y) X);; is Y empty

      (;; if(X < Y)
       (< (car X) (car Y))
       (cons
        (car X);; ARG1
        (merge-sorted (cdr X) Y);;ARG2
        );; ends cons
       );; ends if

      
      (;; else if( X > Y)
       (> (car X) (car Y))
       (cons
        (car Y);;arg1
        (merge-sorted (cdr Y) X);;arg2
        );;ends cons
       );;ends else if

      
      (else ;;ELSE X == Y
       (merge-sorted (cdr X) Y)
       );;ends else X == Y
      )
    ))
;(merge-sorted '(4 8 12 17 45) '(2 4 9 24))



;;_____________________________________________________________________________________________________________________________________



;; problem 3

(define NewTable
  (lambda() '() );; empty table
  );;ends method

(define InsertIntoTable
  (lambda (entry table)
    (cons entry table) ;; inserts a variable/value pair into the table
    ));;ends method

(define LookupTable
  (lambda (variable table)
    (cond
      ((null? table) '()) ;;is it empty??
      ((eq? variable (caar table)) (cadar table))
          (else
           (LookupTable variable (cdr table)) ;;recursive call
           );;ends else
          );; ends condition
    ));;ends method

;(define table
;  (InsertIntoTable '(b (2 4 5))
;                   (InsertIntoTable '(a 7) (NewTable))
;                   ));;ends

;(display (LookupTable 'a table))
;(newline)
;(display (LookupTable 'b table))
;(newline)
;(display (LookupTable 'c table))
;(newline)



;;______________________________________________________________________________________________________________________________________



;; problem 4

;;method given to us
(define map
  (lambda(f l)
    (if (null? l)
        '()
        (cons (f (car l)) (map f (cdr l)))
        )
    ));; ends method



;;method given to us
(define reduce
  (lambda (op l id)
    (if (null? l)
        id
        (op (car l) (reduce op(cdr l) id))
        )
    ));; ends method



;; problem 4.1
(define minSquareVal
  (lambda (X)
    (let
        ( (sqrl (map (lambda (Y) (* Y Y)) X));; ARG 1 for let
          (initval (*(car X) (car X))) ) ;; ARG 1 for let

      (reduce ;;ARG 2 for let
       (lambda (Y Z)
         (if (< Y Z) Y Z))
       sqrl
       initval
       );; ends reduce, ARG 2 for let
      );; ends let
    ));;ends method
;(minSquareVal '(-5 3 -7 10 -11 8 7))



;; problem 4.2
(define maxSquareVal
  (lambda (X)
    (let
        ( (sqrl (map (lambda (Y) (* Y Y)) X));; ARG 1 for let
          (initval (*(car X) (car X))) ) ;; ARG 1 for let

      (reduce ;;ARG 2 for let
       (lambda (Y Z)
         (if (> Y Z) Y Z))
       sqrl
       initval
       );; ends reduce, ARG 2 for let
      );; ends let
    ));;ends method
;(maxSquareVal '(-5 3 -7 10 -11 8 7))


;;____________________________________________________________________________________________________________________________________________
