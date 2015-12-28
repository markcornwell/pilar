(closure (s1 i s2 j)
	 (s=)
	 (let ((s1 s1) (i i) (s2 s2) (j j))
	   (let ((l1 (string-length s1))
		 (l2 (string-length s2)))
	     (if (not (fx= l1 l2))
		 #f (if (fx= i l1)
			#t
			(if (char=? (string-ref s1 i)
				    (string-ref s2 j))
			    ((vector-ref s= 0)
			     s1
			     (fx+ i 1)
			     s2
			     (fx+ j 1))
			    #f))))))

;;----------------------------------------

(let
    (($si= (make-vector 1))
     ($m (make-vector 1)))
  (begin
    (begin
      (vector-set! $si=
		   0
		   (closure (s1 s2 i) ()
			    (char=? (string-ref s1 i)
				    (string-ref s2 i))))
      (vector-set! $m
		   0
		   (closure (s1 s2 i) ($si= $m)
			    (if (fx= i (string-length s1))
				()
				(cons ($si= s1 s2 i)
				      ((vector-ref $m 0)
				       s1
				       s2
				       (fx+ i 1)))))))
    (funcall (vector-ref $m 0) "fi" "fo" 0)))


;;---------------------------------------

(let
    (($si= (make-vector 1))
     ($m (make-vector 1)))
  (begin
    (begin
      (vector-set! $si=
		   0
		   (closure (s1 s2 i) ()
			    (let ((s1 s1) (s2 s2) (i i))
			      (char=? (string-ref s1 i)
				      (string-ref s2 i)))))
      (vector-set! $m
		   0
		   (closure (s1 s2 i) ($si= $m)
			    (let ((s1 s1) (s2 s2) (i i))
			      (if (fx= i (string-length s1))
				  ()
				  (cons ($si= s1 s2 i)
					((vector-ref $m 0)
					 s1
					 s2
					 (fx+ i 1))))))))
    ((vector-ref $m 0) "fi" "fo" 0)))
