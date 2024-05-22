/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_CUCU_TAB_H_INCLUDED
# define YY_YY_CUCU_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INT_TYPE = 258,                /* INT_TYPE  */
    CHAR_TYPE = 259,               /* CHAR_TYPE  */
    STRING = 260,                  /* STRING  */
    ANDOPERATOR = 261,             /* ANDOPERATOR  */
    OROPERATOR = 262,              /* OROPERATOR  */
    XOROPERATOR = 263,             /* XOROPERATOR  */
    ASSIGN = 264,                  /* ASSIGN  */
    PLUS_OP = 265,                 /* PLUS_OP  */
    SUB_OP = 266,                  /* SUB_OP  */
    DIV_OP = 267,                  /* DIV_OP  */
    MUL_OP = 268,                  /* MUL_OP  */
    SEMICOL = 269,                 /* SEMICOL  */
    COMMA = 270,                   /* COMMA  */
    RETURN = 271,                  /* RETURN  */
    IF = 272,                      /* IF  */
    WHILE = 273,                   /* WHILE  */
    OP1 = 274,                     /* OP1  */
    OP2 = 275,                     /* OP2  */
    OP3 = 276,                     /* OP3  */
    CP1 = 277,                     /* CP1  */
    CP2 = 278,                     /* CP2  */
    CP3 = 279,                     /* CP3  */
    ELSE = 280,                    /* ELSE  */
    EQUAL = 281,                   /* EQUAL  */
    NOTEQUAL = 282,                /* NOTEQUAL  */
    SHIFT = 283,                   /* SHIFT  */
    REL_OP = 284,                  /* REL_OP  */
    ID = 285,                      /* ID  */
    NUM = 286                      /* NUM  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 19 "cucu.y"

    int num;
    char *string;

#line 100 "cucu.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_CUCU_TAB_H_INCLUDED  */
