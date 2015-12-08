;;--------------------------------------------------------------------------
;;
;;                            Pilar: A Scheme Compiler
;;                              by Mark Cornwell
;;
;;
;;                    Copyright (C) 2015, All Rights Reserved
;;
;;--------------------------------------------------------------------------
;;   Think first, then try.
;;                              -- The Little Schemer.
;;--------------------------------------------------------------------------
;;
;;  REFERENCES
;;
;; (Ghuloum 2006) Abdulaziz Ghuloum, An Incremental Approach to Compiler
;;                Development, Proceedings of the 2006 Scheme and Functional
;;                Programming Workshop, University of Chicago Technical Report
;;                TR-2006-06
;; 
;; 2.1 Closure
;; 1.9.3  String
;; 1.9.2  Vector
;; 1.9.1  Pair
;; 1.9 Heap Allocation
;; 1.8 Proper Tail Calls
;; 1.7 Procedures
;; 1.6 Local Variables
;; 1.5 Binary Primitives
;; 1.4 Conditional Expressions
;; 1.3 Unary Primitives
;; 1.2 Immediate Constants
;; 1.1 Integers
;;
;; Runs under petite chez scheme
;; See makefile for details.
;;
;;-----------------------------------------------------
;; Intermediate Language (IL):    DYBVIG's Version
;;
;;  Ref: (Dybig 1995) Compiler Construction Using Scheme, FPLE'95
;;
;;
;;   <Expr>   -> <Imm>
;;            |  <Ref>
;;            |  (begin <Expr> <Expr>)
;;            |  (if <Expr> <Expr> <Expr>)
;;            |  (<Prim> <Expr> ...)          ;; takes the place of app
;;            |  (<Expr> <Expr> ...)          ;; takes the place of funcall
;;            |  (closure ( <Var> ...) (<Ref> ...) <Expr>)
;;            |  (let ([<Var> <Expr>] ...) <Expr>)
;;
;;  <Ref>    ->  (free <num> <variable>)
;;            |  (bound <num> <variable>)
;;            |  (local <variable>)
;;
;;  <Prim>   ->  any symbol bound by define-primitive
;;
;;  <Immed>  ->  fixnum | boolean | char | null
;;
;;  <Var>    ->  symbols other than keywords
;;
;;  <Key>    ->  begin | if | closure | let | letrec
;;
;;
;;  COMMENTS
;;
;;  - The closure form behaves like lambda, but lists its free variables
;;    explicitly.
;;    When the closure executes it copies the free variables into a closure
;;    object and returns that object.
;;
;;  ISSUE
;;  - Do I really need to implement this <Ref> form in my scheme?  Why not just get the variables
;;    from the environment instead of rewriting them into the code?  It seems all I really need
;;    to fix my problem is to put the closure forms in place instead of floating them up out of
;;    their context.
;;-----------------------------------------------------

;;-----------------------------------------------------
;; Intermediate Language (IL):    PILAR Version
;;
;;  Ref: (Dybig 1995) Compiler Construction Using Scheme, FPLE'95
;;
;;
;;   <Expr>   -> <Imm>
;;            |  <Var>
;;            |  (begin <Expr> ... )
;;            |  (if <Expr> <Expr> <Expr>)
;;            |  (<Prim> <Expr> ...)          ;; takes the place of app
;;            |  (<Expr> <Expr> ...)          ;; takes the place of funcall
;;            |  (closure (<Formals>) (<FreeVars>) <Expr>)
;;            |  (let ([<Var> <Expr>] ...) <Expr>)
;;
;;  <Formals>  -> <Var> ...
;;
;;  <FreeVars> -> <Var> ...
;;
;;  <Prim>   ->  symbols bound by define-primitive
;;
;;  <Immed>  ->  fixnum | boolean | char | null
;;
;;  <Var>    ->  symbols other than keywords
;;
;;  <Key>    ->  begin | if | closure | let | letrec
;;
;; NOTES
;;
;;  Similar to Dybig but we keep variable reference in the environment instead of
;;  expanding them with inline substitution.
;;
;;  Trying to keep this version of the grammer aligned with the code in this file.
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;;                                    Proper Tail Recursion
;;--------------------------------------------------------------------------------
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
;; * The last expression within the body of a lambda ex- pression, shown as
;;   ⟨tail expression⟩ below, occurs in a tail context.
;;
;;    (lambda ⟨formals⟩ ⟨definition⟩* ⟨expression⟩* ⟨tail expression⟩)
;;
;; * If one of the following expressions is in a tail context, then the
;;   subexpressions shown as ⟨tail expression⟩ are in a tail context. These were
;;   derived from rules given in chapter 7 by replacing some occurrences of
;;   ⟨expression⟩ with ⟨tail expression⟩. Only those rules that contain tail contexts
;;   are shown here.
;;
;; (if ⟨expression⟩ ⟨tail expression⟩ ⟨tail expression⟩)
;; (if ⟨expression⟩ ⟨tail expression⟩)
;;
;; (cond ⟨cond clause⟩+)
;; (cond ⟨cond clause⟩* (else ⟨tail sequence⟩))
;;
;; (case ⟨expression⟩
;;   ⟨case clause⟩+)
;; (case ⟨expression⟩
;;   ⟨case clause⟩*
;;   (else ⟨tail sequence⟩))
;;
;; (and ⟨expression⟩* ⟨tail expression⟩)
;; (or ⟨expression⟩* ⟨tail expression⟩)
;;
;; (let (⟨binding spec⟩*) ⟨tail body⟩)
;; (let ⟨variable⟩ (⟨binding spec⟩*) ⟨tail body⟩)
;; (let* (⟨binding spec⟩*) ⟨tail body⟩)
;; (letrec (⟨binding spec⟩*) ⟨tail body⟩)
;;
;; (let-syntax (⟨syntax spec⟩*) ⟨tail body⟩)
;; (letrec-syntax (⟨syntax spec⟩*) ⟨tail body⟩)
;;
;; (begin ⟨tail sequence⟩)
;;
;; (do (⟨iteration spec⟩*)
;;     (⟨test⟩ ⟨tail sequence⟩)
;;   ⟨expression⟩*)
;;
;; where
;;
;; ⟨cond clause⟩ −→ (⟨test⟩ ⟨tail sequence⟩)
;; ⟨case clause⟩ −→ ((⟨datum⟩*) ⟨tail sequence⟩)
;;
;; ⟨tail body⟩ −→ ⟨definition⟩* ⟨tail sequence⟩
;; ⟨tail sequence⟩ −→ ⟨expression⟩* ⟨tail expression⟩
;;
;; *  If a cond expression is in a tail context, and has a clause of the form
;;    (⟨expression1⟩ => ⟨expression2⟩) then the (implied) call to the procedure
;;    that results from the evaluation of ⟨expression2⟩ is in a tail context.
;;    ⟨expression2⟩ itself is not in a tail context.
;;
;;--------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;;                                  Proper Tail Calls
;;--------------------------------------------------------------------------------
;; The Scheme report requires that implementations be properly tail-recursive. By
;; treating tail-calls properly, we guarantee that an un- bounded number of tail
;; calls can be performed in constant space.
;;
;; So far, our compiler would compile tail-calls as regular calls followed by a
;; return. A proper tail-call, on the other hand, must perform a jmp to the target
;; of the call, using the same stack position of the caller itself.
;;
;; A very simple way of implementing tail-calls is as follows (illustrated in Figure 3):
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
;;--------------------------------------------------------------------------------

