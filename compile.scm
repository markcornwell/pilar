;; Scheme Compiler
;; Integers

;; (load "compile.scm")
;; (emit-program 67)
;; (close-port pgm-port)
;; (exit)
;; cat pgm.s

(load-option 'format)

(define pgm-port (open-output-file "pgm.s"))

(define-syntax emit
  (syntax-rules ()
     ((emit s)
      (format pgm-port s))
     ((emit s x)
      (format pgm-port s x))))

(define (emit-program x)
  (if (integer? x)
    (begin  
      (emit "   .text~%")
      (emit "   .align 4,0x90~%")
      (emit "   .globl _scheme_entry~%")
      (emit "_scheme_entry:~%")
      (emit "    movl $~s, %eax~%" x)
      (emit "    ret~%"))
    (error "not an integer")))


