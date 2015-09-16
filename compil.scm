;; compil.scm
;; Pilar: A Scheme Compiler
;; Mark Cornwell
;;
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
;; Input Language:
;;
;;  <Program> -> <Expr>
;;            |  (letrec ([lvar <Lambda>] ...) <Expr>)
;;
;;  <Lambda>  -> (lamba (var ...) <Expr>)
;;
;;  <Expr>    -> <Imm>
;;            |  var
;;            | (if <Expr> <Expr> <Expr>)
;;            | (let ([var <Expr>] ...) <Expr>
;;            | (app lvar <Expr> ...)
;;            | (prim <Expr>)
;;
;;  <Imm>     -> fixnum | boolean | char | null
;;-----------------------------------------------------

(load "tests-driver.scm")
(load "tests/tests-1.8-req.scm")
(load "tests/tests-1.7-req.scm")
(load "tests/tests-1.6-req.scm")
(load "tests/tests-1.5-req.scm")
(load "tests/tests-1.4-req.scm")
(load "tests/tests-1.3-req.scm")
(load "tests/tests-1.2-req.scm")
(load "tests/tests-1.1-req.scm")

;; utility
(define first car)
(define second cadr)
(define third caddr)
(define rest cdr)

(define fxshift      2)
(define fxmask     #b11)   ; #x03
(define fxtag      #b00)   ; #x00

(define cshift       8)
(define ctag      #b00001111)
(define cmask     #b11111111)
(define bool-f    #b00101111) ; #x2F
(define bool-t    #b01101111) ; #x6F
(define bool-bit     6)
(define bmask     #b10111111)
(define btag      #b00101111)

(define pair-shift   3)
(define pair-mask #b00000111) ; #x03
(define pair-tag  #b00000001) ; #x01
(define size-pair    8)
(define car-offset   0)
(define cdr-offset   4)

(define nil-value #x3F)
(define wordsize     4) ; bytes

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
;;                      Primitives
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
;;            fixnum
;;---------------------------------------

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
  (emit-expr si env arg2)                     ;; evaluate arg2
  (emit "    movl %eax, ~s(%eax)" si)         ;; push arg2
  (emit-expr (- si wordsize) env arg1)        ;; evaluate arg1
  (emit "    movl %eax, ~s(%ebp)" car-offset) ;; arg1 -> car
  (emit "    movl ~s(%eax), %eax" si)         ;; pop arg2
  (emit "    movl %eax, ~s(%ebp)" cdr-offset) ;; arg2 -> cdr
  (emit "    movl %ebp, %eax")                ;; return ptr to cons'd pair
  (emit "    or  $~s, %eax" pair-tag)          ;; or in the tag
  (emit "    addl $~s, %ebp" size-pair))       ;; bump heap ptr %ebp

(define-primitive (car si env arg)
  (emit-expr si env arg)
  (emit "    movl ~s(%eax), %eax)" (- car-offset pair-tag)))

(define-primitive (cdr si env arg)
  (emit-expr si env arg)
  (emit "    movl ~s(%eax), %eax)" (- cdr-offset pair-tag)))  
    
;;---------------------------------------------------------

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
      (let ([L (format "L_~s" count)])
    (set! count (add1 count))
    L))))

;;-------------------------------------------
;;               Conditionals
;;-------------------------------------------

(define (if? x) (and (eq? (car x) 'if) (eq? 4 (length x))))
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

(define (and? x) (eq? (car x) 'and))

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

(define (or? x) (eq? (car x) 'or))

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

(define (let? x) (eq? (car x) 'let))
(define (let-bindings x) (cadr x))
(define (let-body x) (caddr x))

(define lhs car)
(define rhs cadr)
(define bind cons)
(define (extend-env si env var) (cons (bind var si) env))

(define (emit-let si env bindings body) ;; look at the version on p. 30
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

;;------------------------------------------------------------------
;; env is a list of dotted pairs
;; after adding procedure labels we have two kinds of bindings
;; lvars bind to strings, vars bind to integers
;; think this through
;; - clearly emit-variable-ref should take only vars
;; - variable? needs to distingush a var from an lvar
;; - might be some advantage to having function label in environment
;;------------------------------------------------------------------

(define (lookup var env) ;; env is a list of dotted pairs
  (let ([pair (assoc var env)])
    (and pair (cdr pair))))

(define (emit-variable-ref env var)
  (emit-stack-load (lookup var env)))

(define (emit-tail-variable-ref env var)
  (emit-stack-load (lookup var env))
  (emit "    ret"))

(define (emit-stack-save si)
  (emit "    movl %eax, ~s(%esp)   # stk save" si))

(define (emit-stack-load si)
  (emit "    movl ~s(%esp), %eax   # stk load" si))

(define (let*? x) (eq? (car x) 'let*))

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

(define (letrec? expr)
  (and (pair? expr) (eq? (car expr) 'letrec)))
  
(define (letrec-bindings expr) (cadr expr))
(define (letrec-body expr) (caddr expr))

(define (emit-letrec expr)  ;; <<---<< messed up
  (emit "# emit-letrec expr=~s" expr)
  (let* ([bindings (letrec-bindings expr)]
	 [lvars (map lhs bindings)]
	 [lambdas (map rhs bindings)]
	 [labels (unique-labels lvars)]
	 [env (make-initial-env lvars labels)])
    (emit "#  bindings=~s" bindings)
    (emit "#  lvars=~s" lvars)
    (emit "#  lambdas=~s" lambdas)
    (emit "#  labels=~s" labels)
    (emit "#  env=~s" env)
    (emit "#  ---- >>>>> emit-lambdas start ----")
    (for-each (emit-lambda env) lambdas labels)
    (emit "#  ---- <<<<<  emit-lambdas end ------")
    (emit-scheme-entry env (letrec-body expr))))

(define (unique-labels lvars)
    (define (assign-label v) (unique-label))
    (map assign-label lvars))

(define (make-initial-env lvars labels)
  (cond
   [(null? lvars) '()]
   [else (cons (cons (car lvars) (car labels))
	       (make-initial-env (cdr lvars) (cdr labels)))])) 

(define lambda-formals cadr)
(define lambda-body  caddr)

(define empty? null?)

(define (emit-lambda env)
  (lambda (expr label)
    (emit-function-header label)
    (let ([fmls (lambda-formals expr)]
	  [body (lambda-body expr)])
      (let f ([fmls fmls] [si (- wordsize)] [env env])
	(cond
	 [(empty? fmls)
	  (emit-tail-expr si env body)
	  (emit "    ret   # from lambda")]  ;; <<--- Clearly every lambda needs a return
	 [else
	  (f (rest fmls)
	     (- si wordsize)
	     (extend-env si env (first fmls)))])))))  ;; <<---- order correct

(define call-target cadr) ;; (app lvar <Expr> ... )
(define call-args cddr)   ;;           ^-- that part

(define (emit-app si env expr)
  (define (emit-arguments si args)
    (unless (empty? args)
        (emit-expr si env (first args))    ;; evaluated arg in %eax
	(emit "    mov %eax, ~s(%esp)    # arg" si) ;; save %eax as evaluated arg    
	(emit-arguments (- si wordsize) (rest args))))
  (define (emit-adjust-base si)
    (unless (eq? si 0)
	(emit "    lea ~s(%esp), %esp    # adjust base" si )))
  (define (emit-call si label)
    (emit "    call ~a   # app  " label))
  (emit-arguments (- si wordsize) (call-args expr))
  (emit-adjust-base (+ si wordsize))
  (emit-call si (lookup (call-target expr) env))
  (emit-adjust-base (- (+ si wordsize))))

(define (emit-tail-app si env expr)
  (define (emit-arguments si args)
    (unless (empty? args)
        (emit-expr si env (first args))    ;; evaluated arg in %eax
	(emit "    mov %eax, ~s(%esp)    # arg" si) ;; save %eax as evaluated arg    
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

;;--------------------------------------------
;;           Expression Dispatcher
;;--------------------------------------------

(define (emit-expr si env expr) 
  (define (variable? expr)
    (and (symbol? expr)
	 (let ([pair (assoc expr env)])
	   (and pair (fixnum? (cdr pair)))))) ;; ignore lvar bindings
  (define (app? expr)
    (and (pair? expr) (eq? (car expr) 'app)))
  (define (lvar-app? exp)
    (and (pair? expr) (symbol? (car expr)) (string? (lookup (car expr) env))))
  (cond
    [(immediate? expr)  (emit-immediate expr)]
    [(variable? expr)   (emit-variable-ref env expr)]
    [(app? expr)        (emit-app si env expr)]
    [(lvar-app? expr)   (emit-app si env (cons 'app expr))] ;; supply implicit app
    [(let? expr)        (emit-let si env (let-bindings expr) (let-body expr))]
    [(let*? expr)       (emit-let* si env (let-bindings expr) (let-body expr))]
    [(primcall? expr)   (emit-primcall si env expr)]
    [(if? expr)         (emit-if si env expr)]
    [(and? expr)        (emit-and si env expr)]
    [(or? expr)         (emit-or si env expr)]
    [else
     (error "emit-expr" "unrecognized form:" expr)]))

(define (emit-tail-expr si env expr) ;; <---<< ?
  (define (variable? expr)
    (and (symbol? expr)
	 (let ([pair (assoc expr env)])
	   (and pair (fixnum? (cdr pair)))))) ;; ignore lvar bindings
  (define (app? expr)
    (and (pair? expr) (eq? (car expr) 'app)))
  (define (lvar-app? exp)
    (and (pair? expr) (symbol? (car expr)) (string? (lookup (car expr) env))))
  (cond
    [(immediate? expr)  (emit-tail-immediate expr)]
    [(variable? expr)   (emit-tail-variable-ref env expr)]
    [(app? expr)        (emit-tail-app si env expr)]
    [(lvar-app? expr)   (emit-tail-app si env (cons 'app expr))] ;; supply implicit app
    [(let? expr)        (emit-tail-let si env (let-bindings expr) (let-body expr))]
    [(let*? expr)       (emit-tail-let* si env (let-bindings expr) (let-body expr))]
    [(primcall? expr)   (emit-tail-primcall si env expr)]
    [(if? expr)         (emit-tail-if si env expr)]
    [(and? expr)        (emit-tail-and si env expr)]
    [(or? expr)         (emit-tail-or si env expr)]
    [else
     (error "emit-expr" "unrecognized form:" expr)]))

(define (emit-immediate x)
  (emit "    movl $~s, %eax     # immediate" (immediate-rep x)))

(define (emit-tail-immediate x)
  (emit-immediate x)
  (emit "    ret"))

(define (emit-program expr)
  (emit "# ~s~%" expr)
  (if (letrec? expr)
      (emit-letrec expr)  ;; <--
      (emit-scheme-entry '() expr)))

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
  (emit "    movl 12(%esp), %ebp")
  (emit "    movl 8(%esp), %esp")  
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
