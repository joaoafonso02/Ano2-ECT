package Aula3;
import java.util.*;

public class Ex5 {
    public static final String NORMAL = "\033[0m"; final static String RED = "\033[0;31m"; final static String ANSI_PURPLE = "\u001B[36m";
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        double amount = 0, tax;
        do{
            amount = support.getPositiveDouble(sc, "Amount: ");
            if(amount % 1000 != 0) {
                System.out.println(RED + "MULTIPLE OF 1000 PLEASE!" + NORMAL);
            }
        }while(amount % 1000 != 0);

        do{
            tax = support.getPositiveDouble(sc, "Tax: ")/100;
            if(tax < 0.05) break;
            System.out.println(RED + "0% - 5%" + NORMAL);
        } while(tax > 0.05);
        // Calculus
        for (int i = 0; i < 13; i++) {
            amount += amount * (tax/100);
            System.out.printf(ANSI_PURPLE +  "\nMonth number " + i + " the amount is %3.2f €\n" + NORMAL, amount);
        }
        sc.close();
    }
}
