package Aula3;
import java.util.Scanner;

public class Ex3 {
    public static final String NORMAL = "\033[0m"; final static String RED = "\033[0;31m"; final static String ANSI_PURPLE = "\u001B[36m";; 
    
    public static void main(String[]  args) {
        Scanner sc = new Scanner(System.in);
        boolean prime = true;
        do{
            double number = support.getPositiveDouble(sc, "Number: ");
            if(number == 1) {
                System.out.println(RED + " 1 IS NOT A PRIME NUMBER" + NORMAL);
                prime = false;
            } else {
                for (int i = 2; i < number; i++) {
                    if(number % i == 0) {
                        prime = false;
                        break;
                    } else prime = true;
                }
                if(prime) {
                    System.out.println(ANSI_PURPLE + number + " IS A PRIME NUMBER" + NORMAL);
                } else {
                    System.out.println(RED + number + " IS NOT A PRIME NUMBER" + NORMAL);
                }
            }
        } while(!prime);
        sc.close();
    }
}
