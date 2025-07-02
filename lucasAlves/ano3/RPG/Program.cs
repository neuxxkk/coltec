using System;
using System.Diagnostics;

namespace RPG;

class Program
{
    static void Main()
    {
        const int tamanhoExercito = 1_000_000; 

        Personagem[] atacantes = SimuladorCombate.GerarExercito(tamanhoExercito, "atacante");
        Personagem[] defensores = SimuladorCombate.GerarExercito(tamanhoExercito, "defensor");

        Console.WriteLine("=== SIMULAÇÃO DE BATALHA ÉPICA ===");
        Console.WriteLine($"Exércitos: {tamanhoExercito:N0} vs {tamanhoExercito:N0}");

        Stopwatch cronometro = Stopwatch.StartNew();
        int danoTotalRodada = SimuladorCombate.SimularRodadaCombate(atacantes, defensores);
        cronometro.Stop();

        Console.WriteLine($"Dano total causado: {danoTotalRodada:N0}");
        Console.WriteLine($"Tempo sem SIMD: {cronometro.ElapsedMilliseconds}ms");
        Console.WriteLine($"DPS (danos por segundo): {danoTotalRodada * 1000 / Math.Max(1, cronometro.ElapsedMilliseconds):N0}");




        ExercitoSIMD atacantesSIMD = SimuladorCombate.GerarExercitoSIMD(tamanhoExercito, "atacante");
        ExercitoSIMD defensoresSIMD = SimuladorCombate.GerarExercitoSIMD(tamanhoExercito, "defensor");

        Stopwatch cronometroSIMD = Stopwatch.StartNew();
        danoTotalRodada = SimuladorCombate.SimularRodadaCombateSIMD(atacantesSIMD, defensoresSIMD);
        cronometroSIMD.Stop();

        Console.WriteLine($"Dano total causado: {danoTotalRodada:N0}");
        Console.WriteLine($"Tempo com SIMD: {cronometroSIMD.ElapsedMilliseconds}ms");
        Console.WriteLine($"DPS (danos por segundo): {danoTotalRodada * 1000 / Math.Max(1, cronometroSIMD.ElapsedMilliseconds):N0}");
    }
}
