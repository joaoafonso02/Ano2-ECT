package Aula2;
import java.util.Scanner;
public class ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double amount, tax;
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; 

        // Exceptions
        do{
            try {
                System.out.print("\nInvested amount: ");
                amount = sc.nextDouble();
                if(amount > 0) break;
                System.out.println(RED + "THERE ARE NO NEGATIVE AMOUNTS!" + NORMAL); 
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
       
        do{
            try {
                System.out.print("Monthly Tax: ");
                tax = sc.nextDouble();
                if(tax > 0) break;
                System.out.println(RED + "THERE ARE NO NEGATIVE TAXES!" + NORMAL); 
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
        
        // Calculus
        for (int i = 0; i < 3; i++) {
            amount += amount * (tax/100);
        }
        // Print result
        System.out.println("Final amount: " + amount);
        sc.close();

    }
}