(load "tests-driver.scm")

;; (load "tests/tests-9.0-square.scm")  ;; define square -- pass 1.8 first

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
;; (load "tests/tests-2.9-req.scm")  ;; foreign calls exit, S_error
;; (load "tests/tests-2.8-req.scm")  ;; symbols
;; (load "tests/tests-2.6-req.scm")  ;; variable arguments to lambda
;; (load "tests/tests-2.4-req.scm")  ;; letrec letrec* and/or when/unless cond
;; (load "tests/tests-2.3-req.scm")  ;; complex constants - TBD

;; (load "tests/tests-2.2-req.scm")  ;; set! TBD
(load "tests/tests-2.1-req.scm")   ;; procedure
(load "tests/tests-1.9-req.scm")   ;; begin/implicit begin set-car! set-cdr! eq? vectors
(load "tests/tests-1.8-req.scm")   ;; cons procedures deeply nested procedures
(load "tests/tests-1.7-req.scm")   ;; more binary primitives
(load "tests/tests-1.6-req.scm")   ;; let let*
(load "tests/tests-1.5-req.scm")   ;; binary primitives if
(load "tests/tests-1.4-req.scm")   ;; if and or
(load "tests/tests-1.3-req.scm")   ;; unary primitives
(load "tests/tests-1.2-req.scm")   ;; immediate constants
(load "tests/tests-1.1-req.scm")   ;; integers

;;---------------------------------------------------
;;  Enhances readability for some people.
;;---------------------------------------------------

(define first car)
(define second cadr)
(define third caddr)
(define rest cdr)

;;---------------------------------------
;;  Value Representation
;;---------------------------------------

