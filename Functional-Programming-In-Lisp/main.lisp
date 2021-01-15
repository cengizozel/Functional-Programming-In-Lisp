#|
Name: Cengiz Ozel
|#

; LIST FUNCTIONS
; 1. Append two lists
; If L1 is empty, the result is L2. If not, we use the con function to merge the first element and append(rest-of-L1 L2). We do this until L1 is empty then work our way back.
(defun append (L1 L2)
	(if (eq L1 nil)
		L2
		(cons (car L1) (append (cdr L1) L2))))

; 2. Reverse a list
; If L is empty, return nil. We append the rest of L and the first element of L until it is empty. Now we have a result to work our way back.
(defun reverse (L)
	(if (eq L nil)
		nil
		(append (reverse (cdr L)) (list (car L)))))

; 3. Remove duplicates from a list
; If L is empty, return nil. If the first element of L is a member of the rest of L, continue this process only with cdr(L) which removes the duplicate. If not, we merge that element with the rest of L and repeat the process with cdr L.
(defun nub (L)
	(if (eq L nil)
		nil
		(if (member (car L) (cdr L))
			(nub (cdr L))
			(cons (car L) (nub (cdr L))))))

; 4. Add an element to the end of a list.
; Reverses L in order to add n in the beginning. Then we reverse it again to get the correct order.
(defun addtoend (n L)
	(reverse (cons n (reverse L)))
)


; SET FUNCTIONS
; 1. Set membership
; If L is empty, return empty. If input n equals to the first element of L, return true. Otherwise repeat this action with the rest of L until either T is returned or L becomes empty. In that case, nil is returned.
(defun member(n L)
    (if (eq L nil)
		nil 
        (if (eq n (car L))
			T
            (member n (cdr L)))))
		
; 2. Insert element into set
; If n is already in L, return L. Otherwise, simply merge them.
(defun insert(n L)
    (if (member n L)
		L
		(cons n L)))

; 3. Set intersection
; A third parameter is needed for this function to be performed. However, this always starts as nil, thus we can make a second function that will send the nil argument for us.
; intersectCompute: If L1 is empty, return L3. If the first element of L1 is a member of L2, repeat the function with the rest of L1 and append(L3 first-element-of-L1). If L1 is empty, we can return this. Eventually, we will get the values from L1 that were a member of L2 as well.
(defun intersectCompute (L1 L2 L3)
		(if (eq L1 nil)
		L3
		(if (member (car L1) L2)
			(intersectCompute (cdr L1) L2 (append L3 (list (car L1))))
			(intersectCompute (cdr L1) L2 L3))))
			
; This is just so that we don't need to give a third input. If L1 is empty, the answer will be nil.
(defun intersection (L1 L2)
	(intersectCompute L1 L2 nil)
)

; 4. Set union
; This will append L1 and L2 then remove the duplicates.
(defun union (L1 L2)
	(nub (append L1 L2)))


; MATH FUNCTIONS
; 1. Absolute value
; If n is negative, return -n. If not, return n.
(defun abs (n)
	(if (< n 0) (- n) 
		n))

; 2. Factorial
; Multiplies n with the factorial of n-1 until n equals 1.
(defun factorial (n)
	(if (= n 1)
		1 
		(* n (factorial (- n 1)))))

; 3. Check if 3 integers can be the lengths of the two sides and the hypotenuse of a right triangle
; Since we don't specify which parameter is the Hypotenuse, the program checks all three possibilities to see if there is a right triangle using the a^2 = b^2 + c^2 formula.
(defun right-tri(x y z) 
	(if (or (eq (+ (* x x) (* y y)) (* z z)) (eq (+ (* x x) (* z z)) (* y y)) (eq (+ (* y y) (* z z)) (* x x)))
		T
		nil))
	
; 4. Nth Fibonacci number
; Adds up the Fibonacci number F(n-1) and F(n-2) until n equals 2. Then, we return 0 and 1, then we work our way back to add up the numbers in the sequence.
(defun nth-fibo(n)
	(if (= n 0)
		0
		(if (= n 1)
			1
			(+ (nth-fibo (- n 1)) (nth-fibo(- n 2))))))


; Number Theory
; The computation between the three number theory functions are very similar, so it's better to set common functions.
; This adds up all the factors. We initiate sum with 1 because we already know any integer can be perfectly devided by 1. It starts by trying to divide the input number i by i-1. Then we decrease the number it attempts to divide. If it does divide, then the number gets added up to the 'total' variable. In the end, total equals to the sum of the number's factors and is returned.
(defun totalFactor (i n total numbers)
	(if (< n 1)
		total
		(if (member (/ i n) numbers)
			(totalFactor i (- n 1) (+ total (/ i n)) numbers)
			(totalFactor i (- n 1) total numbers))))

