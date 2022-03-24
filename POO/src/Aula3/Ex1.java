package Aula3;
import java.util.Scanner;

public class Ex1 {
    public static  String NORMAL = "\033[0m"; public static String RED = "\033[0;31m"; public static String ANSI_PURPLE = "\u001B[36m";
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        double tgrade = support.readIntervalDouble(sc, "Theoretical grade: ", 0, 20); 
        double pgrade = support.readIntervalDouble(sc, "Pratical grade: ", 0, 20);

        if(FinalGrade(tgrade, pgrade) != 66) {
            System.out.println(ANSI_PURPLE + "Final grade: " + FinalGrade(tgrade, pgrade) + NORMAL);
        } else {
            System.out.println(RED + "Final grade: " + 66 + "!\nFailed by minimum grade! Maybe next time!" + NORMAL);
        }
        sc.close();   
    }

    public static int FinalGrade(double tgrade, double pgrade) {
        int f = (int) Math.round(0.4 * tgrade + 0.6 * pgrade);
        if(tgrade < 7 || pgrade < 7) {
            f = 66;
        } 
        return f;
    }
}
