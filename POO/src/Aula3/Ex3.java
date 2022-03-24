package Aula3;
import java.util.Scanner;

public class Ex3 {
    public static final String NORMAL = "\033[0m"; final static String RED = "\033[0;31m"; final static String ANSI_PURPLE = "\u001B[36m";; 
    
    public static void main(String[]  args) {
        Scanner sc = new Scanner(System.in);
        
            int number = support.getIntPos(sc, "Number: ");
            if(number == 1) {
                System.out.println(RED + " 1 IS NOT A PRIME NUMBER" + NORMAL);
            } else {
                isPrime(number);
            }
 
        sc.close();
    }

    public static boolean isPrime(int n) {
        boolean isPrime = true;
        for (int i = 2; i < n; i++) {
            if(n % i == 0) {
                isPrime = false;
                break;
            } else isPrime = true;
        }
        if(isPrime) {
            System.out.println(ANSI_PURPLE + n + " IS A PRIME NUMBER" + NORMAL);
        } else {
            System.out.println(RED + n + " IS NOT A PRIME NUMBER" + NORMAL);
        }
        return isPrime;
    }
}