; This returns a list of all the numbers from 1 to i-1. It merges i and the number set while decrementing i until it is less than 2. After that, 'numbers' will equal to the result number set.
(defun numSet(i numbers)
	(if(< i 2)
		numbers
		(numSet (- i 1) (cons i numbers))))

; The following part is the 3 main functions of the Number Theory category. It compares the user input with the sum of its factors other than itself.
; Perfect
; Checks if the sum of a number's factors other than itself is equal to the number itself.
(defun perfectp (i)
	(if (= i (totalFactor i (- i 1) 1 (numSet (- i 1) nil)))
		T
		nil))

; Abundant
; Checks if the sum of a number's factors other than itself is greater than the number itself.
(defun abundantp (i)
	(if (< i (totalFactor i (- i 1) 1 (numSet (- i 1) nil)))
		T
		nil))

; Deficient
; Checks if the sum of a number's factors other than itself is less than the number itself.
(defun deficientp (i)
	(if (> i (totalFactor i (- i 1) 1 (numSet (- i 1) nil)))
		T
		nil))


; PRINT FUNCTIONS AND RESULTS
; I wanted to use the print function, but I couldn't get the format that was asked in the prompt. format t makes it so that the output is printed without the quotes. prin1 is used so Lisp doesn't print a newline before the argument. That way I can get the exact same format in the prompt. terpri is to print a newline when needed. progn is to include multiple statements in the if condition.

(terpri)
(format t "***") (terpri)
(format t "*** Functional Programming in Lisp") (terpri)
(format t "*** Cengiz Ozel") (terpri)
(format t "***") (terpri)
(format t "") (terpri)

(format t "*** List functions") (terpri) (terpri)

(format t "(APPEND (1 3 X A) (4 2 B)) => ")
(prin1 (append '(1 3 X A) '(4 2 B))) (terpri)