(define fxshift         2)
(define fxmask       #b00000011)   ; #x03
(define fxtag        #b00000000)   ; #x00

(define cshift          8)
(define ctag         #b00001111) ; #x0F
(define cmask        #b11111111)

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

(define string-mask  #b00000111) ; #x07
(define string-tag   #b00000110) ; #x06

(define closure-mask  #b00000111) ; #x07
(define closure-tag   #b00000010) ; #x02

(define nil-value    #b00111111) ; #x3F)
(define wordsize        4) ; bytes

(define fixnum-bits (- (* wordsize 8) fxshift))

(define fxlower (- (expt 2 (- fixnum-bits 1))))

(define fxupper (sub1 (expt 2 (- fixnum-bits 1))))

(define (fixnum? x)
   (and (integer? x) (exact? x) (<= fxlower x fxupper)))

(define (immediate? x)
   (or (fixnum? x)(boolean? x)(char? x)(null? x)))

(define (immediate-rep x)
   (cond
      [(fixnum? x) (ash x fxshift)]
      [(boolean? x) (if x bool-t bool-f) ]
      [(char? x) (logor (ash (char->integer x) cshift) ctag) ]
      [(null? x) nil-value ]))


;;-----------------------------------------------------
;;               Special Symbols
;;-----------------------------------------------------

;; (define-syntax define-special
;;   (syntax rules ()
;;      [(_ (sym ...)  (putprop 'sym '*is-special* #t)])))
	   

;; (define (special-symbol? x)
;;   (and (special-symbol? x) (getprop '*is-special*)))


;;-----------------------------------------------------
;;                Primitives
;;-----------------------------------------------------

(define-syntax define-primitive
  (syntax-rules ()
    [(_ (prim-name si env arg* ...) b b* ...)
     (begin
       (putprop 'prim-name '*is-prim* #t)
       (putprop 'prim-name '*arg-count*
            (length '(arg* ...)))
       (putprop 'prim-name '*emitter*
		(lambda (si env arg* ...) b b* ...)))]))

;;-----------------------------------------
;;             Conversions
;;-----------------------------------------

(define-primitive (fixnum->char si env arg)
  (emit-expr si env arg)
  (emit "    shll $~s, %eax" (- cshift fxshift))
  (emit "    orl $~s, %eax" ctag))

(define-primitive (char->fixnum si env arg)
    (emit-expr si env arg)
    (emit "   shrl $~s, %eax" cshift)
    (emit "   shll $~s, %eax" fxshift))

;;------------------------------------------
;;           Disjoint Types
;;------------------------------------------

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
    (emit "    and $~s, %eax" cmask)
    (emit "    cmp $~s, %eax" ctag)
     ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (fixnum? si env arg)
  (emit-expr si env arg)
  (emit "    and $~s, %al" fxmask)
  (emit "    cmp $~s, %al" fxtag)
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

;;------------------------------------------------
;; not takes any kind of value and returns #t if
;; the object is #f, otherwise it returns #f
;;------------------------------------------------

(define-primitive (not si env arg)
    (emit-expr si env arg)
    (emit "    cmp $~s, %eax" bool-f)
    ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

;;---------------------------------------
;;        Binary Primitives
;;---------------------------------------

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
  (emit "    movb %ah, ~s(%esp)" si)  ;; save c1
  (emit-expr (- si wordsize) env c2)   ;; eax = c2
  (emit "    cmp %ah, ~s(%esp)" si)   ;; compare c1 c2
  ;; convert the cc to a boolean
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

;;--------------------------------------
;;  bitwise logical fixnum operations
;;--------------------------------------

(define-primitive (fxlognot si env arg)
  (emit-expr si env arg)
  (emit "    or $~s, %al" fxmask)
  (emit "    notl %eax"))

(define-primitive (fxlogand si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    and ~s(%esp), %eax" si))

(define-primitive (fxlogor si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    or ~s(%esp), %eax" si))

;;--------------------------------------
;;            Fixnum Arithmetic
;;--------------------------------------

(define-primitive (fxadd1 si env arg)
  (emit-expr si env arg)
  (emit "     addl $~s, %eax" (immediate-rep 1)))

(define-primitive (fxsub1 si env arg)
    (emit-expr si env arg)
    (emit "    addl $~s, %eax" (immediate-rep -1)))

(define-primitive (fxzero? si env arg)
    (emit-expr si env arg)
    (emit "    cmp $0, %eax")
    ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (fx= si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx< si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    setl %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx<= si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    setle %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx> si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    setg %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx>= si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    cmp ~s(%esp), %eax" si)
  ;; convert the cc to a boolean
  (emit "    setge %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

(define-primitive (fx+ si env arg1 arg2)  ;; swaped arg eval order
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)  # fx+ push arg1" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    addl ~s(%esp), %eax  # fx+ arg1 arg2" si))

(define-primitive (fx- si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    subl ~s(%esp), %eax" si))

(define-primitive (fx* si env arg1 arg2)
  (emit-expr si env arg2)
  (emit "    sar $~s, %eax" fxshift)   ;; 4x/4
  (emit "    movl %eax, ~s(%esp)" si)
  (emit-expr (- si wordsize) env arg1)
  (emit "    imul ~s(%esp), %eax" si)) ;; 4xy = (4x/4)*4y

;;-------------------------------------------
;;                 Pairs
;;-------------------------------------------

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
  (emit "    movl ~s(%eax), %eax" (- car-offset pair-tag)))

(define-primitive (cdr si env arg)
  (emit-expr si env arg)
  (emit "    movl ~s(%eax), %eax" (- cdr-offset pair-tag)))

(define-primitive (set-car! si env u obj)
  (emit-expr si env u)
  (emit "    movl %eax, ~s(%esp)" si)  ;; save u
  (emit-expr (- si wordsize) env obj)  ;; eax = obj
  (emit "    movl ~s(%esp), %ebx" si)  ;; ebx = u
  (emit "    movl %eax, ~s(%ebx)" (- car-offset pair-tag)))

(define-primitive (set-cdr! si env u obj)
  (emit-expr si env u)
  (emit "    movl %eax, ~s(%esp)" si)  ;; save u
  (emit-expr (- si wordsize) env obj)  ;; eax = obj
  (emit "    movl ~s(%esp), %ebx" si)  ;; ebx = u
  (emit "    movl %eax, ~s(%ebx)" (- cdr-offset pair-tag)))

;;-------------------------------------------
;;                 Vectors
;;-------------------------------------------

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
  (emit-expr si env v) ;; eax <- vector + 5
  (emit "andl $-8, %eax")             ;; clear 3-bit tag to select 8-byte aligned value
  (emit "movl 0(%eax), %eax")         ;; follow pointer to get length
  )   ;; length always 4-byte aligned, coincidentally already a fixnum

(define-primitive (vector-set! si env vector k object)
  (emit-expr si env vector)
  (emit "    movl %eax, ~s(%esp)" si)               ;; save the vector
  (emit-expr (- si wordsize) env k)                 ;; eax <- k
  (emit "    movl %eax, ~s(%esp)" (- si wordsize))  ;; save k
  (emit-expr (- si (* 2 wordsize)) env object)      ;; eax <- object
  (emit "    movl ~s(%esp), %ebx" si)               ;; ebx = vector + 5
  (emit "    movl ~s(%esp), %esi" (- si wordsize))  ;; esi = k
  (emit "    movl %eax, -1(%ebx,%esi)")             ;; v[k] <- object ; offset -1 = tag(-5) + lenfield_size(4) 
  )

(define-primitive (vector-ref si env vector k)
  (emit-expr si env vector)
  (emit "    movl %eax, ~s(%esp)" si)    ;; save the vector
  (emit-expr (- si wordsize) env k)      ;; eax <- k
  (emit "    movl ~s(%esp), %esi" si)    ;; esi <- vector + tag(5)
  (emit "    movl -1(%eax,%esi), %eax"))  ;; eax <- v[k]  -1 = tag(-5) + lenfield_size(4)

;;-------------------------------------------------------
;;                     Strings
;;-------------------------------------------------------

(define-primitive (make-string si env len)
   (emit "# make-string len=~s" len)
   (emit-expr si env len)
   (emit "    movl %eax, %esi")           ;; esi = length (bytes x 4)
   (emit "    movl %eax, 0(%ebp)")        ;; set string-length field (bytes x 4)
   (emit "    movl %ebp, %eax")           ;; save the base pointer as return value
   (emit "    orl $~s, %eax" string-tag)  ;; set the tag in the lower 3 bits   
   (emit "    sar $~s, %esi" fxshift)     ;; esi = divide by 4 to get length (bytes)
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
    (emit "    movl ~s(%eax), %eax" (- string-tag)))

(define-primitive (string-ref si env str k)
  (emit-expr si env str)
  (emit "    movl %eax, ~s(%esp)" si)    ;; save the string
  (emit-expr si env k)                   ;; eax = k (4 x bytes)
  (emit "    sar $~s, %eax" fxshift)     ;; eax = k (bytes)
  (emit "    movl ~s(%esp), %esi" si)    ;; esi <- string + tag(6)
  (emit "    movl -2(%eax,%esi), %eax")  ;; eax <- v[k]    tag(-6) + lenfield_size(4)
  (emit "    sal $~s, %eax" cshift)      ;; shift char to content position
  (emit "    or  $~s, %eax" ctag))       ;; affix the tag
   
(define-primitive (string-set! si env str k char)
  (emit-expr si env str)
  (emit "    movl %eax, ~s(%esp)" si)               ;; save the string
  (emit-expr si env k)                              ;; eax = k (4 x bytes)  
  (emit "    movl %eax, ~s(%esp)" (- si wordsize))  ;; save k
  (emit-expr (- si (* 2 wordsize)) env char)        ;; eax <- char
  (emit "    movl ~s(%esp), %ebx" si)               ;; ebx <- string + 6
  (emit "    movl ~s(%esp), %esi" (- si wordsize))  ;; esi = k (4 x bytes)
  (emit "    sar $~s, %esi" fxshift)                ;; esi = k bytes
  (emit "    movb  %ah, -2(%ebx,%esi)"))            ;; s[k] <- object  -2  tag(-6) + lenfield_size(4)

; procedures and closures

(define-primitive (procedure? si env expr)
  (emit-expr si env expr)
  (emit "    and $~s, %al" closure-mask)
  (emit "    cmp $~s, %al" closure-tag)
  ; convert cc to a Boolean
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit);
  (emit "    or $~s, %al" bool-f))
  
;;------------------------------------------
;;             Primitive Calls
;;------------------------------------------

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
  ;  (emit "    movl -4(%esp), %edi")
    (emit "    ret")
  ))

(define (check-primcall-args prim args)
    (= (length args) (getprop prim '*arg-count*)))

(define unique-label
  (let ([count 0])
    (lambda ()
      (let ([L (format "_L_~s" count)])
    (set! count (add1 count))
    L))))

;;-------------------------------------------
;;              Conditionals
;;-------------------------------------------

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

(define (emit-or si env x)
  (cond
   [(eq? (length x) 1) (emit-expr si env #f)]
   [(eq? (length x) 2) (emit-expr si env (cadr x))]
   [else (emit-expr si env (list 'if (cadr x) #t (cons 'or (cddr x))))]))

(define (emit-tail-or si env x)
  (cond
   [(eq? (length x) 1) (emit-tail-expr si env #f)]
   [(eq? (length x) 2) (emit-tail-expr si env (cadr x))]
   [else (emit-tail-expr si env (list 'if (cadr x) #t (cons 'or (cddr x))))]))

;;-----------------------------------------------------------------
;;                        Local Variables
;;-----------------------------------------------------------------
;;
;; Local variables are introduced with let.  They are allocated on
;; the stack relative to the stack pointer %esp.
;;
;; (let ((v E) ...) E)
;;
;; If multiple expressions are in the let-body we wrap a begin around
;; them on-the-fly to normalize them into the above form. (STOP DOING THIS)
;;
;; (let ((v E) ...) E E ...) => (let ((v E) ...) (begin E E ...))
;;
;;------------------------------------------------------------------

(define (let? x)
  (and (pair? x) (symbol? (car x)) (eq? (car x) 'let)))

(define (let-bindings x) (cadr x))

(define (let-body x)
  (unless (and (pair? (cddr x)) (eq? (caddr x) 'begin))
       (cons 'begin (cddr x))))

;;------------------------------------------------------------------
;;                       Environment
;;------------------------------------------------------------------

(define lhs car)
(define rhs cadr)
(define bind cons)

(define (extend-env si env var)
  (cons (bind var si) env))

(define (lookup var env)   ;; env is a list of dotted pairs
  (let ([pair (assoc var env)])
    (and pair (cdr pair))))

;; Have I isolated the environment representation enough to
;; change it here?  Probably not.

;;--------------------------------------------
;;   (let ((v E) ...) E)
;;--------------------------------------------

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

;;-------------------------------------------------------------------
;; letrec is similar to let, but it must create all of the variables
;; before evaluating any of the E so any E can reference any of the v
;; in the list of bindings.  Has to support mutual recursion.
;;
;;     (letrec ([v E] ...) E)
;;
;; Consider
;;
;;   (letrec ([even? (lambda (x) (if (zero? x) #t (odd? (fx- x 1))))]
;;            [odd?  (lambda (x) (if (zero? x) #f (even? (fx- x 1))))])
;;      (even? 14))
;;
;; Our implementation uses vectorize-letrec to rewrite letrec into
;; a let with local variables replaced by singlton vectors and variable
;; references replaced by vector-ref.  That extra leval of indirection
;; is needed to make circular references and mutual recursive fuctions
;; work.
;; 
;; Later will look at how to optimize this away the cases when the
;; full generality is not needed.
;;----------------------------------------------------------------------

(define (letrec? expr)
  (and (pair? expr) (symbol? (car expr)) (eq? (car expr) 'letrec)))
  
(define letrec-bindings cadr)

(define (letrec-body x)
  (unless (and (pair? (cddr x)) (eq? (caddr x) 'begin)) 
      (cons 'begin (cddr x))))

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

;; should never needed since we always wrap tail expr in a begin
(define (emit-tail-variable-ref env var)
  ;(emit-variable-ref (lookup var env))
  (emit "# emit-tail-variable-ref")
  (emit-variable-ref env var)
  ;; restore
;  (emit "    movl -4(%esp), %edi")
  (emit "    ret")
  (emit "# end emit-tail-variable ref")
  )

;;----------------------------------------------------
;; Stack/closure save and load abstracted slightly.
;; These are used occasionally here and there.
;; Did not commit to use these abstractions everywhere.
;; Not sure whether they clarify or obscure.
;;----------------------------------------------------

(define (emit-stack-save si)
  (emit "    movl %eax, ~s(%esp)  # stack save" si))

(define (emit-stack-load si var)
  (emit "    movl ~s(%esp), %eax  # stack load ~a" si var))

(define (emit-frame-save ci)
  (emit "    movl %eax, ~s(%edi)  # frame save" (- ci closure-tag)))

(define (emit-frame-load ci var)
  (emit "    movl ~s(%edi), %eax  # frame load ~a" (- ci closure-tag) var))

;;-----------------------------------------------------------
;; let* is written in an on-the-fly code transformation style
;; The call to emit-let* effectively rewrites let* into a
;; series of nested let expressions as it emits the code.
;;
;; Trying to decide if we should expand let* in a pre-processing
;; pass ouside of emit.  This on-the-fly stuff makes it
;; murkey whether we consider let* a part of the IL or strictly
;; a source language construct.  Leaving it as is until a clearer
;; rationale emerges.
;;------------------------------------------------------------

(define (let*? x) (and (pair? x) (eq? (car x) 'let*)))

(define (emit-let* si env bindings body)
  (cond
   [(null? bindings) (emit-expr si env body)]
   [(null? (cdr bindings)) (emit-expr si env (list 'let bindings body))]
   [else
    (emit-expr si env
	 (list 'let
	       (list (car bindings))
	       (list 'let* (cdr bindings) body)))]))

(define (emit-tail-let* si env bindings body)
  (cond
   [(null? bindings) (emit-tail-expr si env body)]
   [(null? (cdr bindings)) (emit-tail-expr si env (list 'let bindings body))]
   [else
    (emit-tail-expr si env
	 (list 'let
	       (list (car bindings))
	       (list 'let* (cdr bindings) body)))]))

;;-------------------------------------------------------------------------------
;;                                     Procedures
;;-------------------------------------------------------------------------------

(define (unique-labels lvars)
    (define (assign-label v) (unique-label))
    (map assign-label lvars))

(define (make-initial-env lvars labels)
  (cond
   [(null? lvars) '()]
   [else (cons (cons (car lvars) (car labels))
	       (make-initial-env (cdr lvars) (cdr labels)))])) 

(define empty? null?)

;;-------------------------------------------------------------------------------------------------------
;;      Procedure Call           (funcall f arg* ...)
;;-------------------------------------------------------------------------------------------------------
;;  
;;     +--  +------------+         si           +--    +------------+
;;     |    |   arg 3    |         |            |      |   arg 3    |                (si - 20) -> si' - 16
;;     |    +------------+         V            |      +------------+
;; outgoing |   arg 2    |  %esp - 32        incoming  |   arg 2    |  %esp - 12     (si - 16) -> si' - 12
;; args     +------------+                   args      +------------+
;;     |    |   arg 1    |  %esp - 28           |      |   arg 1    |  %esp - 8      (si - 12) -> si' - 8
;;     +--  +------------+                      +--    +------------+
;;          |            |  %esp - 24                  |  old edi   |  %esp - 4      (si - 8)  -> si' - 4
;;          +------------+                             +------------+
;;          |            |  %esp - 20        base -->  |  old eip   |  %esp          (si + 4)  -> si'
;;     +--  +------------+                             +------------+
;;     |    |  local 3   |  %esp - 16    +---------->
;;     |    +------------+               |
;;  locals  |  local 2   |  %esp - 12    |          (B)  Callee's view
;;     |    +------------+               |
;;     |    |  local 1   |  %esp - 8     si        old eip = return point
;;     +--  +------------+               |         old edi = saved closure ptr
;;          |  closure   |  %esp - 4     |         Note that args/locals
;;          +------------+               |         start at %esp - 8
;; base --> |  old eip   |  %esp    <----+
;;          +------------+                         si = offset to top stack elt when funcall happens
;;           high address                               (in this example -16)  
;;                       
;;        (A) Caller's view                        si-8 = amount to shift the stack base
;;                                                 
;;
;;  Note: The old edi will be the same as the content of the edi register normally
;;        The caller restores the frame's edi upon return by loading closure from esp-4
;;        The callee simply returns and does not mess with the closure slot 
;;-----------------------------------------------------------------------------------------------------------

(define funcall-args cddr)
(define funcall-oper cadr)

;;------------------------------------------------------------------------------------------
;;   Invariants
;;
;;  esp - si - 12     next frame arg 1
;;  esp - si - 8      next frame closure
;;  esp - si - 4      next frame return
;;  esp - si          points to the top local frame element
;;  esp - 4 - 4N - i  local var i... (optional)
;;  esp - 4 - 4N      local argN     (optional)
;;  esp - 8           local arg 1    (optional)
;;  esp - 4           closure pointer   |  used to restore ecp when callee returns
;;  esp - 0           return pointer    |  when the frame goes away
;;
;;------------------------------------------------------------------------------------------

(define (emit-funcall si env expr)
  
  (define (emit-arguments si env args)
    (unless (empty? args)
        (emit-expr si env (first args))                              ;; evaluated arg in %eax
        (emit "    mov %eax, ~s(%esp)    # arg ~a" si (first args))  ;; save %eax as evaluated arg
        (emit-arguments (- si wordsize) env (rest args))))           ;; recursively emit the rest
  
  (define (emit-adjust-base delta-si)
    (unless (eq? delta-si 0)
	    (emit "    add $~s, %esp    # adjust base" delta-si)))
  
  (emit "# funcall")
  (emit "#    si   =~s" si)
  (emit "#    env  = ~s" env)
  (emit "#    expr = ~s" expr)

  ;; Evaluate the funcall-oper and stash it esp+si+8
  ;; this becomes the next frame's closure slot
  (emit-expr (- si 8) env (funcall-oper expr))
  (emit "   movl %eax,  ~s(%esp)  # stash funcall-oper in closure slot" (- si 8))

  ;; evaluate the arguments ar1 ... argN and push on stack
  (emit-arguments (- si 12) env (funcall-args expr)) 

  ;; Load new fram closure into edi
  (emit "    movl ~s(%esp), %edi   # load new closure to %edi" (- si 8))

  (emit-adjust-base si)        ;; the value of %esp is adjusted by si

  ;;--------------------------------------------------------------
  ;; This is the only place call appears in the entire compiler.
  ;; Call acts just like.
  ;;
  ;;     add $-4, %esp        # bump stack ptr
  ;;     movl $cont, 0(%esp)  # save return point
  ;;     jmp *-2(%esp)        # jump to the label  
  ;;  cont:
  ;;
  ;; which is less esoteric than understanding call
  ;;--------------------------------------------------------------

  ;; call is going to bump %esp by 4 and save return there.
  
  (emit "    call *-2(%edi)        # call thru closure ptr") ;; closure ptr in %eax since arg1 emitted last
  
  (emit-adjust-base (- si))        ;; after return the value of %esp is adjusted back
  (emit "    movl -4(%esp), %edi   # restore closure frame ptr")  ;; the callee restores this!
  )

  
;;--------------

(define (emit-tail-funcall si env expr) 
  (define (emit-arguments si args)
    (unless (empty? args)
        (emit-expr si env (first args))                ;; evaluated arg in %eax
        (emit "    mov %eax, ~s(%esp)    # arg " si)   ;; save %eax as evaluated arg    
        (emit-arguments (- si wordsize) (rest args)))) 
  (define (emit-shift-args argc si delta)
    (emit "# emit-shift-args:  argc=~s   si=~s  delta=~s" argc si delta)
    (unless (zero? argc)
	   (emit "    mov ~a(%esp), %ebx  # shift arg" si )
	   (emit "    mov %ebx, ~a(%esp)  # down to base" (+ si delta))
	   (emit-shift-args (- argc 1) (- si wordsize) delta)))
  
  (emit "# emit-tail-funcall")
  (emit "#    si   =~s" si)
  (emit "#    env  = ~s" env)
  (emit "#    expr = ~s" expr)
  
  (emit-arguments (- si 8) (funcall-args expr)) ;; leaving room for 2 values
  
  (emit-expr (- si 8 (* 4 (length (funcall-args expr)))) env (funcall-oper expr))
  
  ;; no need to save old closure or a return since we are not comming back
  ;; we just reuse the current stack frame

  ;; not need to save old closure, but we do set the current closure register
  (emit "    movl %eax, %edi  # evaluated funcall op -> %edi")

  ;; now we shift the outgoing arguments down to where incomming arguments would be
  (emit-shift-args (length (funcall-args expr)) (- si 8) (- si))
  (emit "    jmp *-2(%edi)  # tail-funcall"))       ;; jump to closure entry point

;;----------------------------------------------------
;;                    (begin E E ... )
;;-----------------------------------------------------

(define begin-body cdr)

(define (emit-begin si env body)
  (emit "# emit-begin")
  (emit "#   body=~s" body)
  (emit "#   env=~s" env)
  (cond
   [(null? body) '()]
   [(not (pair? body))
    (error "begin" "begin body must be null or a pair" body)]
   [else
     (emit-expr si env (car body))
     (emit-begin si env (cdr body))]))

(define (emit-tail-begin si env body)  ;; this is the body, not the expr
  (emit "# tail-begin body=~s" body)
  (cond
   [(null? body)
     (emit "    ret                  # return thru stack")]
   [(not (pair? body))
    (error "begin" "begin body must be null or a pair" body)]
   [(eq? (length body) 1)
     (emit-tail-expr si env (car body))] ;; ISSUE: BLOWS UP  <<<----<<<  WHY????
   [else
    (emit-expr si env (car body))
    (emit-tail-begin si env (cdr body))]))

;;------------------------------------------------------


;;------------------------------------------------------------------
;;                              Closures
;;------------------------------------------------------------------
;; emit-closure compiles the form
;;
;;   (closure (formal ...) (freevar ...) body)
;;
;; Basically a closure code will look like
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
;; Consider that set! will not work since a variable introduced
;; by let or lambda might be stored both in the closure and on
;; the stack.  Use Dybvig's rewrite to replace any such variables
;; with singleton vectors to solve this. 
;;------------------------------------------------------------------

(define (closure? expr)
   (and (pair? expr) (symbol? (car expr)) (eq? (car expr) 'closure)))

(define closure-formals cadr)
(define closure-freevars caddr)
(define closure-body cdddr)

(define (emit-close-free-vars ci env vars)
  (unless (null? vars)
	  (if (lookup (car vars) env) ;; only initialize closure-variables that exist in the binding environment.
	      (begin
		(emit-variable-ref env (car vars))                 ;; reference the value of the first variable
		(emit "   movl  %eax, ~s(%ebp)" ci)))              ;; copy that value to the closure cell
	  (emit-close-free-vars (+ wordsize ci) env (cdr vars))))  ;; recursively process remaining free vars

(define (extend-closure-env env frev)
  (let f ([frev frev] [ci wordsize] [env env])
    (cond
     [(empty? frev) env]
     [else
      (f (rest frev)
	 (+ ci wordsize)
	 (extend-env ci env (first frev)))])))

(define (extend-formals-env env fmsl)
   (let f ([fmls fmsl] [ci (* -2 wordsize)] [env env])
    (cond
     [(empty? fmls) env]
     [else
      (f (rest fmls)
	 (- ci wordsize)
	 (extend-env ci env (first fmls)))]))) 

(define (emit-closure si env expr)  
  (define (align-to-8-bytes i)
    (if (zero? (remainder i 8))
	i
	(+ i (- 8 (remainder i 8))))) 
  (emit "# emit-closure")
  (emit "# si = ~s" si)
  (emit "# env = ~s" env)
  (emit "# expr = ~s" expr)  
  (let* ([formals (closure-formals expr)]
	 [freevars (closure-freevars expr)]
	 [body (closure-body expr)]
	 ;;[closed-env (extend-closure-env env freevars)]  ;; <<-- DOES NOT LOOK RIGHT?  Why all of env?
	 ;; should not closed-env be just the formals and the freevars, and nothing from outside?
	 ;; [formals-env (extend-formals-env '() formals)]
	 ;; [closed-env (extend-closure-env formals-env freevars)]

	 [closed-env (extend-closure-env '() freevars)]
	 [entry-point (unique-label)]
	 [exit-point (unique-label)]
	 [size (* wordsize (+ 1 (length freevars)))])
    
    ;; --- emit closure object
    
    ;; Set the label field to L_yy
    (emit "    movl $~a, 0(%ebp)  # closure label" entry-point)
    
    ;; Copy the free vars values from the binding environment to the closure
    (emit-close-free-vars wordsize env freevars)
    
    ;; Return the tagged pointer to the heap allocated content
    (emit "    movl %ebp, %eax    # return base ptr")
    (emit "    add $~s, %eax      # closure tag"  closure-tag)
    (emit "    add $~s, %ebp      # bump ebp" (align-to-8-bytes size))
    
    ;; Jump around code for closure body
    (emit "    jmp ~a"  exit-point)
    (emit "~a:" entry-point)
    
    ;; --- emit closure body ---
    ;; note that we use the closed environment so free variable
    ;; references all resolve to the cells in the closure object
    
    (let f ([fmls formals] [si (- (* 2 wordsize))] [env closed-env])  ;; WAS THIS IT???
      (cond
       [(empty? fmls)
	(emit-tail-expr si env (cons 'begin body)) ;; implicity on-the-fly begin
	;;(emit-expr si env (cons 'begin body))  ;; disables proper tail calls   ***DEBUG***
	;;(emit "    ret   # from closure") ;;  needed???  don't think so
	] 
       [else
	(f (rest fmls)
	   (- si wordsize)
	   (extend-env si env (first fmls)))]))
    (emit "    .align 4,0x90")
    (emit "~a:" exit-point)    
    ))

;; IS emit tail closure important ???

;; (define (emit-tail-closure si env expr)   ;;  <<<---- FIX LATER ---<<<  ???
;;   (emit "emit-tail-closure TBD")
;;   (let* [(lvar (closure-lvar expr))
;; 	 (vars (closure-vars expr))
;; 	 (size (* wordsize (+ 1 (length vars))))]
;;     (emit "   movl $~a, 0(%ebp) # store label" (lookup lvar env))
;;     (emit "   movl %ebp, %eax   # return heap base ptr")
;;     (emit "   add $~s, %eax     # closure tag "  closure-tag)
;;     (emit "   add $~s, %ebp     # bump base aligned 8 bytes" (align-to-8-bytes size))))
 
;;--------------------------------------------------------------------
;;    Free variables and transforming lambda forms to closure forms
;;--------------------------------------------------------------------
;; Every lambda expression appearing in the source program is rewritten
;; as a closure annotated with the set of free variables.  Free variables
;; are any variables referenced in the body of the lambda that are
;; not either formal parameters of the lambda or defined locally inside
;; the lambda.
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
;;--------------------------------------------------------------------

;;-------------------------------------------------------------------
;;                (lambda (formals ...) body)
;;-------------------------------------------------------------------

(define (lambda? expr)
  (and (pair? expr) (eq? (car expr) 'lambda)))
(define lambda-formals cadr)
(define (lambda-body expr)
  (if (lambda? expr)
      (if (fx= (length expr) 3)
	  (caddr expr)
	  (cons 'begin (cddr expr)))
      (error 'lambda-body "ill-formed lambda expression")))

(define (close-free-variables bound-vars expr)
  (cond
   [(lambda? expr)
    (let* ([formals (lambda-formals expr)]
	   [freevars (free-variables formals (lambda-body expr))]
	   [body (close-free-variables formals (lambda-body expr))])
      (list 'closure formals freevars body))]
   [(let? expr)
    (let* ([bindings (let-bindings expr)]
	   [vars (map car bindings)]
	   [exps (map cadr bindings)]
           [new-exps (map (lambda (e) (close-free-variables bound-vars e)) exps)]
	   [new-bindings (map list vars new-exps)]
	   [nbv (append vars bound-vars)]
	   [new-body (close-free-variables nbv (let-body expr))])
      (list 'let new-bindings new-body))]
   [(pair? expr)
     (cons (close-free-variables bound-vars (car expr))
	   (close-free-variables bound-vars (cdr expr)))]
   [else expr]))

(define unique-lvar
  (let ([count 0])
    (lambda ()
      (let ([f (format "f~a" count)])
	(set! count (add1 count))
	(string->symbol f)))))

(define (simple-constant? expr)
  (or (boolean? expr) (null? expr) (fixnum? expr) (char? expr) (string? expr)))

(define (special-form? expr)
  (memq expr '(begin if let lambda letrec closure)))  ;; <<<---- REVIEW (Use property list?)

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

;;--------------------------------------------------------
;;         set! elimination     TBD
;;--------------------------------------------------------
;;
;;  (lambda (x) (set! x e1) (fx+ x 1))
;;  =>
;;  (lambda (x)
;;     (let (x (make-vector 1))
;;        (vector-set x 0 e1)
;;        (fx+ (vector-ref x 0) 1)))
;;
;;
;;  (let ((x e1)) (set! x (foo e1)))
;;  =>
;;  (let ((x e1))
;;     (let ((t e1))
;;         (let ((x (make-vector 1)))
;;            (vector-set! x t))
;;            (vector-set! x (foo e1))
;;
;;---------------------------------------------------------

;;----------------------------------------------------------
;;  vectorize-letrec
;;
;; (capture the test case that motivated this)
;;
;;----------------------------------------------------------

(define (vectorize-letrec exp)

  (define (wrapper vars ee)
    (cond
     [(pair? ee) (cons (wrapper vars (car ee)) (wrapper vars (cdr ee)))]			  
     [(and (symbol? ee) (memq ee vars)) (list 'vector-ref ee 0)]
     [else ee]))
  
  (cond
   [(letrec? exp)
    (let* ([bindings (letrec-bindings exp)]
	   [vars (map car bindings)]
	   [exps (map cadr bindings)]
	   [body (letrec-body exp)]
	   [wrap (lambda (e) (wrapper vars e))])
      (list 'let
	    (map (lambda (v) (list v '(make-vector 1))) vars)
	    (cons 'begin
		  (map (lambda (v e) (list 'vector-set! v 0 e))
		       vars
		       (map wrap exps)))
	    (wrap body)))]
   [(pair? exp)
    (cons (vectorize-letrec (car exp))
	  (vectorize-letrec (cdr exp)))]
   [else exp]))

;;-------------------------------------------------------
;;                   Expression Dispatcher
;;-------------------------------------------------------

(define (funcall? expr)
  (and (pair? expr)
       (or (eq? (car expr) 'funcall) (eq? (car expr) 'app))))

(define (begin? expr)
  (and (pair? expr) (symbol? (car expr)) (eq? (car expr) 'begin)))

(define (emit-expr si env expr)
  (define (variable? expr)
    (and (symbol? expr)
	 (let ([pair (assoc expr env)])
	   (and pair (fixnum? (cdr pair)))))) 
  (emit "# emit-expr")
  (cond
    [(immediate? expr)  (emit-immediate expr)]
    [(variable? expr)   (emit-variable-ref env expr)]
    [(begin? expr)      (emit-begin si env (begin-body expr))]
    [(closure? expr)    (emit-closure si env expr)]
    [(funcall? expr)    (emit-funcall si env expr)]
    [(let? expr)        (emit-let si env (let-bindings expr) (let-body expr))]
    [(let*? expr)       (emit-let* si env (let-bindings expr) (let-body expr))]
    [(primcall? expr)   (emit-primcall si env expr)]
    [(if? expr)         (emit-if si env expr)]
    [(and? expr)        (emit-and si env expr)]
    [(or? expr)         (emit-or si env expr)]
    [(pair? expr)       (emit-funcall si env (cons 'funcall expr))] ;; implicit funcall
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
    [(immediate? expr)  (emit-tail-immediate expr)]
    [(variable? expr)   (emit-tail-variable-ref env expr)]
    [(begin? expr)      (emit-tail-begin si env (begin-body expr))]
    [(closure? expr)    (emit-tail-closure si env expr)] ;; ???
    [(funcall? expr)    (emit-tail-funcall si env expr)]
    [(let? expr)        (emit-tail-let si env (let-bindings expr) (let-body expr))]
    [(let*? expr)       (emit-tail-let* si env (let-bindings expr) (let-body expr))]
    [(primcall? expr)   (emit-tail-primcall si env expr)]
    [(if? expr)         (emit-tail-if si env expr)]
    [(and? expr)        (emit-tail-and si env expr)]
    [(or? expr)         (emit-tail-or si env expr)]
    [(pair? expr)       (emit-tail-funcall si env (cons 'funcall expr))] ;; implicit funcall    
    [else
     (error "emit-tail-expr" "unrecognized form:" expr)]))

(define (emit-immediate x)
  (emit "    movl $~s, %eax     # immed ~s" (immediate-rep x) x))

(define (emit-tail-immediate x)
  (emit-immediate x)
  (emit "    ret                  # tail return"))

;;----------------------------------------------------------
;; emit-program is the top level of the compiler; applies
;; the pre-processor passes before generating code.
;;----------------------------------------------------------

(define (emit-program raw-expr)
  (emit "# ~s" raw-expr)
  (let ([vl-expr (vectorize-letrec raw-expr)])
    (emit "# == vectorize-letrec ==>")
    (emit "# ~s" vl-expr)
  (let ([anno-expr  (close-free-variables '() vl-expr)])
    (emit "# == close-free-variables ==>")
    (emit "# ~s" anno-expr)
    (let ([expr anno-expr])
      (emit "# == null transform ==>~%")
      (emit "# ~s~%" expr)
      (emit-scheme-entry '() expr)))))

(define (emit-scheme-entry env expr)
  (emit-function-header "_L_scheme_entry")
  (emit-expr (- (* 2 wordsize)) env expr)
  (emit "    ret")
  (emit-function-header "_scheme_entry")    
  (emit "    movl 4(%esp), %ecx")   ;; linkage assume i386 (32 bit)
  (emit "    movl %ebx, 4(%ecx)")
  (emit "    movl %esi, 16(%ecx)")
  (emit "    movl %edi, 20(%ecx)")
  (emit "    movl %ebp, 24(%ecx)")
  (emit "    movl %esp, 28(%ecx)")
  (emit "    movl 12(%esp), %ebp")  ;; set heap base
  (emit "    movl 8(%esp), %esp")   ;; set stack base
  (emit "    call _L_scheme_entry") 
  (emit "    movl 4(%ecx), %ebx")  
  (emit "    movl 16(%ecx), %esi")
  (emit "    movl 20(%ecx), %edi")
  (emit "    movl 24(%ecx), %ebp")
  (emit "    movl 28(%ecx), %esp")
  (emit "    ret"))  
 
(define (emit-function-header entry)
  (emit "    .text")
  (emit "    .align 4,0x90")
  (emit "    .globl ~a" entry)
  (emit "~a:" entry))

(define compil-program emit-program)
