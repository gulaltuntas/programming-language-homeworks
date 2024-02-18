%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%%
"and"       { printf("KW_AND\n"); }
"or"        { printf("KW_OR\n"); }
"not"       { printf("KW_NOT\n"); }
"equal"     { printf("KW_EQUAL\n"); }
"less"      { printf("KW_LESS\n"); }
"nil"       { printf("KW_NIL\n"); }
"list"      { printf("KW_LIST\n"); }
"append"    { printf("KW_APPEND\n"); }
"concat"    { printf("KW_CONCAT\n"); }
"set"       { printf("KW_SET\n"); }
"def"       { printf("KW_DEF\n"); }
"for"       { printf("KW_FOR\n"); }
"if"        { printf("KW_IF\n"); }
"exit"      { printf("KW_EXIT\n"); }
"load"      { printf("KW_LOAD\n"); }
"display"   { printf("KW_DISPLAY\n"); }
"true"      { printf("KW_TRUE\n"); }
"false"     { printf("KW_FALSE\n"); }
"+"         { printf("OP_PLUS\n"); }
"-"         { printf("OP_MINUS\n"); }
"/"         { printf("OP_DIV\n"); }
"*"         { printf("OP_MULT\n"); }
"("         { printf("OP_OP\n"); }
")"         { printf("OP_CP\n"); }
","         { printf("OP_COMMA\n"); }
";;"        { printf("COMMENT\n"); }
[0-9]+      { printf("VALUEF\n"); }
[a-zA-Z][a-zA-Z0-9]*  { 
    printf("IDENTIFIER\n");
}
[ \t\r\n]+  ; /* Ignore whitespace */
.           { fprintf(stderr, "SYNTAX_ERROR\n"); exit(1); }
%%

int main() {
    yylex();
    return 0;
}