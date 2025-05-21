using System;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;


// Batalha Naval

string coordenada = "";
TcpListener listener = null;
TcpClient client = null;

Console.WriteLine("Batalha Naval");
Console.WriteLine("Digite o tamanho do tabuleiro: ");
int tamanho = int.Parse(Console.ReadLine());
Console.WriteLine("Digite o número de navios: ");
int numNavios = int.Parse(Console.ReadLine());

char[,] tabuleiro = new char[tamanho, tamanho];
for (int i = 0; i < tamanho; i++)
{
    for (int j = 0; j < tamanho; j++)
    {
        tabuleiro[i, j] = '~';
    }
}


string alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

Dictionary<char, int> colunas = new Dictionary<char, int>();

for (int i = 0; i < tamanho; i++)
{
    colunas.Add(alfabeto[i], i);
}

Console.WriteLine("Posicionar navios: \n (1) Aleatório \n (2) Manual");
int opcao = int.Parse(Console.ReadLine());

do
{
    switch (opcao)
    {
        case 1:
            Console.WriteLine("Posicionando navios aleatoriamente...");
            PosicionarNavioAleatorio();
            break;
        case 2:
            Console.WriteLine("Posicione os navios manualmente.");
            PosicionarNavioManual();
            break;
        default:
            Console.WriteLine("Opção inválida.");
            return;
    }
} while (opcao != 1 && opcao != 2);

MostrarTabuleiro();
listener = new TcpListener(IPAddress.Any, 9000);
while (true)
{
    keep(9000);
    Bombardeio(coordenada);
    MostrarTabuleiro();
}

void PosicionarNavioAleatorio()
{
    Random random = new Random();
    for (int i = 0; i < numNavios; i++)
    {
        int x = random.Next(0, tamanho);
        int y = random.Next(0, tamanho);
        while (tabuleiro[x, y] != '~') // Corrigido aqui
        {
            x = random.Next(0, tamanho);
            y = random.Next(0, tamanho);
        }
        tabuleiro[x, y] = 'N';
    }
}

void PosicionarNavioManual()
{
    for (int i = 0; i < numNavios; i++)
    {
        Console.WriteLine($"Posicione o navio {i + 1} (linha e coluna): ");
        int x = colunas[Console.ReadLine()[0]];
        int y = int.Parse(Console.ReadLine());
        while (tabuleiro[x, y] != '~')
        {
            Console.WriteLine("Posição já ocupada. Tente novamente.");
            x = colunas[Console.ReadLine()[0]];
            y = int.Parse(Console.ReadLine());
        }
        tabuleiro[y, x] = 'N';
    }
}

void MostrarTabuleiro()
{
    Console.WriteLine("Tabuleiro:");

    Console.Write("  ");
    for (int i = 0; i < tamanho; i++)
    {
        Console.Write("  " + alfabeto[i]);
    }

    Console.WriteLine();

    Console.Write("  ");
    for (int i = 0; i < tamanho; i++)
    {
        Console.Write("---");
    }

    Console.WriteLine();
    for (int i = 0; i < tamanho; i++)
    {
        Console.Write(i+1 + " | ");
        for (int j = 0; j < tamanho; j++)
        {
            Console.Write(tabuleiro[i, j] + "  ");
        }
        Console.WriteLine();
    }
}

string Bombardeio(string coordenada)
{
    char coluna = coordenada[0];
    int linha = int.Parse(coordenada.Substring(1)) - 1;

    if (linha < 0 || linha >= tamanho || !colunas.ContainsKey(coluna))
    {
        Console.WriteLine("Coordenada inválida.");
    }

    if (tabuleiro[linha, colunas[coluna]] == 'N')
    {
        tabuleiro[linha, colunas[coluna]] = 'X';
        if (IsGameOver())
        {
            return "WIN";
        }

        return "HIT";
    }
    else
    {
        tabuleiro[linha, colunas[coluna]] = 'O';

        return "MISS";
    }
}

bool IsGameOver()
{
    for (int i = 0; i < tamanho; i++)
    {
        for (int j = 0; j < tamanho; j++)
        {
            if (tabuleiro[i, j] == 'N')
            {
                return false;
            }
        }
    }
    return true;
}


void keep(int port)
{
    listener.Start();
    Console.WriteLine($"\nAguardando Player2...");
    client = listener.AcceptTcpClient();
    _= TratarCliente(client);
}

async Task TratarCliente(TcpClient client)
{
    using (client)
    {
        var stream = client.GetStream();

        // Receber dados do Player2
        var buf = new byte[32];
        int len = stream.Read(buf, 0, buf.Length);
        Encoding.ASCII.GetString(buf, 0, len);

        coordenada = Encoding.ASCII.GetString(buf, 0, len);

        Console.WriteLine($"Coordenada recebida: {coordenada}");

        string resposta = Bombardeio(coordenada);

        char[,] tabuleiroEnvio = FormatarTabuleiroParaEnvio();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < tamanho; i++)
        {
            for (int j = 0; j < tamanho; j++)
            {
                sb.Append(tabuleiroEnvio[i, j]);
            }
            sb.AppendLine();
        }

        // Enviar variavel tabuleiro para o Player2 sem navegação

        var dados = Encoding.UTF8.GetBytes(sb.ToString());
        await stream.WriteAsync(dados, 0, dados.Length);

        // Enviar resposta para o Player2
        var respostaBytes = Encoding.UTF8.GetBytes(resposta);
        await stream.WriteAsync(respostaBytes, 0, respostaBytes.Length);
        
    }
}

// Nao deve mostrar 'N', criar copia do tabuleiro
char[,] FormatarTabuleiroParaEnvio()
{
    char[,] tabuleiroEnvio = new char[tamanho, tamanho];
    for (int i = 0; i < tamanho; i++)
    {
        for (int j = 0; j < tamanho; j++)
        {
            if (tabuleiro[i, j] == 'N')
            {
                tabuleiroEnvio[i, j] = '~';
            }
            else
            {
                tabuleiroEnvio[i, j] = tabuleiro[i, j];
            }
        }
    }
    return tabuleiroEnvio;
    
}