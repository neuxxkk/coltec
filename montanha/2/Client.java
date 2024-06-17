public class Client {
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