%{
  #include <stdio.h>  /* Para printf, etc. */
  #include <math.h>   /* Para pow, usado en la gramática. */
  #include "calc.h"   /* Contiene definiciones de 'symrec'. */
  int yylex (void);
  void yyerror (char const *);
%}

%define api.value.type union  /* Genera YYSTYPE desde sus tipos: */
%token <int> NUM	      /* Simple presición para numeros enteros. */
%token <symrec*> VAR FNCT     /* Apuntador a la tabla de símbolos: variable y función*/
%type <int> exp

%precedence '='
%left '-' '+'
%left '*' '/'
%precedence NEG /* negación para números */
%right '^'	/* Exponenciación */

%% /* Empieza la gramática */
entrada:
  %empty
| entrada linea
;

linea:
  '\n'
| exp '\n'	{ printf("Resultado = %d", $1); }
| error '\n'	{ yyerrok;			}
;

exp:
  NUM			{ $$ = $1;			   }
| VAR			{ $$ = $1->value.var;		   }
| VAR '=' exp		{ $$ = $3; $1->value.var = $3;	   }
| FNCT '(' exp ')'	{ $$ = (*($1->value.fnctptr))($3); }
| exp '+' exp		{ $$ = $1 + $3;			   }
| exp '-' exp		{ $$ = $1 - $3;			   }
| exp '*' exp		{ $$ = $1 * $3;			   }
| exp '/' exp		{ $$ = $1 / $3;			   }
| '-' exp  %prec NEG	{ $$ = -$2;			   }
| exp '^' exp		{ $$ = pow($1, $3);		   }
| '(' exp ')'		{ $$ = $2;			   }
;
/* Fin de la gramática */

%%

/* Llamada por yyparse en un error. */
void yyerror(char const *s)
{
  fprintf(stderr, "%s\n", s);
}

int main(int argc, char const* argv[])
{
  int i;
  /*Habilita las llamadas de parse en la opción -p*/
  for(i = 1; i < argc; i++)
    if(!strcmp(argv[i], "-p"))
      yydebug = 1;
  init_table();
  return yyparse();
}
