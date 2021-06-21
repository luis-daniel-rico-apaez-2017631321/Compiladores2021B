/* Notación para calculadora infija. */
%{
  #include <math.h>
  #include <stdio.h>
  int yylex (void);
  void yyerror (char *mensaje){ printf("Error %s \n", mensaje); }
%}

/* Bison declarations. */
%define api.value.type {int}
%token NUM
%left '-' '+'
%left '*' '/'
%precedence NEG	 /* Menos para número negativo */
%right '^'	 /* Exponenciación */


%% /* Sigue la gramática. */
entrada:
  %empty
| entrada linea
;

linea:
  '\n'
| exp '\n'  { printf ("\n Resultado = %d \n", $1); }
;

exp:
  NUM			{ $$ = $1;		}
| exp '+' exp		{ $$ = $1 + $3;		}
| exp '-' exp		{ $$ = $1 - $3;		}
| exp '*' exp		{ $$ = $1 * $3;		}
| exp '/' exp		{ $$ = $1 / $3;		}
;

%%

int main() {
  yyparse(); /* dispara/inicia el análisis sintáctico */

  return 0;
}
