import java.util.Scanner;

public class Repeticao4 {

    public static void main(String[] args) {
        int r=1;
        Scanner scan = new Scanner(System.in);

        System.out.print("Digite um número: ");
        int n = scan.nextInt();

        for(int i=n; i>1; --i) {
            r*=i;
            System.out.print(i + " x ");
        }
        System.out.println("1 = " + r);
        System.out.println(n+"! = "+r);

    }
}