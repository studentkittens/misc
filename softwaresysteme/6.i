%{

#include <stdio.h>
#include <string.h>

static int letters = 0;
static int words = 0;

%}

/* Definition von Elementen und flex Steuercommands */
%x comm
buchstabe [a-zA-Z]

%%

{buchstabe}+  { 
                words++;

                /* `yytext` is lexem */
                letters += strlen(yytext);
                return 1; 
              }
[ \t]         { /* Ignore whitespace */ }
\n            {
                return 0; 
              }
%%

int main(void) {
    for(;;) {
        int rc = yylex();
        printf("   #%d %s\n", rc, yytext);

        if(rc == 0) {
            break;
        }
    }
    printf("%d words %d characters\n", words, letters);
    return 0;
}
