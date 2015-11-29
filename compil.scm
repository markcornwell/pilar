;; compil.scm
;; Pilar: A Scheme Compiler
;; Mark Cornwell
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
;; runs under petite chez scheme

;; petite compil.scm
;; (test-all)

;;-----------------------------------------------------
;; Code Generator Input Language:    TBD -- REVISE
;;
;;  <Program> -> <Expr>
;;            |  (letrec ([lvar <Lambda>] ...) <Expr>)
;;
;;  <Lambda>  -> (lamba (var ...) <Expr>)
;;
;;  <Expr>    -> <Immediate>
;;            |  var
;;            | (if <Expr> <Expr> <Expr>)
;;            | (let ([var <Expr>] ...) <Expr> ...)
;;            | (app lvar <Expr> ...)   
;;            | (prim <Expr>)
;;
;;  <Immediate>  -> fixnum | boolean | char | null
;;-----------------------------------------------------

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

;;--------------------------------------
;;   Utility
;;-------------------------------------

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

;;------------------------------------------------------
;;                Unary Primitives
;;------------------------------------------------------

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

(define-primitive (fixnum->char si env arg)
  (emit-expr si env arg)
  (emit "    shll $~s, %eax" (- cshift fxshift))
  (emit "    orl $~s, %eax" ctag))

(define-primitive (char->fixnum si env arg)
    (emit-expr si env arg)
    (emit "   shrl $~s, %eax" cshift)
    (emit "   shll $~s, %eax" fxshift))

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

;; not takes any kind of value and returns #t if
;; the object is #f, otherwise it returns #f

(define-primitive (not si env arg)
    (emit-expr si env arg)
    (emit "    cmp $~s, %eax" bool-f)
    ;; convert the cc to a boolean
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
  (emit "    movl %eax, -1(%ebx,%esi)")              ;; v[k] <- object ; offset -1 = tag(-5) + lenfield_size(4) 
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
  (let ([prim (car x)] [args (cdr x)])
    (check-primcall-args prim args)
    (apply (primitive-emitter prim) si env args)
    (emit "    ret")))

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

;;---------------------------------------------
;;                Local Variables
;;---------------------------------------------

(define (next-stack-index si) (- si wordsize))

