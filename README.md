# Functional-Programming-In-Lisp<br />
<br />
In this project, four functions are implement from each of the “List,” “Set,” “Math” sections and all three functions from the "Required" section using recursive programming. The implemented functions are listed below.<br />
<br />
List Functions<br />
------------------<br />
1. append<br />
2. reverse<br />
3. nub<br />
4. addtoend<br />
<br />
Set Functions<br />
------------------<br />
1. member<br />
2. insert<br />
3. intersection<br />
4. union<br />
<br />
Math Functions<br />
------------------<br />
1. abs<br />
2. factorial<br />
3. right-tri<br />
4. nth-fibo<br />
<br />
Required Functions<br />
------------------<br />
1. perfectp<br />
2. abundantp<br />
3. deficientp<br />
<br />
HOW TO RUN:<br />
This project was made in Windows. I used Notepad++ to write the code and abcl.jar on CMD to run it.<br />
<br />
- Open CMD and open the directory in which abcl.jar is located.<br />
- Enter the command "java -jar abcl.jar".<br />
- Enter "(load "main")". This is assuming abcl.jar and main.lisp are in the same folder. If not, the directory in which main is located should be written.<br />
- The program should create all the functions, and a list of sample outputs will be printed (A copy of the output is included in this README.txt file)<br />
- After that, REPL will be run. At this point, it will ask you to write inputs for the append function. You can put inputs or write nil to skip to the next function.<br />
- After going through all the functions, the program will automatically quit.<br />
<br />
SAMPLE OUTPUT: This is the sample output created before getting into REPL. The exact same output will be printed by the program.<br />
<br />
***<br />
*** Functional Programming in Lisp<br />
*** Cengiz Ozel<br />
***<br />
<br />
*** List functions<br />
<br />
(APPEND (1 3 X A) (4 2 B)) => (1 3 X A 4 2 B)<br />
(REVERSE (A B C D)) => (D C B A)<br />
(NUB (1 1 2 4 1 2 5)) => (4 1 2 5)<br />
(ADDTOEND D (A B C)) => (A B C D)<br />
<br />
*** Set functions<br />
<br />
(MEMBER A (B C A D)) => T<br />
(INSERT A (B C D)) => (A B C D)<br />
(INSERT A (A B C D)) => (A B C D)<br />
(INTERSECTION (A B C) (A C D)) => (A C)<br />
(UNION (A B C) (A C D)) => (B A C D)<br />
<br />
*** Math functions<br />
<br />
(ABS 7) => 7<br />
(ABS -7) => 7<br />
(FACTORIAL 5) => 120<br />
(RIGHT-TRI 3 4 5) => T<br />
(RIGHT-TRI 1 2 3) => NIL<br />
(NTH-FIBO 6) => 8<br />
(NTH-FIBO 10) => 55<br />
<br />
*** Required functions<br />
<br />
(PERFECTP 5) => NIL<br />
(PERFECTP 6) => T<br />
(PERFECTP 36) => NIL<br />
(PERFECTP 496) => T<br />
(ABUNDANTP 5) => NIL<br />
(ABUNDANTP 12) => T<br />
(DEFICIENTP 5) => T<br />
(DEFICIENTP 12) => NIL<br />
<br />
Further details regarding how the functions were written, the sample output was printed, and how REPL works is explained in the comments.<br />
