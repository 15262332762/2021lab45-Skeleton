%option noyywrap
%{
    /*
    * You will need to comment this line in lab5.
    */
    #define ONLY_FOR_LEX
    #ifdef ONLY_FOR_LEX
    #else
    #define YYSTYPE void *
    #include "parser.h"
    #endif
    #define YY_NO_UNPUT
    #define YY_NO_INPUT
    #include <string>
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    #ifdef ONLY_FOR_LEX
    #include <ostream>
    #include <fstream>
    using namespace std;
    extern FILE *yyin; 
    extern FILE *yyout;

    void DEBUG_FOR_LAB4(std::string s){
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
    #endif
%}

LETTER [a-zA-Z]
DIGIT [0-9]
OINTEGER [1-9]{DIGIT}*
INTEGER [1-9]{DIGIT}*|0
DECIMIAL ([1-9][0-9]*|0)
ID ({LETTER}|_)({LETTER}|_|{DIGIT})* 
EOL (\r\n|\n|\r)
WHITE [\t ]
OCTNUMBER (0[0-7]*|0)
HEXNUMBER (0[Xx][0-9a-fA-F]*)

LPAREN "("
RPAREN ")"
LBRACE "{"
RBRACE "}"
SEMICOLON ";"

EQ "=="
GRAEQ ">="
LESEQ "<="
NEQ "!="
ASSIGN "="
PLUSASSIGN "+="
MINUSASSIGN "-="
MULASSIGN "*="
DIVASSIGN "/="
GRA ">"
LES "<"
PLUS "+"
MINUS "-"
MUL "*"
DIV "/"
MOD "%"
AND "&&"
OR "||"
NOT "!"

CONST "const"
VOID "void"
ELSE "else"
WHILE "while"
BREAK "break"
CONTINUE "continue"
RETURN "return"
INT "int"
IF if

%x BLOCKCOMMENT
commentbegin "/*"
commentelement .|\n
commentend "*/"


commentlinebegin "//"
commentlineelement .
commentlineend \n
%%

"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    #ifdef ONLY_FOR_LEX
       fprintf(stderr,"INT\tint\t%d\n",yylineno);
    #else
        return INT;
    #endif
}
{INTEGER} {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"INTEGER\t%s\t%d\n",yytext,yylineno);
    #else
        return INTEGER;
    #endif 
}
{ID} {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"ID\t%s\t%d\n",yytext,yylineno);
    #else
        return ID;
    #endif 
}
"void" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"VOID\tvoid\t%d\n",yylineno);
    #else
        return VOID;
    #endif 
}
"if" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"IF\t%s\t%d\n",yytext,yylineno);
    #else
        return IF;
    #endif
};
"else" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"ELSE\telse\t%d\n",yylineno);
    #else
        return ELSE;
    #endif
};
"return" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"RETURN\treturn\t%d\n",yylineno);
    #else
        return RETURN;
    #endif
}

"=" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"ASSIGN\t=\t%d\n",yylineno);
    #else
        return ASSIGN;
    #endif
}
"!=" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"NEQ\t!=\t%d\n",yylineno);
    #else
        return NEQ;
    #endif
}
"==" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"EQ\t==\t%d\n",yylineno);
    #else
        return EQ;
    #endif
}
"+=" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"PLUSASSIGN\t+=\t%d\n",yylineno);
    #else
        return PLUSASSIGN;
    #endif
}
"-=" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"MINUSASSIGN\t-=\t%d\n",yylineno);
    #else
        return MINUSASSIGN;
    #endif
}
"*=" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"MULASSIGN\t*=\t%d\n",yylineno);
    #else
        return MULASSIGN;
    #endif
}
"/=" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"DIVASSIGN\t/=\t%d\n",yylineno);
    #else
        return DIVASSIGN;
    #endif
}
">=" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"GRAEQ\t>=\t%d\n",yylineno);
    #else
        return GRAEQ;
    #endif
}
"<=" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"LESEQ\t<=\t%d\n",yylineno);
    #else
        return LESEQ;
    #endif
}
"<" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"LESS\t<\t%d\n",yylineno);
    #else
        return LESS;
    #endif
}
"+" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"ADD\t+\t%d\n",yylineno);
    #else
        return ADD;
    #endif
}
"-" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"MINUS\t-\t%d\n",yylineno);
    #else
        return MINUS;
    #endif
}
"*" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"MUL\t*\t%d\n",yylineno);
    #else
        return MUL;
    #endif
}
"/" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"DIV \t/\t%d\n",yylineno);
    #else
        return DIV ;
    #endif
}
";" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"SEMICOLON\t;\t%d\n",yylineno);
    #else
        return SEMICOLON;
    #endif
}
"(" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"LPAREN\t(\t%d\n",yylineno);
    #else
        return LPAREN;
    #endif
}
")" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"RPAREN\t)\t%d\n",yylineno);
    #else
    return RPAREN;
    #endif
}
"{" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"LBRACE\t{\t%d\n",yylineno);
    #else
        return LBRACE;
    #endif
}
"}" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"RBRACE\t}\t%d\n",yylineno);
    #else
        return RBRACE;
    #endif
}
"%" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"MOD\t%s\t%d\n",yytext,yylineno);
    #else
        return MOD;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        fprintf(stderr,"AND\t%s\t%d\n",yytext,yylineno);
    #else
        return AND;
    #endif
}
{EOL} yylineno++;
{WHITE}
%%

#ifdef ONLY_FOR_LEX
int main(int argc, char **argv){
    if(argc != 5){
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }

    if(!(yyin = fopen(argv[1], "r"))){
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }

    if(!(yyout = fopen(argv[3], "w"))){
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }

    yylex();
    return 0;
}
#endif
