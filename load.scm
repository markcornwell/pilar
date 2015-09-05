;; test scheme compiler
;; works under petite chez scheme

;; $ petite load.scm

(load "compile.scm")
(emit-program 42)
(close-port pgm-port)
(system "cat pgm.s")
(system "as pgm.s -o pgm.o")
(system "gcc -Wall main.c pgm.o -o main")
(system "./main")
(exit)
