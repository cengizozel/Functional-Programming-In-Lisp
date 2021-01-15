# Functional Programming In Lisp  
  
Fifteen functions are implemented in Lisp, which are categorized under “List,” “Set,” “Math”, and "Number Theory" sections using recursive programming. The implemented functions are listed below.
  
#### List Functions
1. append
2. reverse
3. nub
4. addtoend
  
#### Set Functions
1. member
2. insert
3. intersection
4. union
  
#### Math Functions
1. abs
2. factorial
3. right-tri
4. nth-fibo
  
#### Number Theory Functions
1. perfectp
2. abundantp
3. deficientp
  
## Demo


## Installation  
This project was made in Windows. I used Notepad++ to write the code and abcl.jar on CMD to run it.  
  
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
  
Further details regarding how the functions were written, the sample output was printed, and how REPL works is explained in the comments.  
