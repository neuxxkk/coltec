using System;
using CAS;

Expressao n1  = 10;
Expressao n2 = 20;

Expressao nc1 = new NumeroComplexo(50, 10);
Expressao nc2 = new NumeroComplexo(30, 20);

Expressao s1 = new Simbolo("b");

Expressao divisao =  nc1 + nc2;

Console.WriteLine((n1/s1).Substituir((Simbolo)s1, 40).Simplificar()); // 