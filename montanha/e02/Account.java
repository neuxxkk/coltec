
public class Account {
    Client owner;

    double balance;

    int id;

    String agency;

    double limit;

    //Constructor
    public Account(Client owner, double balance, int id, String agency){
        this.owner = owner;
        this.balance = balance;
        this.id = id;
        this.agency = agency;
        this.limit = balance*10;
    }

    //Alter functions 
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

    //Display functions
    void print(){
        this.owner.printClient();
        System.out.printf("ID: %d\nAgency: %s\nCurrent balance: $%.2f\nLimit: $%.2f\n", this.id, this.agency, this.balance, this.limit);
    }

}
