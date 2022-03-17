package Aula2;
import java.util.Scanner;
public class ex5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double v1, v2, d1, d2;
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; 
        //final String ANSI_CYAN = "\u001B[36m";

        // Exceptions
        do{
            try {
                System.out.print("\nv1(km/h): ");
                v1 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
       
        do{
            try {
                System.out.print("d1(km): ");
                d1 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
        
        do{
            try {
                System.out.print("v2(km/h): ");
                v2 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
       
        do{
            try {
                System.out.print("d2(km): ");
                d2 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
        
        // Calculus
        double distance = d1+d2;
        double time = d1/v1 + d2/v2;
        
        // Print result
        System.out.println("Medium velocity: " + distance/time);
        sc.close();
    }
}
