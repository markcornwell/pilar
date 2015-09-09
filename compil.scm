;; compil.scm
;; Scheme Compiler
;; 1.3 Unary Primitives
;; runs under petite chez scheme

;; petite compil.scm
;; (test-all)

(load "tests-driver.scm")
(load "tests/tests-1.3-req.scm")
(load "tests/tests-1.2-req.scm")
(load "tests/tests-1.1-req.scm")

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

(define-syntax define-primitive
  (syntax-rules ()
    [(_ (prim-name arg* ...) b b* ...)
     (begin
       (putprop 'prim-name '*is-prim* #t)
       (putprop 'prim-name '*arg-count*
	  (length '(arg* ...)))
       (putprop 'prim-name '*emitter*
		(lambda (arg* ...) b b* ...)))]))

(define-primitive (fxadd1 arg)
  (emit-expr arg)
  (emit "     addl $~s, %eax" (immediate-rep 1)))

(define-primitive (fxsub1 arg)
    (emit-expr arg)
    (emit "    addl $~s, %eax" (immediate-rep -1)))

(define-primitive (fxzero? arg)
    (emit-expr arg)
    (emit "    cmp $0, %eax")
    ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (fixnum->char arg)
  (emit-expr arg)
  (emit "    shll $~s, %eax" (- cshift fxshift))
  (emit "    orl $~s, %eax" ctag))

(define-primitive (char->fixnum arg)
    (emit-expr arg)
    (emit "   shrl $~s, %eax" cshift)
    (emit "   shll $~s, %eax" fxshift))

(define-primitive (null? arg)
    (emit-expr arg)
    (emit "    cmp $~s, %eax" nil-value)
    (emit "    mov $0, %eax")
     ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (char? arg)
    (emit-expr arg)
    (emit "    and $~s, %eax" cmask)
    (emit "    cmp $~s, %eax" ctag)
     ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (fixnum? arg)
  (emit-expr arg)
  (emit "    and $~s, %al" fxmask)
  (emit "    cmp $~s, %al" fxtag)
  (emit "    sete %al")
  (emit "    movzbl %al, %eax")
  (emit "    sal $~s, %al" bool-bit)
  (emit "    or $~s, %al" bool-f))

;; not takes any kind of value and return #t if
;; the object is #f, otherwise it returns #f

(define-primitive (not arg)
    (emit-expr arg)
    (emit "    cmp $~s, %eax" bool-f)
    ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (boolean? arg)
    (emit-expr arg)
    (emit "    and $~s, %eax" bmask)
    (emit "    cmp $~s, %eax" btag)
     ;; convert the cc to a boolean
    (emit "    sete %al")
    (emit "    movzbl %al, %eax")
    (emit "    sal $~s, %al" bool-bit)
    (emit "    or $~s, %al" bool-f))

(define-primitive (fxlognot arg)
    (emit-expr arg)
    (emit "    or $~s, %al" fxmask)
    (emit "    notl %eax"))

(define (primitive? x)
  (and (symbol? x) (getprop x '*is-prim*)))

(define (primitive-emitter x)
  (or (getprop x '*emitter*)
      (error "primitive-emitter" "no emitter defined for ~s" x)))

(define (primcall? x)
  (and (pair? x) (primitive? (car x))))

(define (emit-primcall x)
  (let ([prim (car x)] [args (cdr x)])
    (check-primcall-args prim args)
    (apply (primitive-emitter prim) args)))

(define (check-primcall-args prim args)
    (= (length args) (getprop prim '*arg-count*)))

(define (emit-expr x)
  (cond
    [(immediate? x)
     (emit "     movl $~s, %eax" (immediate-rep x))]
    [(primcall? x)
     (emit-primcall x)]
    [else
     (error "emit-expr" "unrecognized expr -- not immediate or primcall ~s" x)]))

(define (emit-program x)
  (emit-function-header "_scheme_entry")
  (emit-expr x)
  (emit "    ret"))

(define (emit-function-header entry)
  (emit "    .text")
  (emit "    .align 4,0x90")
  (emit "    .globl ~s" entry)
  (emit "~s:" entry))

(define compil-program emit-program)



