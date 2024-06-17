public class Account {
    private Client owner;

    private double balance;

    private int id;

    private String agency;

    private double limit;

    private Transaction[] transaction;

    private int transactionCounter;

    static int totalAccount=0;

    public Client getOwner() {
        return owner;
    }

    public void setOwner(Client owner) {
        this.owner = owner;
    }

    public double getBalance() {
        return balance;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAgency() {
        return agency;
    }

    public void setAgency(String agency) {
        this.agency = agency;
    }

    public double getLimit() {
        return limit;
    }

    public void setLimit(double limit) {
        this.limit = (limit<0) ? 0 : limit;
    }

    //Constructor
    public Account(Client owner, double balance, int id, String agency, double limit){
        this.owner = owner;
        this.balance = balance;
        this.id = id;
        this.agency = agency;
        setLimit(limit);
        this.transaction = new Transaction[1000];
        this.transactionCounter=0;
        totalAccount++;
    }

    //Alter functions 
    boolean deposit(double amount){

        if (amount>0){
            this.balance+=amount;
            this.transaction[transactionCounter]=new Transaction('d', amount);
            this.transactionCounter++;
        }

        return amount > 0;
    }

    boolean withdraw(double amount){
        if(amount>0 && amount<this.balance){
            this.balance-=amount;
            this.transaction[transactionCounter]=new Transaction('w', amount);
            this.transactionCounter++;
        }

        return (amount > 0 && amount<this.balance);
    }

    boolean transfer(Account destinyAccount, double amount){
        if(withdraw(amount)){
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

    void printStatemant() {
        System.out.printf("\n--Account %d Statemant--", id);
        for (int i = 0; i < transactionCounter; i++) {
                transaction[i].statemant();
        }
        System.out.println();
    }
    

}
