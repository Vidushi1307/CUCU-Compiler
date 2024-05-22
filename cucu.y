%{
#include <stdio.h>
#include <string.h>
extern FILE * yyin;
int yylex(void);
int yyparse(void);

extern FILE *lexer;
extern FILE *yyout;

void yyerror(char *s)
{
	fprintf(yyout,"error: %s\n",s);
}

%}

%union 
{
    int num;
    char *string;
}

%token <string> INT_TYPE CHAR_TYPE STRING ANDOPERATOR OROPERATOR XOROPERATOR ASSIGN PLUS_OP SUB_OP DIV_OP MUL_OP SEMICOL COMMA RETURN IF WHILE OP1 OP2 OP3 CP1 CP2 CP3 ELSE EQUAL NOTEQUAL SHIFT REL_OP ID
%token <num> NUM

%left ASSIGN
%left EQUAL NOTEQUAL
%left PLUS_OP SUB_OP
%left MUL_OP DIV_OP

%%
programs: subprogram 

subprogram : func_def				{fprintf(yyout,"\n");}
| var_dec							{fprintf(yyout,"\n");}
 |func_dec 							{fprintf(yyout,"\n");}
 |subprogram func_def				{fprintf(yyout,"\n");}
 | subprogram func_dec				{fprintf(yyout,"\n");}
 |subprogram var_dec 				{fprintf(yyout,"\n");}
 ;

var_dec : INT_TYPE ID SEMICOL                                              {fprintf(yyout,"global variable : %s ,type : int\n",$2);}
					   | CHAR_TYPE ID SEMICOL                                            {fprintf(yyout,"global variable : %s ,type : %s\n\n",$2,$1);}

                       | INT_TYPE ID ASSIGN expression SEMICOL                          {fprintf(yyout,"= global variable: %s,type: %s\n",$2,$1);}

                       | CHAR_TYPE ID ASSIGN STRING SEMICOL                              {fprintf(yyout,"%s = var-%s\nglobal variable : %s ,type : %s\n\n",$4,$2,$2,$1);}
					   ;
expression: Bin_expr 
      | Bin_expr ASSIGN expression {fprintf(yyout,"%s ",$2);}
	  ; 

Bin_expr : val_expr
		     | Bin_expr ANDOPERATOR val_expr {fprintf(yyout,"%s ",$2);}
             | Bin_expr OROPERATOR val_expr {fprintf(yyout,"%s ",$2);}
		     | Bin_expr XOROPERATOR val_expr {fprintf(yyout,"%s ",$2);}

			 ;
		     
val_expr : rel_expr
		   | val_expr EQUAL rel_expr     {fprintf(yyout,"%s ",$2);}
		   | val_expr NOTEQUAL rel_expr  {fprintf(yyout,"%s ",$2);}
		   ;
		   
rel_expr : add_sub_expr
		      | rel_expr REL_OP add_sub_expr   {fprintf(yyout,"%s ",$2);}
			  ;
		   
add_sub_expr : div_mul_expr
         | add_sub_expr PLUS_OP div_mul_expr   {fprintf(yyout,"%s ",$2);}
		 | add_sub_expr SUB_OP div_mul_expr    {fprintf(yyout,"%s ",$2);}
         ;

div_mul_expr: pre_factor
               | div_mul_expr DIV_OP pre_factor    {fprintf(yyout,"%s ",$2);}
		       | div_mul_expr MUL_OP pre_factor    {fprintf(yyout,"%s ",$2);}
			   ;

pre_factor : factor
             | pre_factor OP3 expression CP3       {fprintf(yyout,"[] ");}
		     | pre_factor OP1 expression_list CP1  {fprintf(yyout,"() ");}
			 ;
		     
factor : 		NUM                  {fprintf(yyout,"const-%d ",$1);}
                 | ID                   {fprintf(yyout,"var-%s ",$1);}
				 | OP1 expression CP1   {fprintf(yyout,"() ");}
				 ; 

