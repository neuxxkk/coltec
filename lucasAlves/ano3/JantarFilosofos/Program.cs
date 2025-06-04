using System;
using System.Threading;
using System.Threading.Tasks;

namespace Main;
public class Program
{
    public static bool[] garfos = new bool[5] { true, true, true, true, true }; // True = available, False = occupied
    public static Filosofo[] filosofos = new Filosofo[5]; // Array of philosophers
    static object lockConsole = new object();


    public static void Print(string msg, ConsoleColor color)
        {
            lock (lockConsole)
            {
                var aux = Console.ForegroundColor;
                Console.ForegroundColor = color;
                Console.WriteLine(msg);
                Console.ForegroundColor = aux;
            }
        }

    public static void Main(string[] args)
    {
        filosofos[0] = new Filosofo("Sócrates", "Penso, logo existo logo como", "Não posso pensar, não posso comer", "Só sei que acabei.", 2000);
        filosofos[1] = new Filosofo("Platão", "A comida é a sombra do bem", "Quem comete uma injustiça é sempre mais infeliz que o alimentado.", "A paz do coração é o paraíso dos homens. Acabei de comer.", 3500);
        filosofos[2] = new Filosofo("Zygmunt Bauman", "A única coisa que podemos ter certeza é a comida.", "A vida é muito maior que a soma de seus alimentos.", "Vivemos o fim do futuro.", 4000);
        filosofos[3] = new Filosofo("Cortella", "O que me importa é a comida que eu levo enquanto minha morte não vem.", "A tristeza do rio é não poder comer.", "Coragem é acabar de comer e não mera disposição eufórica.", 1700);
        filosofos[4] = new Filosofo("Nietzche", "Torna-te aquilo que és Come-te.", "A vida vai ficando cada vez mais dura longe da comida.", "Deus está morto, a comida acabou.", 2800);

        Print("Iniciando o jantar dos filósofos...", ConsoleColor.Cyan);

        Task[] tasks = new Task[5];
        while (true)
        {
            for (int i = 0; i < 5; i++)
            {
                int index = i; // Capture the current value of i in a local variable

                // Check if the task is null or has already completed
                if (tasks[index] == null || tasks[index].IsCompleted)
                {
                    tasks[index] = Task.Run(() =>
                    {
                        filosofos[index].Viver();
                    });
                }
            }
        }
    }
}
