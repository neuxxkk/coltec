using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.Json;

var criptomoedas = new List<string>
{
	"BTC",  // Bitcoin
	"ETH",  // Ethereum
	"LTC",  // Litecoin
	"BCH",  // Bitcoin Cash
	"XRP",  // Ripple
	"ADA",  // Cardano
	"DOT",  // Polkadot
	"LINK", // Chainlink
	"XLM",  // Stellar
	"DOGE"  // Dogecoin
};

var precosAtuais = new ConcurrentDictionary<string, decimal>(criptomoedas.ToDictionary(simbolo => simbolo, simbolo => 0m));
var precosAnteriores = new ConcurrentDictionary<string, decimal>(criptomoedas.ToDictionary(simbolo => simbolo, simbolo => 0m));


static HttpClient CriarClienteHttp() {
	var cliente = new HttpClient {
    	Timeout = TimeSpan.FromSeconds(10)
	};
	cliente.DefaultRequestHeaders.Add("User-Agent", "MonitorCripto/1.0");
	cliente.DefaultRequestHeaders.Add("Accept", "application/json");
	return cliente;
}

void ExibirResultadosNoConsole(string simbolo, decimal precoAtual, decimal precoAnterior) {
	var corOriginal = Console.ForegroundColor;
	Console.ForegroundColor = precoAtual > precoAnterior ? ConsoleColor.Green : ConsoleColor.Red;
	Console.WriteLine($"{simbolo}: ${precoAtual:N2} {(precoAtual > precoAnterior ? "↑" : "↓")}");
	Console.ForegroundColor = corOriginal;
}

async Task ObterEConverterCotacaoAsync(string simbolo, CancellationToken token) {
	var clienteHttp = CriarClienteHttp();
	var urlRequisicao = 
    $"https://api.exchange.cryptomkt.com/api/3/public/price/rate?from={simbolo}&to=USDT";
	var resposta = await clienteHttp.GetAsync(urlRequisicao, token);
	resposta.EnsureSuccessStatusCode();

	var json = await resposta.Content.ReadAsStringAsync(token);

	using var documento = JsonDocument.Parse(json);
	if (documento.RootElement.TryGetProperty(simbolo, out var dadosMoeda))    
    {
        var precoString = dadosMoeda.GetProperty("price").GetString();
        decimal precoAtual = decimal.Parse(precoString, CultureInfo.InvariantCulture);
        // Armazene o valor em um ConcurrentDictionary
        precosAtuais[simbolo] = precoAtual;
    }
}


async Task ExibirResultadosAsync(CancellationToken token) {
    while (!token.IsCancellationRequested) {

        Console.Clear();

        var tarefas = criptomoedas.Select(async simbolo => {
            try {
                await ObterEConverterCotacaoAsync(simbolo, token);
            } catch (Exception ex) {
                Console.WriteLine($"Erro ao obter cotação para {simbolo}: {ex.Message}");
            }

            ExibirResultadosNoConsole(simbolo, precosAtuais[simbolo], precosAnteriores[simbolo]);

            precosAnteriores[simbolo] = precosAtuais[simbolo];
        });

        await Task.WhenAll(tarefas);
        await Task.Delay(10000, token); // Aguarde 10 segundos antes de atualizar novamente
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

var cts = new CancellationTokenSource();
var monitoramentoTecla = MonitorarTeclaEscAsync(cts);

await ExibirResultadosAsync(cts.Token);
await monitoramentoTecla;