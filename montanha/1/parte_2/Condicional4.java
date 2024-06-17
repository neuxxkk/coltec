import java.util.Scanner;

public class Condicional4 {
    public static void main (String[] args){
        Scanner scan = new Scanner(System.in);
        char c='\0';

        System.out.print("Digite uma nota: ");
        int n = scan.nextInt();

        if (n<40) c = 'F';
        else if (n<59) c = 'E';
        else if (n<69) c = 'D';
        else if (n<79) c = 'C';
        else if (n<89) c = 'B';
        else if (n>90) c = 'A';

        System.out.println("Conceito: " + c);
    }
    
}