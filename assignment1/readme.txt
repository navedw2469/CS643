steps:- 
  i) lex filename.l
  ii) gcc lex.yy.c -o lexer -ll
  iii) ./lexer
  or if there is input file
  ./lexer input.c