package Aula3;
import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; final String ANSI_PURPLE = "\u001B[36m";;
        double tgrade, pgrade;
        boolean approved = true;

        tgrade = support.readIntervalDouble(sc, "Theoretical grade: ", 0, 20);
        if(tgrade < 7) approved = false;
        
        pgrade = support.readIntervalDouble(sc, "Pratical grade: ", 0, 20);
        if(pgrade < 7) approved = false;

        if(approved) {
            System.out.println(ANSI_PURPLE + "Final grade: " + Math.round(0.4 * tgrade + 0.6 * pgrade) + NORMAL);
        } else {
            System.out.println(RED + "Final grade: " + 66 + "! Failed by minimum grade! Maybe next time!" + NORMAL);
        }
        sc.close();
        
    }
}
