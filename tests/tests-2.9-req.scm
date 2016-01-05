
(add-tests-with-string-output "exit"
    [(foreign-call "s_foo") => "foo\n#t\n"]  ;; this is first to break at pad=32, likes pad=36			      
    [(foreign-call "exit" 0) => ""]
    [(foreign-call "exit" 1) => ""]			      
)

(add-tests-with-string-output "write"
     [(foreign-call "s_nop") => "#t\n"]   ;; wierd - see base.scm
     [(foreign-call "s_42") => "42\n"]
     [(foreign-call "s_true") => "#t\n"]
     [(foreign-call "s_false") => "#f\n"]  
     [(foreign-call "s_once" 0) => "0\n"] ;; these all work with a pad of 0, 32
 ;   [((lambda () (foreign-call "s_twice" 2))) => "4\n"]
 ;   [(foreign-call "s_once" 1) => "1\n"]
 ;   [(foreign-call "s_once" 2) => "2\n"]
 ;   [(foreign-call "s_twice" 2) => "4\n"]
 ;   [(foreign-call "s_twice" 250) => "500\n"]
    [(foreign-call "s_foo") => "foo\n#t\n"]  ;; this is first to break at pad=32, likes pad=36
    [(foreign-call "s_write_foo") => "foo\n#t\n"]
    [(foreign-call "s_write_hello") => "Hello World!\n#t\n"]    
 ;   [(foreign-call "s_exit") => ""]
    [(foreign-call "s_write" 1 "hello world" 11) => "hello world"]
 ;   [(foreign-call "s_write" 0 "hello world" (string-length "hello world")) => "hello world"]
)

;; IDEA:  DID ANYTHNG STEP ON ECX?  We need it when we exit!!!


;; (add-tests-with-string-output "S_error"
;;  [(let ([error (lambda args
;;                  (foreign-call "ik_error" args))])
;;    (error #f "died")
;;    12) => ""]

;;  [(let ([error (lambda args
;;                  (foreign-call "ik_error" args))])
;;    (error 'car "died")
;;    12) => ""]
;; )



