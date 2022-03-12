import java.util.Scanner;
public class ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nInvested amount: ");
        double amount = sc.nextDouble();
        System.out.print("Monthly Tax: ");
        double tax = sc.nextDouble();
        for (int i = 0; i < 3; i++) {
            amount += amount * (tax/100);
        }

        System.out.println("Final amount: " + amount);
        sc.close();

    }
}
