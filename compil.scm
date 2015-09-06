;; Scheme Compiler
;; Integers
;; runs under petite chez scheme

;; (load "compile.scm")
;; (emit-program 67)
;; (close-port pgm-port)
;; (exit)
;; cat pgm.s

(define compil-port
  (make-parameter
      (current-output-port)
      (lambda (p)
          (unless (output-port? p)
	     (error 'compil-port "not an output port ~s" p))
	  p)))

(define (run-compil expr)
  (let ([p (open-output-file "pgm.s" 'replace)])
    (parameterize ([compil-port p])
       (compil-program expr))
    (close-output-port p)))

(define (build)
  (unless (zero? (system "as pgm.s -o pgm.o"))
	  (error 'build "produced program failed assembly"))
  (unless (zero? (system "gcc main.c pgm.o -o main"))
	  (error 'build "produced program failed to link")))

(define (emit . args)
  (apply fprintf (compil-port) args)
  (newline (compil-port)))

(define (compil-program x)
  (unless (integer? x) (error "emit-program" "not an integer"))
  (emit "   .text")
  (emit "   .align 4,0x90")
  (emit "   .globl _scheme_entry")
  (emit "_scheme_entry:")
  (emit "    movl $~s, %eax" x)
  (emit "    ret"))

