public abstract class Produto
{
	public string Nome { get; set; }
	public decimal Preco { get; set; }
	public abstract string ObterCategoria();
	public abstract decimal CalcularFrete();
}

public abstract class FabricaProduto
{
	public abstract Produto CriarProduto(string nome, decimal preco);
}

public class FabricaEletronicos : FabricaProduto
{
	public override Produto CriarProduto(string nome, decimal preco)
	{
    	    return new Eletronico { Nome = nome, Preco = preco };
	}
}

// TODO: Implementar FabricaRoupa e FabricaLivro

public class FabricaRoupa : FabricaProduto
{
    public override Produto CriarProduto(string nome, decimal preco)
    {
        return new Roupa { Nome = nome, Preco = preco };
    }
}

public class FabricaLivro : FabricaProduto
{
    public override Produto CriarProduto(string nome, decimal preco)
    {
        return new Livro { Nome = nome, Preco = preco };
    }
}

public class Eletronico : Produto
{
    public override string ObterCategoria() => "Eletrônico";
    public override decimal CalcularFrete() => Preco * .05m;
}

public class Roupa : Produto
{
    char Tamanho; // P, M, G

    public override string ObterCategoria() => "Roupas";
    public override decimal CalcularFrete() => 12.5m; 
}

public class Livro : Produto
{
    int NumeroPaginas; 

    public override string ObterCategoria() => "Livros";
    public override decimal CalcularFrete() => NumeroPaginas > 300 ? 8m : 5m;
}




public abstract class DecoradorProduto : Produto
{
	protected Produto _produto;
   
	public DecoradorProduto(Produto produto)
	{
    	    _produto = produto;
	}
   
	public override string ObterCategoria() => _produto.ObterCategoria();
	public override decimal CalcularFrete() => _produto.CalcularFrete();
}

public class DecoradorGarantia : DecoradorProduto
{
	private int _mesesGarantia;

	public DecoradorGarantia(Produto produto, int mesesGarantia) : base(produto)
	{
		_mesesGarantia = mesesGarantia;
		Preco = produto.Preco + (mesesGarantia * 10); // R$10 por mês
	}

	// TODO: Implementar métodos
}

public class DecoradorFreteExpresso : DecoradorProduto
{
	public DecoradorFreteExpresso(Produto produto) : base(produto)
	{
		Preco = produto.Preco + 15;
	}

    //public override decimal CalcularFrete() => _produto.CalcularFrete() + 15;
}

// TODO: Implementar DecoradorFreteExpresso e DecoradorEmbalagem Presente

public class DecoradorEmbalagemPresente : DecoradorProduto
{
	public DecoradorEmbalagemPresente(Produto produto) : base(produto) => Preco = produto.Preco + 5;
}

