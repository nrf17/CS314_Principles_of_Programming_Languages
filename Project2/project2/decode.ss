
(load "include.ss")

;; contains a test document consisting of three paragraphs. 
(load "document.ss")

;; contains a test-dictionary, which has a much smaller dictionary for testing
;; the dictionary is needed for spell checking
(load "test-dictionary.ss")

 ;;(load "dictionary.ss") ;; the real thing with 45,000 words


;; -----------------------------------------------------
;; HELPER FUNCTIONS



(define decoding
  (lambda (X)
    
    (encode-n X)
    
    )) ;;ends method



(define counts
  (lambda (X)
    
    (reduce
     +
     ;; + -> ARG1
     (map
      (lambda (Y) (if (equal? Y #t) 1 0))
      X
      );; ends map
     
     0 ;; + -> ARG2
     ) ;;ends reduce
    
    )) ;;ends method



(define indexes
  (lambda (X Y)
    
    (if (null? X) 0
        (if (equal? Y (car X))
            
	    0
            
	    (+ 
	     1 ;; + -> ARG1
	     (indexes (cdr X) Y) ;; + -> ARG2
	     ) ;; ends +
	    
	    )) ;;ends if conditions
    )) ;;ends method



(define tracks
  (lambda (X)
    
    (map counts
          
	 (list
            
	  (map spell-checker
	       (map 
		(encode-n 0) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 1) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 2) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 3) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 4) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 5) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 6) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 7) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 8) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 9) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 10) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 11) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 12) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 13) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 14) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 15) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 16) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 17) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 18) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 19) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 20) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 21) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 22) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 23) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 24) X) )
	  
	  (map spell-checker
	       (map
		(encode-n 25) X) )
	    
	    ) ;; ends list
	  ) ;;ends mapping 
    )) ;;ends method



(define helper
  (lambda (X Y)
    
    (cond
     
     ((null? X) X)

	 ( (list? (car X))
	  
	  (cons
	   (Y(car X)) ;; cons -> ARG1
	   (helper (cdr X) Y) ;; cons -> ARG2
	   ) ;; ends cons
	  
	  )) ;; ends condition
    )) ;; ends method



(define shifts
  (lambda (X)
    
    ( ;; shifts to 'e'
     +
     (- 26 X) ;; + -> ARG1
     4 ;; + -> ARG2
     ) ;; ends +
    )) ;; ends method



(define counter
  (lambda (X)
    (lambda (Y)
      
      (if (null? Y) ;; if NULL == 0
          
	  0
          
	  (if (equal? (car Y) X) ;; if the 1st is equal to X count++
              
	      (+ 1 ((counter X) (cdr Y)))
              (+ 0 ((counter X) (cdr Y)))
	      
	      )) ;; ends if conditions
      ))) ;; ends method



(define counting
  (lambda (X)
  
    (list
     
     (reduce +
	     (map (counter 'a) (reduce append (list X) '() ))
	     0 )
     
     (reduce +
	     (map (counter 'b) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'c) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'd) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'e) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'f) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'g) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'h) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'i) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'j) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'k) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'l) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'm) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'n) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'o) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'p) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'q) (reduce append (list X) '() )) 
	     0 )  
     
     (reduce +
	     (map (counter 'r) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 's) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 't) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'u) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'v) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'w) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'x) (reduce append (list X) '() )) 
	     0 )
     
     (reduce + 
	     (map (counter 'y) (reduce append (list X) '() )) 
	     0 )
     
     (reduce +
	     (map (counter 'z) (reduce append (list X) '() )) 
	     0 )
   
     ) ;; ends list
    )) ;; ends method



;; -----------------------------------------------------
;; SPELL CHECKER FUNCTION

