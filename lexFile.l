%option yylineno
%{
/*
    Lyle Johnson
    lexParser.l

*/

#include <string.h>
#include <stdio.h>
//#include "y.tab.h"
//#include "token.h"	/* a struct type for tokens */

struct token *yytokens;	/* a global array of all tokens */
int yyntokens;		/* number of tokens in source file */
int yynallocated=0;	/* size of dynamic array */
int newlineflag;	/* did a newline occur between last token and this? */

%}

%%


[\t]			{ printf("<PRE> </PRE>"); }
[" "] 			{ printf(" ");  }
[\n]			{ newlineflag++; printf("<BR></BR>"); }
["/\\*\\*.*?\\*/"]	{ printf("<font color = \"red\"> %s< /font>", yytext ); }


%%

int yywrap(void) 
{
	return 1;
}

int main( int argc, char *argv[] )
{
	yyin = fopen( argv[1], "r" );
	yylex();
	return 0;
	fclose( yyin );
}


/*
g++ lex.yy.c -ll
http://aquamentus.com/tut_lexyacc.html
*/