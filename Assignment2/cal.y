%{
#include<stdio.h>
int flag=0;
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

ArithmeticExpression: E{

         printf("\nResult=%d\n",$$);
         return 0;
        };

E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |'('E')' {$$=$2;}
 | NUMBER {$$=$1;}
;

%%
int main()
{
  yyparse();
  if(flag==0)
   printf("\nEntered arithmetic expression is Valid\n\n");
  return 0;
}

int yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
   flag=1;
   return 0;
}


/*
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment2$ lex cal.l
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment2$ yacc -d cal.y
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment2$ cc y.tab.c lex.yy.c -ll -lm
y.tab.c: In function ‘yyparse’:
y.tab.c:1218:16: warning: implicit declaration of function ‘yylex’ [-Wimplicit-function-declaration]
 1218 |       yychar = yylex ();
      |                ^~~~~
y.tab.c:1397:7: warning: implicit declaration of function ‘yyerror’; did you mean ‘yyerrok’? [-Wimplicit-function-declaration]
 1397 |       yyerror (YY_("syntax error"));
      |       ^~~~~~~
      |       yyerrok
prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment2$ ./a.out
14*3

Result=42

Entered arithmetic expression is Valid

prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment2$ ./a.out
14/

Entered arithmetic expression is Invalid

prjlab@prjlab-HP-280-Pro-G6-Microtower-PC:~/BEA28/Assignment2$ 

*/
