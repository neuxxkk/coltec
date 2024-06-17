public class Main {
    public static void main(String[] args) {

        Client client1 = new Client("Rui", "023.065.376-66", "BH", 35, 'm');
        Client client2 = new Client("Max", "510.376.874-54", "RJ", 26, 'f');
        Client client3 = new Client("Jan", "994.715.609-09", "SP", 48, 'f');
        Client client4 = new Client("Tim", "236.426.038-80", "DF", 19, 'm');

        Account account1 = new Account(client1, 1500, 1234, "312-4");
        Account account2 = new Account(client2, 1000, 4321, "244-1");
        Account account3 = new Account(client3, 3500, 1534, "552-7");
        Account account4 = new Account(client4, 6000, 8723, "244-1");

        if (account2.transfer(account1, 300)) System.out.printf("\nSuccesfull transfer!\nNew %s balance: $%.2f\nNew %s balance: $%.2f\n", account1.owner,account1.balance,  account2.owner,account2.balance);
        else System.out.printf("\nError during the process\n");

        account1.print();
        account2.print();
        account3.print();
        account4.print();
    }
}