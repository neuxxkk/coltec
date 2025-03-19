using Avalonia.Controls;
using Avalonia.Interactivity;

namespace projetoAvalonia
{
	public partial class MainWindow : Window
	{
    	public MainWindow()
    	{
        	// Inicializa a interface a partir do XAML
        	InitializeComponent();
    	}

    	// Evento chamado quando o botão é clicado
    	private void BtnClique_Click(object sender, RoutedEventArgs e)
    	{
        	var nome = this.FindControl<TextBox>("txtInput").Text;

            if (string.IsNullOrEmpty(nome)) nome = "visitante";

            nome = nome.Replace("Olá,", "").Replace("Hello,", "").Trim(' ', '!');

            if (nome.StartsWith("Olá") || nome.StartsWith("Hello")) return;

            if (this.FindControl<RadioButton>("ola").IsChecked??false)
            {
                this.FindControl<TextBox>("txtInput").Text = $"Olá, {nome}!";
            }
            else
            {
                this.FindControl<TextBox>("txtInput").Text = $"Hello, {nome}!";
            }

            this.FindControl<ListBox>("listaItens").Items.Add(nome);
    	}
	}
}