;;check a word's spell correctness
;;INPUT:a word(a global variable "dictionary" is included in the file "test-dictionary.ss", and can be used directly here)
;;OUTPUT:true(#t) or false(#f)
(define spell-checker 
  (lambda (w)
    ;;'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
    
    (if (member w dictionary) #t #f) ;;checks each word in the dictionary to see if its a match 
    
    )) ;;ends method

;; -----------------------------------------------------
;; ENCODING FUNCTIONS

;;generate an Caesar Cipher single word encoders
;;INPUT:a number "n"
;;OUTPUT:a function, whose input is a word, and output is the encoded word
(define encode-n
  (lambda (n);;"n" is the distance, eg. n=3: a->d,b->e,...z->c
    (lambda (w);;"w" is the word to be encoded
      ;;'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
      
      (cond ((null? w) w) ;;null check
	    
	    (else 
	     
	     (cons 
	      (vtl(modulo(+ (ltv(car w))n)26)) ;;cons->ARG1
	      ((encode-n n) (cdr w)) ;;cons->ARG2
	      )  ;;ends cons
	     
	     ) ;;ends else
	    ) ;;ends condition
      ))) ;;ends method

;;encode a document
;;INPUT: a document "d" and a "encoder"
;;OUTPUT: an encoded document using a provided encoder
(define encode-d;;this encoder is supposed to be the output of "encode-n"
  (lambda (d encoder)
    ;;'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
    
    (if (null? d) '() ;;base case
	
	(append
	 
	 ;;encode 1st paragraph
	 (cons ;; appends ARG1
	  (map encoder (car d)) ;;cons->ARG1
	  '() ;; cons->ARG2
	  ) ;;ends cons
	 
	 ;;recall function on the remaining paragraphs 2-N -> 3-N -> 4-N -> ect.
	 (encode-d (cdr d) encoder) ;;appends ARG2
	 
	 ) ;;ends append
	) ;;ends if
    ;;encode first para, concat w/ recursive call on rest
    )) ;;ends method
    
;; -----------------------------------------------------
;; DECODE FUNCTION GENERATORS
;; 2 generators should be implemented, and each of them returns a decoder

;;generate a decoder using brute-force-version spell-checker
;;INPUT:an encoded paragraph "p"
;;OUTPUT:a decoder, whose input=a word, output=decoded word
(define Gen-Decoder-A
  (lambda (p)
    ;;'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***

    (decoding
     (indexes      
      
      ;; indexes -> arg1
      (tracks p)
      
      ;; indexes -> arg2
      (apply max (tracks p))
      
      );;ends indexes  
     );;ends decoding
    
    ));;ends method

;;generate a decoder using frequency analysis
;;INPUT:same as above
;;OUTPUT:same as above
(define Gen-Decoder-B
  (lambda (p)
    ;;'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
    
    (decoding
     (shifts
      (indexes

       (counting p)
       (apply max (counting p))
       
       ) ;; ends indexes
      ) ;; ends shifts
     ) ;; ends decoding
    )) ;; ends function

;; -----------------------------------------------------
;; CODE-BREAKER FUNCTION

;;a codebreaker
;;INPUT: an encoded document(of course by a Caesar's Cipher), a decoder(generated by functions above)
;;OUTPUT: a decoded document
(define Code-Breaker
  (lambda (d decoder)
     ;;'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***

     (cond
      
      ( (null? d) d ) ;; null check
      
      ( (list? d) ;; list check
	
	(cons
	 (helper (car d) decoder) ;; cons -> ARG1
	 (Code-Breaker (cdr d) decoder) ;; cons -> ARG2
	 ) ;; ends cons
	
	) ;; ends list check
     
      ) ;; ends condition

     )) ;; ends method

;; -----------------------------------------------------
;; EXAMPLE APPLICATIONS OF FUNCTIONS
;;(spell-checker '(h e l l o))
;;(define add5 (encode-n 5))
;;(encode-d document add5)
;;(define decoderSP1 (Gen-Decoder-A paragraph))
;;(define decoderFA1 (Gen-Decoder-B paragraph))
;;(Code-Breaker document decoderSP1)
