;; test scheme compiler

(load "compile.scm")
(emit-program 42)
(close-port pgm-port)
(run-shell-command "cat pgm.s")
(run-shell-command "as pgm.s -o pgm.o")
(run-shell-command "gcc main.c pgm.o -o main")
(run-shell-command "./main")
(exit)
