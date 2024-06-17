import java.text.SimpleDateFormat;
import java.util.Date;

public class Transaction {

    private Date date;

    private char transaction;

    private double amount;

    static int totalTransaction=0;

    public Date getDate() {
        return date;
    }

    public char getTransaction() {
        return transaction;
    }

    public void setTransaction(char transaction) {
        if (transaction=='d' || transaction=='w')
            this.transaction = transaction;
        else{
        System.err.println("Erro, valores aceitos em transaction: w/d");;
        System.exit(1);
        }
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Transaction(char transaction, double amount) {
        setTransaction(transaction);
        this.amount = amount;
        this.date = new Date();
        totalTransaction++;
    }

    void statemant(){

        SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");

        String dataFormatada = formatter.format(date);

        System.out.printf("\n%s %c %.2f",dataFormatada, this.transaction, this.amount);
    }

}