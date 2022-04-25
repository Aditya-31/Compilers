%{
#include<stdio.h>
%}
identifier [a-zA-Z][a-zA-Z0-9]*
%%
#.* {printf("\n%s is a preprocessor directive",yytext);}
float|int|char|double|long|void|include|typedef printf("%s IS A KEYWORD\n",yytext);
{identifier}(\[[0-9]*\])? printf("%s is an identifier\n",yytext);
["|(|)|{|}|#|;|,|%|&] printf("%s IS A SPECIAL SYMBOL\n", yytext);
["]+[a-zA-Z0-9]+["] printf("%s IS A MESSAGE\n", yytext);
\".*\" printf("%s is a STRING\n",yytext);
[+|-|*|/] printf("%s IS A ARITHMATIC OPERATOR\n", yytext);
{identifier}\( {printf("%s is a FUNCTION\n ",yytext);}
[a-zA-Z]*.h printf("%s IS A HEADER FILE\n", yytext);
[0-9]+ printf("%s IS A CONSANT\n", yytext);
= printf("%s IS AN ASSIGNMENT OPERATOR \n", yytext);
[<|>|<=|>=|<>] printf("%s IS A RELATIONAL OPERATOR\n", yytext);
[&&|!=|==] printf("%s IS A LOGICAL OPERATOR\n", yytext);

%%
int yywrap(void)
{
return 1;
}
int main()
{
FILE *fp=fopen("code.c","r");
yyin = fp;
yylex();
yywrap();
return 0;
}


/*

code.c-

#include<stdio.h>
#include<conio.h>
void main()
{
int a,b,c;
a=1;
b=2;
c=a+b;
printf("Sum:%d",c);
}


OUTPUT-

prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28$ ls
Assignment1  Assignment2
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28$ cd Assignment1
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment1$ ls
a.out  assign1.l  code.c  lex.yy.c
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment1$ lex assign1.l
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment1$ gcc lex.yy.c
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment1$ ./a.out
 
#include<stdio.h> is a preprocessor directive

#include<conio.h> is a preprocessor directive
void IS A KEYWORD
 main( is a FUNCTION
 ) IS A SPECIAL SYMBOL

{ IS A SPECIAL SYMBOL

int IS A KEYWORD
 b is an identifier
; IS A SPECIAL SYMBOL

clrscr( is a FUNCTION
 ) IS A SPECIAL SYMBOL
; IS A SPECIAL SYMBOL

printf( is a FUNCTION
 "the value of a,b" is a STRING
) IS A SPECIAL SYMBOL
; IS A SPECIAL SYMBOL

scanf( is a FUNCTION
 "%d,%d" is a STRING
, IS A SPECIAL SYMBOL
& IS A SPECIAL SYMBOL
a is an identifier
, IS A SPECIAL SYMBOL
& IS A SPECIAL SYMBOL
b is an identifier
) IS A SPECIAL SYMBOL
; IS A SPECIAL SYMBOL

a is an identifier
= IS AN ASSIGNMENT OPERATOR 
a is an identifier
+ IS A ARITHMATIC OPERATOR
b is an identifier
; IS A SPECIAL SYMBOL

b is an identifier
= IS AN ASSIGNMENT OPERATOR 
a is an identifier
-b is an identifier
; IS A SPECIAL SYMBOL

a is an identifier
= IS AN ASSIGNMENT OPERATOR 
a is an identifier
-b is an identifier
; IS A SPECIAL SYMBOL

printf( is a FUNCTION
 "the no after swapping a=%d and b=%d" is a STRING
) IS A SPECIAL SYMBOL
; IS A SPECIAL SYMBOL

getch( is a FUNCTION
 ) IS A SPECIAL SYMBOL
; IS A SPECIAL SYMBOL

} IS A SPECIAL SYMBOL



prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment1$ 


*/
