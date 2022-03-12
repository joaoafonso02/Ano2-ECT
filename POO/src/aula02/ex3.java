package Aula02;
import java.util.Scanner;

public class ex3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); //Scanner
        System.out.print("\nWater quantity: ");
        double M = sc.nextDouble();
        System.out.print("Inicial water temperature: ");
        double iw = sc.nextDouble();
        System.out.print("Final water temperature: ");
        double fw = sc.nextDouble();

        double dif = fw - iw;
        double Q = M * dif * 4184;
        System.out.println("Energy = " + Q + " J"); 
        sc.close();
    }
}

