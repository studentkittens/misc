%{

#include <stdio.h>
#include <string.h>

static int letters = 0;
static int words = 0;

static int comment_balance = 0;

typedef enum {
    END_OF_FILE,
    COMMENT_TOK,
    WORD
} TOKENS;

static void yyerror(const char *msg) {
    fprintf(stderr, "Invalid syntax: %s\n", msg);
}

%}


/* Definition von Elementen und flex Steuercommands */
%x COMMENT

buchstabe [a-zA-Z]
comment_start "/*"
comment_end   "*/"

%%

{comment_start}        {
                            BEGIN(COMMENT);
                            comment_balance++;
                            return COMMENT;
                       }
<COMMENT>[^*\n]*       { /* Match everything till comment end */ return COMMENT_TOK; }  
<COMMENT>{comment_end} {
                            if(--comment_balance == 0) {
                                BEGIN(INITIAL);
                            }

                            return COMMENT;
                        }
{comment_end}           {
                            if(comment_balance) yyerror("`*/` without `/*`");
                        }
<COMMENT>{comment_start} {
                            if(!comment_balance) yyerror("`/*` after `/*`");
                        }
{buchstabe}+  { 
                words++;

                /* `yytext` is lexem */
                letters += strlen(yytext);
                return WORD; 
              }
[ \t]         { /* Ignore whitespace */ }
\n            {
                return END_OF_FILE; 
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
    printf("%d %d\n", words, letters);
    return 0;
}
