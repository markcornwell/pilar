;; tests-driver.scm

(define all-tests '())

(define-syntax add-tests-with-string-output
  (syntax-rules (=>)
    [(_ test-name [expr => output-string] ...)
     (set! all-tests
        (cons 
           '(test-name [expr string  output-string] ...)
            all-tests))]))

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
  (unless (zero? (system "gcc -Wall main.c pgm.o -o main"))
     (error 'build "produced program failed to link")))

(define (execute)
  (unless (zero? (system "./main > main.out"))
	  (error 'execute "produced program exited abnormally")))

(define (test-one test-id test)
  (let ([expr (car test)]
        [type (cadr test)]
        [out  (caddr test)])
    (printf "test ~s:~s ..." test-id expr)
    (flush-output-port)
    (case type
     [(string) (test-with-string-output test-id expr out)]
     [else (error 'test "invalid test type ~s" type)])
    (printf " ok\n")))

(define (test-all)
  (let f ([i 0] [ls (reverse all-tests)])
    (if (null? ls)
        (printf "passed all ~s tests\n" i)
        (let ([x (car ls)] [ls (cdr ls)])
          (let* ([test-name (car x)] 
                 [tests (cdr x)]
                 [n (length tests)])
            (printf "Performing ~a tests ...\n" test-name)
            (let g ([i i] [tests tests])
              (cond
                [(null? tests) (f i ls)]
                [else
                 (test-one i (car tests))
                 (g (add1 i) (cdr tests))])))))))

(define (test-with-string-output test-id expr expected-output)
   (run-compil expr)
   (build)
   (execute)
   (unless (string=? expected-output (get-string))
     (error 'test "output mismatch for test ~s, expected ~s, got ~s"
        test-id expected-output (get-string))))

(define (get-string)
  (with-output-to-string
    (lambda ()
      (with-input-from-file "main.out"
        (lambda ()
          (let f ()
            (let ([c (read-char)])
              (cond
               [(eof-object? c) (void)]
               [else (display c) (f)]))))))))

(define (emit . args)
  (apply fprintf (compil-port) args)
  (newline (compil-port)))
