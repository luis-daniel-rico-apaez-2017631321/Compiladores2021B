/* Función de tipo. */
typedef int(*func_t) (double);

/* Tipo de dato para ligadura en la cadena de símbolos */
struct symrec
{
  char *name;	/* Nombre del símbolo */
  int type;	/* Tipo de símbolo: entre VAR y FNCT */
  union
  {
    int var;		/* valor de un VAR */
    func_t fnctptr	/* valor de un FNCT */
  } value;
  struct symrec *next;	/* Se hace la ligadura */
};

typedef struct symrec symrec;

/* La tabla de símbolos: una cadena de 'struct symrec'. */
extern symrec *sym_table;

symrec *putsym(char const *, int);
symrec *getsym(char const *);

/* La nueva versión del 'main' será llamada 'init_table' para inicializar
   la tabla de símbolos */

struct init
{
  char const *fname
  double (fnct) (double);
};

struct init const arith_fncts[] =
{
  { "atan", atan },
  { "cos",  cos	 },
  { "exp",  exp	 },
  { "ln",   log	 },
  { "sin",  sin	 },
  { "sqrt", sqrt },
  { 0, 0 },
};

/* La tabla de símbolos: una cadena de 'struct symrec'. */
symrec *sym_table;

/* Pone las funciones aritméticas en la tabla. */
static
void
init_table(void)
{
  int i;
  for(i = 0; arith_fncts[i].fname != 0; i++)
    {
      symrec *ptr = putsym(arith_fncts[i].fname, FNCT);
      ptr->value.fnctptr = arith_fncts[i].fnct;
    }
}

#include <stdlib.h> /* malloc. */
#include <string.h> /* strlen */

symrec *
putsym(char const *sym_name, int sym_type)
{
  symrec *ptr = (symrec *) malloc(sizeof(symrec));
  ptr->name = (char *) malloc(strlen(sym_name) + 1);
  strcpy(ptr->name, sym_name);
  ptr->type = sym_type;
  ptr->value.var = 0; /* Pone el valor en 0 */
  ptr->next = (struct symrec *)sym_table;
  sym_table = ptr;
  return ptr;
}

symrec *
getsym(char const *sym_name)
{
  symrec *ptr;
  for(ptr = sym_table; ptr != (symrec *) 0;
      ptr = (symrec *)ptr->next)
    if(strcmp(ptr->name, sym_name) == 0)
      return ptr;
  return 0;
}
