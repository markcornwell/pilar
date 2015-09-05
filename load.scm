;; test scheme compiler
;; works with chez scheme

;; $ petite load.scm

(load "compile.scm")
(emit-program 42)
(close-port pgm-port)
;; mit scheme
;;(run-shell-command "cat pgm.s")
;;(run-shell-command "as pgm.s -o pgm.o")
;;(run-shell-command "gcc main.c pgm.o -o main")
;;(run-shell-command "./main")
;; petite chez scheme
(system "cat pgm.s")
(system "as pgm.s -o pgm.o")
(system "gcc main.c pgm.o -o main")
(system "./main")
(exit)
