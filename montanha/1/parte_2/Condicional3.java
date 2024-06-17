import java.util.Scanner;

public class Condicional3 {
    public static void main (String[] args){

        Scanner scan = new Scanner(System.in);

        System.out.print("Digite uma nota: ");
        int n = scan.nextInt();

        System.out.println(n >= 60 ? "O aluno passou de ano" : "O aluno não passou de ano");

    }
    
}