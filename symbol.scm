;;-------------------
;;  Symbol libary
;;-------------------

(label ([str2sym
	 (letrec ((f (lambda (str symlist)
		       (if (string=? str (symbol->string (car symlist)))
			  (car symlist)
			  (if (null? (cdr symlist))
			      (set-cdr! symlist (make-symbol str nil))
			      (f str (cdr symlist)))))))
	   (lambda (s) (f s (symbols))))])
       (make-symbol "string->symbol" (label-ref str2sym)))

;; This feels a bit non-standard, but perhaps we can hide it behind some transforms that
;; look less odd.

;; idea, character sequences as part of translation to asm
;; ->  _to_
;; +   _plus_
;; -   _minus_
;; Too complex.



