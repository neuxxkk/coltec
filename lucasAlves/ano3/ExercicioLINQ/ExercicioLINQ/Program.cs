using ConsoleDump;

var cotas = CotaParlamentar.LerCotasParlamentares("cota_parlamentar.csv");
cotas.OrderByDescending(c => c.ValorLiquido).Take(10).ToArray().Dump();

cotas.GroupBy(c => c.DataEmissao?.Month)
.Select(g => new { Mes = g.Key, Media = g.Average(v => v.ValorLiquido) }).Dump();
