using ConsoleDump;

var cotas = CotaParlamentar.LerCotasParlamentares("cota_parlamentar.csv");

//1
cotas.GroupBy(c => c.Partido).Select(v => new { Partido = v.Key, Total = v.Sum(g => g.ValorLiquido) }).Dump();

//2
cotas.GroupBy(d => d.NomeParlamentar ?? null)
    .Select(g => new {
        Deputado = g.Key,
        TotalGasto = g.Sum(d => d.ValorLiquido ?? 0)
    })
    .OrderByDescending(d => d.TotalGasto)
    .Take(5)
    .ToArray()
    .Dump();

// 3
cotas.GroupBy(c => c.DataEmissao?.Month)
.Select(g => new { Mes = g.Key, Media = g.Average(v => v.ValorLiquido) }).Dump();

//4
cotas.Where(c => c.Descricao?.Contains("ALIMENTAÇÃO") == true).GroupBy(c => c.NomeParlamentar)
    .Select(g => new { Nome = g.Key, TotalAlimentacao = g.Sum(v => v.ValorLiquido) }).Dump();

//5
cotas.GroupBy(f => f.Fornecedor)
    .Select(g => new { Fornecedor = g.Key, TotalUtilizacoes = g.Count() })
    .OrderByDescending(g => g.TotalUtilizacoes)
    .ToArray()
    .Dump();

//6
cotas.GroupBy(c => c.UF)
    .Select(g => new { UF = g.Key, Total = g.Sum(v => v.ValorLiquido) })
    .ToArray()
    .Dump();

//7
cotas.GroupBy(c => c.DataEmissao?.Month). 
    OrderByDescending(g => g.Count()).
    Select(g => new { Mes = g.Key, DocumentosEmitidos = g.Count() })
    .ToArray()
    .Dump();



//8
cotas.Where(c => c.ValorLiquido > 10_000)
    .Select(g => new { Nome = g.NomeParlamentar, Valor = g.ValorLiquido })
    .ToArray()
    .Dump();

//9
cotas.GroupBy(c => c.Descricao). 
    Select(g => new { TipoDespesa = g.Key, Total = g.Sum(v => v.ValorLiquido) })
    .OrderByDescending(g => g.Total)
    .ToArray()
    .Dump();

//10
cotas.GroupBy(c => c.DataEmissao?.Year)
    .Select(g => new { Ano = g.Key, Total = g.Sum(v => v.ValorLiquido)})
    .ToArray()
    .Dump();