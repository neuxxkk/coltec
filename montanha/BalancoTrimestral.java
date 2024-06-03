public class BalancoTrimestral {
    public static void main(String[] args) {
        int gastosJaneiro = 15000;
        int gastosFevereiro = 23000;
        int gastosMarco = 17000;

        int gastosTrimestre = gastosJaneiro + gastosFevereiro + gastosMarco;

        System.out.println(mediaMensal(gastosTrimestre));
    }

    static String mediaMensal(int gasto) {
        float mediaMensal = gasto/3f;
        return ("Valor da média mensal = "+ mediaMensal);
    }

}