(define (let? x)
  (and (pair? x) (symbol? (car x)) (eq? (car x) 'let)))

(define (let-bindings x) (cadr x))
(define (let-body x)
  (if (eq? (length x) 3)
      (caddr x)
      (cons 'begin (cddr x))))

;;--------------------------------------------
;;                 Environment
;;--------------------------------------------

(define lhs car)
(define rhs cadr)
(define bind cons)
(define (extend-env si env var) (cons (bind var si) env))

;;--------------------------------------------
;;   let
;;--------------------------------------------

(define (emit-let si env bindings body) ;; look at the version on p. 30
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

(define (emit-tail-let si env bindings body) ;; look at the version on p. 30
  (emit "# emit-tail-let")
  (emit "#  si   = ~s" si)
  (emit "#  env  = ~s" env)
  (emit "#  bindings = ~s" bindings)
  (emit "#  body = ~s" body)
  (let f ((si si) (new-env env) (b* bindings))
     (cond
       [(null? b*)  (emit-tail-expr si new-env body)]
       [else
         (let ([b (car b*)])
           (emit-expr si env (rhs b))
           (emit-stack-save si)
           (f (next-stack-index si)
              (extend-env si new-env (lhs b))
              (cdr b*)))])))

;;-------------------------------------------------------------------
;; letrec is similar to let, but it must create all of the variables
;; before evaluating any of the expr so any expr can reference any v
;; in the list of bindings.  This supports mutual recursion.
;;
;;     (letrec ([v expr] ...) body)
;;
;; Consider
;;
;;   (letrec ([even? (lambda (x) (if (zero? x) #t (odd? (fx- x 1))))]
;;            [odd?  (lambda (x) (if (zero? x) #f (even? (fx- x 1))))])
;;      --body-- )
;;
;;-------------------------------------------------------------------

(define (letrec? expr)
  (and (pair? expr) (symbol? (car expr)) (eq? (car expr) 'letrec)))
  
(define letrec-bindings cadr)

(define (letrec-body x)
  (if (eq? (length x) 3)
      (caddr x)
      (cons 'begin (cddr x))))

(define (lookup var env) ;; env is a list of dotted pairs
  (let ([pair (assoc var env)])
    (and pair (cdr pair))))

(define (emit-variable-ref env var)
  (let ([i (lookup var env)])
    (cond
     [(and (fixnum? i) (fx> i 0))
        (emit-frame-load i)]
     [else
        (emit-stack-load i)])))

(define (emit-tail-variable-ref env var)
  (emit-variable-ref (lookup var env))
  (emit "    ret"))

(define (emit-stack-save si)
  (emit "    movl %eax, ~s(%esp)" si))

(define (emit-stack-load si)
  (emit "    movl ~s(%esp), %eax" si))

(define (emit-frame-save ci)
  (emit "    movl %eax, ~s(%edi)" (- ci closure-tag)))

(define (emit-frame-load ci)
  (emit "    movl ~s(%edi), %eax" (- ci closure-tag)))

;;--------------------------------------------

(define (let*? x) (and (pair? x) (eq? (car x) 'let*)))

;; rewrite let* into nested singleton let's
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

;;---------------------------------------------
;;                 Procedures
;;---------------------------------------------


(define (unique-labels lvars)
    (define (assign-label v) (unique-label))
    (map assign-label lvars))

(define (make-initial-env lvars labels)
  (cond
   [(null? lvars) '()]
   [else (cons (cons (car lvars) (car labels))
	       (make-initial-env (cdr lvars) (cdr labels)))])) 

(define empty? null?)

(define (extend-closure-env env frev)
  (let f ([frev frev] [ci wordsize] [env env])
    (cond
     [(empty? frev) env]
     [else
      (f (rest frev)
	 (+ ci wordsize)
	 (extend-env ci env (first frev)))])))

(define call-target cadr) ;; (app lvar <Expr> ... )
(define call-args cddr)   ;;           ^-- that part

(define (emit-app si env expr)    ;; <<------- FIX THIS TO ACCOMODATE CLOSURES
  (define (emit-arguments si env args)
    (unless (empty? args)
        (emit-expr si env (first args))                ;; evaluated arg in %eax
	(emit "    mov %eax, ~s(%esp)    # arg" si)    ;; save %eax as evaluated arg    
	(emit-arguments (- si wordsize) env (rest args)))) ;; recursively emit the rest
  (define (emit-adjust-base si)
    (unless (eq? si 0)
	(emit "    add $~s, %esp    # adjust base" si )))
  (define (emit-labelcall si label)
    (emit "    call ~a   # app  " label))
  (emit-arguments (- si wordsize) env (call-args expr))
  (emit-adjust-base (+ si wordsize))
  (emit-labelcall si (lookup (call-target expr) env)) ;; <<--- take into account closures here????
  (emit-adjust-base (- (+ si wordsize))))

;;------------------------------------------------------
;;                   (funcall f arg* ...)
;;------------------------------------------------------

(define funcall-args cddr)
(define funcall-oper cadr)

(define (emit-funcall si env expr)
  (define (emit-arguments si env args)
    (unless (empty? args)
        (emit-expr si env (first args))                    ;; evaluated arg in %eax
        (emit "    mov %eax, ~s(%esp)    # arg ~a" si (first args))        ;; save %eax as evaluated arg
        (emit-arguments (- si wordsize) env (rest args)))) ;; recursively emit the rest
  (define (emit-adjust-base si)
    (unless (eq? si 0)
	    (emit "    add $~s, %esp    # adjust base" si ))) 
  (emit "# funcall")
  (emit "#  si   =~s" si)
  (emit "#  env  = ~s" env)
  (emit "#  expr = ~s" expr)
  (emit-arguments (- si 8) env (funcall-args expr)) ;; leaving room for 2 values
  (emit "#  oper = ~s" (funcall-oper expr))
  (emit-expr (- si 8 (* 4 (length (funcall-args expr)))) env (funcall-oper expr))
  (emit "    movl %edi, ~s(%esp)" si)    ;; save old closure frame pointer
  (emit "    movl %eax, %edi")           ;; funcall oper is in %eax; it will be a closure
  (emit-adjust-base (+ si))              ;; the value of %esp is adjusted by si [?? why by si????]
  (emit "     call *-2(%edi)")           ;; closure ptr will be in %eax since arg1 emitted last
  (emit-adjust-base (- si))              ;; after return the value of %esp is adjusted back by -si  [?? why by -si????]
  (emit "    movl ~s(%esp), %edi" si))   ;; restore closure frame pointer %edi

;;---------------------End  Funcall ----------------------

(define (emit-tail-app si env expr)
  (define (emit-arguments si args)
    (unless (empty? args)
        (emit-expr si env (first args))                ;; evaluated arg in %eax
	(emit "    mov %eax, ~s(%esp)    # arg" si)    ;; save %eax as evaluated arg    
	(emit-arguments (- si wordsize) (rest args))))
  (define (emit-shift-args argc si delta)
    (emit "# emit-shift-args:  argc=~s   si=~s  delta=~s" argc si delta)
    (unless (zero? argc)
	(emit "    mov ~a(%esp), %ebx  # shift arg" si )
	(emit "    mov %ebx, ~a(%esp)  # down to base" (+ si delta))
	(emit-shift-args (- argc 1) (- si wordsize) delta)))
  (define (emit-jmp si label)
    (emit "    jmp ~a   # app  " label))
  (emit-arguments (- si wordsize) (call-args expr))
  (let ([argc (length (call-args expr))]
	[si (- si wordsize)]
	[delta (- -4 (- si wordsize))])
     (emit-shift-args argc si delta))
  (emit-jmp si (lookup (call-target expr) env)))

(define (emit-tail-funcall si env expr)    ;; <<<------ FIX LATER; model on emit-tail-app
  (define (emit-arguments si env args)
    (unless (empty? args)
        (emit-expr si env (first args))                    ;; evaluated arg in %eax
        (emit "    mov %eax, ~s(%esp)    # arg" si)        ;; save %eax as evaluated arg
        (emit-arguments (- si wordsize) env (rest args)))) ;; recursively emit the rest
  (define (emit-adjust-base si)
    (unless (eq? si 0)
	    (emit "    add $~s, %esp    # adjust base" si )))
  (emit "# tail-funcall")
  (emit "#  si   =~s" si)
  (emit "#  env  = ~s" env)
  (emit "#  expr = ~s" expr)
  (emit-arguments (- si (* 2 wordsize)) env (funcall-args expr))  ;; leaving room for 2 values
  (emit "    movl %edi, ~s(%esp)" si)    ;; save value of current closure pointer on stack
  (emit-adjust-base (+ si))              ;; the value of %esp is adjusted by si [???]
  (emit "    call -6(%edi)")             ;; an indirect call to label field of the closure is issued
  (emit-adjust-base (- si))              ;; after return the value of %esp is adjusted back by -si  [???]
  (emit "    movl ~s(%esp), %edi" si))   ;; the value of the closure pointer is restored.  %edi

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
     (emit-begin si env (cdr body))]))     ;; <<--- reuse si or bump it ???

(define (emit-tail-begin si env body)
  (emit "# tail-begin body=~s" body)
  (cond
   [(null? body)
    (emit "    ret")]
   [(not (pair? body))
    (error "begin" "begin body must be null or a pair" body)]
   [else
    (emit-expr si env (car body))
    (emit-tail-begin si env (cdr body))])) ;; <<--- reuse si or bump it ???

(define (align-to-8-bytes i)
    (if (zero? (remainder i 8))
	i
	(+ i (- 8 (remainder i 8)))))

;;-----------------------------------------------------
;; REVISED CLOSURE IMPLEMENTATION
;;
;; emit-closure now needs to compile the form
;;
;;   (closure (formal ...) (freevar ...) body)
;;
;; which used to be compiled by emit-code.
;; need to combine the emit-code and emit-closure forms
;;
;; Basically a closure will look like
;;
;; Alloc heap space for label + free variables
;; Set the label field to L_yy
;; Initialize the free vars from the binding environment
;; Return the tagged pointer to the heap allocated closure 
;; Jmp L_zz
;; L_yy:
;; Closure code here -- should get all free vars from the closure Iimportant!!!)
;; Ret
;; L_zz
;;
;; Consider that set! will not work. Use Dybvig's rewrite to
;; singleton vectors to solve this. 
;;-------------------------------------------------------

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

(define (emit-closure si env expr)   ;; <<<---- WORK IN PROGRESS
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
	 [size (* wordsize (+ 1 (length freevars)))])

    ;; set the label field to L_yy
    ;;(emit "    movl $~a, 0(%ebp)  # closure label" entry-point)
    
    (emit "    movl $~a, 0(%ebp)  # closure label" entry-point)
    
    ;; Copy the free vars values from the binding environment to the closure
    (emit-close-free-vars wordsize env freevars)
    
    ;; Return the tagged pointer to the heap allocated content
    (emit "    movl %ebp, %eax    # return base ptr")
    (emit "    add $~s, %eax      # closure tag"  closure-tag)
    (emit "    add $~s, %ebp      # bump ebp" (align-to-8-bytes size))
    
    ;; Jump around code for application of closure
    (emit "    jmp ~a"  exit-point)
    (emit "~a:" entry-point)
    
    ;; CLOSURE CODE HERE -- based on emit code
    ;; note that we use the closure environment here so free variable
    ;; references all resolve to the closure cells
    
    (let f ([fmls formals] [si (- wordsize)] [env closed-env])
      (cond
       [(empty? fmls)
	(emit-tail-expr si env (cons ' begin body)) ;; implicit begin
	;(emit "    ret   # from closure")
	] 
       [else
	(f (rest fmls)
	   (- si wordsize)
	   (extend-env si env (first fmls)))]))
    (emit "    .align 4,0x90")
    (emit "~a:" exit-point)    
    ))

(define (emit-tail-closure si env expr)   ;;  <<<---- FIX LATER
  (let* [(lvar (closure-lvar expr))
	 (vars (closure-vars expr))
	 (size (* wordsize (+ 1 (length vars))))]
    (emit "   movl $~a, 0(%ebp) # store label" (lookup lvar env))
    (emit "   movl %ebp, %eax   # return heap base ptr")
    (emit "   add $~s, %eax     # closure tag "  closure-tag)
    (emit "   add $~s, %ebp     # bump base aligned 8 bytes" (align-to-8-bytes size))))
 

;;--------------------------------------------------------------------
;;             Free variable annotation & transformation
;;--------------------------------------------------------------------
;;
;; 1. Free variable analysis is performed.  Every lambda expression
;;    appearing in the source program is rewritten as a closure
;;    annotated with the set of free variables.  Free variables are
;;    any variables referenced in the body of the lambda that are
;;    not either formal parameters of the lambda or defined locally
;     inside the lambda.
;;
;;  (let ((x 5))
;;     (lambda (y) (lambda () (+ x y))))
;;
;;   becomes
;;
;;  (let ((x 5))
;;     (closure (y) (x)
;;         (closure () (x y) (+ x y))))
;;
;;--------------------------------------------------------------------

(define (lambda? expr)
  (and (pair? expr) (eq? (car expr) 'lambda)))

(define lambda-formals cadr)
(define (lambda-body expr)
  (if (lambda? expr)
      (if (fx= (length expr) 3)
	  (caddr expr)
	  (cons 'begin (cddr expr)))
      (error 'lambda-body "ill-formed lambda expression")))

(define (annotate-free-variables bound-vars expr)
  (cond
   [(lambda? expr)
    (let* ([formals (lambda-formals expr)]
	   [freevars (free-variables formals (lambda-body expr))]
	   [body (annotate-free-variables formals (lambda-body expr))])
      (list 'closure formals freevars body))]
   [(let? expr)
    (let* ([bindings (let-bindings expr)]
	   [vars (map car bindings)]
	   [exps (map cadr bindings)]
           [new-exps (map (lambda (e) (annotate-free-variables bound-vars e)) exps)]
	   [new-bindings (map list vars new-exps)]
	   [nbv (append vars bound-vars)]
	   [new-body (annotate-free-variables nbv (let-body expr))])
      (list 'let new-bindings new-body))]
   [(letrec? expr)
    (let* ([bindings (letrec-bindings expr)]
	   [vars (map car bindings)]
	   [exps (map cadr bindings)]
	   [nbv (append vars bound-vars)]
	   [new-exps (map (lambda (e) (annotate-free-variables nbv e)) exps)]
	   [new-bindings (map list vars new-exps)]
	   [new-body (annotate-free-variables nbv (letrec-body expr))])
      (list 'letrec new-bindings new-body))]
   [(pair? expr)
     (cons (annotate-free-variables bound-vars (car expr))
	   (annotate-free-variables bound-vars (cdr expr)))]
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
  (memq expr '(app begin if let lambda letrec)))  ;; <<<---- REVIEW THIS LIST

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
    (free-variables (merg (let-bound-vars expr) bound-vars)  ;; <<-- NEW 
  		    (let-body expr))]
   
   [(pair? expr)
      (append (free-variables bound-vars (car expr))
	      (free-variables bound-vars (cdr expr)))]
   [else
    (error 'free-variables "unrecognized expr")]))

(define (let-bound-vars expr)
  (map car (let-bindings expr)))



;;--------------------------------------------
;;  set! elimination     TBD
;;--------------------------------------------
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
;;--------------------------------------------


;;--------------------------------------------
;;       letrec elimination  -- IT WORKS!
;;--------------------------------------------

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


;;--------------------------------------------
;;           Expression Dispatcher
;;--------------------------------------------

(define (app? expr)
  (and (pair? expr) (eq? (car expr) 'app)))

(define (funcall? expr)
  (and (pair? expr)
       (or (eq? (car expr) 'funcall) (eq? (car expr) 'app))))  ;; make app a synonym for funcall
;; NOTE: cleaner to do this substitution in a pre-processing pass.


(define (begin? expr)
    (and (pair? expr) (symbol? (car expr)) (eq? (car expr) 'begin))) 

(define (emit-expr si env expr)
  (define (variable? expr)
    (and (symbol? expr)
	 (let ([pair (assoc expr env)])
	   (and pair (fixnum? (cdr pair)))))) ;; ignore lvar bindings  
  (define (lvar-app? expr)
    (and (pair? expr) (symbol? (car expr)) (string? (lookup (car expr) env))))
  (cond
    [(immediate? expr)  (emit-immediate expr)]
    [(variable? expr)   (emit-variable-ref env expr)]
    [(begin? expr)      (emit-begin si env (begin-body expr))]
    [(closure? expr)    (emit-closure si env expr)]
    [(funcall? expr)    (emit-funcall si env expr)]
   ; [(app? expr)        (emit-app si env expr)]
   ; [(lvar-app? expr)   (emit-funcall si env (cons 'funcall expr))] ;; supply implicit funcall
   ; [(lvar-app? expr)   (emit-app si env (cons 'app expr))]  ;; supply implicit app
    [(let? expr)        (emit-let si env (let-bindings expr) (let-body expr))]
    [(let*? expr)       (emit-let* si env (let-bindings expr) (let-body expr))]
    [(letrec? expr)     (emit-letrec si env (letrec-bindings expr)(letrec-body expr))]
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
	   (and pair (fixnum? (cdr pair))))))   ;; ignore lvar bindings
  (define (lvar-app? expr)  ;; there used to be lvar applications; resurrect this to co-exist with closures??
    (and (pair? expr) (symbol? (car expr)) (string? (lookup (car expr) env))))
(cond
    [(immediate? expr)  (emit-tail-immediate expr)]
    [(variable? expr)   (emit-tail-variable-ref env expr)]
    [(begin? expr)      (emit-tail-begin si env (begin-body expr))]
    [(app? expr)        (emit-tail-app si env expr)]
    [(closure? expr)    (emit-tail-closure si env expr)] ;; NEW
    [(funcall? expr)    (emit-tail-funcall si env expr)] ;; NEW
   ; [(lvar-app? expr)   (emit-tail-funcall si env (cons 'funcall expr))] ;; supply implicit funcall
    [(lvar-app? expr)   (emit-tail-app si env (cons 'app expr))] ;; supply implicit app
    [(let? expr)        (emit-tail-let si env (let-bindings expr) (let-body expr))]
    [(let*? expr)       (emit-tail-let* si env (let-bindings expr) (let-body expr))]
    [(letrec? expr)     (emit-tail-letrec si env (letrec-bindings expr) (letrec-body expr))]
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
  (emit "    ret"))

;;----------------------------------------------------------
;; emit-program is the top level of the compiler; applies
;; the pre-processor passes before generating code.
;;----------------------------------------------------------


(define (emit-program raw-expr)
  (emit "# ~s" raw-expr)
  (let ([vl-expr (vectorize-letrec raw-expr)])
    (emit "# == vectorize-letrec ==>")
    (emit "# ~s" vl-expr)
  (let ([anno-expr  (annotate-free-variables '() vl-expr)])
    (emit "# == annotate ==>")
    (emit "# ~s" anno-expr)
   ;(let ([expr (transform-to-closures anno-expr)])
    (let ([expr anno-expr])
      (emit "# == null transform ==>~%")
      (emit "# ~s~%" expr)
      (cond
       ;[(letrec? expr) (emit-letrec expr)]
       ;[(codes? expr)  (emit-codes expr)]
       [else           (emit-scheme-entry '() expr)])))))

(define (emit-scheme-entry env expr)
  (emit-function-header "_L_scheme_entry")
  (emit-expr (- wordsize) env expr)
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
