package Aula2;
import java.util.Scanner;
public class ex6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nSeconds: ");
        int s = sc.nextInt();

        int m = s / 60;
        int resto_s = s % 60;
        s = resto_s;

        int h = m / 60;
        int resto_h = h % 60;
        h = resto_h;

        System.out.printf("%02d:%02d:%02d\n", h, m, s);
        sc.close();
    }
}
