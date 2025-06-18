using System.IO;
using System.Text.RegularExpressions;
using System;

var regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()+=_\-{}\[\]:;""'?<>,.]).{7,16}$", RegexOptions.Compiled);

while (true)
{
    Console.WriteLine("Digite uma senha para validação (7 a 16 caracteres, pelo menos uma letra maiúscula, uma minúscula, um dígito e um caractere especial):\n");
    var text = Console.ReadLine() ?? string.Empty;


    if (regex.IsMatch(text))
    {
        Console.WriteLine("Senha válida.\n");
        break;
    }
    else
    {
        Console.WriteLine("Senha inválida.\n");
    }
}

string filePath = "prize.json";

string jsonContent = File.ReadAllText(filePath);

string pattern = @"""category"":\s*""economics"".*?""firstname"":\s*""([^""]+)""";


regex = new Regex(pattern);

MatchCollection matches = regex.Matches(jsonContent);

foreach (Match match in matches)
    if (match.Groups.Count > 1)
        Console.WriteLine("First Name: " + match.Groups[1].Value);
    else
        Console.WriteLine("No first name found in this match.");