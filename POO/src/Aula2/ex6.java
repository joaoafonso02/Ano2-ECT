package Aula2;
import java.util.Scanner;
public class ex6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int s, m, h;
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; 
    
        do{
            try {
                s = support.getIntSecs(sc,"\nSeconds: ");
                break;
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);

        // Conversão em hh:mm:ss
        h = s / 3600;
        int resto = s % 3600;
        m = resto / 60;
        s = resto % 60;

        // Print
        System.out.printf("%02d:%02d:%02d\n", h, m, s);
        sc.close();
    }
}
