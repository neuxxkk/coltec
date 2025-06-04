using System;
using System.Threading.Tasks;
using System.Collections.Concurrent;
using System.Text;

namespace Main
{
    public class Filosofo
    {
        static int counter = 0;
        static object lockCheckGrab = new object();
        int id;
        string nome;
        string lemaBom;
        string lemaRuim;
        string lemaFim;
        int tempoComendo;
        bool canEat;

        public Filosofo(string nome, string lemaBom, string lemaRuim, string lemaFim, int tempoComendo)
        {
            this.id = counter;
            this.nome = nome;
            this.lemaBom = lemaBom;
            this.lemaRuim = lemaRuim;
            this.lemaFim = lemaFim;
            this.tempoComendo = tempoComendo;

            this.canEat = false;
            counter++;
        }

        public void Viver()
        {
            // Tenta pegar garfos, caso consiga prossiga, caso contrário Program.print lema e diga que não.
            int n = this.id;
            lock (lockCheckGrab)
            {
                if (Program.garfos[n] && Program.garfos[(n + 1) % 5])
                {
                    // Comerá
                    canEat = true;
                    Program.garfos[n] = false;
                    Program.garfos[(n + 1) % 5] = false;
                    Program.Print($"[{this.nome}] : {this.lemaBom}", ConsoleColor.Green);
                }
                else
                {
                    Program.Print($"[{this.nome}] : {this.lemaRuim}", ConsoleColor.Red);
                }
                Task.Delay(1000).Wait(); // Espera 1 segundo para tentar novamente
            }

            if (canEat){
                // Espera o tempo de comer
                Task.Delay(tempoComendo).Wait();
                // Solta os garfos
                lock (lockCheckGrab)
                {
                    Program.garfos[n] = true;
                    Program.garfos[(n + 1) % 5] = true;
                    canEat = false;
                }
                // Program.Print que terminou de comer
                Program.Print($"[{this.nome}] : {lemaFim}", ConsoleColor.White);
            }
        }
    }
}