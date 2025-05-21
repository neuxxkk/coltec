using System;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

while (true)
{
    Console.WriteLine("Batalha Naval");
    const string host = "127.0.0.1";
    const int porta = 9000;
    using var cliente = new TcpClient();
    await cliente.ConnectAsync(host, porta);
    using var stream = cliente.GetStream();
    Console.WriteLine($"Coordenada Bombardeio (ex: A1): ");

    string coordenada = Console.ReadLine();

    var dados = Encoding.UTF8.GetBytes(coordenada);
    await stream.WriteAsync(dados, 0, dados.Length);

    var buffer = new byte[1024];
    int lidos = await stream.ReadAsync(buffer, 0, buffer.Length);
    Console.WriteLine(Encoding.UTF8.GetString(buffer, 0, lidos));

    buffer = new byte[1024];
    lidos = await stream.ReadAsync(buffer, 0, buffer.Length);
    Console.WriteLine(Encoding.UTF8.GetString(buffer, 0, lidos));
    Console.WriteLine("Pressione qualquer tecla para continuar ou 's' para sair.");
    string resposta = Console.ReadLine();
    if (resposta.ToLower() == "s")
    {
        break;
    }
}