(format t "(REVERSE (A B C D)) => ")
(prin1 (reverse '(A B C D))) (terpri)

(format t "(NUB (1 1 2 4 1 2 5)) => ")
(prin1 (nub '(1 1 2 4 1 2 5))) (terpri)

(format t "(ADDTOEND D (A B C)) => ")
(prin1 (addtoend 'D '(A B C))) (terpri)

(terpri) (format t "*** Set functions") (terpri) (terpri)

(format t "(MEMBER A (B C A D)) => ")
(prin1 (member 'A '(B C A D))) (terpri)

(format t "(INSERT A (B C D)) => ")
(prin1 (insert 'A '(B C D))) (terpri)

(format t "(INSERT A (A B C D)) => ")
(prin1 (insert 'A '(A B C D))) (terpri)

(format t "(INTERSECTION (A B C) (A C D)) => ")
(prin1 (intersection '(A B C) '(A C D))) (terpri)

(format t "(UNION (A B C) (A C D)) => ")
(prin1 (union '(A B C) '(A C D))) (terpri)

(terpri) (format t "*** Math functions") (terpri) (terpri)

(format t "(ABS 7) => ")
(prin1 (abs 7)) (terpri)

(format t "(ABS -7) => ")
(prin1 (abs -7)) (terpri)

(format t "(FACTORIAL 5) => ")
(prin1 (factorial 5)) (terpri)

(format t "(RIGHT-TRI 3 4 5) => ")
(prin1 (right-tri 3 4 5)) (terpri)

(format t "(RIGHT-TRI 1 2 3) => ")
(prin1 (right-tri 1 2 3)) (terpri)

(format t "(NTH-FIBO 6) => ")
(prin1 (nth-fibo 6)) (terpri)

(format t "(NTH-FIBO 10) => ")
(prin1 (nth-fibo 10)) (terpri)

(terpri) (format t "*** Number Theory functions") (terpri) (terpri)

(format t "(PERFECTP 5) => ")
(prin1 (perfectp 5)) (terpri)

(format t "(PERFECTP 6) => ")
(prin1 (perfectp 6)) (terpri)

(format t "(PERFECTP 36) => ")
(prin1 (perfectp 36)) (terpri)

(format t "(PERFECTP 496) => ")
(prin1 (perfectp 496)) (terpri)

(format t "(ABUNDANTP 5) => ")
(prin1 (abundantp 5)) (terpri)

(format t "(ABUNDANTP 12) => ")
(prin1 (abundantp 12)) (terpri)

(format t "(DEFICIENTP 5) => ")
(prin1 (deficientp 5)) (terpri)

(format t "(DEFICIENTP 12) => ")
(prin1 (deficientp 12)) (terpri)

;(format t " => ")
;(prin1 ()) (terpri)


; REPL
; The function calls itself after it is used unless the arguments were nil. I'm sure there are ways to make this code shorter, but it works just as well and gives results fast, so I settled with it.
(terpri) (format t "*** REPL") (terpri)

(defun appendAsk()
	(terpri)
	(format t "(APPEND (1 3 X A) (4 2 B)) => ")
	(prin1 (append '(1 3 X A) '(4 2 B))) (terpri)
	(format t "Enter first argument for APPEND (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L1 (read))
	(format t "Enter second argument for APPEND (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L2 (read))
	(if (not (and (eq L1 nil) (eq L2 nil)))
		(progn (format t "(APPEND ") (prin1 L1) (format t " ") (prin1 L2) (format t ") => ") (prin1 (append L1 L2)))
		(reverseAsk)) ; Next function
		(terpri) (appendAsk))

(defun reverseAsk()
	(terpri)
	(format t "(REVERSE (A B C D)) => ")
	(prin1 (reverse '(A B C D))) (terpri)
	(format t "Enter argument for REVERSE (i.e. (a b c). NIL to stop)") (terpri)
	(setq L (read))
	(if (not (eq L nil))
		(progn (format t "(REVERSE ") (prin1 L) (format t ") => ") (prin1 (reverse L)))
		(nubAsk)) ; Next function
		(terpri) (reverseAsk))

(defun nubAsk()
	(terpri)
	(format t "(NUB (1 1 2 4 1 2 5)) => ")
	(prin1 (nub '(1 1 2 4 1 2 5))) (terpri)
	(format t "Enter argument for NUB (i.e. (a b c). NIL to stop)") (terpri)
	(setq L (read))
	(if (not (eq L nil))
		(progn (format t "(NUB ") (prin1 L) (format t ") => ") (prin1 (nub L)))
		(addtoendAsk)) ; Next function
		(terpri) (nubAsk))

(defun addtoendAsk()
	(terpri)
	(format t "(ADDTOEND D (A B C)) => ")
	(prin1 (addtoend 'D '(A B C))) (terpri)
	(format t "Enter first argument for ADDTOEND (i.e. a. NIL for both inputs to stop)") (terpri)
	(setq n (read))
	(format t "Enter second argument for ADDTOEND (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L (read))
	(if (not (and (eq n nil) (eq L nil)))
		(progn (format t "(ADDTOEND ") (prin1 n) (format t " ") (prin1 L) (format t ") => ") (prin1 (addtoend n L)))
		(memberAsk)) ; Next function
		(terpri) (addtoendAsk))

(defun memberAsk()
	(terpri)
	(format t "(MEMBER A (B C A D)) => ")
	(prin1 (member 'A '(B C A D))) (terpri)
	(format t "Enter first argument for MEMBER (i.e. a. NIL for both inputs to stop)") (terpri)
	(setq n (read))
	(format t "Enter second argument for MEMBER (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L (read))
	(if (not (and (eq n nil) (eq L nil)))
		(progn (format t "(MEMBER ") (prin1 n) (format t " ") (prin1 L) (format t ") => ") (prin1 (member n L)))
		(insertAsk)) ; Next function
		(terpri) (memberAsk))

(defun insertAsk()
	(terpri)
	(format t "(INSERT A (B C D)) => ")
	(prin1 (insert 'A '(B C D))) (terpri)
	(format t "Enter first argument for INSERT (i.e. a. NIL for both inputs to stop)") (terpri)
	(setq n (read))
	(format t "Enter second argument for INSERT (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L (read))
	(if (not (and (eq n nil) (eq L nil)))
		(progn (format t "(INSERT ") (prin1 n) (format t " ") (prin1 L) (format t ") => ") (prin1 (insert n L)))
		(intersectionAsk)) ; Next function
		(terpri) (insertAsk))

(defun intersectionAsk()
	(terpri)
	(format t "(INTERSECTION (A B C) (A C D)) => ")
	(prin1 (intersection '(A B C) '(A C D))) (terpri)
	(format t "Enter first argument for INTERSECTION (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L1 (read))
	(format t "Enter second argument for INTERSECTION (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L2 (read))
	(if (not (and (eq L1 nil) (eq L2 nil)))
		(progn (format t "(INTERSECTION ") (prin1 L1) (format t " ") (prin1 L2) (format t ") => ") (prin1 (intersection L1 L2)))
		(unionAsk)) ; Next function
		(terpri) (intersectionAsk))

(defun unionAsk()
	(terpri)
	(format t "(UNION (A B C) (A C D)) => ")
	(prin1 (union '(A B C) '(A C D))) (terpri)
	(format t "Enter first argument for UNION (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L1 (read))
	(format t "Enter second argument for UNION (i.e. (a b c). NIL for both inputs to stop)") (terpri)
	(setq L2 (read))
	(if (not (and (eq L1 nil) (eq L2 nil)))
		(progn (format t "(UNION ") (prin1 L1) (format t " ") (prin1 L2) (format t ") => ") (prin1 (union L1 L2)))
		(absAsk)) ; Next function
		(terpri) (unionAsk))

(defun absAsk()
	(terpri)
	(format t "(ABS -7) => ")
	(prin1 (abs -7)) (terpri)
	(format t "Enter argument for ABS (i.e. -69. NIL to stop)") (terpri)
	(setq n (read))
	(if (not (eq n nil))
		(progn (format t "(ABS ") (prin1 n) (format t ") => ") (prin1 (abs n)))
		(factorialAsk)) ; Next function
		(terpri) (absAsk))

(defun factorialAsk()
	(terpri)
	(format t "(FACTORIAL 5) => ")
	(prin1 (factorial 5)) (terpri)
	(format t "Enter argument for FACTORIAL (i.e. 7. NIL to stop)") (terpri)
	(setq n (read))
	(if (not (eq n nil))
		(progn (format t "(FACTORIAL ") (prin1 n) (format t ") => ") (prin1 (factorial n)))
		(right-triAsk)) ; Next function
		(terpri) (factorialAsk))

(defun right-triAsk()
	(terpri)
	(format t "(RIGHT-TRI 3 4 5) => ")
	(prin1 (right-tri 3 4 5)) (terpri)
	(format t "Enter first argument for RIGHT-TRI (i.e. 7. NIL for all three inputs to stop)") (terpri)
	(setq x (read))
	(format t "Enter second argument for RIGHT-TRI (i.e. 7. NIL for all three inputs to stop)") (terpri)
	(setq y (read))
	(format t "Enter third argument for RIGHT-TRI (i.e. 7. NIL for all three inputs to stop)") (terpri)
	(setq z (read))
	(if (not (and (and (eq x nil) (eq y nil)) (eq z nil)))
		(progn (format t "(RIGHT-TRI ") (prin1 x) (format t " ") (prin1 y) (format t " ") (prin1 z) (format t ") => ") (prin1 (right-tri x y z)))
		(nth-fiboAsk)) ; Next function
		(terpri) (right-triAsk))

(defun nth-fiboAsk()
	(terpri)
	(format t "(NTH-FIBO 10) => ")
	(prin1 (nth-fibo 10)) (terpri)
	(format t "Enter argument for NTH-FIBO (i.e. 7. NIL to stop)") (terpri)
	(setq n (read))
	(if (not (eq n nil))
		(progn (format t "(NTH-FIBO ") (prin1 n) (format t ") => ") (prin1 (nth-fibo n)))
		(perfectpAsk)) ; Next function
		(terpri) (nth-fiboAsk))

(defun perfectpAsk()
	(terpri)
	(format t "(PERFECTP 6) => ")
	(prin1 (perfectp 6)) (terpri)
	(format t "Enter argument for PERFECTP (i.e. 7. NIL to stop)") (terpri)
	(setq n (read))
	(if (not (eq n nil))
		(progn (format t "(PERFECTP ") (prin1 n) (format t ") => ") (prin1 (perfectp n)))
		(abundantpAsk)) ; Next function
		(terpri) (perfectpAsk))

(defun abundantpAsk()
	(terpri)
	(format t "(ABUNDANTP 12) => ")
	(prin1 (abundantp 12)) (terpri)
	(format t "Enter argument for ABUNDANTP (i.e. 7. NIL to stop)") (terpri)
	(setq n (read))
	(if (not (eq n nil))
		(progn (format t "(ABUNDANTP ") (prin1 n) (format t ") => ") (prin1 (abundantp n)))
		(deficientpAsk)) ; Next function
		(terpri) (abundantpAsk))

(defun deficientpAsk()
	(terpri)
	(format t "(DEFICIENTP 5) => ")
	(prin1 (deficientp 5)) (terpri)
	(format t "Enter argument for DEFICIENTP (i.e. 7. NIL to stop)") (terpri)
	(setq n (read))
	(if (not (eq n nil))
		(progn (format t "(DEFICIENTP ") (prin1 n) (format t ") => ") (prin1 (deficientp n)))
		(exit)) ; Next function (it's the last one, so it will exit)
		(terpri) (deficientpAsk))

; Initiates REPL by asking the first function.
(appendAsk)
