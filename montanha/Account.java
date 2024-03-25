public class Account {
    String owner;

    double balance;

    int id;

    String agency;

    //Init Void
    public Account(String owner, double balance, int id, String agency){
        this.owner = owner;
        this.balance = balance;
        this.id = id;
        this.agency = agency;
    }

    boolean deposit(double amount){
        this.balance+= (amount>0) ? amount : 0;
        return amount > 0;
    }

    boolean withdraw(double amount){
        this.balance-= (amount>0 && amount<this.balance) ? amount : 0;
        return (amount > 0 && amount<this.balance);
    }

    boolean transfer(Account destinyAccount, double amount){
        if(this.withdraw(amount)){
            return destinyAccount.deposit(amount);
        }else {
            return false;
        }

    }
}
