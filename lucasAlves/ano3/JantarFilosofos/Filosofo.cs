using System;
using System.Threading.Tasks;
using System.Collections.Concurrent;
using System.Text;

public class Filosofo{
    
    static int counter = 0;
    static object lockCheckGrab = new object();
    static object lockConsole = new object();

    void Filosofo(string nome, string lemaBom, string lemaRuim, int tempoComendo){
        this.id = counter;
        this.nome = nome;
        this.lemaBom = lemaBom;
        this.lemaRuim = lemaRuim;
        this.tempoComendo = tempoComendo;

        this.eat = false;
        counter++;
    }

    void Print(string msg, ConsoleColor color){
        lock(lockConsole){
            var aux = Console.ForegroundColor;
            Console.ForegroundColor = color;
            Console.WriteLine(msg);
            Console.ForegroundColor = aux;
        }
    }

    void Viver(){
        // Tenta pegar garfos, caso consiga prossiga, caso contrário print lema e diga que não.
        int n = this.id;
        lock(lockCheckGrab){
            if (garfos[n] && garfos[(n+1)%5]){
                //Comeu
                garfos[n] = false;
                garfos[(n+1)%5] = false;
                Print($"[{this.nome}] : {this.lemaBom}", ConsoleColor.Green);
            }else{
                Print($"[{this.nome}] : {this.lemaRuim}", ConsoleColor.Red);
            }
        }

    }

}