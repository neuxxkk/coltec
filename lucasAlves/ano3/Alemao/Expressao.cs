namespace CAS;

public abstract class Expressao
{
    public abstract override string ToString();
    public abstract Expressao Derivar(Simbolo s);
    public abstract Expressao Substituir(Simbolo s, Expressao e);

    public static Expressao operator +(Expressao a, Expressao b) => new Soma(a, b);
    public static Expressao operator -(Expressao a, Expressao b) => new Subtracao(a, b);
    public static Expressao operator *(Expressao a, Expressao b) => new Multiplicacao(a, b);
    public static Expressao operator /(Expressao a, Expressao b) => new Divisao(a, b);

    public static implicit operator Expressao(int v) => new Numero(v);
    public static implicit operator Expressao(float v) => new Numero(v);
    public static implicit operator Expressao(string s) => new Simbolo(s);

    public abstract Expressao Simplificar();

}

public class Numero : Expressao{
    public float valor;
    public Numero(float v) => this.valor = v;
    public override string ToString() => valor.ToString();

    public override Expressao Derivar(Simbolo s) => new Numero(0);

    public override Expressao Simplificar() => this;

    public override Expressao Substituir(Simbolo s, Expressao e) => this;
}

public class NumeroComplexo : Expressao{
    public float parteReal, parteImaginaria;

    public NumeroComplexo(float parteReal, float parteImaginaria){
        this.parteReal = parteReal;
        this.parteImaginaria = parteImaginaria;
    }


    public override string ToString() => $"{parteReal} + {(parteImaginaria != 0.0 ? parteImaginaria != 1 ? $"{parteImaginaria}i": "i" : "")}";

    public override Expressao Derivar(Simbolo s) => new Numero(0);

    public override Expressao Simplificar() => this;

    public override Expressao Substituir(Simbolo s, Expressao e) => this;
}

public class Simbolo : Expressao{
    string simbolo;
    public Simbolo(string s) => this.simbolo = s;
    public override string ToString() => simbolo;

    public override Expressao Derivar(Simbolo s) => new Numero(simbolo == s.simbolo ? 1 : 0);

    public override Expressao Simplificar() => this;

    public override Expressao Substituir(Simbolo s, Expressao e) => simbolo == s.simbolo ? e : this;
}

public class Soma : Expressao{
    Expressao a, b; // a + b
    public Soma(Expressao a, Expressao b){
        this.a = a;
        this.b = b;
    }
    public override string ToString() => $"({a} + {b})";

    public override Expressao Derivar(Simbolo s) => new Soma(a.Derivar(s), b.Derivar(s));

    public override Expressao Simplificar(){
        if(a is Numero n1 && b is Numero n2)
            return new Numero((n1 as Numero).valor + (n2 as Numero).valor);
        else if (a is NumeroComplexo nc1 && b is NumeroComplexo nc2)
            return new NumeroComplexo(nc1.parteReal + nc2.parteReal, nc1.parteImaginaria + nc2.parteImaginaria);
        else if (a is NumeroComplexo nc && b is Numero n)
            return new NumeroComplexo(nc.parteReal + (n as Numero).valor, nc.parteImaginaria);
        else if (a is Numero nn && b is NumeroComplexo ncc)
            return new NumeroComplexo((nn as Numero).valor + ncc.parteReal, ncc.parteImaginaria);
        return this;
    }

    public override Expressao Substituir(Simbolo s, Expressao e) => new Soma(a.Substituir(s, e), b.Substituir(s, e));
}

public class Subtracao : Expressao{
    Expressao a, b; // a - b
    public Subtracao(Expressao a, Expressao b){
        this.a = a;
        this.b = b;
    } 

    public override string ToString() => $"({a} - {b})";

    public override Expressao Derivar(Simbolo s) => new Subtracao(a.Derivar(s), b.Derivar(s));

