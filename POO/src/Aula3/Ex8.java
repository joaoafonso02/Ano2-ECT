package Aula3;
import java.util.Scanner;

public class Ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; final String GREEN = "\u001B[36m";;
        // variables
        double[][] CLASS = new double[16][3];
        // Filling the gaps
        for (int i = 0; i < CLASS.length; i++) {
            CLASS[i][0]= (20.0 * Math.random());

            CLASS[i][1] = (20.0 * Math.random());

            CLASS[i][2] = (int) Math.round(0.4 * CLASS[i][0] + 0.6 * CLASS[i][1]);
            if(CLASS[i][2] < 7) {
                CLASS[i][2] = (int)66;
            }
        }
        // Print Grade Table
        System.out.println(GREEN + "NotaT   NotaP   Pauta" + NORMAL);
        for (int i = 0; i < CLASS.length; ++i) {
            System.out.printf("%4.1f    %4.1f      %2s", 
                    CLASS[i][0], 
                    CLASS[i][1], 
                    CLASS[i][2] < 9.5 ? RED + String.format("%.0f",CLASS[i][2]) + NORMAL: String.format("%.0f",CLASS[i][2]));
            System.out.println();
        }
        sc.close();
    }
}
