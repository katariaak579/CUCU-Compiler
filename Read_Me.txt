There are 7 files in this folder : lexer.txt, parser.txt, cucu.l, cucu.y, Sample1.cu, Sample2.cu and README.txt.

The Following Instructions Should Be Followed While Running The Program :
    A. Open the terminal in the directory 2020CSB1113 and Enter the following commands to run the program :
        1. flex cucu.l
        2. bison -d cucu.y
        3. g++ cucu.tab.c lex.yy.c -lfl -o cucu
        4. ./cucu

Cucu.l

    A. I've tokenized all the variable names, keywords, special characters and numbers.
    B. It will give the output inside the lexer.txt file and print every token name in it.

cucu.y

    A. This program contains the BNF grammar rules for the compiler.
    B. This will give the output inside the parser.txt file and print the parsing of code.
    C. If there would be any error in syntax then an error message Syntax Error is printed in the terminal and code returns from there.


Sample1.cu

    A. This file contains the code which has correct synatx.
    B. You can add your correct syntax code here and the program would parse it.
    C. Comment the line 133 and uncomment the line 132 to run the program on this file.

Sample2.cu

    A. This file contains the code which has incorrect syntax.
    B. You can add your incorrect synatx code here and the program would parse it and print the error if it is wrong.
    C. Comment the line 132 and uncomment the line 133 to run the program on this file.

lexer.txt

    A. This file contains the output obtained by the cucu.l file, which are all the tokens in the code.

parser.txt

    A. This file stores the output obtained by the cucu.y file, which is parsed by the cucu.y file and printed the steps and different types of statements in it.
