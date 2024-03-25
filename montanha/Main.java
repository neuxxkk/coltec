public class Main {
    public static void main(String[] args) {

        Account ruiAccount = new Account("Rui", 500, 1234, "123-3");
        Account maxAccount = new Account("Max", 1000, 4321, "321-1");

        if (maxAccount.transfer(ruiAccount, 300)) System.out.printf("Succesfull transfer!\nNew %s balance: %.2f\nNew %s balance: %.2f", ruiAccount.owner,ruiAccount.balance,  maxAccount.owner,maxAccount.balance);
        else System.out.printf("Error during the process");
    }
}