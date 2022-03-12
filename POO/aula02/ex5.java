import java.util.Scanner;
public class ex5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nv1(km/h): ");
        double v1 = sc.nextDouble();
        System.out.print("d1(km): ");
        double d1 = sc.nextDouble();
        System.out.print("v2(km/h): ");
        double v2 = sc.nextDouble();
        System.out.print("d2(km): ");
        double d2 = sc.nextDouble();

        double distance = d1+d2;
        double time = d1/v1 + d2/v2;
        
        System.out.println("Medium velocity: " + distance/time);
        sc.close();
    }
}