    public override Expressao Simplificar(){
        if(a is Numero n1 && b is Numero n2)
            return new Numero((n1 as Numero).valor - (n2 as Numero).valor);
        else if (a is NumeroComplexo nc1 && b is NumeroComplexo nc2)
            return new NumeroComplexo(nc1.parteReal - nc2.parteReal, nc1.parteImaginaria - nc2.parteImaginaria);
        else if (a is NumeroComplexo nc && b is Numero n)
            return new NumeroComplexo(nc.parteReal - (n as Numero).valor, nc.parteImaginaria);
        else if (a is Numero nn && b is NumeroComplexo ncc)
            return new NumeroComplexo((nn as Numero).valor - ncc.parteReal, ncc.parteImaginaria);
        return this;
    }

    public override Expressao Substituir(Simbolo s, Expressao e) => new Subtracao(a.Substituir(s, e), b.Substituir(s, e));

}

public class Multiplicacao : Expressao{
    Expressao a, b; // a * b
    public Multiplicacao(Expressao a, Expressao b){
        this.a = a;
        this.b = b;
    }
    public override string ToString() => $"({a} * {b})";

    public override Expressao Derivar(Simbolo s) => 
        new Soma(
            new Multiplicacao(a.Derivar(s), b),
            new Multiplicacao(a, b.Derivar(s))
        );

    public override Expressao Simplificar(){
        if(a is Numero n1 && b is Numero n2)
            return new Numero((n1 as Numero).valor * (n2 as Numero).valor);
        else if (a is NumeroComplexo nc1 && b is NumeroComplexo nc2)
            return new NumeroComplexo(
                nc1.parteReal * nc2.parteReal - nc1.parteImaginaria * nc2.parteImaginaria, // i² = -1
                nc1.parteReal * nc2.parteImaginaria + nc1.parteImaginaria * nc2.parteReal
            );
        else if (a is NumeroComplexo nc && b is Numero n)
            return new NumeroComplexo(nc.parteReal * (n as Numero).valor, nc.parteImaginaria * (n as Numero).valor);
        else if (a is Numero nn && b is NumeroComplexo ncc)
            return new NumeroComplexo((nn as Numero).valor * ncc.parteReal, (nn as Numero).valor * ncc.parteImaginaria);
        return this;
    }

    public override Expressao Substituir(Simbolo s, Expressao e) => new Multiplicacao(a.Substituir(s, e), b.Substituir(s, e));
    
}

public class Divisao : Expressao{
    Expressao a, b; // a / b
    public Divisao(Expressao a, Expressao b){
        this.a = a;
        this.b = b;
    } 
    public override string ToString() => $"({a} / {b})";

    public override Expressao Derivar(Simbolo s) => 
        new Divisao(
            new Subtracao(
                new Multiplicacao(a.Derivar(s), b),
                new Multiplicacao(a, b.Derivar(s))
            ),
            new Multiplicacao(b, b)
        );

    public override Expressao Simplificar(){
        if(a is Numero n1 && b is Numero n2)
            return new Numero((n1 as Numero).valor / (n2 as Numero).valor);
        else if (a is NumeroComplexo nc1 && b is NumeroComplexo nc2){
            var denominador = nc2.parteReal * nc2.parteReal + nc2.parteImaginaria * nc2.parteImaginaria;
            return new NumeroComplexo(
                (nc1.parteReal * nc2.parteReal + nc1.parteImaginaria * nc2.parteImaginaria) / denominador,
                (nc1.parteImaginaria * nc2.parteReal - nc1.parteReal * nc2.parteImaginaria) / denominador
            );
        }
        else if (a is NumeroComplexo nc && b is Numero n)
            return new NumeroComplexo(nc.parteReal / (n as Numero).valor, nc.parteImaginaria / (n as Numero).valor);
        else if (a is Numero nn && b is NumeroComplexo ncc){
            var denominador = ncc.parteReal * ncc.parteReal + ncc.parteImaginaria * ncc.parteImaginaria;
            return new NumeroComplexo(
                (nn as Numero).valor * ncc.parteReal / denominador,
                (nn as Numero).valor * ncc.parteImaginaria / denominador
            );
        }
        return this;
    }

    public override Expressao Substituir(Simbolo s, Expressao e) => new Divisao(a.Substituir(s, e), b.Substituir(s, e));
}