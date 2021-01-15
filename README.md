# Functional Programming In Lisp  
  
Fifteen functions are implemented in Lisp, which are categorized under “List,” “Set,” “Math,” and "Number Theory" sections using recursive programming. The implemented functions are listed below.
  
#### List Functions
1. **append:** Append two lists.
2. **reverse:** Reverse a list.
3. **nub:** Remove duplicates from a list.
4. **addtoend:** Add an element to the end of a list.
  
#### Set Functions
1. **member:** Set membership.
2. **insert:** Insert element into set.
3. **intersection:** Set intersection.
4. **union:** Set union.
  
#### Math Functions
1. **abs:** Absolute value.
2. **factorial:** Factorial.
3. **right-tri:** Check if 3 integers can be the lengths of the two sides and the hypotenuse of a right triangle.
4. **nth-fibo:** Nth Fibonacci number.
  
#### Number Theory Functions
1. **perfectp:** Checks if the sum of a number's factors other than itself is equal to the number itself.
2. **abundantp:** Checks if the sum of a number's factors other than itself is greater than the number itself.
3. **deficientp:** Checks if the sum of a number's factors other than itself is less than the number itself.
  
## Demo
![1](https://user-images.githubusercontent.com/60388555/104777312-74e00680-5749-11eb-8222-49ed2d7a9226.PNG)

## Installation  
This project was made in Windows. I used Notepad++ to write the code and abcl.jar on CMD to run it.  
- Download 
[main.lisp](https://github.com/cengizozel/Functional-Programming-In-Lisp/archive/main.zip).
- Open CMD and open the directory in which abcl.jar is located.  
- Enter the command below.
```batch
java -jar abcl.jar
```
- Enter the command below. This is assuming abcl.jar and main.lisp are in the same folder. If not, the directory in which main is located should be written.  
```batch
(load "main")
```
- The program should create all the functions, and a list of sample outputs will be printed (A copy of the output is included below)  
- After that, REPL will be run. At this point, it will ask you to write inputs for the append function. You can put inputs or write nil to skip to the next function.  
- After going through all the functions, the program will automatically quit.

## Functional Programming
Functional programming is the process of creating software which includes only mathematical functions and does not include any other concepts such as Object Oriented Programming. These functions are often written using recursive algorithms. This makes it so that the function calls itself until an answer is returned. After that, the function unwinds and returns the final result.
```lisp
(defun reverse (L)
	(if (eq L nil)
		nil
		(append (reverse (cdr L)) (list (car L)))))
```
For these functions, recursive programming is more preferable compared to iterative programming.
  
## Sample Output

This is the sample output created before getting into REPL. The exact same output will be printed by the program.  
 
```lisp 
***  
*** Functional Programming in Lisp  
*** Cengiz Ozel  
***  
  
*** List functions  
  
(APPEND (1 3 X A) (4 2 B)) => (1 3 X A 4 2 B)  
(REVERSE (A B C D)) => (D C B A)  
(NUB (1 1 2 4 1 2 5)) => (4 1 2 5)  
(ADDTOEND D (A B C)) => (A B C D)  
  
*** Set functions  
  
(MEMBER A (B C A D)) => T  
(INSERT A (B C D)) => (A B C D)  
(INSERT A (A B C D)) => (A B C D)  
(INTERSECTION (A B C) (A C D)) => (A C)  
(UNION (A B C) (A C D)) => (B A C D)  
  
*** Math functions  
  
(ABS 7) => 7  
(ABS -7) => 7  
(FACTORIAL 5) => 120  
(RIGHT-TRI 3 4 5) => T  
(RIGHT-TRI 1 2 3) => NIL  
(NTH-FIBO 6) => 8  
(NTH-FIBO 10) => 55  
  
*** Number Theory functions  
  
(PERFECTP 5) => NIL  
(PERFECTP 6) => T  
(PERFECTP 36) => NIL  
(PERFECTP 496) => T  
(ABUNDANTP 5) => NIL  
(ABUNDANTP 12) => T  
(DEFICIENTP 5) => T  
(DEFICIENTP 12) => NIL
```  

## REPL
A read–eval–print loop (REPL) is an interactive program that takes inputs from the user and executes the appropriate functions with them in order to return a result. This is common in LISP, and the image below shows how the REPL in this project looks.

![2](https://user-images.githubusercontent.com/60388555/104777419-9e992d80-5749-11eb-9501-5879d478df20.PNG)

REPL gives the user a chance to use the functions in real time without having the need to hard code everything inside of the source file.
