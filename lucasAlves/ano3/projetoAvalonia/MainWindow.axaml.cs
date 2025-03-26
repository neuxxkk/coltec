using Avalonia.Controls;
using Avalonia.Interactivity;
using System.Diagnostics;

namespace projetoAvalonia
{
	public partial class MainWindow : Window
	{

    	public MainWindow()
    	{
        	// Inicializa a interface a partir do XAML
        	InitializeComponent();
    	}

		private void tipo_selecionado(object sender, SelectionChangedEventArgs e)
		{

			var comboBox = sender as ComboBox;

			if (comboBox == null) return; // Check if comboBox is null

			if (comboBox.SelectedItem is ComboBoxItem item)
			{
				switch (item.Content.ToString())
				{
					case "Temperatura":
						c1.Content = "Celsius - Fahrenheit";
						c2.Content = "Kelvin - Celsius";
						break;
					case "Comprimento":
						c1.Content = "Metro - Pés";
						c2.Content = "Quilômetro - Milhas";
						break;
					case "Peso":
						c1.Content = "Quilograma - Libra";
						c2.Content = "Grama - Onça";
						break;
					case "Volume":
						c1.Content = "Litros - Galões";
						c2.Content = "Mililitros - Onças";
						break;
					default:
						break;
				}
			}

			if (c1 == null) return; // Check if modo is null
			if (c2 == null) return; // Check if modo is null

		}

		private void modo_selecionado(object sender, SelectionChangedEventArgs e){
			var comboBox = sender as ComboBox;

			if (comboBox == null) return; // Check if comboBox is null

			if (comboBox.SelectedItem is ComboBoxItem item)
			{

				var t1 = item.Content.ToString().Split(" - "); 
				
				if (t1.Length > 1)
				{
					m1.Text = t1[0];
					m2.Text = t1[1];
					arrow.IsVisible = true;
				}
			}
		}

		private void invert_arrow(object sender, RoutedEventArgs e){
			switch (arrow.Content.ToString()){
				case "->":
					arrow.Content = "<-";
					break;
				case "<-":
					arrow.Content = "->";
					break;
			}
		}


    	// Evento chamado quando o botão é clicado
    	private void Converter(object sender, RoutedEventArgs e)
		{
			// Obtém o valor de entrada
			if (!double.TryParse(txtInput.Text, out double input))
			{
				// Se o valor de entrada for inválido, exibe uma mensagem de erro
				ans.Text = "Valor inválido";
				return;
			}

			// Verifica a direção da conversão
			bool invert = arrow.Content.ToString() == "<-";

			// Realiza a conversão com base nos valores de m1 e m2
			double result = 0;
			if (m1.Text == "Celsius" && m2.Text == "Fahrenheit")
				result = invert ? (input - 32) / 1.8 : (input * 1.8) + 32;
			else if (m1.Text == "Celsius" && m2.Text == "Kelvin")
				result = invert ? input - 273.15 : input + 273.15;
			else if (m1.Text == "Fahrenheit" && m2.Text == "Celsius")
				result = invert ? (input * 1.8) + 32 : (input - 32) / 1.8;
			else if (m1.Text == "Kelvin" && m2.Text == "Celsius")
				result = invert ? input + 273.15 : input - 273.15;
			else if (m1.Text == "Metro" && m2.Text == "Pés")
				result = invert ? input * 0.3048 : input * 3.28084;
			else if (m1.Text == "Quilômetro" && m2.Text == "Milhas")
				result = invert ? input * 1.60934 : input * 0.621371;
			else if (m1.Text == "Quilograma" && m2.Text == "Libra")
				result = invert ? input * 0.453592 : input * 2.20462;
			else if (m1.Text == "Grama" && m2.Text == "Onça")
				result = invert ? input * 28.3495 : input * 0.035274;
			else if (m1.Text == "Litros" && m2.Text == "Galões")
				result = invert ? input * 3.78541 : input * 0.264172;
			else if (m1.Text == "Mililitros" && m2.Text == "Onças")
				result = invert ? input * 29.5735 : input * 0.033814;

			// Exibe o resultado
			ans.Text = result.ToString("F2");
		}
	}
}
