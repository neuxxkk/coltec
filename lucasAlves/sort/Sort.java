import java.util.Random;

public class Sort {
    public static void main(String[] args){
        System.out.println("Hello, world!");

        Random rand = new Random();

        int n=5;
        int[] array;
        array = new int[n];

        for (int i=0;i<5;i++) array[i]=rand.nextInt(1500);

        for (int f : array) System.out.print(f + ", ");

        for (int i=0; i<n; i++){
            int swp;
            int o=i;
            for (int j=i; j>=0; j--){
                if (array[o]<array[j]){
                    swp=array[o];
                    array[o]=array[j];
                    array[j]=swp;
                    o--;
                }
            }
        }

        System.out.println("\n----");

        for (int f : array) System.out.print(f + ", ");

    }
}
