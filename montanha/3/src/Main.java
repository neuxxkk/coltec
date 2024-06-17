public class Main {
    public static void main(String[] args) {

        Client client1 = new Client("Rui", "023.065.376-66", "BH", 35, 'm');
        Client client2 = new Client("Max", "510.376.874-54", "RJ", 26, 'f');
        Client client3 = new Client("Jan", "994.715.609-09", "SP", 48, 'f');
        Client client4 = new Client("Tim", "236.426.038-80", "DF", 19, 'm');

        Account account1 = new Account(client1, 1500, 1234, "312-4",50000);
        Account account2 = new Account(client2, 1000, 4321, "244-1",42000);
        Account account3 = new Account(client3, 3500, 1534, "552-7", -80);
        Account account4 = new Account(client4, 6000, 8723, "244-1", 110000);

        if (account2.transfer(account1, 300)) System.out.printf("\nSuccesfull transfer!\nNew %s balance: $%.2f\nNew %s balance: $%.2f\n", account1.getOwner().name, account1.getBalance(), account2.getOwner().name, account2.getBalance());
        else System.out.printf("\nError during the process\n");

        account2.deposit(750);
        account2.withdraw(9130);

        account3.deposit(10020);
        account3.deposit(230);

        account1.deposit(692);
        account1.withdraw(1452);
        
        account4.deposit(580);

        account3.print();
        account1.print();

        account2.printStatemant();

        account4.printStatemant();

        account1.printStatemant();

        int avg = Transaction.totalTransaction/Account.totalAccount;

        System.out.printf("\nAverage transactions per account: %d\n", avg);
    }
}