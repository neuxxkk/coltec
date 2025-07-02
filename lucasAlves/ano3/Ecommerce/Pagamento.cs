public interface IEstrategiaPagamento
{
	bool ProcessarPagamento(decimal valor);
	string ObterDetalhespagamento();
}

public class ContextoPagamento
{
	private IEstrategiaPagamento _estrategiaPagamento;
   
	public void DefinirEstrategiaPagamento(IEstrategiaPagamento estrategia)
	{
    	    _estrategiaPagamento = estrategia;
	}
   
	public bool ExecutarPagamento(decimal valor)
	{
    	    return _estrategiaPagamento?.ProcessarPagamento(valor) ?? false;
	}
}

// TODO: Implementar PagamentoCartaoCredito, PaymentPayPal, PagamentoPix

public class PagamentoCartaoCredito : IEstrategiaPagamento
{
    string NumeroCartao;
    string NomeTitular;

    public bool ProcessarPagamento(decimal valor) => valor > 0 && valor < 5000;
    public string ObterDetalhespagamento() => $"Cartão de crédito: {NumeroCartao.Substring(0, 4)}";
}

public class PagamentoPayPal : IEstrategiaPagamento
{
    string Email;

    public bool ProcessarPagamento(decimal valor) => valor > 0 && Email.Contains("@");
    public string ObterDetalhespagamento() => $"PayPal: {Email}";
}

public class PagamentoPix : IEstrategiaPagamento
{
    string ChavePix;

    public bool ProcessarPagamento(decimal valor) => valor > 0;
    public string ObterDetalhespagamento() => $"Pix: {ChavePix}";
}
