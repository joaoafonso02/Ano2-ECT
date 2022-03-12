package Aula02;
import java.util.Scanner;
public class ex7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("\nCoordinates P1:");
        System.out.print("x1: ");
        double x1 = sc.nextDouble();
        System.out.print("y1: ");
        double y1 = sc.nextDouble();
        
        System.out.println("\nCoordinates P1:");
        System.out.print("x2: ");
        double x2 = sc.nextDouble();
        System.out.print("y2: ");
        double y2 = sc.nextDouble();

        double sum = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
        double dist = Math.sqrt(sum);
        System.out.println("Distance between those 2: " + dist);
        sc.close();
    }
}
