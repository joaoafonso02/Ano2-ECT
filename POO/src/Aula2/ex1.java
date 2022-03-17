package Aula2;
import java.util.Scanner;

public class ex1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); // Scanner
        double km;
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m";

        // Exceptions 
        do{
            try {
                km = support.getDouble(sc, "\nDistance in Km: ");        // read double value from keyboard
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        }while(true);

        // Calculus
        double miles = km / 1.609;
        // Print
        System.out.printf("%5.2fkm in Miles is %5.2f!\n", km, miles);
        sc.close();
    }
}
