public interface IObservadorPedido
{
	void AoMudarStatusPedido(Pedido pedido, string novoStatus);
}

public class Pedido : IObservable<IObservadorPedido>
{
	private List<IObservadorPedido> _observadores = new List<IObservadorPedido>();
	private string _status;
   
	public string Status
	{
    	    get => _status;
    	    set
    	    {
        	   _status = value;
        	   NotificarObservadores();
    	    }
	}
   
	public void Inscrever(IObservadorPedido observador)
	{
    	    _observadores.Add(observador);
	}

    public IDisposable Subscribe(IObserver<IObservadorPedido> observer)
    {
        throw new NotImplementedException();
    }

    private void NotificarObservadores()
	{
    	    foreach (var observador in _observadores)
    	    {
        	    observador.AoMudarStatusPedido(this, _status);
    	    }
	}
}


public class NotificadorEmail : IObservadorPedido
{
    public void AoMudarStatusPedido(Pedido pedido, string novoStatus) => Console.WriteLine($"Notificação Email: Pedido {pedido} mudou para o status: {novoStatus}");
}

public class NotificadorSMS : IObservadorPedido
{
    public void AoMudarStatusPedido(Pedido pedido, string novoStatus) => Console.WriteLine($"Notificação SMS: Pedido {pedido} mudou para o status: {novoStatus}");
}