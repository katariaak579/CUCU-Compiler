%{
	#include <stdio.h>
	#include <string.h>
    int yylex();
	extern FILE* yyin;
	extern FILE* yyout, * lexout;
	extern void yyerror(char* msg);
%}

%token INT_ CHAR_  IF ELSE WHILE RETURN 
%union{
    int number;
    char* str;
}

%token <str> ID 
%token <str> STRING 
%token <number> NUM
%token <str> ROT

%%

LANG:           VAR_DEC 
|               FUNC_DEC
|               FUNC_DEF
|				LANG VAR_DEC
|				LANG FUNC_DEC
|				LANG FUNC_DEF
;

VAR_DEC:         INT_ ID ';' { fprintf(yyout,"Datatype:Int\nVariableName:%s \nVariable Declare\n ", $2); }
|                INT_ ID '=' EXPR ';' { fprintf(yyout,"Datatype:Int \nVariableName:%s\nVariable Declare and Initiated \n ", $2); }
|                CHAR_ ID ';'{ fprintf(yyout,"Datatype:Char*\nVariableName:%s \n Variable Declare\n", $2); }
|                CHAR_ ID '=' STRING ';'{ fprintf(yyout,"Datatype:Char* \nVariableName:%s \nVariablevalue= %s \nVariable Declare and Initiated\n ", $2,$4); }

;

FUNC_HEAD:       INT_ ID '(' ARG_LIST ')'  { fprintf(yyout,"Function Declare Return Type: Int\nFunction Name: %s\n ",$2 ); }
|                CHAR_ ID '(' ARG_LIST ')' { fprintf(yyout,"Function Declare Return Type: Char\nFunction Name: %s\n ",$2 ); }
|                INT_ ID '(' ')'  { fprintf(yyout,"Function Declare Return Type: Int\nFunction Name: %s\n ",$2 ); }
|                CHAR_ ID '(' ')' { fprintf(yyout,"Function Declare Return Type: Char\nFunction Name: %s\n ",$2 ); }
;

FUNC_DEC:       FUNC_HEAD ';' 
;

ARG_LIST:        INT_ ID  { fprintf(yyout,"Argument Datatype: Int\nArgument ID: %s \n",$2 ); }
|                CHAR_ ID  { fprintf(yyout,"Argument Datatype: Char*\nArgument ID: %s \n",$2 ); }
|                ARG_LIST ','  INT_ ID  { fprintf(yyout,"Argument Datatype: Int\nArgument ID: %s \n",$4 ); }
|               ARG_LIST ','  CHAR_ ID { fprintf(yyout,"Argument Datatype: Char*\nArgument ID: %s \n",$4 ); } 
|				EXPR
;

FUNC_DEF:        FUNC_HEAD STMT
;

STMT_LIST:      STMT
|               STMT_LIST STMT 
;

STMT:           ASSIGN_ST
|               FUNC_CALL
|               RETURN_STMT
|               CONDITION
|               LOOP
|               BLOCK_STMT
|               VAR_DEC 
;

ASSIGN_ST:      ID '=' EXPR ';'    { fprintf(yyout,"Assignment Statement ---> Variable:%s = \n  ", $1); }
;

EXPR:           EXPR '+' TERM  {fprintf(yyout,"Plus Operator = '+'\n");} 
|               EXPR '-' TERM   {fprintf(yyout,"Minus Operator = '-'\n");} 
|               TERM
;

TERM:           TERM '*' FACTOR  {fprintf(yyout,"Multiply Operator = '*'\n");} 
|               TERM '/' FACTOR      {fprintf(yyout,"Divide Operator = '/'\n");} 
|               FACTOR
;

FACTOR:         ID          {fprintf(yyout,"VariableName:%s\n",$1);}
|               NUM          {fprintf(yyout,"Constant Number = %d\n",$1);} 
|				'(' EXPR ')'  {fprintf(yyout,"Left Paranthesis: ( \n Right Paranthesis: )\n");} 
|				ID '(' ')'   {fprintf(yyout,"VariableName:%s\n",$1);} 
|				ID '(' EXPR_LIST ')'  {fprintf(yyout,"VariableName:%s\n",$1);} 
|               STRING  {fprintf(yyout,"String Output :%s\n",$1);} 
;

RETURN_STMT:    RETURN EXPR ';' { fprintf(yyout,"Return \n" ); }
|               RETURN ';'  { fprintf(yyout,"Return \n" ); }
;

FUNC_CALL:      ID '(' ')' ';'   { fprintf(yyout,"Function Call Name:%s \n",$1 ); }
|               ID '(' EXPR_LIST ')' ';'  { fprintf(yyout,"Function Call Name:%s \n",$1 ); }
;

EXPR_LIST:      EXPR
|               EXPR_LIST ',' EXPR
;

CONDITION:      IF '(' BOOL ')' BLOCK_STMT  { fprintf(yyout,"If_statement end\n" ); }
|               IF '(' BOOL ')' BLOCK_STMT ELSE BLOCK_STMT { fprintf(yyout,"If_statement end\nElse_Statement end\n" ); }
;

BOOL:           EXPR ROT EXPR { fprintf(yyout,"Relational Operator: %s\n",$2 ); }
;

BLOCK_STMT:     '{' STMT_LIST '}' 
|               '{' '}' 
;

LOOP:           WHILE '(' BOOL ')' STMT { fprintf(yyout,"WHILE LOOP ENDS\n" ); } 
;

%%

int main(int argc, char *argv[]){
	yyin = fopen(argv[1], "r");
	yyout = fopen("Parser.txt", "w");
	lexout = fopen("Lexer.txt", "w");
	yyparse();
}

void yyerror(char* msg){
	fprintf(yyout,"%s\n", msg);
}