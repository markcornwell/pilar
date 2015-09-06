;; Scheme Compiler
;; Integers
;; runs under petite chez scheme

;; petite compil.scm
;; (test-all)

(load "tests-driver.scm")
(load "tests/tests-1.1-req.scm")

;;---------------- integer compiler

(define (compil-program x)
  (unless (integer? x) (error "emit-program" "not an integer"))
  (emit "   .text")
  (emit "   .align 4,0x90")
  (emit "   .globl _scheme_entry")
  (emit "_scheme_entry:")
  (emit "    movl $~s, %eax" x)
  (emit "    ret"))

