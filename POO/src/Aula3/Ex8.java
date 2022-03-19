package Aula3;
import java.util.Scanner;

public class Ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; final String GREEN = "\u001B[36m";;
        // variables
        double tgrade = 0, pgrade = 0;
        double[][] CLASS = new double[16][3];
        //String pauta = "";
        // Filling the gaps
        for (int i = 0; i < CLASS.length; i++) {
            CLASS[i][0]= (int)(20.0 * Math.random()) + 1;
            tgrade = CLASS[i][0];

            CLASS[i][1] = (int)(20.0 * Math.random()) + 1;
            pgrade = CLASS[i][1];

            CLASS[i][2] = (int) Math.round(0.4 * tgrade + 0.6 * pgrade);
            //if(CLASS[i][2] < 9.5) {
             //       pauta = RED + CLASS[i][2] + NORMAL;
            //} else 
             //   pauta = NORMAL +CLASS[1][2];
            
        }
        // Print Grade Table
        System.out.println(GREEN + "NotaT   NotaP   Pauta" + NORMAL);
        for (int i = 0; i < CLASS.length; ++i) {
            for(int j = 0; j < CLASS[i].length; ++j) {
                System.out.printf(String.format("%4.1f", CLASS[i][j]) + "    "); 
            }
            System.out.println();
        }

        sc.close();
    }
}
