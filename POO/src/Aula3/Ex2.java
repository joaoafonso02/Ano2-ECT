package Aula3;
import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Write a number: ");
        int number = sc.nextInt();

        for (int i = number; i >= 0; i--) {
            System.out.print(i + ", ");
        }
        sc.close();
    }
}
