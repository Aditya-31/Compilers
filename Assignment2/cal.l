
%{
#include<stdio.h>
#include "y.tab.h"
//extern int yylval;
%}

%%

[0-9]+ { yylval=atoi(yytext); return NUMBER; }

[\n] return 0;
. return yytext[0];

%%

int yywrap()
{
return 1;
}


/*

Output-

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
