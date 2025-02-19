import java.util.Random;

public class Sort {
    public static void main(String[] args){
        System.out.println("Hello, world!");

        Random rand = new Random();

        int n=8;
        int[] array;
        array = new int[n];

        for (int i=0;i<n;i++) array[i]=rand.nextInt(1500);

        for (int f : array) System.out.print(f + ", ");

        shellSort(array);


        System.out.println("\n----");

        for (int f : array) System.out.print(f + ", ");

    }

    static void insertSort(int[] array){
        int n = array.length;
        for (int i=0; i<n; i++){
            int swp = array[i];
            for (int j=i-1; j>=0; j--){
                if (swp<array[j]){
                    array[j+1]=array[j];
                    array[j]=swp;
                }
            }
        }
    }

    static void shellSort(int[] array){
        int n = array.length+1;
        int h = 1;

        while (h<n/3) h=h*3+1;

        while(h>=1){
            for (int i=h; i<n-1;i++){
                int temp = array[i];
                int j=i;
                while (j>=h && array[j-h]>temp) {
                        array[j]=array[j-h];
                        j=j-h;
                }
                array[j]=temp;
            }
            h=h/3;
        }
    }

}
