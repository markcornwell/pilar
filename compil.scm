;;-----------------------------------------------------------------------------
;;
;;                          Pilar: A Scheme Compiler
;;
;;                                     by
;;
;;                                Mark Cornwell
;;
;;
;;                   Copyright (C) 2015, All Rights Reserved
;;
;;------------------------------------------------------------------------------
;;                   Think first, then try.     -- The Little Schemer.
;;------------------------------------------------------------------------------
;;
;; Runs under petite chez scheme.  See makefile for details.
;;
;;  REFERENCES
;;
;; (R5RS) KELSEY, R., CLINGER, W., AND (EDITORS), J. R. Revised5 report on the
;;        algorithmic language Scheme. ACM SIGPLAN Notices 33, 9 (1998), 26–76.
;;
;; (Ghuloum 2006) Abdulaziz Ghuloum, An Incremental Approach to Compiler
;;        Development, Proceedings of the 2006 Scheme and Functional
;;        Programming Workshop, University of Chicago Technical Report
;;        TR-2006-06.
;;
;; (ABI)  SCO. System V Application Binary Interface, Intel386TM Architecture
;;        Processor Supplement Fourth Edition, 1997.
;;
;;  INTRODUCTION
;;
;;  This compiler translates programs expressed in the Source Language (fig 1)
;;  into assembly code that can be run through a conventional assembler and linked
;;  with a runtime to execute on an x86 processor.
;;
;;  Our source language is a subset of Scheme as defined in the 5th Revised Report
;;  on the Algorithmic Language Scheme (R5RS).  It includes,
;;
;;      Immediate Constants    -3  42  #f  () ...
;;      Variables               a  foo FUBAR ...
;;      Primitives              eq?  fx+  logor make-vector vector-set!  string-ref 
;;      Expressions             42    (fx- 1 43)    ((lambda (x) (fx+ 1 x)) 41)
;;
;;  The language supports functions as first class objects.  Functions that are
;;  created dynamically, can be assigned to variables and passed as arguments to
;;  other functions.  Free variables that appear in functions thus created are
;;  maintained by forming closures to hold their variables so they will have
;;  indefinite extent.  Thus both upward and downward funargs are supported.
;;  All variables are bound using lexical (or static) scope.
;;
;;  This translation is divided into two stages. Stage I is a series of source to
;;  source transformations that simplify the SL expressions into an equivalent
;;  expression in IL, a scheme-like intermediate language designed to simplify
;;  code generation.  Stage II takes this IL and generates x86 assembly by recursive
;;  descent.
;;
;;             +--------------+         +-----------+           +-----------+
;;             |   Source     |         |  Code     |           |   GNU     |
;;   Source -->|  to Source   |-->IL -->| Generator |--> x86 -->| Assembler |-->
;;     SL      |  Transforms  |         |           |    ASM    |           |
;;             +--------------+         +-----------+           +-----------+
;;                Stage  I                Stage II               Stage III
;;
;;------------------------------------------------------------------------------
;; Pilar Source Language (SL) -- Used by the Human Programmer
;;
;;   E -> I | V | P
;;     |  (begin E ...)
;;     |  (if E E E)
;;     |  (cond (E E) ...)
;;     |  (P E ...)
;;     |  (E E ...)
;;     |  (lambda (V ...) E E* ...)
;;     |  (let ((V E) ...) E E* ...)
;;     |  (letrec ((V E) ...) E E* ...)
;;     |  (let* ((V E) ...) E E* ...)
;;     |  (set! V E)
;;
;;   I  ->  fixnum | boolean | char | ()
;;   P  ->  any primitive function
;;   V  ->  variable
;;
;;                                     Figure 1
;;------------------------------------------------------------------------------
;; Pilar Intermediate Language (IL) -- Accepted by the Code Generator
;;
;;   E   ->  I | V | P
;;       |  (begin E ...)
;;       |  (if E E E)
;;       |  (P E E* ...)        
;;       |  (E E E* ...)      
;;       |  (closure (V ...) (V...) E)
;;       |  (let ((V E) ...) E)
;;       |  (labels ((V E) ...) E)
;;
;;   I  ->  fixnum | boolean | char | ()
;;   P  ->  any primitive function
;;   V  ->  variable
;;
;;                                    Figure 2
;;------------------------------------------------------------------------------
;;  Feature List - The compiler is being developed itteratively by extending the
;;  following feature list.  The numbers correspond to sections in Ghuloum's
;;  paper (Ghuloum 2006)
;;
;; 3.1 Integers
;; 3.2 Immediate Constants
;; 3.3 Unary Primitives
;; 3.4 Binary Primitives
;; 3.5 Local Variables
;; 3.6 Conditional Expressions
;; 3.7 Heap Allocation
;; 1.9.3  String (tutorial)
;; 1.9.2  Vector (tutorial)
;; 1.9.1  Pair   (tutorial)
;; 3.8 Procedure Calls
;; 3.9 Closures
;; 3.10 Proper Tail Calls
;; 3.11 Complex Constants
;; 3.12 Assignment
;; 3.13 Extending the Syntax
;; 3.14 Symbols, Libraries, and Separate Compilation
;; 3.15 Foreign Functions

;;------------------------------------------------------------------------------
;;                               Compiler Options
;;------------------------------------------------------------------------------

;;------------------------------------------------------------------------------
;;                        Generation of Run-time Checks
;;------------------------------------------------------------------------------
;;  Robust error checking is essential for development.  Debugging goes faster
;;  when you have a useful error message than it does when you have to track down
;;  a segfault using the llvm debugger.
;;
;;  You also want the ability to turn off generation of unnecessary runtime checks
;;  when speed is critical, say, in move tree search of a chess program.
;;
;;  The following switches enable and disable the generation of code that performs
;;  runtime error checking.  See the section Error Checking and Safe Primitives
;;  for details.  They are all interpreted by the Code Generation Stage.
;;------------------------------------------------------------------------------

