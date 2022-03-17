package Aula2;
import java.util.Scanner;
public class ex7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("\nCoordinates P1:");
        double x1, x2, y2, y1;
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; 

        do{
            try {
                System.out.print("x1: ");
                x1 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
        
        do{
            try {
                System.out.print("y1: ");
                y1 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
       
        
        System.out.println("\nCoordinates P1:");
         
        do{
            try {
                System.out.print("x2: ");
                x2 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
        
        do{
            try {
                System.out.print("y2: ");
                y2 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);

        double sum = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
        double dist = Math.sqrt(sum);
        System.out.printf("Distance between those 2: %3.2f\nm", dist);
        sc.close();
    }
}
