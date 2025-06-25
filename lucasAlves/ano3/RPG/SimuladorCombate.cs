using System;
using System.Diagnostics;
using System.Linq;
using System.Numerics;


namespace RPG;

public class SimuladorCombate
{
    private static Random gerador = new Random(42);


    //No SIMD
    public static int SimularRodadaCombate(Personagem[] atacantes, Personagem[] defensores)
    {
        int danoTotal = 0;

        for (int i = 0; i < atacantes.Length; i++)
        {
            var atacante = atacantes[i];
            var defensor = defensores[i];

            // Calcular dano base
            int danoBase = Math.Max(1, atacante.Ataque - defensor.Defesa);
            int danoCritico = danoBase * atacante.MultCritico / 100;

            // Verificar se é crítico
            int chanceCritico = Random.Shared.Next(0, 100);
            if (chanceCritico < atacante.ChanceCritico)
            {
                danoTotal += danoCritico;
            }
            else
            {
                danoTotal += danoBase;
            }

            // Atualizar vida do defensor
            defensores[i].Vida -= danoBase;
        }

        return danoTotal;
    }


    // Using SIMD
    public static int SimularRodadaCombateSIMD(ExercitoSIMD atacantes, ExercitoSIMD defensores)
    {
        int tam = Vector<int>.Count;

        int[] pb = new int[tam];
        var danoTotal = Vector<int>.Zero;

        for (int i = 0; i < atacantes.Ataques.Length; i += tam)
        {
            var ataque = new Vector<int>(atacantes.Ataques, i);
            var defesa = new Vector<int>(defensores.Defesas, i);
            var chancesCritico = new Vector<int>(atacantes.ChancesCritico, i);
            var multCritico = new Vector<int>(atacantes.MultCriticos, i);
            var vidas = new Vector<int>(defensores.Vidas, i);

            var danoBase = Vector.Max(Vector<int>.One, ataque - defesa);
            var danoCritico = danoBase * multCritico / 100;

            for (int j = 0; j < tam; j++) pb[j] = Random.Shared.Next(0, 100);

            var prob = new Vector<int>(pb);
            var ehCritico = Vector.LessThan(prob, chancesCritico);

            var danoFinal = Vector.ConditionalSelect(ehCritico, danoCritico, danoBase);

            vidas = vidas - danoFinal;
            var vivos = Vector.GreaterThan(vidas, Vector<int>.Zero);

            danoTotal += danoFinal;

            // Atualizar os dados de vida e vivo
            vidas.CopyTo(defensores.Vidas, i);
            vivos.CopyTo(defensores.Vivos, i);

        }

        return Vector.Sum(danoTotal);
    }

    public static ExercitoSIMD GerarExercitoSIMD(int tamanho, string tipo)
    {
        Personagem[] exercito = new Personagem[tamanho];

        for (int i = 0; i < tamanho; i++)
        {
            if (tipo == "atacante")
            {
                exercito[i] = new Personagem
                {
                    Ataque = gerador.Next(80, 120),     // 80-119 ataque
                    Defesa = gerador.Next(20, 40),      // 20-39 defesa 
                    ChanceCritico = gerador.Next(15, 25), // 15-24% crítico
                    MultCritico = gerador.Next(180, 220), // 1.8x-2.2x crítico
                    Vida = gerador.Next(100, 150),
                };
            }
            else // defensor
            {
                exercito[i] = new Personagem
                {
                    Ataque = gerador.Next(60, 80),      // menos ataque
                    Defesa = gerador.Next(40, 70),      // mais defesa
                    ChanceCritico = gerador.Next(10, 20),
                    MultCritico = gerador.Next(150, 200),
                    Vida = gerador.Next(120, 180),      // mais vida
                };
            }
        }

        return new ExercitoSIMD(exercito);
    }

    public static Personagem[] GerarExercito(int tamanho, string tipo)
    {
        Personagem[] exercito = new Personagem[tamanho];

        for (int i = 0; i < tamanho; i++)
        {
            if (tipo == "atacante")
            {
                exercito[i] = new Personagem
                {
                    Ataque = gerador.Next(80, 120),     // 80-119 ataque
                    Defesa = gerador.Next(20, 40),      // 20-39 defesa 
                    ChanceCritico = gerador.Next(15, 25), // 15-24% crítico
                    MultCritico = gerador.Next(180, 220), // 1.8x-2.2x crítico
                    Vida = gerador.Next(100, 150),
                };
            }
            else // defensor
            {
                exercito[i] = new Personagem
                {
                    Ataque = gerador.Next(60, 80),      // menos ataque
                    Defesa = gerador.Next(40, 70),      // mais defesa
                    ChanceCritico = gerador.Next(10, 20),
                    MultCritico = gerador.Next(150, 200),
                    Vida = gerador.Next(120, 180),      // mais vida
                };
            }
        }

        return exercito;
    }
}