(define *safe* #f)
(define *safe-procedures* *safe*)  ;; check attempts to call non-procedures
(define *safe-arg-counts* *safe*)  ;; check number of arguments passed at run time
(define *safe-primitives* *safe*)  ;; check valid arguments passed to primitives

;;------------------------------------------------------------------------------
;;                                 REGRESSION  TEST
;;------------------------------------------------------------------------------

(load "tests-driver.scm")

;; (load "tests/tests-9.0-square.scm")  ;; e5chess define square -- pass 1.8 first

;; (load "tests/tests-5.6-req.scm")  ;; fxmodulo
;; (load "tests/tests-5.3-req.scm")  ;; call/cc
;; (load "tests/tests-5.2-req.scm")  ;; overflow
;; (load "tests/tests-5.1-req.scm")  ;; tokenizer reader
;; (load "tests/tests-4.3-req.scm")  ;; tokenizer reader
;; (load "tests/tests-4.2-req.scm")  ;; eof-object  read-char 
;; (load "tests/tests-4.1-req.scm")  ;; remainder modulo quotient write-char write/display
;; (load "tests/tests-3.4-req.scm")  ;; apply
;; (load "tests/tests-3.3-req.scm")  ;; string-set! errors
;; (load "tests/tests-3.2-req.scm")  ;; error, argcheck
;; (load "tests/tests-3.1-req.scm")  ;; vector
(if *safe* (load "tests/tests-2.9-req.scm"))  ;; foreign call,s exit, S_error
(load "tests/tests-2.8-req.scm")  ;; symbols
;; (load "tests/tests-2.6-req.scm")  ;; variable arguments to lambda

(load "tests/tests-2.4-req.scm")   ;; letrec letrec* and/or when/unless cond
(load "tests/tests-2.3-req.scm")   ;; complex constants
(load "tests/tests-2.2-req.scm")   ;; set!
(load "tests/tests-2.1-req.scm")   ;; procedures and closures
(load "tests/tests-1.9-req.scm")   ;; begin/implicit begin set-car! set-cdr! eq? vectors
(load "tests/tests-1.8-req.scm")   ;; cons procedures deeply nested procedures
(load "tests/tests-1.7-req.scm")   ;; more binary primitives
(load "tests/tests-1.6-req.scm")   ;; let let*
(load "tests/tests-1.5-req.scm")   ;; binary primitives if
(load "tests/tests-1.4-req.scm")   ;; if and or
(load "tests/tests-1.3-req.scm")   ;; unary primitives
(load "tests/tests-1.2-req.scm")   ;; immediate constants
(load "tests/tests-1.1-req.scm")   ;; integers

;;-----------------------------------------------------------------------------------
;;                        Some aliases to help readability
;;-----------------------------------------------------------------------------------

(define first car)
(define second cadr)
(define third caddr)
(define fourth cadddr)
(define rest cdr)

;;------------------------------------------------------------------------------------
;;                           PART I - SOURCE CODE TRANSFORMATIONS
;;------------------------------------------------------------------------------------
;;
;; The first passes of the compiler are a series of source to source transformations.
;; Theses transformations convert the source language into a far more normalized
;; language processed by the code generator.
;;
;; The order of the passes is important.
;;
;; emit-program works with the macro define-transform defined near the top of this
;; file. Stuff we need to know about the transform hangs off the property list of the
;; transform.  Makes code to compose lots of tranforms cleaner -- especially when we
;; need look at the intermediate results for debugging.
;;
;;-----------------------------------------------------------------------------------

(define *transform-list*         ;; all transforms get applied in the order below
  (list 'explicit-begins         ;; add implicit begin to make bodies a single expression
	'eliminate-let*          ;; transform all let* to nested lets	
	'eliminate-shadowing     ;; rename variables to make names unique
	'vectorize-letrec        ;; rewrite letrec as let with vars transformed to vectors
	'eliminate-set!          ;; rewrite settable variables as vectors
	'close-free-variables    ;; do free variable analysis, rewrite lambdas as closures
	'eliminate-quote         ;; eliminate complex constants
	'eliminate-when/unless   ;; when/unless translate to corresponding if expressions
	'eliminate-cond          ;; rewrite cond as if
	'external-symbols        ;; substitute primitive-ref and primitive-set!
	))

(define (apply-transforms expr)   ;; CLEAN UP emit program and emit library program
  (for-each
   (lambda (tf)
     (unless (getprop tf '*is-transform*)
	 (error 'emit-program (format "undefined transform: ~s" tf)))
     (emit "# == ~a  ==>" (getprop tf '*name-string*))
     (set! expr ((getprop tf '*procedure*) expr))
     (emit "# ~s" expr))
   *transform-list*)
  expr)

(define (emit-program expr)  ;; runs the preprocessor passes then calls the code generator
  (emit "# ~s" expr)
  (emit-scheme-entry '() (apply-transforms expr)))

(define compil-program emit-program) ;; hook to the test driver which calls compil-program

(define (emit-library-program expr)  ;; like emit program, but no scheme entry
  (emit "# ~s" expr)
  (emit-library-init '() (apply-transforms expr)))

(define-syntax define-transform
  (syntax-rules ()
    [(_ (transform-name v) b b* ... )
     (begin
       (putprop 'transform-name '*is-transform* #t)
       (putprop 'transform-name '*name-string* (symbol->string 'transform-name))
       (putprop 'transform-name '*procedure*
		(lambda (v) b b* ... ))
       (set! transform-name (getprop 'transform-name '*procedure*)))]))

;;-----------------------------------------------------------------------------------
;;                         Special Forms
;;-----------------------------------------------------------------------------------
;; Used by eliminate-closure and perhaps other places.
;;-----------------------------------------------------------------------------------

(define (special-form? x)
  (memq x
        '(begin closure foreign-call if lambda let let* letrec primitive-ref quote)))

;;-----------------------------------------------------------------------------------
;;                        Explicit Begins
;;-----------------------------------------------------------------------------------
;;
;; Normalize let and lambda expressions to wrap multi element body in a begin
;;
;;  (let ((v E) ...) E E* ...)  =>  (let ((v E) ...) (begin E E* ...))
;;  (let* ((v E) ...) E E* ...)  =>  (let* ((v E) ...) (begin E E* ...))
;;  (letrec ((v E) ...) E E* ...)  =>  (letrec ((v E) ...) (begin E E* ...))
;;  (let* ((v E) ...) E E* ...)  =>  (let* ((v E) ...) (begin E E* ...))
;;  (lambda (v ...) E E* ...)  => (lambda (v* .... ) (begin E E* ...))
;;
;; Puts all let and lambda in form where body is a single element
;;
;;  (let ((v E) ...) E)
;;  (lambda (v ...) E)
;;-----------------------------------------------------------------------------------

(define-transform (explicit-begins expr)
  (cond
   [(or (let? expr) (letrec? expr) (let*? expr))
    (let* ([letform (car expr)]
	   [bindings (let-bindings expr)]
	   [vars (map car bindings)]
	   [exprs (map cadr bindings)]
	   [new-exprs (map explicit-begins exprs)]
	   [long-body (cddr expr)]
	   [new-body (if (fx> (length long-body) 1)
			 (explicit-begins (cons 'begin long-body))
		         (explicit-begins (car long-body)))]
           [new-bindings (map list vars new-exprs)])
      (list letform new-bindings new-body))]
   [(lambda? expr)
    (let* ([formals (lambda-formals expr)]
	   [long-body (cddr expr)]
	   [new-body (if (fx> (length long-body) 1)
			 (cons 'begin long-body)
			 (car long-body))])
      (list 'lambda formals new-body))]      
   [(pair? expr)
    (cons (explicit-begins (car expr))
	  (explicit-begins (cdr expr)))]
   [else expr]))

;;-----------------------------------------------------------------------------------
;;                              Eliminate-let*
;;-----------------------------------------------------------------------------------
;;  Every let* form can be transformed to an equivalent for of nested let forms
;;
;;  For example,
;;
;;  (let* ((v1 E1) (v2 E2)) E)
;;
;;   ==[eliminate-let*]==>
;;
;;   (let ((v1 E1))  (let ((v2 E2)) E))
;;
;;  This generalizes to any number of let* arguments.  Notice our tranformation as
;;  buys us a little bit of optimization when the list of bindings is empty.
;;
;;  (let* () E) ==[eliminate-let*]==> E
;;-----------------------------------------------------------------------------------

(define (let*? x)
  (and (pair? x) (eq? (car x) 'let*)))
(define let*-bindings second)
(define let*-body third)

(define-transform (eliminate-let* expr)
  (cond
   [(let*? expr)
    (let* ([bindings (let*-bindings expr)]
	   [body (let*-body expr)])
      (cond
       [(null? bindings) (eliminate-let* body)]
       [(null? (cdr bindings))	(list 'let bindings (eliminate-let* body))]
       [else
	(list 'let
	      (list (list (first (car bindings))
			  (eliminate-let* (second (car bindings)))))
	      (eliminate-let* (list 'let* (cdr bindings) body)))]))]
   [(pair? expr)
    (cons (eliminate-let* (car expr))
	  (eliminate-let* (cdr expr)))]
   [else expr]))

;;-----------------------------------------------------------------------------------
;;                     Eliminate variable name shadowing
;;-----------------------------------------------------------------------------------
;; Other transforms are made simpler if we give variables unique names elimating the
;; compexities of shadowing.  Otherwise we would have to keep track of an environment
;; in every transform that recursively descended into the code just to keep the
;; variables straight.  This way we recur tracking a list bound variables and when
;; instances of shadowing are found we substitue new unique names that eliminate any
;; shadowing.
;;
;; This will be done after eliminate-multi-element-body so we can assume singleton
;; body on let and lamba forms.
;;
;; Variable are intoduced by let and lambda. Pay careful attention to the difference
;; in variable scope rules for each of these forms. See (R5RS) for details.
;;-----------------------------------------------------------------------------------

(define *global-names* '())

(define-transform (eliminate-shadowing expr)
  (uniquely-rename-variables *global-names* expr))

(define (find-name-collision vars bound-vars)
  (cond
   [(null? vars) #f]
   [(null? bound-vars) #f]
   [(memq (car vars) bound-vars) (car vars)]
   [else (find-name-collision (cdr vars) bound-vars)]))

(define unique-rename
  (let ([count 0])
    (lambda (old-name)
      (let ([name (format "~a$~a" old-name count)])
    (set! count (add1 count))
    (string->symbol name)))))

(define (remove-name-conflict old-name expr)
  (let ([new-name (unique-rename old-name)])
    (rename-variable old-name new-name expr)))

(define (rename-variable old-name new-name expr)
  (cond
   [(null? expr) '()]
   [(eq? expr old-name) new-name]
   [(pair? expr)
    (cons (rename-variable old-name new-name (car expr))
	  (rename-variable old-name new-name (cdr expr)))]
   [else expr]))

(define (uniquely-rename-variables-in-let*-bindings bound-vars vars exprs)
  (if (null? vars)
      '()
      (cons (list (car vars)
		  (uniquely-rename-variables bound-vars (car exprs)))
	    (uniquely-rename-variables-in-let*-bindings (cons (car vars) bound-vars)
							(cdr vars)
							(cdr exprs)))))

(define (rename-let-formal name-conflict let-expr)
  (let* ([letform (car let-expr)]
	 [bindings (let-bindings let-expr)]
	 [vars (map first bindings)]
	 [exprs (map second bindings)]
	 [body (let-body let-expr)]
	 [new-name (unique-rename name-conflict)]
	 [new-vars (rename-variable name-conflict new-name vars)]
	 [new-body (rename-variable name-conflict new-name body)]
	 [new-bindings (map list new-vars exprs)])
  (list letform new-bindings new-body)))
	    
(define (uniquely-rename-variables bound-vars expr)
  (cond
   [(lambda? expr)
    (let* ([formals (lambda-formals expr)]
	   [body (lambda-body expr)]
	   [name-conflict (find-name-collision formals bound-vars)])
      (if name-conflict
	  (uniquely-rename-variables bound-vars (remove-name-conflict name-conflict expr))
	  (list 'lambda formals (uniquely-rename-variables (append formals bound-vars) body))))]
   [(letrec? expr)
    (let* ([bindings (letrec-bindings expr)]
	   [vars (map first bindings)]
	   [exprs (map second bindings)]
	   [body (letrec-body expr)]
	   [name-conflict (find-name-collision vars bound-vars)])
      (if name-conflict
	  (uniquely-rename-variables bound-vars (remove-name-conflict name-conflict expr))
	  (list 'letrec
		(map list vars (uniquely-rename-variables (append vars bound-vars) exprs))
		(uniquely-rename-variables (append vars bound-vars) body))))]
   [(let? expr)
    (let* ([bindings (let-bindings expr)]
	   [vars (map first bindings)]
	   [exprs (map second bindings)]
	   [body (let-body expr)]
	   [name-conflict (find-name-collision vars bound-vars)])
      (if name-conflict
	  (uniquely-rename-variables bound-vars (rename-let-formal name-conflict expr)) ;;
	  (list 'let
		(map list vars (uniquely-rename-variables bound-vars exprs))
		(uniquely-rename-variables (append vars bound-vars) body))))]
   [(pair? expr)
    (cons (uniquely-rename-variables bound-vars (car expr))
	  (uniquely-rename-variables bound-vars (cdr expr)))]
   [else expr]))

;;-----------------------------------------------------------------------------------
;;                        Close-free-variables      
;;-----------------------------------------------------------------------------------
;; Free variables and transforming lambda forms to closure forms
;;
;; Every lambda expression appearing in the source program is rewritten as a closure
;; annotated with the set of free variables.  Free variables are any variables
;; referenced in the body of the lambda that are not either formal parameters of the
;; lambda or defined locally inside the lambda.
;;
;;  (let ((x 5))
;;     (lambda (y) (lambda () (fx+ x y))))
;;
;;   == close-free-variables ==>
;;
;;  (let ((x 5))
;;     (closure (y) (x)
;;         (closure () (x y) (fx+ x y))))
;;
;;-----------------------------------------------------------------------------------

(define (lambda? expr)
  (and (pair? expr) (eq? (car expr) 'lambda)))
(define lambda-formals cadr)
(define (lambda-body expr)
  (if (lambda? expr)
      (if (fx= (length expr) 3)
	  (caddr expr)
	  (cons 'begin (cddr expr)))
      (error 'lambda-body "ill-formed lambda expression")))

(define-transform (close-free-variables expr)
   (close-free '() expr))

(define (close-free bound-vars expr)
  (cond
   [(lambda? expr)
    (let* ([formals (lambda-formals expr)]
	   [freevars (free-variables formals (lambda-body expr))]
	   [body (close-free formals (lambda-body expr))])
      (list 'closure formals freevars body))]
   [(let? expr)
    (let* ([bindings (let-bindings expr)]
	   [vars (map car bindings)]
	   [exps (map cadr bindings)]
           [new-exps (map (lambda (e) (close-free bound-vars e)) exps)]
	   [new-bindings (map list vars new-exps)]
	   [nbv (append vars bound-vars)]
	   [new-body (close-free nbv (let-body expr))])
      (list 'let new-bindings new-body))]
   [(pair? expr)
     (cons (close-free bound-vars (car expr))
	   (close-free bound-vars (cdr expr)))]
   [else expr]))

(define unique-lvar
  (let ([count 0])
    (lambda ()
      (let ([f (format "f~a" count)])
	(set! count (add1 count))
	(string->symbol f)))))

(define (simple-constant? expr)
  (or (boolean? expr) (null? expr) (fixnum? expr) (char? expr) (string? expr)))

(define (symbol<? a b)
  (string<? (symbol->string a) (symbol->string b)))

(define (merg l1 l2)
  (cond ((null? l1) l2)
        ((null? l2) l1)
	((symbol<? (car l1) (car l2)) (cons (car l1) (merg (cdr l1) l2)))
        (else (cons (car l2) (merg l1 (cdr l2))))))

(define sort
  (lambda (lst)
    (if (null? lst)
        '()
        (insert (car lst)
                (sort (cdr lst))))))

(define insert
  (lambda (elt sorted-lst)
    (if (null? sorted-lst)
        (list elt)
        (if (symbol<=? elt (car sorted-lst))
            (cons elt sorted-lst)
            (cons (car sorted-lst)
                  (insert elt (cdr sorted-lst)))))))

(define (symbol<=? a b)
  (or (symbol<? a b) (symbol=? a b)))

(define (elim-dups lst)
  (elim-dups1 (sort lst) '()))

(define (elim-dups1 lin lout)
  (cond
   [(null? lin) lout]
   [(null? lout) (elim-dups1 (cdr lin) (cons (car lin) lout))]
   [(eq? (car lin) (car lout)) (elim-dups1 (cdr lin) lout)]
   [else
    (elim-dups1 (cdr lin) (cons (car lin) lout))]))

(define (free-variables bound-vars expr)
  (cond
   [(simple-constant? expr) '()]
   [(primitive? expr) '()]
   [(special-form? expr) '()]
   [(symbol? expr) (if (memq expr bound-vars)
			 '()
			 (list expr))]
   [(lambda? expr)
      (free-variables (merg (lambda-formals expr)
			      bound-vars)
		      (lambda-body expr))]
   [(let? expr)
    (free-variables (merg (let-bound-vars expr) bound-vars)
  		    (let-body expr))]
   
   [(pair? expr)
      (append (free-variables bound-vars (car expr))
	      (free-variables bound-vars (cdr expr)))]
   [else
    (error 'free-variables "unrecognized expr")]))

(define (let-bound-vars expr)
  (map car (let-bindings expr)))

;;-----------------------------------------------------------------------------------
;;                               vectorize-letrec
;;-----------------------------------------------------------------------------------
;; letrec forms are eliminated by rewriting them as let forms. Recall the scope rules
;; for letrec.  Each of the E1 ... Ek below needs to be evaluated in an environment
;; in which all of the v1...vK exist and are in scope.  This means that code being
;; generated for any Ei may need to generate code that references any of the vi.
;;
;; Our answer is to rewrite the letrec into a let form that allocates all of the
;; v1...vK before generating code for any of the E1...Ek.  We bind all of the v1...vk
;; to vectors that put a box around their value.  Then we replace all the references
;; to these v1...vk are replaced with vector references.
;;
;;  (letrec ((v1 E1) ... (vk Ek) E)
;;
;;  gets rewritten as
;; 
;;   (let ((v1 (make-vector 1)) ... (vk (make-vector 1)))
;;      (begin
;;          (vector-set! v1 0 E1[vi->(vector-ref vi)]
;;          ...
;;          (vector-set! vk 0 Ek[vi->(vector-ref vi)]
;;          E[vi->(vector-ref vi)]))
;;
;;-----------------------------------------------------------------------------------

;; ISSUE: Rewrite this comment.
;;
;; (set! z1 '(letrec () 12)) (vectorize-letrec z)
;; (set! z2 '(letrec ((f (letrec ((g (lambda (x) (fx* x 2)))) (lambda (n) (g (fx* n 2)))))) (f 12)))
;; (set~ z3 '(letrec ((f 12) (g (lambda (n) (set! f n)))) (begin (g 130) f)))
;;
;; ISSUE: what happens when we set! variables in the letrec?  They will have become vectors.
;; should we turn (set! v E) to (vector-set v E) for any v in vars.  I think so.
;;
;; Thus our rewrite E[vi->(vector-ref vi)]  need some nuance so that
;; E[(set! vi E)->(vector-set! vi E[...])] take precedence when it applies.
;;
;;  E.g.
;;
;;      T(ui)[(letrec ((vi Ei) ....) E)] =>  (let ((vi (make-vector 1)) ...)
;;                                             (begin
;;                                                (begin (vector-set! vi T(vi+ui)[Ei]) ...)
;;                                                 T(vi+ui)[E])))
;; 
;;      T(vi)[(set! v E)]                => (vector-set! v T(vi)[E])  if v in vi
;;                                       => (set! v T(vi)[E])         o/w
;;
;;      T(vi)[v]                         => (vector-ref vi 0)       if v in vi
;;      T(vi)[vj]                        => v                       o/w
;;
;;      T(vi)[(x . y)]                   => (T(vi)[x] . T(vi)[y])
;;
;;      T(vi)[a]                         => a
;;
;;
;; After using the above notation to clarify my thinking, re-implemented vectorize
;; from scratch and it worked the first time.  Good notation helps you think!
;;-----------------------------------------------------------------------------------

(define-transform (vectorize-letrec exp)
  (vectorize-T '() exp))

(define (vectorize-T ui exp)
  (cond
   [(letrec? exp)
    (let* ([vi (map first (letrec-bindings exp))]
	   [Ei (map second (letrec-bindings exp))]
	   [E (letrec-body exp)]
	   [vi+ui (append vi ui)]
	   [new-let-bindings (map (lambda (v)
				    (list v '(make-vector 1)))
				  vi)]
	   [new-vector-sets (map (lambda (v e)
				   (list 'vector-set! v 0 (vectorize-T vi+ui e)))
				 vi
				 Ei)]
	   [new-inner-body (vectorize-T vi+ui E)])
      (list 'let new-let-bindings
	    (list 'begin
		  (cons 'begin new-vector-sets)
		  new-inner-body)))]
   [(set!? exp)
    (let* ([v (set!-var exp)]
	   [E (set!-expr exp)])
      (if (memq v ui)
	  (list 'vector-set! v 0 (vectorize-T ui E))
	  (list 'set! v (vectorize-T ui E))))]
   [(symbol? exp)
    (if (memq exp ui)
	(list 'vector-ref exp 0)
	exp)]
   [(pair? exp)
    (cons (vectorize-T ui (car exp))
	  (vectorize-T ui (cdr exp)))]
   [else exp]))

;;-----------------------------------------------------------------------------------
;;                                    Assignment
;;-----------------------------------------------------------------------------------
;; Let's examine how our compiler treats variables. At the source level, variables
;; are introduced either by let or by lambda. By the time we get to code generation,
;; a third kind (free-variables) is there as well. When a lambda closes over a
;; reference to a variable, we copied the value of the variable into a field in the
;; closure. If more than one closure references the variable, each gets its own copy
;; of the value. If the variable is assignable, then all references and assignments
;; occurring in the code must reference/assign to the same location that holds the
;; value of the the variable. Therefore, every assignable variable must be given one
;; unique location to hold its value.
;;
;; The way we treat assignment is by making the locations of assignable variables
;; explicit. These locations cannot in general be stack-allocated due to the
;; indefinite extent of Schemeís closures. So, for every assignable variable, we
;; allocate space on the heap (a vector of size 1) to hold its value. An assignment
;; to a variable x is rewritten as an assignment to the memory location holding x
;; (via vector-set!) and references to x are rewritten as references to the location
;; of x (via vector-ref).
;;-----------------------------------------------------------------------------------
;; As an example the following program
;;
;; (let ((f (lambda (x)
;; 	   (begin
;; 	     (set! x (fxadd1 x))
;; 	     x))))
;;   (f 12))
;;
;; is transformed into
;;
;; (let ((f (lambda (t0)
;; 	   (let (x (vector t0))
;; 	     (begin
;; 	       (vector-set! x 0 (fxadd1 (vector-ref x 0)))
;; 	       (vector-ref x 0)))))
;;   (f 12))
;;
;;-----------------------------------------------------------------------------------

(define (set!? expr)
    (and (pair? expr) (symbol? (car expr)) (eq? (car expr) 'set!)))

(define (set!-var expr)
    (if (symbol? (cadr expr))
         (cadr expr)
         (error 'set! "non-variable given as first arg to set!")))

(define set!-expr caddr)

;; (set! z '(let ((x 12)) (set! x 13) x))

(define-transform (eliminate-set! expr)
  (vectorize (settable-vars expr '()) expr))

(define (settable-vars expr vlst)
  (cond
   [(set!? expr) (settable-vars (set!-expr expr)
				(cons (set!-var expr) vlst))]
   [(pair? expr) (settable-vars (car expr)
				(settable-vars (cdr expr) vlst))]
   [else vlst]))

(define (vectorize svars expr) ;references to svars into vector-ref, set! to vector-set!
  (cond
   [(set!? expr)
    (list 'vector-set!
	  (set!-var expr)
	  '0
	  (vectorize svars (set!-expr expr)))]
   [(let? expr)
    (let* ([bindings (let-bindings expr)]
	   [vars (map first bindings)]
	   [exprs (map second bindings)]
	   [body (let-body expr)]
	   [new-body (vectorize svars body)]
	   [new-exprs (vectorize svars exprs)]
	   [new-bindings (map (lambda (v e) (if (memq v svars)
						(list v (list 'vector e))
						(list v e)))
			      vars
			      new-exprs)])
      (list 'let new-bindings new-body))]
   [(lambda? expr)
    (let* ([formals (lambda-formals expr)]
	   [new-formals (map (lambda (v) (if (memq v svars)
					     (unique-rename v)
					     v))
			     formals)]
	   [new-let-bindings (map (lambda (v nf) (if (memq v svars)
						     (list v (list 'vector nf))
						     (list v v)))
				  formals
				  new-formals)]
	   [body (lambda-body expr)]
	   [new-body (vectorize svars body)])
      (list
       'lambda new-formals (list 'let new-let-bindings new-body)))]
   [(and (symbol? expr) (memq expr svars)) 
    (list 'vector-ref expr '0)]
   [(pair? expr)
    (cons (vectorize svars (car expr))
	  (vectorize svars (cdr expr)))]
   [else expr]))

;;-----------------------------------------------------------------------------------
;;                               Complex Constants
;;-----------------------------------------------------------------------------------
;; (quote ⟨datum⟩) evaluates to ⟨datum⟩. ⟨Datum⟩ may be any external representation of
;; a Scheme object. This notation is used to include literal constants in Scheme
;; code. It is not necessary that complex constants be the same when compared with
;; eq?  From (R5RS) section 6, we have a wealth of examples:
;;
;;   (eq? 'a 'a)                => #t
;;   (eq? '(a) '(a))            =>  unspecified
;;   (eq? (list 'a) (list 'a))  => #f
;;   (eq? "a" "a")              => unspecified
;;   (eq? "" "")                => unspecified
;;   (eq? '() '())              => #t
;;   (eq? 2 2)                  => unspecified
;;   (eq? #\A #\A)              => unspecified
;;   (eq? car car)              => #t
;;
;; Given this, we will take the simple approach an compile complex constants like
;; into expressions that construct the value from primitives and constants already
;; defined.  Thus quote is something we eliminate as a preprocessing step.
;;
;;     (quote (#t 42))  =>  (cons #t (cons 42 '()))
;;
;; Note this is different from the approach taken by (Ghuloum 2006) that has been our
;; guide through much of this development.  Ghuloum claims "the formal semantics of
;; Scheme require that quoted constants always evaluate to the same object."  So he
;; is appealing to the formal semantics and not the informal english language
;; description above.
;;
;; I tested a few examples on the petite scheme interpreter I am using and find that
;; the "unspecificed" behavior is not so strict as the formal semantics.  E.g.
;;
;;     (eq? '(a) '(a))  =>  #f
;;     (eq? "a" "a")    =>  #f
;;     (eq? 2 2)        =>  #t
;;     (eq? #\A #\A)    =>  #t
;;
;; Since constants don't change, it would be potentially wasteful to emit code for
;; compilex constants (list, strings, vectors) that constructs their values anew
;; every time.  That would eat up heap and/stack space unnecessarily.  We prefer to
;; create them just once when they are encountered and have later encounters re-use
;; their values.
;;
;;  #(vector #t 42) =>  (let ((t1 (make-vector 2)))
;;                        (begin
;;                          (vector-set! t1 0 #t)
;;                          (vector-set! t1 1 42)))
;;
;; We introduce two new primitives
;;
;;    (constant-init t0 expr)
;;    (constant-ref t0)
;;
;; constant-init initializes the value of expr in the heap and binds t0 to a datum
;; pointing back to that value.
;;
;;-----------------------------------------------------------------------------------

(define (quote? expr)
  (and (pair? expr) (eq? (car expr) 'quote)))
(define quote-body second)

(define-transform (eliminate-quote expr)
  (cond
   [(quote? expr)
    (let ([body (quote-body expr)])
      (cond
       [(or (boolean? body) (fixnum? body) (char? body) (null? body)) body]
       [(symbol? body) (list 'string->symbol (symbol->string body))] ;; requires string->symbol
       [(pair? body) (expand-list body)]
       [(string? body) body]))]
   [(pair? expr)
    (cons (eliminate-quote (car expr))
	  (eliminate-quote (cdr expr)))]
   [else expr]))

(define (expand-list exp)  ;; transform lists to sequences of cons operations
  (cond
   [(pair? exp)
    (list 'cons
	  (eliminate-quote (list 'quote (car exp)))
	  (eliminate-quote (list 'quote (cdr exp))))]
   [(null? exp) exp]
   [(symbol? exp) (list 'quote exp)]   ;; symbol not yet implemented
   [else exp]))

;;-----------------------------------------------------------------------------------
;;  eliminate-when/unless
;;-----------------------------------------------------------------------------------
;;  T(when E ...)   =>  (if T[E] (begin T[...]) #f)
;;  T(unless E ...) =>  (if (not T[E]) (begin T[...]) #f)
;;  T(X . Y)        =>  (T[X] . T[Y])
;;  T(a)            =>  a
;;-----------------------------------------------------------------------------------

(define (when? exp)
  (and (pair? exp) (eq? (car exp) 'when)))
(define when-test second)
(define when-body cddr)

(define (unless? exp)
  (and (pair? exp) (eq? (car exp) 'unless)))
(define unless-test second)
(define unless-body cddr)

(define-transform (eliminate-when/unless exp)
  (cond
   [(when? exp)
    (list 'if
	  (eliminate-when/unless (when-test exp))
	  (cons 'begin (eliminate-when/unless (when-body exp)))
	  #f)]
   [(unless? exp)
    (list 'if
	  (list 'not (eliminate-when/unless (unless-test exp)))
	  (cons 'begin (eliminate-when/unless (unless-body exp)))
	  #f)]
   [(pair? exp)
    (cons (eliminate-when/unless (car exp))
	  (eliminate-when/unless (cdr exp)))]
   [else exp]))


;;-----------------------------------------------------------------------------------
;;  eliminate-cond
;;-----------------------------------------------------------------------------------
;;  T(cond)           => #f
;;  T(cond (B))       => error
;;  T(cond [else E])  => T[E]
;;  T(cond [B E])     => (if T[B] T[E] #f)
;;  T(cond [B E] ...) => (if T[B] T[E] (cond T[...]))
;;  T(X . Y)          => (T[X] . T[Y])
;;  T[a]              => a
;;-----------------------------------------------------------------------------------

(define (cond? exp)
  (and (pair? exp) (eq? (car exp) 'cond)))
(define (clause? exp) (and (pair? exp) (not (null? (cdr exp)))))
(define cond-clause second)
(define (else? exp)
  (and (pair? exp) (eq? (car exp) 'else)))

(define-transform (eliminate-cond exp)
  (cond
   [(cond? exp)
    (cond
        [(null? (cdr exp)) #f]
	[(not (clause? (second exp)))
	 (error 'cond (format "bad cond clause: ~s" (second exp)))]
	[(else? (cond-clause exp)) (eliminate-cond (second (cond-clause exp)))]
	[else (list 'if (eliminate-cond (first (cond-clause exp)))
		    (eliminate-cond (second (cond-clause exp)))
		    (eliminate-cond (cons 'cond (cddr exp))))])]
   [(pair? exp)
    (cons (eliminate-cond (car exp))
	  (eliminate-cond (cdr exp)))]
   [else exp]))


;;-----------------------------------------------------------------------------------
;;                                External Symbols
;;-----------------------------------------------------------------------------------
;; External symbols have their values stored in memory at locations denoted by
;; global labels that are defined in separately linked library files.
;;-----------------------------------------------------------------------------------
;; asmify maps scheme identifiers to assembler identifiers by substituting legal
;; escape sequences for illegal special characters.
;;
;; Example
;;
;;   (asmify 'string->symbol) => "string$m$gsymbol"
;;
;; The full compliment of special characters that (R5RS) allows:
;;
;;            ! $ % & * + - . / : < = > ? @ ^ _ ~
;;
;;----------------------------------------------------------------------------------

(define (asmify s)
  (list->string (asmify1 (string->list (symbol->string s)))))

(define (asmify1 l)  ;;  TBD expand this list to all scheme specials chars 
    (cond
     [(null? l) l]
     [(eq? (car l) #\!) (cons #\$ (cons #\b (asmify1 (cdr l))))]  ; bang
     [(eq? (car l) #\$) (cons #\$ (cons #\$ (asmify1 (cdr l))))]  ; dollar
     [(eq? (car l) #\%) (cons #\$ (cons #\p (asmify1 (cdr l))))]  ; percent
     [(eq? (car l) #\&) (cons #\$ (cons #\a (asmify1 (cdr l))))]  ; ampersand
     [(eq? (car l) #\*) (cons #\$ (cons #\s (asmify1 (cdr l))))]  ; star
     [(eq? (car l) #\+) (cons #\$ (cons #\p (asmify1 (cdr l))))]  ; plus
     [(eq? (car l) #\-) (cons #\$ (cons #\m (asmify1 (cdr l))))]  ; minus
     [(eq? (car l) #\.) (cons #\$ (cons #\d (asmify1 (cdr l))))]  ; dot
     [(eq? (car l) #\/) (cons #\$ (cons #\S (asmify1 (cdr l))))]  ; slash
     [(eq? (car l) #\:) (cons #\$ (cons #\c (asmify1 (cdr l))))]  ; colon
     [(eq? (car l) #\<) (cons #\$ (cons #\l (asmify1 (cdr l))))]  ; less than
     [(eq? (car l) #\=) (cons #\$ (cons #\e (asmify1 (cdr l))))]  ; equals
     [(eq? (car l) #\>) (cons #\$ (cons #\g (asmify1 (cdr l))))]  ; greater than
     [(eq? (car l) #\?) (cons #\$ (cons #\q (asmify1 (cdr l))))]  ; question mark
     [(eq? (car l) #\@) (cons #\$ (cons #\A (asmify1 (cdr l))))]  ; at
     [(eq? (car l) #\^) (cons #\$ (cons #\h (asmify1 (cdr l))))]  ; hat
     [(eq? (car l) #\_) (cons #\$ (cons #\u (asmify1 (cdr l))))]  ; underscore
     [(eq? (car l) #\~) (cons #\$ (cons #\t (asmify1 (cdr l))))]  ; tilde
     [else (cons (car l) (asmify1 (cdr l)))]))	

(define-syntax import-from
  (syntax-rules ()
    [(import-from (library-name) s)
     (begin
       (putprop 's '*is-external* #t)
       (putprop 's '*library-name* 'library-name)
       (putprop 's '*label* (asmify 's)))]
    [(import-from (library-name) s s* ...)
     (begin
       (import-from (library-name) s)
       (import-from (library-name) s* ...))]))

(define (external? symbol)
  (getprop symbol '*is-external*))

;;--------------------------------------------------------------------------------
;; We need to know what symbols come from separately compiled libraries at compile
;; time.  A transform uses this list to wrap those symbols in a primitive-ref
;; form, e.g. (primitive-ref string->symbol)
;;
;; Then at code generation time, we recognize those forms and emit code to fetch
;; the datum from memory using the global labels defined by the library.
;;---------------------------------------------------------------------------------
;;
;; ISSUE: Should we provide a way to pull this list from a header file or the
;; library's published interface?
;;
;; There are decent reasons for enumerating imports as we do here.  Makes it
;; explicit what we are importing and from where we import it.

(import-from (base)
	     string->symbol
	     symbols
	     string=?
	     append1
	     error
	     eh_procedure
	     eh_argcount
	     primitives
	     list-ref)

(define-transform (external-symbols expr)
  (cond
   [(and (pair? expr) (symbol? (car expr)) (external? (car expr)))
    (cons (list 'primitive-ref (car expr)) (external-symbols (cdr expr)))]
   [(pair? expr)
    (cons (external-symbols (car expr))
	  (external-symbols (cdr expr)))]
   [else expr])) 

;;-----------------------------------------------------------------------------------
;;                              PART II  -- CODE GENERATION
;;-----------------------------------------------------------------------------------



;;-----------------------------------------------------------------------------------
;;                                    Proper Tail Recursion
;;-----------------------------------------------------------------------------------
;;
;; Implementations of Scheme are required to be properly tail-recursive. Procedure
;; calls that occur in certain syntactic contexts defined below are ‘tail calls’.
;; A Scheme implementation is properly tail-recursive if it supports an unbounded
;; number of active tail calls. 
;;
;; A tail call is a procedure call that occurs in a tail context. Tail contexts
;; are defined inductively. Note that a tail context is always determined with
;; respect to a particular lambda expression.
;;
;; So far, our compiler would compile tail-calls as regular calls followed by a
;; return. A proper tail-call, on the other hand, must perform a jmp to the target
;; of the call, using the same stack position of the caller itself.
;;
;; A very simple way of implementing tail-calls is as follows:
;;
;; 1. All the arguments are evaluated and saved on the stack in the same way arguments
;;    to nontail calls are evaluated.
;;
;; 2. The operator is evaluated and placed in the %edi register replacing the current
;;    closure pointer.
;;
;; 3. The arguments are copied from their current position of the stack to the
;;    positions adjacent to the return-point at the base of the stack.
;; 
;; 4. An indirect jmp, not call, through the address in the closure pointer is issued.
;;
;; This treatment of tail calls is the simplest way of achieving the objective of the
;; requirement. Other methods for enhancing performance by minimizing the excessive
;; copying are discussed later in Section 4.
;;-----------------------------------------------------------------------------------


(define (funcall? expr)
  (and (pair? expr)
       (or (eq? (car expr) 'funcall) (eq? (car expr) 'app))))

(define (begin? expr)
  (and (pair? expr) (eq? (car expr) 'begin)))

(define (primitive-ref? expr)
  (and (pair? expr) (eq? (car expr) 'primitive-ref)))

(define (foreign-call? expr)
  (and (pair? expr) (eq? (car expr) 'foreign-call)))

(define (emit-expr si env expr)
  (define (variable? expr)
    (and (symbol? expr)
	 (let ([pair (assoc expr env)])
	   (and pair (fixnum? (cdr pair)))))) 
  (emit "# emit-expr ~s" expr)
  (cond
   [(primcall? expr)        (emit-primcall si env expr)]   
   [(immediate? expr)       (emit-immediate expr)]
   [(labels? expr)          (emit-labels si env expr)]   ;; labels never in tail position
   [(string? expr)          (emit-string-literal expr)]
   [(variable? expr)        (emit-variable-ref env expr)]
   [(primitive-ref? expr)   (emit-primitive-ref si env expr)]
   [(foreign-call? expr)    (emit-foreign-call si env expr)]
   [(begin? expr)           (emit-begin si env expr)]  
   [(closure? expr)         (emit-closure si env expr)]
   [(funcall? expr)         (emit-funcall si env expr)]
   [(let? expr)             (emit-let si env (let-bindings expr) (let-body expr))] ;; should let let do this
   [(if? expr)              (emit-if si env expr)]
   [(and? expr)             (emit-and si env expr)]
   [(or? expr)              (emit-or si env expr)]
   [(pair? expr)            (emit-funcall si env (cons 'funcall expr))] ;; implicit funcall
   [else
    (error "emit-expr" "unrecognized form" expr)]))

(define (emit-tail-expr si env expr)
  (define (variable? expr)
    (and (symbol? expr)
	 (let ([pair (assoc expr env)])
	   (and pair (fixnum? (cdr pair))))))
  (emit "# emit-tail-expr")
  (emit "# si=~s" si)
  (emit "# env=~s" env)
  (emit "# expr=~s" expr)
  (cond
   [(primcall? expr)      (emit-tail-primcall si env expr)]   
   [(immediate? expr)     (emit-tail-immediate expr)]
   [(labels? expr)        (error 'emit-tail-expr "labels never in tail position")]
   [(string? expr)        (emit-tail-string-literal)]
   [(variable? expr)      (emit-tail-variable-ref env expr)]
   [(primitive-ref? expr) (emit-tail-primitive-ref si env expr)]
   [(foreign-call? expr)  (emit-tail-foreign-call si env expr)]
   [(begin? expr)         (emit-tail-begin si env expr)]   
   [(closure? expr)       (emit-tail-closure si env expr)]
   [(funcall? expr)       (emit-tail-funcall si env expr)]
   [(let? expr)           (emit-tail-let si env (let-bindings expr) (let-body expr))]
   [(if? expr)            (emit-tail-if si env expr)]
   [(and? expr)           (emit-tail-and si env expr)]
   [(or? expr)            (emit-tail-or si env expr)]
   [(pair? expr)          (emit-tail-funcall si env (cons 'funcall expr))] ;; implicit funcall    
   [else
    (error "emit-tail-expr" "unrecognized form:" expr)]))


(define (emit-immediate x)
  (emit "    movl $~s, %eax     # immed ~s" (immediate-rep x) x))

(define (emit-tail-immediate x)
  (emit-immediate x)
  (emit "    ret                  # immediate tail return"))

(define (emit-scheme-entry env expr) 
  (emit "# emit-scheme-entry")
  (emit-function-header "_L_scheme_entry")
  (emit "    movl $0, %edi  # dummy for debugging")
  (emit-init -8 env)       ;; return is at %esp, so start at %esp - 4
  (emit-expr -8 env expr)  ;; return is at %esp, so start at %esp - 4
  (emit "    ret")
  (emit-function-header "_scheme_entry")
  (emit "    movl 4(%esp), %ecx")   ;; linkage assume i386 (32 bit)
  (emit "    movl %ebx, 4(%ecx)")
  (emit "    movl %esi, 16(%ecx)")
  (emit "    movl %edi, 20(%ecx)")
  (emit "    movl %ebp, 24(%ecx)")
  (emit "    movl %esp, 28(%ecx)")  ;; we really need to perserve ecx
  (emit "    movl 12(%esp), %ebp")  ;; set heap base
  (emit "    movl 8(%esp), %esp")   ;; set stack base
  (emit "    call _L_scheme_entry") ;; %esp, -4(%esp), eip := %esp-4, eip, _L_scheme_entry 
  (emit "    movl 4(%ecx), %ebx")  
  (emit "    movl 16(%ecx), %esi")
  (emit "    movl 20(%ecx), %edi")
  (emit "    movl 24(%ecx), %ebp")
  (emit "    movl 28(%ecx), %esp")
  (emit "    ret"))

(define (emit-init si env)
  (emit "    .global base_init_callback")
  (emit "    .extern base_init")
  (emit "    addl $-4,%esp")  ;;
  (emit "    jmp base_init")  ;;
  (emit "base_init_callback:")
  (emit "    addl $4,%esp"))

;; (define (emit-init si env)
;;   (emit "    .global main_callback")
;;   (emit "    .extern base_init")
;;   (emit "    call base_init")   ;; would call work just as well?
;;   (emit "main_callback:"))

(define (emit-function-header label)
  (emit "    .text")
 ;(emit "    .align 4,0x90")
  (emit "    .align 16, 0x90")
  (emit "    .globl ~a" label)
  (emit "~a:" label))

;;-----------------------------------------------------------------------------------
;;                       Value Representation
;;-----------------------------------------------------------------------------------
;;  All values are represented in a 'datum' of 32-bits.  Low order bits are reserved
;;  for a tag unique to the type.  Some types (e.g. fixnum, character, boolean) have
;;  their values encoded in the datum itself. have their values represented in the
;;  datum itself.  For others (pair, vector, string, closure) the datum holds a
;;  pointer to heap allocated objects.
;;
;;  Type tags are of varying length. But each type is a type specific mask defined so
;;  that testing for membership in the type is a simple mask and compare.  As
;;  specified by the Scheme standard (R5RS) types are disjoint.  Each datum belongs
;;  to exactly one type.
;;-----------------------------------------------------------------------------------
;;  Constants

(define fixnum-shift         2)
(define fixnum-mask       #b00000011)   ; #x03
(define fixnum-tag        #b00000000)   ; #x00

(define char-shift          8)
(define char-tag         #b00001111) ; #x0F
(define char-mask        #b11111111)

(define bool-f       #b00101111) ; #x2F
(define bool-t       #b01101111) ; #x6F
(define bool-bit        6)
(define bmask        #b10111111)
(define btag         #b00101111)

(define pair-shift      3)
(define pair-mask    #b00000111) ; #x07
(define pair-tag     #b00000001) ; #x01
(define size-pair       8)
(define car-offset      0)
(define cdr-offset      4)

(define vector-shift    3)
(define vector-mask  #b00000111) ; #x07 
(define vector-tag   #b00000101) ; #x05

(define string-shift    3)
(define string-mask  #b00000111) ; #x07
(define string-tag   #b00000110) ; #x06

(define closure-mask  #b00000111) ; #x07
(define closure-tag   #b00000010) ; #x02

(define symbol-shift    3)
(define symbol-mask   #b00000111) ; #x07     ;; Symbols are under construction
(define symbol-tag    #b00000011) ; #x03     ;; Still thinking it through
(define size-symbol     8)
(define string-offset   0)
(define value-offset    4)

(define nil-value    #b00111111) ; #x3F)
(define wordsize        4) ; bytes

(define fixnum-bits (- (* wordsize 8) fixnum-shift))

(define fxlower (- (expt 2 (- fixnum-bits 1))))

(define fxupper (sub1 (expt 2 (- fixnum-bits 1))))

(define (fixnum? x)
   (and (integer? x) (exact? x) (<= fxlower x fxupper)))

(define (immediate? x)
   (or (fixnum? x)(boolean? x)(char? x)(null? x)))

(define (immediate-rep x)
   (cond
      [(fixnum? x) (ash x fixnum-shift)]
      [(boolean? x) (if x bool-t bool-f) ]
      [(char? x) (logor (ash (char->integer x) char-shift) char-tag) ]
      [(null? x) nil-value ]))

;;-----------------------------------------------------------------------------------
;;                             Macros to define Primitives
;;-----------------------------------------------------------------------------------
;; Primitives are represented as properties of their function symbol. This includes
;; information such as the number of parameters and procedure to emit code for the
;; primitive.  'primcall' relies on this information to generate code for primitive
;; calls.
;;
;; To support error handling, we keep a list of all primitives assigning each a
;; unique fixnum code corresponding to its ordinal position in the list.
;;-----------------------------------------------------------------------------------

(define *primitive-count* 0)
(define *primitive-names* '())
(define (primitive-code name)
  (getprop name '*primitive-code*))

(define-syntax define-primitive
  (syntax-rules ()
    [(_ (prim-name si env arg* ...) b b* ...)
     (begin
       (putprop 'prim-name '*is-prim* #t)
       (putprop 'prim-name '*arg-count*
		(length '(arg* ...)))
       (set! *primitive-names* (cons 'prim-name *primitive-names*))
       (putprop 'prim-name '*primitive-code* *primitive-count*)
       (set! *primitive-count* (+ 1 *primitive-count*))        
       (putprop 'prim-name '*emitter*
		(lambda (si env arg* ...) b b* ...)))]))

;;-----------------------------------------------------------------------------------
;;                              Conversions between Types
;;-----------------------------------------------------------------------------------

(define-primitive (fixnum->char si env arg)
  (emit-expr si env arg)
  (emit-check-fixnum 'fixnum->char)
  (emit "    shll $~s, %eax" (- char-shift fixnum-shift))
  (emit "    orl $~s, %eax" char-tag))

(define-primitive (char->fixnum si env arg)
  (emit-expr si env arg)
  (emit-check-character 'char->fixnum)
  (emit "   shrl $~s, %eax" char-shift)
  (emit "   shll $~s, %eax" fixnum-shift))

;;-----------------------------------------------------------------------------------
;;                              Disjoint Types
;;-----------------------------------------------------------------------------------

(define-primitive (null? si env arg)
    (emit-expr si env arg)
    (emit "    cmp $~s, %eax" nil-value)
    (emit "    mov $0, %eax")
     ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (char? si env arg)
    (emit-expr si env arg)
    (emit "    and $~s, %eax" char-mask)
    (emit "    cmp $~s, %eax" char-tag)
     ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (fixnum? si env arg)
  (emit-expr si env arg)
  (emit "    and $~s, %al" fixnum-mask)
  (emit "    cmp $~s, %al" fixnum-tag)
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (boolean? si env arg)
    (emit-expr si env arg)
    (emit "    and $~s, %eax" bmask)
    (emit "    cmp $~s, %eax" btag)
    ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

;;-----------------------------------------------------------------------------------
;; not takes any kind of value and returns #t if the object is #f, otherwise it
;; returns #f
;;-----------------------------------------------------------------------------------

(define-primitive (not si env arg)
    (emit-expr si env arg)
    (emit "    cmp $~s, %eax" bool-f)
    ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

;;-----------------------------------------------------------------------------------
;;                                        Equality
;;-----------------------------------------------------------------------------------

(define-primitive (eq? si env arg1 arg2)
  (emit "# eq? arg1=~s arg2=~s" arg1 arg2)
  (emit-expr si env arg1)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg2)
  (emit "    cmp %eax, ~s(%esp)" si)
  ;; convert the cc to a boolean
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (char=? si env c1 c2)
  (emit "# char= c1=~s c2=~s" c1 c2)
  (emit-expr si env c1)                ;; eax = c1
  (emit-check-character 'char=?)
  (emit "    movb %ah, ~s(%esp)" si)   ;; save c1
  (emit-expr (- si wordsize) env c2)   ;; eax = c2
  (emit-check-character 'char=?)
  (emit "    cmp %ah, ~s(%esp)" si)    ;; compare c1 c2
  ;; convert the cc to a boolean
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

;;-----------------------------------------------------------------------------------
;;    Bitwise logical fixnum operations
;;
;;   (fxlognot N)            (fxlogand N N)               (fxlogor N N)
;;-----------------------------------------------------------------------------------

(define-primitive (fxlognot si env arg)
  (emit-expr si env arg)
  (emit-check-fixnum 'fxlognot)
  (emit "    or $~s, %al" fixnum-mask)
  (emit "    notl %eax"))

(define-primitive (fxlogand si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fxlogand)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fxlogand)
  (emit "    and ~s(%esp), %eax" si))

(define-primitive (fxlogor si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fxlogor)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fxlogor)
  (emit "    or ~s(%esp), %eax" si))

;;-----------------------------------------------------------------------------------
;;                  Fixnum Arithmetic
;;-----------------------------------------------------------------------------------
;;
;;  (fxzero? N)     (fxadd1 N)
;;  (fx= N N)       (fxsub1 N)
;;  (fx< N N)
;;  (fx<= N N)      (fx+ N N)
;;  (fx> N N)       (fx- N N)
;;  (fx>= N N)      (fx* N N)
;;
;;-----------------------------------------------------------------------------------

(define-primitive (fxadd1 si env arg)
  (emit-expr si env arg)
  (emit-check-fixnum 'fxadd1)
  (emit "     addl $~s, %eax" (immediate-rep 1)))

(define-primitive (fxsub1 si env arg)
  (emit-expr si env arg)
  (emit-check-fixnum 'fxsub1)
  (emit "    addl $~s, %eax" (immediate-rep -1)))

;;-----------------------------------------------------------------------------------

(define-primitive (fxzero? si env arg)
  (emit-expr si env arg)
    (emit-check-fixnum 'fxzero?)
    (emit "    cmp $0, %eax")
    ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (fx= si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fx=)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fx=)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx< si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fx<)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fx<)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    setl %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx<= si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fx<=)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fx<=)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    setle %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx> si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fx>)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fx>)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    setg %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx>= si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fx>=)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fx>=)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    setge %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

;;-----------------------------------------------------------------------------------

(define-primitive (fx+ si env arg1 arg2)  ;; swaped arg eval order
  (emit-expr si env arg2)
  (emit-check-fixnum 'fx+)
  (emit "    movl %eax, ~s(%esp)  # fx+ push arg1" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fx+)
  (emit "    addl ~s(%esp), %eax  # fx+ arg1 arg2" si))

(define-primitive (fx- si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fx-)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fx-)
  (emit "    subl ~s(%esp), %eax" si))

(define-primitive (fx* si env arg1 arg2)
  (emit-expr si env arg2)
  (emit-check-fixnum 'fx*)
  (emit "    sar $~s, %eax" fixnum-shift)   ;; 4x/4
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit-check-fixnum 'fx*)
  (emit "    imul ~s(%esp), %eax" si)) ;; 4xy = (4x/4)*4y

;; ---------------- Error checks inserted up to here -----------

;;-----------------------------------------------------------------------------------
;;                              Pairs
;;-----------------------------------------------------------------------------------
;;  (cons X Y)             (set-car! V X)
;;  (car V)                (set-cdr! V Y)
;;  (cdr V)
;;-----------------------------------------------------------------------------------
;; Pairs are allocated in the heap.  They are always aligned on an 8-byte boundary.
;; Nicely compact since pairs are 8-bytes anyway.  Pairs are often called cons-nodes
;; when talking about their representation.
;;
;;                           +--------------+
;;     (V - pair-tag) -----> |     car      | 0    
;;                           +----------------+
;;                           |     cdr      | 4
;;                           +--------------+
;;
;;  Key Invariant:  %epb points to next open slot in the heap
;;                 
;;-----------------------------------------------------------------------------------

(define-primitive (pair? si env arg)
  (emit-expr si env arg)
  (emit "    and $~s, %al" pair-mask)
  (emit "    cmp $~s, %al" pair-tag)
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (cons si env arg1 arg2)
  (emit "# cons arg1=~s arg2=~s" arg1 arg2);
  (emit-expr si env arg1)                     ;; evaluate arg1
  (emit "    movl %eax, ~s(%esp)" si)         ;; save value of arg1
  (emit-expr (- si wordsize) env arg2)        ;; evaluate arg2
  (emit "    movl %eax, ~s(%ebp)" cdr-offset) ;; arg2 -> cdr
  (emit "    movl ~s(%esp), %eax" si)         ;; get value of arg1
  (emit "    movl %eax, ~s(%ebp)" car-offset) ;; arg1 -> car
  (emit "    movl %ebp, %eax")                ;; get ptr to cons'd pair
  (emit "    or   $~s, %al" pair-tag)         ;; or in the pair tag
  (emit "    add  $~s, %ebp" size-pair)       ;; bump heap ptr
  (emit "# cons end"))     

(define-primitive (car si env arg)
  (emit-expr si env arg)
  (emit-check-pair 'car)
  (emit "    movl ~s(%eax), %eax" (- car-offset pair-tag)))

(define-primitive (cdr si env arg)
  (emit-expr si env arg)
  (emit-check-pair 'cdr)
  (emit "    movl ~s(%eax), %eax" (- cdr-offset pair-tag)))

(define-primitive (set-car! si env u obj)
  (emit-expr si env u)
  (emit-check-pair 'set-car!)
  (emit "    movl %eax, ~s(%esp)" si)  ;; save u
  (emit-expr (- si wordsize) env obj)  ;; eax = obj
  (emit "    movl ~s(%esp), %ebx" si)  ;; ebx = u
  (emit "    movl %eax, ~s(%ebx)" (- car-offset pair-tag)))

(define-primitive (set-cdr! si env u obj)
  (emit-expr si env u)
  (emit-check-pair 'set-cdr!)
  (emit "    movl %eax, ~s(%esp)" si)  ;; save u
  (emit-expr (- si wordsize) env obj)  ;; eax = obj
  (emit "    movl ~s(%esp), %ebx" si)  ;; ebx = u
  (emit "    movl %eax, ~s(%ebx)" (- cdr-offset pair-tag)))

;;-----------------------------------------------------------------------------------
;;                              Vectors
;;-----------------------------------------------------------------------------------
;;  Vectors are allocated in the heap.  They start with a length field followed by
;;  the elements of the vector.  Note the tag for the vector lives in the pointer to
;;  it.  Vectors are 8-byte aligned in the heap.
;;
;;  Question: Do we interpret the len as the lisp datum or the x86 number?
;;  Answer: Treat len as a scheme datum, specifically a fixnum value. Our fixnum has
;;  the lower 2 bits set to 0.  So we map the fixnum to it's interpretation by
;;  shifting right 2 bits, or equivalently multiplying by 4.  But 4 happens to be the
;;  number of bytes used by each 32 bit datum.  So the fixnum datum can be used
;;  directly to indicate the length in bytes, or divided by 4 to indicate the number
;;  of elements in the vector.  Cool, yes?
;;           
;;          +-------------+
;;   -----> |    len      | 0    
;;          +-------------+
;;          |   elt 0     | 4
;;          +-------------+
;;          |   elt 1     | 8
;;          +-------------+
;;          |   ...       |
;;          +-------------+
;;          |   elt N     | 4*(N+1)
;;          +-------------+
;;
;;  (vector? V)           returns #f iff v is not a vector
;;  (make-vector N)       returns a new vector of size N
;;  (vector-length v)     the size of the vector
;;  (vector-set! V N E)   sets (vector-ref V N) to E
;;  (vector-ref V N)      most recent value set by vector-set!
;;  (vector E)            new vector of length 1 with (vector-ref v 1) => E
;;
;;-----------------------------------------------------------------------------------

(define-primitive (vector? si env arg)
  (emit-expr si env arg)
  (emit "    and $~s, %al" vector-mask)
  (emit "    cmp $~s, %al" vector-tag)
  ;; convert cc to a boolean
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

;; the single argument version is primitive

(define-primitive (make-vector si env length)
  (emit "# make-vector ~s" length)
  (emit-expr si env length)
  (emit-check-fixnum 'make-vector)
  (emit-check-nonneg 'make-vector)
  (emit "    movl %eax, %esi")             ;; save length in esi as offset (not yet aliged)
  (emit "    movl %eax, 0(%ebp)")          ;; set the vector length field 
  (emit "    movl %ebp, %eax")             ;; save the base pointer as return value
  (emit "    orl  $~s, %eax" vector-tag)   ;; set the vector tag in the lower 3 bits
  (emit "    addl $~s, %esi" wordsize)     ;; 4 bytes for length field
                                           ;; align length in esi to 8 bytes
  (emit "    addl $4, %esi")               ;;  by adding #0100 
  (emit "    andl $-8, %esi")              ;;  and clearing bottom 3 bits  
  (emit "    addl %esi, %ebp"))            ;; advance alloc ptr

(define-primitive (vector-length si env v)
  (emit-expr si env v)                ;; eax <- vector + 5
  (emit-check-vector 'vector-length)
  (emit "andl $-8, %eax")             ;; clear 3-bit tag to select 8-byte aligned value
  (emit "movl 0(%eax), %eax")         ;; follow pointer to get length
  )   ;; length always 4-byte aligned, coincidentally already a fixnum

(define-primitive (vector-set! si env vector k object)
  (emit-expr si env vector)
  (emit-check-vector 'vector-set!)
  (emit "    movl %eax, ~s(%esp)" si)               ;; save the vector
  (emit-expr (- si wordsize) env k)                 ;; eax <- k
  (emit-check-fixnum 'vector-set!)
  (emit-check-vector-index si 'vector-set!)         ;; check 0 <= k length(vector)
  (emit "    movl %eax, ~s(%esp)" (- si wordsize))  ;; save k
  (emit-expr (- si (* 2 wordsize)) env object)      ;; eax <- object
  (emit "    movl ~s(%esp), %ebx" si)               ;; ebx = vector + 5
  (emit "    movl ~s(%esp), %esi" (- si wordsize))  ;; esi = k
  (emit "    movl %eax, -1(%ebx,%esi)")             ;; v[k] <- object
  )                                                 ;; offset -1 = tag(-5) + lenfield_size(4) 

(define-primitive (vector-ref si env vector k)
  (emit-expr si env vector)
  (emit-check-vector 'vector-ref)
  (emit "    movl %eax, ~s(%esp)" si)    ;; save the vector
  (emit-expr (- si wordsize) env k)      ;; eax <- k
  (emit-check-fixnum 'vector-ref)
  (emit-check-vector-index si 'vector-ref)
  (emit "    movl ~s(%esp), %esi" si)    ;; esi <- vector + tag(5)
  (emit "    movl -1(%eax,%esi), %eax"))  ;; eax <- v[k]  -1 = tag(-5) + lenfield_size(4)

(define-primitive (vector si env x)
  (emit-expr si env '(make-vector 1))    ;; new unitary vector eax
  (emit "    movl %eax, ~s(%esp)" si)    ;; save the vector+5
  (emit-expr (- si wordsize) env x)      ;; eax <- evaluated x
  (emit "    movl  %eax, %ebx")          ;; ebx <- evaluated x
  (emit "    movl ~s(%esp), %eax" si)    ;; eax <- the vector+5
  (emit "    movl %ebx, -1(%eax)"))      ;; v[0] <- object;
                                         ;; offset -1 = tag(-5) + lenfield_size(4)

;;-------------------------------------------------------------------------------
;;                                      Strings
;;-------------------------------------------------------------------------------
;;
;;
;;
;;
;;-------------------------------------------------------------------------------

(define-primitive (make-string si env len)
   (emit "# make-string len=~s" len)
   (emit-expr si env len)
   (emit-check-fixnum 'make-string)
   (emit-check-nonneg 'make-string)
   (emit "    movl %eax, %esi")           ;; esi = length (bytes x 4)
   (emit "    movl %eax, 0(%ebp)")        ;; set string-length field (bytes x 4)
   (emit "    movl %ebp, %eax")           ;; save the base pointer as return value
   (emit "    orl $~s, %eax" string-tag)  ;; set the tag in the lower 3 bits   
   (emit "    sar $~s, %esi" fixnum-shift)     ;; esi = divide by 4 to get length (bytes)
   (emit "    add $~s, %esi" wordsize)    ;; account for length field (4 bytes)
                                          ;; align esi to 8-bytes:
   (emit "    add $7, %esi")              ;;    first add 7
   (emit "    andl $-8, %esi")            ;;    then clear the last 3 bits.
   (emit "    add  %esi, %ebp")           ;; bump heap base to the 8 byte aligned boundary
   (emit "# make-string end"))

(define-primitive (string? si env object)
    (emit-expr si env object)
    (emit "    and $~s, %al" string-mask)
    (emit "    cmp $~s, %al" string-tag)
    ; convert cc to a Boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit);
    (emit "    or $~s, %al" bool-f))

(define-primitive (string-length si env str)
    (emit-expr si env str)
    (emit-check-string 'string-length)
    (emit "    movl ~s(%eax), %eax" (- string-tag)))

(define-primitive (string-ref si env str k)
  (emit-expr si env str)
  (emit-check-string 'string-ref)
  (emit "    movl %eax, ~s(%esp)" si)    ;; save the string
  (emit-expr si env k)                   ;; eax = k (4 x bytes)
  (emit-check-fixnum 'string-ref)
  (emit-check-string-index si 'string-ref)
  (emit "    sar $~s, %eax" fixnum-shift)     ;; eax = k (bytes)
  (emit "    movl ~s(%esp), %esi" si)    ;; esi <- string + tag(6)
  (emit "    movl -2(%eax,%esi), %eax")  ;; eax <- v[k]    tag(-6) + lenfield_size(4)
  (emit "    sal $~s, %eax" char-shift)      ;; shift char to content position
  (emit "    or  $~s, %eax" char-tag))       ;; affix the tag
   
(define-primitive (string-set! si env str k char)
  (emit-expr si env str)
  (emit-check-string 'string-set!)
  (emit "    movl %eax, ~s(%esp)" si)               ;; save the string
  (emit-expr si env k)                              ;; eax = k (4 x bytes)
  (emit-check-fixnum 'string-set!)
  (emit-check-string-index si 'string-set!)
  (emit "    movl %eax, ~s(%esp)" (- si wordsize))  ;; save k
  (emit-expr (- si (* 2 wordsize)) env char)        ;; eax <- char
  (emit-check-character 'string-set!)
  (emit "    movl ~s(%esp), %ebx" si)               ;; ebx <- string + 6
  (emit "    movl ~s(%esp), %esi" (- si wordsize))  ;; esi = k (4 x bytes)
  (emit "    sar $~s, %esi" fixnum-shift)                ;; esi = k bytes
  (emit "    movb  %ah, -2(%ebx,%esi)"))            ;; s[k] <- object  -2  tag(-6) + lenfield_size(4)

;;-----------------------------------------------------------------------------------
;; A simple implementation of string literals using assember directives.
;;-----------------------------------------------------------------------------------

(define (emit-string-literal s)             ;; IS THIS USED ???
  (let ([data (unique-label)]
	[load (unique-label)])
    (emit "# string literal")
    (emit "    jmp ~a" load)
    (emit "    .align 8,0x90") ;; strings are 8-byte aligned
    (emit "~a :" data)
    (emit "    .int ~a" (* 4 (string-length s)))
    (emit "    .ascii ~s" s)  ;; Code Injection VULNERABILITY!?
    (emit "~a:" load)
    (emit "    movl $~a, %eax" data)
    (emit "    orl $~a, %eax" string-tag)))

(define (emit-tail-string-literal s)
  (emit-string-literal s)
  (emit "    ret"))

;;-----------------------------------------------------------------------------------
;;                            Label - external libraries
;;-----------------------------------------------------------------------------------
;; Here we employ a label form to compile expressions and save the resulting
;; object at the label given in the form.  It works like a bridge between our
;; expression language and the underlying assember labels.
;;
;;  (label ((L1 E1) ... ) E)
;;
;; That evaluates E and stores it in a location defined by a global label L1.
;; The L1 passes through to the assembler.
;;
;; Important: the label is an asm symbol which is restricted to letters, digits,
;; and 3 symbols _ . $ (that is underscore, dot, and dollar sign).  Other stuff
;; is not allowed, so we must be cautious in what we write for Li. See asmify below.
;;
;; Unlike let, the labels are not defined in the environment.  All labels are global
;; and their content may be accessed anywhere with the form primitive-ref.
;;-----------------------------------------------------------------------------------

(define (labels? expr)
  (and (pair? expr) (eq? (car expr) 'labels)))
(define labels-bindings second)
(define labels-body third)    ;; eliminate body for now

;; this is only used for separately compiled libraries
;; could parameterize library name
;; wondering if we could separate labels construct from
;; the construct for libraries.  Lables might be useful in the main routine
;; things like complex constants and top-level defines.

(define (emit-labels si env expr)   
  (let* ([bindings (labels-bindings expr)]
	 [syms (map first bindings)]
	 [labs (map asmify syms)]
	 [exprs (map second bindings)]
	 [body (labels-body expr)]
	 )
    (emit "     .data")
    (for-each (lambda (l)
	       (emit "     .global ~s" l)
	       (emit "     .align 8")
	       (emit "~a:" l)
	       (emit "     .int 0xFF"))
	     labs)
    (emit "     .text")
    (emit "     .global base_init")  ;; generalize later
    (emit "     .align 4")
    (emit "base_init:")
    (for-each (lambda (l e)
	       (emit-expr si env (apply-transforms e))
	       (emit "     movl %eax, ~a" l))
	     labs
	     exprs)
    (emit-expr si env body)
    (emit "    .extern base_init_callback")    ;; see emit-scheme-entry
    (emit "    jmp base_init_callback")
    ))
  
(define (emit-primitive-set! si env expr)  ;; not used yet
  (emit-expr si env (third expr))
  (emit "    movl %eax,~a" (asmify (second expr))))

(define (emit-primitive-ref si env expr)
  (let ([gl (asmify (second expr))])
    (emit "    .extern ~a" gl)      ;; could float these to the top
    (emit "    movl ~a,%eax" gl)))

(define (emit-tail-primitive-ref si env expr)
  (emit-primitive-ref si env expr)
  (emit "    ret"))

;;-----------------------------------------------------------------------------------
;;                 Symbols, Libraries, and Separate Compilation
;;-----------------------------------------------------------------------------------
;; Symbols are similar to pairs in having two fields a string and a value
;; Symbols are allocated in the heap.  They are always aligned on an 8-byte boundary.
;; Nicely compact since pairs are 8-bytes anyway.  
;;
;;                           +--------------+
;;    (Ptr - symbol-tag) --> |    string    | 0  
;;                           +--------------+
;;                           |    value     | 4 
;;                           +--------------+
;;
;; New symbols are created with make-symbol which acts analogous to cons.
;;
;;   (make-symbol <string> <value>)
;;   (string-set! <symbol> <string>)
;;   (value-set! <symbol> <value>)
;;
;; The basic utility of symbols is that they can be compared for equality.
;;
;; So when we are faced with the possibility of creating a new symbol, we first
;; check if a symbol with that string has already been created and if so re-use
;; that symbol.  That way the string acts as a unique index to the value.
;; The functions below provide that mechanism.
;;
;;   (symbols)   returns a list of all interned symbols
;;   (symbol->string <symbol>)
;;   (symbol-value <symbol>)    ;; returns the value (what is standard for this?)
;;   (string->symbol <string>)  ;; this one does the work; it is defined in base.scm
;;
;;-----------------------------------------------------------------------------------
;;   (primitive-ref x)    
;;   (primitive-set! x v)
;;-----------------------------------------------------------------------------------

(define-primitive (symbol? si env arg)
  (emit-expr si env arg)
  (emit "    and $~s, %al" symbol-mask)
  (emit "    cmp $~s, %al" symbol-tag)
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f)) 

(define-primitive (make-symbol si env arg1 arg2)
  (emit "# make-symbol arg1=~s arg2=~s" arg1 arg2);
  (emit-expr si env arg1)                        ;; evaluate arg1
  (emit "    movl %eax, ~s(%esp)" si)            ;; save value of arg1
  (emit-expr (- si wordsize) env arg2)           ;; evaluate arg2
  (emit "    movl %eax, ~s(%ebp)" value-offset)  ;; arg2 -> value
  (emit "    movl ~s(%esp), %eax" si)            ;; get value of arg1
  (emit "    movl %eax, ~s(%ebp)" string-offset) ;; arg1 -> string
  (emit "    movl %ebp, %eax")                   ;; get ptr to symbol record
  (emit "    orl  $~s, %eax" symbol-tag)         ;; or in the symbol tag
  (emit "    add  $~s, %ebp" size-symbol)        ;; bump heap ptr
  (emit "# make-symbol end"))

(define-primitive (symbol->string si env arg)
  (emit "# symbol->string ~s" arg)
  (emit-expr si env arg)
  (emit "    movl ~s(%eax), %eax" (- string-offset symbol-tag)))

(define-primitive (symbol-value si env arg)
  (emit-expr si env arg)
  (emit "    movl ~s(%eax), %eax" (- value-offset symbol-tag))) 
   
;;-----------------------------------------------------------------------------------
;;                            procedures and closures
;;-----------------------------------------------------------------------------------
(define-primitive (procedure? si env expr)
  (emit-expr si env expr)
  (emit "    and $~s, %al" closure-mask)
  (emit "    cmp $~s, %al" closure-tag)
  ; convert cc to a Boolean
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit);
  (emit "    or $~s, %al" bool-f))
  
;;-----------------------------------------------------------------------------------
;;                         Processing Primitive Calls
;;-----------------------------------------------------------------------------------

(define (primitive? x)
  (and (symbol? x) (getprop x '*is-prim*)))

(define (primitive-emitter x)
  (or (getprop x '*emitter*)
      (error "primitive-emitter" "no emitter defined for ~s" x)))

(define (primcall? x)
  (and (pair? x) (primitive? (car x))))

(define (emit-primcall si env x)
  (let ([prim (car x)] [args (cdr x)])
    (check-primcall-args prim args)
    (apply (primitive-emitter prim) si env args)))

(define (emit-tail-primcall si env x)
  (emit "# tail primcall")
  (let ([prim (car x)] [args (cdr x)])
    (check-primcall-args prim args)
    (apply (primitive-emitter prim) si env args)
    (emit "#return from tail ~a" x)
    (emit "    ret")
  ))

(define (check-primcall-args prim args)
  (if (eq? (length args) (getprop prim '*arg-count*))
      #t
      (error prim (format "wrong number of arugments to ~s" prim))))

(define unique-label
  (let ([count 0])
    (lambda ()
      (let ([L (format "_L_~s" count)])
    (set! count (add1 count))
    L))))

;;-----------------------------------------------------------------------------------
;;                                  Conditionals
;;-----------------------------------------------------------------------------------

(define (if? x) (and (pair? x) (eq? (car x) 'if) (eq? 4 (length x))))
(define (if-test x) (cadr x))
(define (if-conseq x) (caddr x))
(define (if-altern x) (cadddr x))

(define (emit-if si env x)
  (let ([alt-label (unique-label)]
    [end-label (unique-label)])
    (emit-expr si env (if-test x))
    (emit "    cmp $~s, %al" bool-f)
    (emit "    je ~a" alt-label)
    (emit-expr si env (if-conseq x))
    (emit "    jmp ~a" end-label)
    (emit "~a:" alt-label)
    (emit-expr si env (if-altern x))
    (emit "~a:" end-label)))

(define (emit-tail-if si env x)
  (let ([alt-label (unique-label)]
    [end-label (unique-label)])
    (emit-expr si env (if-test x))
    (emit "    cmp $~s, %al" bool-f)
    (emit "    je ~a" alt-label)
    (emit-tail-expr si env (if-conseq x))
    (emit "    jmp ~a" end-label)
    (emit "~a:" alt-label)
    (emit-tail-expr si env (if-altern x))
    (emit "~a:" end-label)))

;;-----------------------------------------------------------------------------------
;;  (and) => #t
;;  (and E) => E
;;  (and E ...) => (if E (and ...) #f)
;;  
;;  (or) => #f
;;  (or E) => E
;;  (or E ...) => (let ((z E1)) (if z z (or ...)))
;;-----------------------------------------------------------------------------------

(define (and? x) (and (pair? x)(symbol? (car x)) (eq? (car x) 'and)))

(define (emit-and si env x)
  (cond
   [(eq? (length x) 1) (emit-expr si env #t)]
   [(eq? (length x) 2) (emit-expr si env (cadr x))]
   [else (emit-expr si env (list 'if (cadr x) (cons 'and (cddr x)) #f))]))

(define (emit-tail-and si env x)
  (cond
   [(eq? (length x) 1) (emit-tail-expr si env #t)]
   [(eq? (length x) 2) (emit-tail-expr si env (cadr x))]
   [else (emit-tail-expr si env (list 'if (cadr x) (cons 'and (cddr x)) #f))]))

(define (or? x) (and (pair? x) (symbol? (car x)) (eq? (car x) 'or)))

;; emit-or is TRICKY;; Be careful not to evaluate (cadr x) twice. A mistake
;; when evaluating (cadr x) has side effects.

(define (emit-or si env x)
  (cond
   [(eq? (length x) 1) (emit-expr si env #f)]
   [(eq? (length x) 2) (emit-expr si env (cadr x))]
   [else (emit-expr si env (let ([z (unique-rename 'z)])
	     		      (list 'let (list (list z (cadr x)))
					  (list 'if z z (cons 'or (cddr x))))))]))

(define (emit-tail-or si env x)
  (cond
   [(eq? (length x) 1) (emit-tail-expr si env #f)]
   [(eq? (length x) 2) (emit-tail-expr si env (cadr x))]
   [else (emit-tail-expr si env (let ([z (unique-rename 'z)])
				  (list 'let (list (list z (cadr x)))
					  (list 'if z z (cons 'or (cddr x))))))]))

;;-----------------------------------------------------------------------------------
;;                            Local Variables
;;-----------------------------------------------------------------------------------
;;
;; Local variables are introduced with let.  They are allocated on the stack relative
;; to the stack pointer %esp.
;;
;; (let ((v E) ...) E)
;;
;; NOTE -- IN PROCESS OF MOVING THIS IN PRE-PROCESSING If multiple expressions are in
;; the let-body we wrap a begin around them on-the-fly to normalize them into the
;; above form. (STOP DOING THIS)
;;
;; (let ((v E) ...) E E ...) => (let ((v E) ...) (begin E E ...))
;;
;;-----------------------------------------------------------------------------------

(define (let? x)
  (and (pair? x) (eq? (car x) 'let)))
(define let-bindings second)
(define let-body third)

;;-----------------------------------------------------------------------------------
;;                          Environment
;;-----------------------------------------------------------------------------------
;; We keep bindings in an environment.  Bindings assoicate variables with information
;; on where they are stored.  Typically this is an offset either in the heap with
;; respect to the current closure pointer, or in the stack as an offset from the
;; start of the current stack frame.  Other entities such as constants can be found
;; in the environment.
;;
;;

(define lhs car)
(define rhs cadr)
(define bind cons)

(define (extend-env si env var)
  (cons (bind var si) env))

(define (lookup var env)   ;; env is a list of dotted pairs
  (let ([pair (assoc var env)])
    (and pair (cdr pair))))


;; Have I isolated the environment representation enough to change it here?  Probably
;; not.  It might be helpful to do so. We need some way to look at a binding and tell
;; if it is 1) a stack allocated objects  2) a closure allocated object

;;-----------------------------------------------------------------------------------
;;   (let ((v E) ...) E)
;;-----------------------------------------------------------------------------------

(define (next-stack-index si) (- si wordsize))

(define (emit-let si env bindings body)
  (emit "# emit-let")
  (emit "#  si   = ~s" si)
  (emit "#  env  = ~s" env)
  (emit "#  bindings = ~s" bindings)
  (emit "#  body = ~s" body)
  (let f ((si si) (new-env env) (b* bindings))
     (cond
       [(null? b*)  (emit-expr si new-env body)]
       [else
         (let ([b (car b*)])
           (emit-expr si env (rhs b))
           (emit-stack-save si)
           (f (next-stack-index si)
              (extend-env si new-env (lhs b))
              (cdr b*)))])))

(define (emit-tail-let si env bindings body)
  (emit "# emit-tail-let")
  (emit "#  si   = ~s" si)
  (emit "#  env  = ~s" env)
  (emit "#  bindings = ~s" bindings)
  (emit "#  body = ~s" body)
  (let f ((si si) (new-env env) (b* bindings))
     (cond
       [(null? b*)  (emit-tail-expr si new-env body)] ;; <-- key difference
       [else
         (let ([b (car b*)])
           (emit-expr si env (rhs b))
           (emit-stack-save si)
           (f (next-stack-index si)
              (extend-env si new-env (lhs b))
              (cdr b*)))])))

;;-----------------------------------------------------------------------------------
;; letrec is similar to let, but it must create all of the variables  before
;; evaluating any of the E so any E can reference any of the v in the list of
;; bindings.  Has to support mutual recursion.
;;
;;     (letrec ([v E] ...) E)
;;
;; Consider
;;
;;   (letrec ([even? (lambda (x) (if (zero? x) #t (odd? (fx- x 1))))]
;;            [odd?  (lambda (x) (if (zero? x) #f (even? (fx- x 1))))])
;;      (even? 14))
;;
;; Our implementation uses vectorize-letrec to rewrite letrec into a let with local
;; variables replaced by singlton vectors and variable references replaced by
;; vector-ref.  That extra leval of indirection is needed to make circular references
;; and mutual recursive fuctions work.
;; 
;; Later will look at how to optimize this away the cases when the full generality is
;; not needed.
;;-----------------------------------------------------------------------------------

(define (letrec? expr)
  (and (pair? expr) (symbol? (car expr)) (eq? (car expr) 'letrec)))
(define letrec-bindings second)
(define letrec-body third)

(define (emit-variable-ref env var)
  (emit "# emit-variable-ref")
  (emit "# env=~s" env)
  (emit "# var=~s" var)
  (let ([i (lookup var env)])
    (cond
     [(and (fixnum? i) (fx> i 0))
        (emit-frame-load i var)]
     [else
      (emit-stack-load i var)]))
  (emit "# end emit-variable-ref"))

(define (emit-tail-variable-ref env var)
  (emit "# emit-tail-variable-ref")
  (emit-variable-ref env var)
  (emit "    ret")
  (emit "# end emit-tail-variable ref")
  )

;;-----------------------------------------------------------------------------------
;; Stack/closure save and load abstracted slightly.
;; These are used occasionally here and there.
;; Did not commit to use these abstractions everywhere.
;; Not sure whether they clarify or obscure.
;;-----------------------------------------------------------------------------------

 (define (emit-stack-save si)
  (emit "    movl %eax, ~s(%esp)  # stack save" si))

(define (emit-stack-load si var)
  (emit "    movl ~s(%esp), %eax  # stack load ~a" si var))

(define (emit-frame-save ci)
  (emit "    movl %eax, ~s(%edi)  # frame save" (- ci closure-tag)))

(define (emit-frame-load ci var)
  (emit "    movl ~s(%edi), %eax  # frame load ~a" (- ci closure-tag) var))

;;-----------------------------------------------------------------------------------
;;                                Procedures
;;-----------------------------------------------------------------------------------

(define (unique-labels lvars)
    (define (assign-label v) (unique-label))
    (map assign-label lvars))

(define (make-initial-env lvars labels)
  (cond
   [(null? lvars) '()]
   [else (cons (cons (car lvars) (car labels))
	       (make-initial-env (cdr lvars) (cdr labels)))])) 

(define empty? null?)

;;-----------------------------------------------------------------------------------------------
;;      Procedure Call           (funcall f arg* ...)
;;-----------------------------------------------------------------------------------------------
;;  
;;     +--  +------------+         si          +--    +------------+
;;     |    |   arg 3    |         |           |      |   arg 3    |            (si-20)->si'-16
;;     |    +------------+         V           |      +------------+
;; outgoing |   arg 2    |  esp - 32        incoming  |   arg 2    |  esp - 12  (si-16)->si'-12
;; args     +------------+                  args      +------------+
;;     |    |   arg 1    |  esp - 28           |      |   arg 1    |  esp - 8   (si-12)->si'-8
;;     +--  +------------+                     +--    +------------+
;;          |            |  esp - 24                  |  closure   |  esp - 4   (si-8)->si'-4
;;          +------------+                            +------------+
;;          |            |  esp - 20        base -->  |  return    |  esp       (si+4)->si'
;;     +--  +------------+                            +------------+
;;     |    |  local 3   |  esp - 16    +---------->                       (C) How callee frame
;;     |    +------------+              |                                      looks to caller
;;  locals  |  local 2   |  esp - 12    |          (B)  Callee's view          wrt si
;;     |    +------------+              |                                               
;;     |    |  local 1   |  esp - 8    si        old eip = return point
;;     +--  +------------+              |         old edi = saved closure ptr
;;          |  closure   |  esp - 4     |         Note that args/locals
;;          +------------+              |           start at %esp - 8
;; base --> |  return    |  esp    <----+
;;          +------------+                         si = offset to top stack elt at funcall
;;           high address                               (in this example -16)  
;;                       
;;        (A) Caller's view                        si-8 = amount to shift the stack base
;;                                                 
;;
;;  Note: The old edi will be the same as the content of the edi register normally
;;        The caller restores the frame's edi upon return by loading closure from esp-4
;;        The callee simply returns and does not mess with the closure slot
;;
;;                                              figure 3
;;-----------------------------------------------------------------------------------------------

;;-----------------------------------------------------------------------------------
;;   Invariants
;;
;;  esp - si - 12     next frame arg 1
;;  esp - si - 8      next frame closure
;;  esp - si - 4      next frame return
;;  esp - si          points to the top local frame element
;;  esp - 4 - 4N - i  local var i... (optional)
;;  esp - 4 - 4N      local argN     (optional)
;;  esp - 8           local arg 1    (optional)
;;  esp - 4           closure pointer |  used to restore ecp when callee returns
;;  esp - 0           return pointer  |  when the frame goes away
;;
;;-----------------------------------------------------------------------------------

(define funcall-args cddr)
(define funcall-oper cadr)

(define (emit-funcall si env expr)
  
  (define (emit-arguments si env args)
    (unless (empty? args)
        (emit-expr si env (first args))                            ;; evaluated arg in %eax
        (emit "    mov %eax, ~s(%esp)  # arg ~a" si (first args))  ;; save %eax as evaluated arg
        (emit-arguments (- si wordsize) env (rest args))))         ;; recursively emit the rest
  
  (define (emit-adjust-base delta-si)
    (unless (eq? delta-si 0)
	    (emit "    add $~s, %esp   # adjust base" delta-si)))
  
  (emit "# funcall")
  (emit "#    si   =~s" si)
  (emit "#    env  = ~s" env)
  (emit "#    expr = ~s" expr)

  ;; Evaluate the funcall-oper and stash it esp+si+8
  ;; This becomes the next frame's closure slot.  See figure 3. (B)(C)
  (emit-expr (- si 8) env (funcall-oper expr))

  ;; check that funcall-oper is a procedure and if not call error handler
  ;; uses ebx as a scratch register.
  (emit-check-procedure)


  (emit "   movl %eax,  ~s(%esp)  # stash funcall-oper in closure slot" (- si 8))

  ;; evaluate the arguments ar1 ... argN and push on stack
  (emit-arguments (- si 12) env (funcall-args expr))

  ;; Load new frame closure into edi
  (emit "    movl ~s(%esp), %edi   # load new closure to %edi" (- si 8))

  (emit-adjust-base si)        ;; the value of %esp is adjusted by si

  ;; save argument count where called function can check it
  (emit-save-arg-count (length (funcall-args expr)))
  
  ;; call first bumps %esp by 4 and then saves %eip at 0(%esp).  
  (emit "    call *-2(%edi)        # call thru closure ptr")
                                   ;; closure ptr in %eax since arg1 emitted last
  
  (emit-adjust-base (- si))        ;; After return the value of %esp is adjusted back
                                   ;; for tail recursive version below, we do not adjust
                                   ;; adjust the base, we shift args instead
  (emit "    movl -4(%esp), %edi   # restore closure frame ptr")
  )

;;-----------------------------------------------------------------------------------
;; In tail position, we do not need to allocate a new frame.  Instead, we will re-use
;; the old frame.  We keep the return pointer.  But we will reset the frame slots for
;; the current closure and args.  We mimic the implementation above to build the
;; new frame, but then we slide the new frame down to overwrite the caller's frame,
;; keeping only the frame's return address.
;;-----------------------------------------------------------------------------------

(define (emit-tail-funcall si env expr)
  
  (define (emit-arguments si env args)
    (unless (empty? args)
        (emit-expr si env (first args))                ;; evaluated arg in %eax
        (emit "    mov %eax, ~s(%esp)    # arg ~a" si (first args))   ;; save %eax as evaluated arg    
        (emit-arguments (- si wordsize) env (rest args)))) ;; recursively emit the rest
  
  (define (emit-shift-frame size si delta)
    (emit "# emit-shift-args:  size=~s   si=~s  delta=~s" size si delta)
    (unless (zero? size)
	   (emit "    mov ~a(%esp), %ebx  # shift frame cell" si)
	   (emit "    mov %ebx, ~a(%esp)  # down to base" (+ si delta))
	   (emit-shift-frame (- size 1) (- si wordsize) delta)))
  
  (emit "# emit-tail-funcall")
  (emit "#    si   =~s" si)
  (emit "#    env  = ~s" env)
  (emit "#    expr = ~s" expr)

  ;; Evaluate the funcall-oper and save it on the stack
  (emit-expr si env (funcall-oper expr))
  (emit "   movl %eax,  ~s(%esp)  # stash funcall-oper in next closure slot" si)

  ;; Evaluate the arguments arg[0] ... arg[k-1] and put them on stack above oper 
  (emit-arguments (- si 4) env (funcall-args expr))

  ;; Load new frame closure into edi
  (emit "    movl ~s(%esp), %edi   # load new closure to %edi" si)

  ;; shift the whole frame (closure + args) down by |si|-4
  (emit-shift-frame (1+ (length (funcall-args expr)))  ;; size
		    si                                 ;; si
		    (- (abs si) 4))                    ;; delta

  ;; save argument count where called function can check it
  (emit-save-arg-count (length (funcall-args expr)))
  
  (emit "    jmp *-2(%edi)  # tail-funcall")
  )  ;; jump to closure entry point


;;-----------------------------------------------------------------------------------
;;      (begin E* ... )
;;-----------------------------------------------------------------------------------

(define begin-body cdr)

(define (emit-begin si env expr)
  (emit "# emit-begin")
  (emit "#   expr=~s" expr)
  (emit "#   env=~s" env)
  (cond
   [(null? (begin-body expr)) '()]
   [else
     (emit-expr si env (car (begin-body expr)))
     (emit-expr si env (cons 'begin (cdr (begin-body expr))))]))

(define (emit-tail-begin si env expr)  ;; this is the body, not the expr
  (emit "# tail-begin ~s" expr)
  (emit "#   env=~s" env)  
  (cond
   [(null? (begin-body expr))
     (emit "    ret   # return thru stack")]
   [(eq? (length (begin-body expr)) 1)
    (emit-tail-expr si env (first (begin-body expr)))
    (emit "     ret   # return thru stack")] ;; <<<----- NEW: I think this is needed!
   [else
    (emit-expr si env (car (begin-body expr)))
    (emit-tail-expr si env (cons 'begin (cdr (begin-body expr))))]))

;;-----------------------------------------------------------------------------------
;;                                      Closures
;;-----------------------------------------------------------------------------------
;;                       low addr
;;                   +--------------+                     Closure tag is 010
;;    closure-2  --->|    label     |   %ebp              so closure-2 is pointer
;;                   +--------------+                     to an 8-byte aligned
;;                   |  free var 0  |   %ebp + 4          memory location.
;;                   +--------------+
;;                   |  free var 1  |   %ebp + 8          Element at the location
;;                   +--------------+                     is a label that be passed
;;                   |     ...      |    ...              to jmp or call to execute 
;;                   +--------------+                     a procedure
;;                   | free var k-1 |   %ebp + 4 * k
;;                   +--------------+                     The closure value in the
;;                       high addr                        stack is the tagged
;;                                                        closure form.
;;
;; A closure form is the result of making the free variables in a lambda expression
;; explicit by a process called "free variable analysis".  A pre-processing pass
;; converts all expressions (and sub-espressions) of the form
;;
;;   (lambda (V[0] ... V[j-1] body)                       where V[i] are the j
;;                                                        formal variables
;;
;;  to corresponding expressions of the form
;;
;;   (closure (V[0] ... V[j-1]) (W[0] ...W[k-1]) body)    where W[i] are the k
;;                                                        variables free in body
;;
;; The closure will compile to code like the following
;;
;;   Alloc heap space for label + free variables
;;   Set the label field to L_yy
;;   Initialize the free vars from the binding environment
;;   Return the tagged pointer to the heap allocated closure
;;   Jmp L_zz
;;   L_yy:
;;   Closure body code (Gets all free vars from the closure!!!)
;;   L_zz
;;
;; Consider that set! will not work since a variable introduced by let or lambda
;; might be stored both in the closure and on the stack.  Use Dybvig's rewrite to
;; replace any such variables with singleton vectors to solve this. 
;;-----------------------------------------------------------------------------------

(define (closure? expr)
   (and (pair? expr) (eq? (car expr) 'closure)))

(define closure-formals second)
(define closure-freevars third)
(define closure-body fourth)

(define (emit-closure si env expr)
  (emit "# emit-closure")
  (emit "# si = ~s" si)
  (emit "# env = ~s" env)
  (emit "# expr = ~s" expr)  
  (let* ([formals (closure-formals expr)]
	 [freevars (closure-freevars expr)]
	 [body (closure-body expr)]
	 [closed-env (extend-closure-env env freevars)]
	 [entry-point (unique-label)]
	 [exit-point (unique-label)]
	 [k (length freevars)]
	 [size (* 4 (+ k 1))])   ;; 4*(k + 1)

    ;;-----------------------------------------------------------
    ;; Build a closure object in the heap
    ;;-----------------------------------------------------------
    
    ;; Set the label field to L_yy
    (emit "    movl $~a, 0(%ebp)  # closure label" entry-point)  ;; fills %ebp + 0 <-- label
    
    ;; Copy the free vars values from the binding environment to the closure
    ;; or reserve space if unbound.  Q: what happens with the unbound vars?
    (emit-close-free-vars 4 env freevars)  ;; fills %ebp + 4 ... %ebp + (4*k)
    
    ;; Return the tagged pointer to the heap allocated content
    (emit "    movl %ebp, %eax   # get the base ptr")
    (emit "    add $~s, %eax     # add the closure tag"  closure-tag)
    (emit "    add $~s, %ebp     # bump ebp" (align-to-8-bytes size))
    (emit "    jmp ~a            # jump around closure body"  exit-point) 

    ;;------------------------------------------------------------------
    ;; Build the code to execute the closure body using the closed
    ;; environment so any free variable references all resolve to cells
    ;; in the closure object
    ;;------------------------------------------------------------------
    
    (emit "~a:" entry-point)         ;; this is the label that we put in the closure
    (emit-check-arg-count (length formals))
    (let f ([fmls formals]
	    [si (- (* 2 wordsize))]  ;; Q: why this value for si ???  -8 ???
	    [env closed-env])      
      (cond
       [(empty? fmls)
	(emit-tail-expr si env body)]
       [else
	(f (rest fmls)
	   (- si wordsize)
	   (extend-env si env (first fmls)))]))
    (emit "    .align 4,0x90")
    (emit "~a:" exit-point)    
    ))

(define (emit-tail-closure si env expr)
  (emit-closure si env expr)
  (emit "   ret"))

 (define (extend-formals-env env fmsl)
   (let f ([fmls fmsl] [ci (* -2 wordsize)] [env env])  ;; Why -2 * wordsize??  = -8
    (cond
     [(empty? fmls) env]
     [else
      (f (rest fmls)
	 (- ci wordsize)
	 (extend-env ci env (first fmls)))]))) 

(define (emit-close-free-vars ci env vars)
  (unless (null? vars)
	  (if (lookup (car vars) env) ;; only initialize closure-variables
	                              ;; that exist in the binding environment.
	      (begin
		(emit-variable-ref env (car vars))  ;; reference the value of the first variable
		(emit "   movl  %eax, ~s(%ebp)  # ~s" ci (car vars))) ;; copy that value to the closure cell
	      (emit "# WARNING: free var ~s not defined in the environmnet" (car vars)))
	  (emit-close-free-vars (+ 4 ci) env (cdr vars))))  ;; recursively process remaining free vars

(define (extend-closure-env env frev)
  (let f ([frev frev] [ci wordsize] [env env])
    (cond
     [(empty? frev) env]
     [else
      (f (rest frev)
	 (+ ci wordsize)
	 (extend-env ci env (first frev)))])))

 
(define (align-to-8-bytes i)    ;; rounds i up to next multiple of 8
    (if (zero? (remainder i 8))
	i
	(+ i (- 8 (remainder i 8)))))

;;-------------------------------------------------------------------------------------
;;                                Foreign functions
;;-------------------------------------------------------------------------------------
;;
;; Our Scheme implementation cannot exist in isolation. It needs a way of interacting
;; with the host operating system in order to perform Input/Output and many other useful
;; operations. We now add a very simple way of calling to foreign C procedures.
;; We add one additional form to our compiler:
;;    <Expr> ::= (foreign-call <string> <Expr> ...)
;; The foreign-call form takes a string literal as the first argument. The string
;; denotes the name of the C procedure that we intend to call. Each of the expressions
;; are evaluated first and their values are passed as arguments to the C procedure. The
;; calling convention for C differs from the calling convention that we have been using
;; for Scheme in that the arguments are placed below the return point and in reverse
;; order. Figure 4 illustrates the difference.  (Ghuloum 2006)
;;
;;                 low addr                                    low addr
;;               +------------+                             +------------+
;;               |   ...      |                             |    ...     |
;;         +--   +------------+                             +------------+
;;         |     |   arg 3    |  %esp - 12                  |   return   |  %esp
;;         |     +------------+                             +------------+
;;      incoming |   arg 2    |  %esp - 8                   |   arg 1    |  %esp - 4    
;;      args     +------------+                             +------------+
;;         |     |   arg 1    |  %esp - 4                   |   arg 2    |  %esp - 8  
;;         +--   +------------+                             +------------+
;;    base---->  |  return    |  %esp                       |   arg 3    |  %esp - 12        
;;               +------------+                             +------------+
;;
;;      (A) Parameter passing to Scheme                (B) Parameter passing to C
;;
;;                                      fig 4
;;
;; If only it were that simple.  OSX throws a wrench in the works by insisting that esp
;; be aligned on a 16 byte boundary at the time that the call is made.  Since our
;; call migth be made from anywhere, we need to adjust for the proper alignment at run
;; time.  But since all the arguments need to evaluated in the original Scheme stack
;; frame we adopt a simple expedient.  We calcuale all the arguments first, then we shift
;; them up just before making the call.  Since we are going to need to restore the esp, we
;; will save that in the stack as well just below the last argument.  Our scheme ends
;; up looking like this:
;;
;;
;;  (diagrams go here - pull from notes on yellow pad)
;;
;;
;;-------------------------------------------------------------------------------------

(define foreign-call-proc second)
(define foreign-call-args cddr)

(define (emit-foreign-call si env expr)
  
  (define (emit-args si env args)
    (unless (null? args)
	    (emit-expr si env (car args))
	    (emit "    movl %eax, ~s(%esp)" si)
	    (emit-args (- si wordsize) env (cdr args))))

  (define (shift-frame m n)
    (unless (> m n)
	    (emit "    movl ~s(%edi),%eax" m)
	    (emit "    movl %eax,~s(%esi)" m)
	    (shift-frame (+ m 4) n)))

  (let* ([proc (foreign-call-proc expr)]
	 [args (foreign-call-args expr)]	 
	 [k (length args)])

    ;; preserve ecx on stack at esp - si
    (emit  "    movl %ecx,~s(%esp)" si)

    ;; push esp on stack at esp-si-4
    (emit  "    movl %esp,~s(%esp)" (- si wordsize))

    ;; push arg1...argK at esp-si-4-4*1 ... exp-si-4-4*k
    (emit-args (- si (* 2 wordsize)) env (reverse args))

    ;; set edi to esp-si-4-4*k, where last argument was pushed
    (emit "    leal ~s(%esp),%edi" (- si 4 (* 4 k)))

    ;; set esi to result of making edi value 16-byte aligned
    (emit "    movl %edi,%esi")
    (emit "    andl $-16,%esi")   ;; clear bottom 4 bytes of esi

    ;; shift k+1 values at edi & below, up to esi position.
    (shift-frame 0 (+ 1 (* 4 k)))

    ;; set esp to esi
    (emit "    movl %esi,%esp")
    
    ;; now make the call
    (emit "    .extern _~a" proc)

    (emit "    call _~a" proc)
    ;;(emit "    xorl %eax,%eax")  ;; from the model; necessary???
    
    ;; restore the esp from esi+4*k
    (emit "    movl ~s(%esi),%esp" (* 4 k))
    
    ;; restore ecx
   (emit "    movl ~s(%esp),%ecx" si) 
   ))


(define (emit-tail-foreign-call si env expr)
  (emit-foreign-call si env expr)
  (emit "     ret"))

;;---------------------------------------------------------------------------
;;                      Error Checking and Safe Primitives
;;---------------------------------------------------------------------------
;; Using our newly acquired ability to write and exit, we can define a simple
;; error procedure that takes two arguments: a symbol (denoting the caller of
;; error), and a string (describing the error). The error procedure would
;; write an error message to the console, then causes the program to exit.

;; With error, we can secure some parts of our implementation to provide
;; better debugging facilities. Better debugging allows us to progress with
;; implementing the rest of the system more quickly since we won’t have to
;; hunt for the causes of segfaults.
;;
;; There are three main causes of fatal errors:
;;
;; 1. Attempting to call non-procedures.
;;
;; 2. Passing an incorrect number of arguments to a procedure.
;;
;; 3. Calling primitives with invalid arguments.  For example: performing
;;    (car 5) causes an immediate segfault. Worse, performing vector-set! with
;;    an index that’s out of range causes other parts of the system to get corrupted,
;;    resulting in hard-to- debug errors.
;;
;; Calling nonprocedures can be handled by performing a procedure check before
;; making the procedure call. If the operator is not a procedure, control is
;; transferred to an error handler label that sets up a call to a procedure that
;; reports the error and exits.
;;
;; Passing an incorrect number of arguments to a procedure can be handled by a
;; collaboration from the caller and the callee. The caller, once it performs
;; the procedure check, sets the value of the %eax register to be the number of
;; arguments passed. The callee checks that the value of %eax is consistent with
;; the number of arguments it expects. Invalid arguments cause a jump to a label
;; that calls a procedure that reports the error and exits.
;;
;; For primitive calls, we can modify the compiler to insert explicit checks at
;; every primitive call. For example, car translates to:
;;
;;    movl %eax, %ebx
;;    andl $7, %ebx
;;    cmpl $1, %ebx
;;    jne L_car_error
;;    movl -1(%eax), %eax
;;    ...
;; L_car_error:
;;    movl car_err_proc, %edi  # load handler
;;    movl $0, %eax            # set arg-count
;;    jmp *-3(%edi)            # call the handler
;;    ...
;;
;; Another approach is to restrict the compiler to unsafe primitives. Calls to
;; safe primitives are not open-coded by the compiler, instead, a procedure call
;; to the safe primitive is issued. The safe primitives are defined to perform
;; the error checks themselves. Although this strategy is less efficient than
;; open-coding the safe primitives, the implementation is much simpler and less
;; error-prone.
;;                                             Quoted from (Ghuloum 2006)
;;------------------------------------------------------------------------------

(define (emit-check-procedure)  ;; uses ebx as a scratch register to check eax
  (when *safe-procedures*
	(let ([cont (unique-label)]
	      [eh (asmify 'eh_procedure)])
	  (emit "# check the funcall op is a procedure")
	  (emit "    movl %eax,%ebx")
	  (emit "    and $~s, %bl" closure-mask)
	  (emit "    cmp $~s, %bl" closure-tag)
	  (emit "    je ~s" cont)
          (emit "# invoke error handler funcall_non_procedure")
	  (emit "    .extern ~a" eh)
          (emit "    movl ~a, %edi  # load handler" eh)
          (emit "    movl $0, %eax  # set arg count")
          (emit "    jmp *~s(%edi)  # jump to the handler" (- closure-tag))
	  (emit "~s:" cont))))

(define (emit-check-fixnum f)  ;; uses ebx as a scratch register to check eax
  (when *safe-primitives*
	(let ([cont (unique-label)]
	      [eh (asmify 'eh_fixnum)])
	  (emit "# check the argument is a fixnum")
	  (emit "    movl %eax,%ebx")
	  (emit "    and $~s, %bl" fixnum-mask)
	  (emit "    cmp $~s, %bl" fixnum-tag)
	  (emit "    je ~s" cont)
          (emit "# error handler eh_fixnum")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a, %edi  # load handler" eh)
	  (emit "    movl $4, %eax  # set arg count")
	  ;; step on arg1 -- its ok, exiting ... can re-use stack frame
	  (emit "    movl $~a,-8(%esp)" (* 4 (primitive-code f)))
	  (emit "    jmp *~s(%edi)  # jump to the handler" (- closure-tag))
	  (emit "~a:" cont))))

(define (emit-check-character f)  ;; uses ebx as a scratch register to check eax
  (when *safe-primitives*
	(let ([cont (unique-label)]
	      [eh (asmify 'eh_character)])
	  (emit "# check the argument is a char")
	  (emit "    movl %eax,%ebx")
	  (emit "    and $~s, %bl" char-mask)
	  (emit "    cmp $~s, %bl" char-tag)
	  (emit "    je ~s" cont)
          (emit "# invoke error handler eh_character")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a, %edi  # load handler" eh)
	  (emit "    movl $4, %eax  # set arg count")
	  ;; step on arg1 -- its ok, exiting ... can re-use stack frame
	  (emit "    movl $~a,-8(%esp)" (* 4 (primitive-code f)))	  
	  (emit "    jmp *~a(%edi)  # jump to the handler" (- closure-tag))
	  (emit "~a:" cont))))

(define (emit-check-pair f)  ;; uses ebx as a scratch register to check eax
  (when *safe-primitives*
	(let ([cont (unique-label)]
	      [eh (asmify 'eh_pair)])
	  (emit "# check the argument is a pair")
	  (emit "    movl %eax,%ebx")
	  (emit "    and $~s, %bl" pair-mask)
	  (emit "    cmp $~s, %bl" pair-tag)
	  (emit "    je ~a" cont)
          (emit "# invoke error handler eh_pair")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a, %edi  # load handler" eh)
	  (emit "    movl $4, %eax  # set arg count")
	  ;; step on arg1 -- its ok, exiting ... can re-use stack frame
	  (emit "    movl $~a,-8(%esp)" (* 4 (primitive-code f)))
	  (emit "    jmp *~a(%edi)  # jump to the handler" (- closure-tag))
	  (emit "~a:" cont))))

(define (emit-check-vector f)  ;; uses ebx as a scratch register to check eax
  (when *safe-primitives*
	(let ([cont (unique-label)]
	      [eh (asmify 'eh_vector)])
	  (emit "# check the argument is a vector")
	  (emit "    movl %eax,%ebx")
	  (emit "    and $~s, %bl" vector-mask)
	  (emit "    cmp $~s, %bl" vector-tag)
	  (emit "    je ~a" cont)
          (emit "# invoke error handler eh_vector")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a, %edi  # load handler" eh)
	  (emit "    movl $4, %eax  # set arg count")
	  ;; step on arg1 -- its ok, exiting ... can re-use stack frame
	  (emit "    movl $~a,-8(%esp)" (* 4 (primitive-code f)))
	  (emit "    jmp *~a(%edi)  # jump to the handler" (- closure-tag))
	  (emit "~a:" cont))))

(define (emit-check-string f)  ;; uses ebx as a scratch register to check eax
  (when *safe-primitives*
	(let ([cont (unique-label)]
	      [eh (asmify 'eh_string)])
	  (emit "# check the argument is a string")
	  (emit "    movl %eax,%ebx")
	  (emit "    and $~s, %bl" string-mask)
	  (emit "    cmp $~s, %bl" string-tag)
	  (emit "    je ~a" cont)
          (emit "# invoke error handler eh_string")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a, %edi  # load handler" eh)
	  (emit "    movl $4, %eax  # set arg count")
	  ;; step on arg1 -- its ok, exiting ... can re-use stack frame
	  (emit "    movl $~a,-8(%esp)" (* 4 (primitive-code f)))
	  (emit "    jmp *~a(%edi)  # jump to the handler" (- closure-tag))
	  (emit "~a:" cont))))

(define (emit-check-nonneg f)  ;; uses ebx as a scratch register to check eax
  (when *safe-primitives*      ;; assumes length is a fixnum, checks if >= 0
	(let ([cont (unique-label)]
	      [eh (asmify 'eh_length)])
	  (emit "# check the argument is a fixnum >= 0")
	  (emit "    cmp $0,%eax")
	  (emit "    jge ~a" cont)   
          (emit "# invoke error handler eh_length")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a, %edi  # load handler" eh)
	  (emit "    movl $4, %eax  # set arg count")
	  ;; step on arg1 -- its ok, exiting ... can re-use stack frame
	  (emit "    movl $~a,-8(%esp)" (* 4 (primitive-code f)))
	  (emit "    jmp *~a(%edi)  # jump to the handler" (- closure-tag))
	  (emit "~a:" cont))))

(define  (emit-check-vector-index si f)  ;; vector at %esp+si, fixnum index in %eax
  (when *safe-primitives*                ;; uses ebx as a scratch register
	(let ([cont (unique-label)]
	      [out-of-bounds (unique-label)]
	      [eh (asmify 'eh_vector_index)])
	  (emit "# check bounds on vector index")
	  (emit "    movl ~s(%esp), %ebx" si)
	  (emit "    cmp  %eax,~s(%ebx) " (- vector-tag))  
	  (emit "    jle ~a" out-of-bounds)
          (emit "    cmp  $0,%eax")  
          (emit "    jge ~a" cont)
	  (emit "~a:" out-of-bounds)
	  (emit "# invoke error handler eh_vector_index")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a,%edi   # load handler" eh)
	  (emit "    movl $4, %eax  # set arg count")
	  ;; step on arg1 - pass the primitive index to identify the call
	  (emit "    movl $~a,-8(%esp)" (* 4 (primitive-code f)))
	  (emit "    jmp *~a(%edi)  # jump to handler" (- closure-tag))
	  (emit "~a:" cont))))

(define  (emit-check-string-index si f)  ;; string at %esp+si, fixnum index in %eax
  (when *safe-primitives*                ;; uses ebx as a scratch register
	(let ([cont (unique-label)]
	      [out-of-bounds (unique-label)]
	      [eh (asmify 'eh_string_index)])
	  (emit "# check bounds on string index")
	  (emit "    movl ~s(%esp), %ebx" si)
	  (emit "    cmp  %eax,~s(%ebx) " (- string-tag))  
	  (emit "    jle ~a" out-of-bounds)
          (emit "    cmp  $0,%eax")  
          (emit "    jge ~a" cont)
	  (emit "~a:" out-of-bounds)
	  (emit "# invoke error handler eh_string_index")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a,%edi   # load handler" eh)
	  (emit "    movl $4, %eax  # set arg count")
	  ;; step on arg1 - pass the primitive index to identify the call
	  (emit "    movl $~a,-8(%esp)" (* 4 (primitive-code f)))
	  (emit "    jmp *~a(%edi)  # jump to handler" (- closure-tag))
	  (emit "~a:" cont))))

(define (emit-save-arg-count argc)
  (when *safe-arg-counts*
	(emit "    movl $~s,%eax   # save arg count" (* 4 argc))))

(define (emit-check-arg-count argc)
  (when *safe-arg-counts*
	(let ([cont (unique-label)]
	      [eh (asmify 'eh_argcount)])
	  (emit "# check argument count")
	  (emit "    cmp $~s,%eax" (* 4 argc))
	  (emit "    je ~a" cont)
	  (emit "# invoke error handler eh_argcount")
	  (emit "    .extern ~a" eh)
	  (emit "    movl ~a, %edi  # load handler" eh)
	  (emit "    movl $0, %eax  # set arg count")
	  (emit "    jmp *~s(%edi)  # jump to handler" (- closure-tag))
	  (emit "~a:" cont))))

;; Generate code for function that evaluates to the list of primitives
;; used by the error handlers

(define (generate-primitives)
  `(primitives (let ((p nil))
		 ,@(map (lambda (f) `(set! p (cons (quote ,f) p)))
			*primitive-names*)
		 (lambda () p))))
