class Client {
    String name;
    String cpf;
    String adress;
    int age;
    String gender;

    public Client(String name, String cpf, String adress, int age, char gender){
        this.name = name;
        this.cpf = cpf;
        this.adress = adress;
        this.age = age;
        this.gender = (gender=='f') ? "Female": "Male";
    }

    void printClient(){
        System.out.printf("\n--Account data--\nName: %s\nCPF: %s\nAdress: %s\nAge: %d\nGender: %s\n", this.name, this.cpf, this.adress, this.age, this.gender);
    }
}

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
