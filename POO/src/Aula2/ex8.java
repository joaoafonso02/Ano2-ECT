package Aula2;
import java.util.Scanner;
public class ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("\nFind the hypotenuse!\nThis is a triangle: ");
        int i, j;
        double c1, c2, h;
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; 

        for(i=1; i <= 5; i++){
            for(j=1; j <= i; j++){
                System.out.print("* ");
            }
        System.out.println("");
        } 

        do{
            try {
                System.out.print("\nValue of 1 side: ");
                c1 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);

        do{
            try {
                System.out.print("Value of the other: ");
                c2 = sc.nextDouble();
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);

        h = Math.sqrt(c1*c1 + c2*c2);
        double area = (c1*c2) / 2;
        double angle = Math.acos(c1/h)*180/Math.PI;
     
        System.out.println("Hypotenuse: " + h);
        System.out.println("Area: " + area);
        System.out.println("Angle(º): " + angle);
        sc.close();
    }
}
