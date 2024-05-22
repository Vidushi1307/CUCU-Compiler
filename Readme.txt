Aim: To make a compiler for a simple toy language


To execute the code use the following commands

flex cucu.l
bison -d cucu.y
cc lex.yy.c cucu.tab.c -o cucu or gcc lex.yy.c cucu.tab.c -o cucu -lfl
./cucu Sample1.cu (or Sample2.cu to run the file containing errors)

The compiler supports:
>>The function supports variable declarations, function declarations, and function definitions.
>>Variable declaration can be:-
   int var;
   int var=13;
   char *str;
   char *str="Vidushi";
>>The compiler follows the precedence order and also the associativity rules.
>>It ignores the single and multi-line comments as mentioned
>>The parser will break down on the instance it encounters an error
>>Compiler supports all operators mentioned in assignment