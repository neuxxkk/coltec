import java.util.Scanner;

public class Condicional2 {
    public static void main (String[] args){

        Scanner scan = new Scanner(System.in);

        System.out.print("Digite um número: ");
        int n = scan.nextInt();

        System.out.println(n%7==0 ? "O número é mútiplo de 7" : "O número não é mútiplo de 7");

    }
    
}