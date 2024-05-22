%{
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "cucu.tab.h"
void yyerror(char *s);
FILE *lexer;
%}

%%
"/*"(\*+[^/*]|([^*]))*\**"*/"     /* Ignoring MUL_OPti Line Comments*/
(\/\/.*)                          /* Ignoring Single Line Comments*/
int[ ]                            {fprintf(lexer,"TYPE : %s\n",yytext); yylval.string=strdup(yytext);return INT_TYPE;}
char[ ]*\**                       {fprintf(lexer,"TYPE : %s\n",yytext); yylval.string=strdup(yytext);return CHAR_TYPE;}
==                                {fprintf(lexer,"EQUAL : ==\n"); yylval.string=strdup(yytext);return EQUAL;}
!=                                {fprintf(lexer,"NOTEQUAL : !=\n");yylval.string=strdup(yytext);return NOTEQUAL;}
=                                 {fprintf(lexer,"ASSIGN : =\n");yylval.string=strdup(yytext);return ASSIGN;}
\&                           {fprintf(lexer,"ANDOPERATOR : &\n");yylval.string=strdup(yytext);return ANDOPERATOR;}
\^                                  {fprintf(lexer,"XOROPERATOR : &\n");yylval.string=strdup(yytext);return XOROPERATOR;}
\|                                {fprintf(lexer,"OROPERATOR : &\n");yylval.string=strdup(yytext);return OROPERATOR;}
return                            {fprintf(lexer,"RETURN : %s\n",yytext);yylval.string=strdup(yytext);return RETURN;}
if                                {fprintf(lexer,"CONTROL_TYPE : %s\n",yytext);yylval.string=strdup(yytext);return IF;}
else                              {fprintf(lexer,"CONTROL_TYPE : %s\n",yytext);yylval.string=strdup(yytext);return ELSE;}
while                             {fprintf(lexer,"CONTROL_TYPE : %s\n",yytext);yylval.string=strdup(yytext);return WHILE;}
\"([^\"])*\"                      {fprintf(lexer,"STRING  : %s\n", yytext);yylval.string = strdup(yytext); return STRING;}
[a-zA-Z][a-zA-Z0-9_]*             {fprintf(lexer,"ID: %s\n",yytext);yylval.string=strdup(yytext);return ID;}
[0-9]+                            {fprintf(lexer,"NUM : %s\n",yytext);yylval.num=atoi(yytext); return NUM;}
\(                                {fprintf(lexer,"OPENPAR : %s\n",yytext);yylval.string=strdup(yytext);return OP1;}
\)                                {fprintf(lexer,"CLOSEPAR : %s\n",yytext);yylval.string=strdup(yytext);return CP1;}
\{                                {fprintf(lexer,"OPENPAR : %s\n",yytext);yylval.string=strdup(yytext);return OP2;}
\}                                {fprintf(lexer,"CLOSEPAR : %s\n",yytext);yylval.string=strdup(yytext);return CP2;}
\[                                {fprintf(lexer,"OPENPAR : %s\n",yytext);yylval.string=strdup(yytext);return OP3;}
\]                                {fprintf(lexer,"CLOSEPAR : %s\n",yytext);yylval.string=strdup(yytext);return CP3;}
\+                                {fprintf(lexer,"PLUS_OP : %s\n",yytext);yylval.string=strdup(yytext);return PLUS_OP;}
-                                 {fprintf(lexer,"SUB_OP : %s\n",yytext);yylval.string=strdup(yytext);return SUB_OP;}
\/                                {fprintf(lexer,"DIV_OP : %s\n",yytext);yylval.string=strdup(yytext);return DIV_OP;}
\*                                {fprintf(lexer,"MUL_OP : %s\n",yytext);yylval.string=strdup(yytext);return MUL_OP;}
\;                                {fprintf(lexer,"SEMICOL : %s\n",yytext);yylval.string=strdup(yytext);return SEMICOL;}
,                                 {fprintf(lexer,"COMMA : %s\n",yytext);yylval.string=strdup(yytext);return COMMA;}
(\<|\>|\<=|\>=)                   {fprintf(lexer,"RELATIONAL_OP : %s\n",yytext);yylval.string=strdup(yytext);return REL_OP;}
[ \t]*                            /* Ignoring Newline, Tab and Whitespace*/
\n                                {yylineno++;}

%%