public class Basic {

   static class Livro {
       String nome, autor, genero;
   }

   static class LivroDeLivraria {
       Livro livroDeLivraria = new Livro();
       int id;
       float price;

       void showLivro(){
           System.out.printf("\n\nLivro %s:\n-Id: %d\n-Autor: %s\n-Gênero: %s\n-Price: %.2fR$\n", livroDeLivraria.nome, id, livroDeLivraria.autor, livroDeLivraria.genero, price);
       }

   }

    static class Lampada {
        String branch;
        int power;
        float price;

        static boolean estaLigada(int lampState){
            return (lampState==1)? true : false;
        }

        void showLamp() {
            System.out.printf("\nLâmpada %s de %dW está a %.2f$\n", branch, power, price);
            System.out.println((estaLigada(0))? "A lâmpada está ligada!" : "A lâmpada está desligada!");
        }
}

    public static void main(String[] args) {
        Lampada lamp1 = new Lampada();
        lamp1.branch = "Positivo";
        lamp1.power = 15;
        lamp1.price = 3.50f;

        lamp1.showLamp();

        LivroDeLivraria livro1 = new LivroDeLivraria();
        livro1.livroDeLivraria.nome = "Iracema";
        livro1.livroDeLivraria.autor = "José de Alencar";
        livro1.livroDeLivraria.genero = "Drama";
        livro1.id = 13;
        livro1.price = 24.9f;

        livro1.showLivro();

    }
}