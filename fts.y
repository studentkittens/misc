%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

void yyerror(const char *str) {
    fprintf(stderr, "line %d: %s\n", 0, str);
}
 
int yywrap() {
    return 1;
} 
  
typedef struct node {
    char *text;
    struct node *next;
} node;

node *HEAD = NULL;
node *TAIL = NULL;

char *add_node(char *format, ...) {
    node *new_node = malloc(sizeof(node));
    memset(new_node, 0, sizeof(node));

    va_list list;
    va_start(list, format);
    char buf[500];
    memset(buf, 0, sizeof(buf));
    vsnprintf(buf, sizeof(buf), format, list);
    va_end(list);

    char *str = strdup(buf);
    new_node->text = str;

    if(TAIL) {
        TAIL->next = new_node;
        TAIL = new_node;
    } else {
        HEAD = TAIL = new_node;
    }

    return str;
}

%}

%pure-parser

%token <tag>TAG
%token <spec>SPEC <spec>MATCH_ALL
%token <range>DATE_SPEC
%token OPER_AND OPER_OR UNARY_OPER_NOT 
%token PARAN_OPEN PARAN_CLOSE

%left OPER_AND OPER_OR PARAN_OPEN PARAN_CLOSE
%left SPEC DATE_SPEC 
%right UNARY_OPER_NOT
%nonassoc MATCH_ALL TAG

%type<spec> expr

%union { 
    char *tag;
    char *spec;

    struct {
        int begin;
        int end;
    } range;
}

%%

expr:
  expr expr {
    $$ = add_node("%s AND %s", $1, $2);
 }
 | expr OPER_AND expr {
     $$ = add_node("%s AND %s", $1, $3);
   }
 | expr OPER_OR expr {
     $$ = add_node("%s OR %s", $1, $3);
   }
 | UNARY_OPER_NOT expr {
     $$ = add_node("NOT %s", $2);
   }
 | PARAN_OPEN expr PARAN_CLOSE {
    $$ = add_node("(%s)", $2);
 }
 | SPEC {
    $$ = add_node(
        "(artist:\"%s\" OR album:\"%s\" OR title:\"%s\" OR album_artist:\"%s\")",
        $1, $1, $1, $1
    );
 }
 | TAG DATE_SPEC {
    int begin = yylval.range.begin, end = yylval.range.end, i;
    size_t current_size = 0;
    char *dates = NULL;

    for(i = begin; i <= end; ++i) {
        char date_buf[128];
        memset(date_buf, 0, sizeof(date_buf));
        int bytes = snprintf(
            date_buf, sizeof(date_buf),
            "%s:%d%s", $1, i, (i == end) ? "" : " OR "
        );

        dates = realloc(dates, current_size + bytes + 1);
        memset(dates + current_size, 0, bytes + 1);
        memcpy(dates + current_size, date_buf, bytes);
        current_size += bytes;
    }

    if(dates != NULL) {
        $$ = add_node("(%s)", dates);
        free(dates);
    } else {
        $$ = add_node("");
    }
 }
 | TAG SPEC {
    $$ = add_node("%s:\"%s\"", $1, $2);
 }
 | MATCH_ALL {
    $$ = add_node("always_dummy:*");
 }
;

%% 
int main() {
   // yydebug = 1;
    yyparse();

    if(HEAD != NULL) {
        printf("-> %s\n", TAIL->text);
        node *iter = HEAD;
        while(iter) {
            if(iter->text) {
                free(iter->text);
            }

            node *tmp = iter;
            iter = iter->next;
            free(tmp);
        }
    } else {
        yyerror("Empty input.");
    }

    return EXIT_SUCCESS;
} 
