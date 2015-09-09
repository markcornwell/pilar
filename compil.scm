;; compil.scm
;; Scheme Compiler
;; Immediate Constants
;; runs under petite chez scheme

;; petite compil.scm
;; (test-all)

(load "tests-driver.scm")
(load "tests/tests-1.2-req.scm")
(load "tests/tests-1.1-req.scm")

(define fxshift      2)
(define cshift       8)
(define ctag      #x0F)
(define bool_f    #x2F)
(define bool_t    #x6F)
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
      [(boolean? x) (if x bool_t bool_f) ]
      [(char? x) (logor (ash (char->integer x) cshift) ctag) ]
      [(null? x) nil-value ]))

(define (compil-program x)
   (unless (immediate? x) (error "compil-program" "not an immediate constant"))
   (emit "     .text")
   (emit "     .align 4,0x90")
   (emit "     .globl _scheme_entry")
   (emit "_scheme_entry:")
   (emit "     movl $~s, %eax" (immediate-rep x))
   (emit "     ret"))


