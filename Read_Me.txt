Assumptions taken in the compiler 

We cannot initiate or declare multiple variable with only one datatype states
Eg: int a,b,c,d will give syntax error 
whereas int a;int b;int c;int d; will not give any error

There is no else if() statement 

There is no bitwise operator like |,&

Modulo is also not added %

In parser.txt while printing the expression first it prints the variable names and then the operator (arithmaetic or realtional) between them.

In if and if else statement it prints the if statement when the if statement has terminated and same is the case for else statement 

In while loop it prints the WHILE LOOP HAS ENDED when the loop has been terminated 

In return statement it first tells the return value then species that it is being returned 
In case nothing is returned only return is printed and no return value has been printed

In Bool statement first the varibles are printed and then the relational operator.

It is expected that all the statements will be given inside either main function or any other function.

In my sample1.cu is the syntactically correct code 
In sample2.cu is the syntactically incorrect code as else statement cannot occur without if statement.
