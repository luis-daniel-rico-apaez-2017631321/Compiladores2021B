%{
  #include <stdlib.h>
  #include "calc.h"
%}

%%
[0-9]+		{ yyval = atof(yytext); return NUM; }
[a-zA-Z]+	{ return VAR;  }
[=]		{ return '=';  }
[+]		{ return '+';  }
[-]		{ return '-';  }
[*]		{ return '*';  }
[/]		{ return '/';  }
[\^]		{ return '^';  }
\n		{ return '\n'; }
.