func_dec : INT_TYPE ID OP1 function_parameter CP1 SEMICOL                    {fprintf(yyout,"function-name : %s , type: %s\n\n",$2,$1);}
                       | CHAR_TYPE ID OP1 function_parameter CP1 SEMICOL                  {fprintf(yyout,"function-name : %s \n function-return-type: %s\n\n",$2,$1);}
                       ;

function_parameter : function_parameter COMMA INT_TYPE ID  {fprintf(yyout,"func ARG : %s \n",$4);}
                  | function_parameter COMMA CHAR_TYPE ID   {fprintf(yyout,"func ARG : %s \n",$4);}
                  | INT_TYPE ID                            {fprintf(yyout,"func ARG : %s \n",$2);}
				  | CHAR_TYPE ID                            {fprintf(yyout,"func ARG : %s \n",$2);}
				  |
			      ;

func_def  : INT_TYPE ID OP1 function_parameter CP1 OP2 fun_body CP2  {fprintf(yyout,"FUNCTION-BODY ENDS HERE   function-name : %s   function-return-type: %s\n",$2,$1);}
                       | CHAR_TYPE ID OP1 function_parameter CP1 OP2 fun_body CP2 {fprintf(yyout," FUNCTION-BODY ENDS HERE  function-name : %s   function-return-type: %s\n",$2,$1);}
                       ; 


fun_body: fun_body statement   
               | statement             
			   ; 

statement: INT_TYPE ID ASSIGN expression SEMICOL                      {fprintf(yyout,"= var-%s\nlocal variable : %s , type: %s\n",$2,$2,$1);}
        | CHAR_TYPE ID ASSIGN STRING SEMICOL                           {fprintf(yyout,"%s = var-%s\nlocal variable : %s , type: %s\n",$4,$2,$2,$1);}
		| ID OP3 expression CP3 ASSIGN expression SEMICOL          {fprintf(yyout,"= [] var-%s\n",$1);}
		| ID OP1 expression_list CP1 SEMICOL                       {fprintf(yyout,"func ARG ENDs HERE\nfunction-name : %s \n",$1);}
	    | RETURN expression SEMICOL                                {fprintf(yyout,"%s \n",$1);}
	    | IF OP1 expression CP1 OP2 fun_body CP2 else      {fprintf(yyout,"IF-COND \n");}
	    | LOOP       									{fprintf(yyout,"WHILE LOOP ENDS\n");}
        | IF OP1 expression CP1 statement                       {fprintf(yyout,"IF-COND\n");}
        | IF OP1 expression CP1 statement else                    {fprintf(yyout,"IF-COND\n");}
		| INT_TYPE ID SEMICOL                                         {fprintf(yyout,"local variable : %s , type: %s\n",$2,$1);}
		| CHAR_TYPE ID SEMICOL                                         {fprintf(yyout,"local variable : %s , type: %s\n",$2,$1);}
	    | ID ASSIGN expression SEMICOL                             {fprintf(yyout,"= var-%s\n",$1);}
		| ID ASSIGN STRING SEMICOL                                 {fprintf(yyout,"%s = var-%s\n",$3,$1);}

		;
LOOP: WHILE OP1 expression CP1 OP2 fun_body CP2 ;

expression_list: expression_list COMMA expression      {fprintf(yyout,": function-argument \n");}
           | expression_list COMMA STRING              {fprintf(yyout,"%s : function-argument \n",$3);}
           | expression                                {fprintf(yyout,": function-argument \n");}
		   | STRING                                    {fprintf(yyout,"%s : function-argument \n",$1);}
		   |
		   ;

else: ELSE OP2 fun_body CP2    {fprintf(yyout,"ELSE-COND \n");}
      | ELSE statement             {fprintf(yyout,"ELSE-COND \n");}
      |
	  ;










	    
%%


int yywrap()
{
	return 1;
}

int main(int argc, char *argv[])
{   
	yyin = fopen(argv[1], "r");
    lexer = fopen("Lexer.txt", "w");
	yyout = fopen("Parser.txt", "w");

	yyparse();

	fclose(yyin);
    fclose(lexer);
	fclose(yyout);
	return 0;
}