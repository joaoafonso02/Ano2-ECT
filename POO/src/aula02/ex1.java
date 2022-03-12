package Aula02;
import java.util.Scanner;

public class ex1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); // Scanner
        System.out.print("km : ");
        double km = sc.nextDouble();        // read double value from keyboard
        double miles = km / 1.609;

        System.out.printf("%5.2fkm in Miles is %5.2f!\n", km, miles);
        sc.close();
    }
}