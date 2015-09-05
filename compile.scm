;; Scheme Compiler
;; Integers

;; (load "compile.scm")
;; (emit-program 67)
;; (close-port pgm-port)
;; (exit)
;; cat pgm.s

;; (load-option 'format)  ;; mit scheme only
;; (define pgm-port (open-output-file "pgm.s")) ;; mit

(define pgm-port (open-output-file "pgm.s" 'replace)) ;; chez scheme

(define-syntax emit
  (syntax-rules ()
     ((emit s)
      (format pgm-port s))
     ((emit s x)
      (format pgm-port s x))))

(define (emit-program x)
  (unless (integer? x) (error ---))
  (emit "   .text~%")
  (emit "   .align 4,0x90~%")
  (emit "   .globl _scheme_entry~%")
  (emit "_scheme_entry:~%")
  (emit "    movl $~s, %eax~%" x)
  (emit "    ret~%"))


