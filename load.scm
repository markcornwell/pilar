;; test scheme compiler

(load "compile.scm")
(emit-program 4454323)
(close-port pgm-port)
(run-shell-command "make pgm.o")
(run-shell-command "make main")
(run-shell-command "./main")
(exit)
