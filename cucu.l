%{
#include <stdio.h>
#include <string.h>
// #define YYSTYPE char*
#include "y.tab.h"
FILE * lexout;

%}

%%
([ ]+) {}

(if) {fprintf(lexout,"If_Statement\n");return IF;}
(else) {fprintf(lexout,"Else_Statement\n");return ELSE;}
(while) {fprintf(lexout,"While_Loop_Statement\n");return WHILE;}
(int) {fprintf(lexout,"Datatype: %s\n",yytext);return INT_;}
(return) {fprintf(lexout,"Return Statement\n");return RETURN;}
char[ \t]*\* {fprintf(lexout,"Datatype: %s\n",yytext);return CHAR_;} 
(\"[a-zA-Z0-9 ]*\") {fprintf(lexout,"Datatype: String\n");yylval.str=strdup(yytext); return STRING;}
([a-zA-Z][a-zA-Z0-9_]*) {fprintf(lexout,"Identifier: %s\n",yytext); yylval.str=strdup(yytext); return ID;}
(;) {fprintf(lexout,"Semicolon: %s\n",yytext);return yytext[0];}
(\+) {fprintf(lexout,"Operator_Plus\n");return yytext[0];}
(\-) {fprintf(lexout,"Operator_Minus\n");return yytext[0];}
(\*) {fprintf(lexout,"Operator_Multiply\n");return yytext[0];}
(\/) {fprintf(lexout,"Operator_Divide\n");return yytext[0];}
(\%) {fprintf(lexout,"Operator_Modulo\n");return yytext[0];}
(=) {fprintf(lexout,"Assign: =\n");return yytext[0];}
(\() {fprintf(lexout,"Left_Paranthesis\n");return yytext[0];}
(\)) {fprintf(lexout,"Right_Paranthesis\n");return yytext[0];}
([0-9]+) {fprintf(lexout,"NUM\n"); yylval.number=atoi(yytext); return NUM;}
(\{) {fprintf(lexout,"Left_Curly_Bracket\n");return yytext[0];}
(\}) {fprintf(lexout,"Right_Curly_Bracket\n");return yytext[0];}
(\>\=|\>|\<|\<\=|==|!=) {fprintf(lexout,"Relational Operator: %s",yytext);yylval.str=strdup(yytext);return ROT;}
([,]*) {fprintf(lexout,"Comma: ,\n");return yytext[0];}

.		{}


%%