package Aula3;
import java.util.Scanner;

public class Ex8_v2 {
    public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    final String NORMAL = "\033[0m"; final String RED_BOLD = "\033[1;31m"; final String GREEN = "\u001B[36m";
    
    // variables
        double[][] CLASS = new double[16][3];
        // Filling the gaps
        for (int i = 0; i < CLASS.length; i++) {
            CLASS[i][0]= (20.0 * Math.random());

            CLASS[i][1] = (20.0 * Math.random());

            CLASS[i][2] = (int) Math.round(0.4 * CLASS[i][0] + 0.6 * CLASS[i][1]);
            if(CLASS[i][2] < 7) {
                CLASS[i][2] = 66;
            }
        }
        // Print Grade Table
        System.out.println(GREEN + "NotaT   NotaP   Pauta" + NORMAL);
        for (double[] aClass : CLASS) {
            System.out.printf("%4.1f    %4.1f      %2s",
                    aClass[0],
                    aClass[1],
                    aClass[2] == 66 || aClass[2] < 9.5 ? RED_BOLD + String.format("%.0f", aClass[2]) + NORMAL : String.format("%.0f", aClass[2]));
            System.out.println();
        }
        sc.close();
    }
}
    
