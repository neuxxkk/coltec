using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.Json;

var temperaturas = new List<string>
{
    "C",
    "F",
    "K"
};

var tempsAtuais = new ConcurrentDictionary<string, decimal>(temperaturas.ToDictionary(simbolo => simbolo, simbolo => 0m));
var tempsAnteriores = new ConcurrentDictionary<string, decimal>(temperaturas.ToDictionary(simbolo => simbolo, simbolo => 0m));

var simbolo = "";
var unidade = GetUnidade();

static HttpClient CriarClienteHttp()
{
    var cliente = new HttpClient
    {
        Timeout = TimeSpan.FromSeconds(10)
    };
    cliente.DefaultRequestHeaders.Add("User-Agent", "MonitorTemp/1.0");
    cliente.DefaultRequestHeaders.Add("Accept", "application/json");
    return cliente;
}

void ExibirResultadosNoConsole(string simbolo, decimal tempAtual, decimal tempAnterior) {
	var corOriginal = Console.ForegroundColor;
	Console.ForegroundColor = tempAtual > tempAnterior ? ConsoleColor.Red : ConsoleColor.Blue;
	Console.WriteLine($"{tempAtual:N2}º {simbolo} {(tempAtual > tempAnterior ? "↑" : "↓")}");
	Console.ForegroundColor = corOriginal;
}

async Task ObterEConverterTemperaturaAsync(string unidadeDeMedida, CancellationToken token)
{
    var clienteHttp = CriarClienteHttp(); 

    var urlRequisicao = $"http://localhost:5131/temperatura/{unidade}";

    try
    {
        var resposta = await clienteHttp.GetAsync(urlRequisicao, token);
        resposta.EnsureSuccessStatusCode();

        var json = await resposta.Content.ReadAsStringAsync(token);

        using var documento = JsonDocument.Parse(json);

        if (documento.RootElement.TryGetProperty("valor", out var valorJsonElement))
        {
            if (valorJsonElement.TryGetDecimal(out decimal tempAtual))
            {
                tempsAtuais[unidadeDeMedida] = tempAtual;
                Console.WriteLine($"Temperatura em '{unidade}', aperte ESC para sair.");
            }
        }
        else
        {
            Console.WriteLine($"Erro: Propriedade 'valor' não encontrada no JSON da resposta para a unidade '{unidadeDeMedida}'. JSON: {json}");
        }
    }
    catch (HttpRequestException ex)
    {
        Console.WriteLine($"Erro: {ex.Message}");
    }
}


async Task ExibirResultadosAsync(CancellationToken token) {
    while (!token.IsCancellationRequested)
    {

        Console.Clear();

        try
        {
            await ObterEConverterTemperaturaAsync(simbolo, token);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Erro ao obter cotação para {simbolo}: {ex.Message}");
        }

        ExibirResultadosNoConsole(simbolo, tempsAtuais[simbolo], tempsAnteriores[simbolo]);

        tempsAnteriores[simbolo] = tempsAtuais[simbolo];

        await Task.Delay(10000, token);
    }
}

async Task MonitorarTeclaEscAsync(CancellationTokenSource cts) {
	while (true) {
    	if (Console.KeyAvailable && Console.ReadKey(true).Key == ConsoleKey.Escape) {
        	cts.Cancel();
        	break;
    	}
    	await Task.Delay(100);
	}
}

string GetUnidade()
{
    while (true)
    {
        Console.WriteLine("Qual a unidade?\n1. Celsius\n2. Fahrenheit\n3. Kelvin\n");

        switch (Console.ReadLine())
        {
            case "1":
                simbolo = "C";
                return "celsius";
            case "2":
                simbolo = "F";
                return "fahrenheit";
            case "3":
                simbolo = "K";
                return "kelvin";
            default:
                Console.WriteLine("Bad try again! ");
                break;
        }
    }
}

var cts = new CancellationTokenSource();
var monitoramentoTecla = MonitorarTeclaEscAsync(cts);

await ExibirResultadosAsync(cts.Token);
await monitoramentoTecla;