package Aula2;
import java.util.Scanner;

public class support {
    public static final String NORMAL = "\033[0m"; final static String RED = "\033[0;31m"; 
    public static Double getPositiveDouble(Scanner sc, String text) { 
        double d=0.0;
        do {
            System.out.print(text);
            if(sc.hasNextDouble()) {
                d = sc.nextDouble();
                if(d > 0) break;     
                System.out.println(RED + "IT HAS TO BE POSITIVE!" + NORMAL); 
			} else {
                System.out.println("IT HAS TO BE A REAL NUMBER");
                sc.next();
            }
        } while(true);

        return d;
    }

    public static int getIntSecs(Scanner sc, String text) {
        int d = 0;
        do {
            System.out.print(text);
            if(sc.hasNextInt()) {
                d = sc.nextInt();
                if(d > 0) break;     
                System.out.println(RED + "THERE ARE NO NEGATIVE SECONDS!" + NORMAL); 
			} else {
                System.out.println("IT HAS TO BE A REAL NUMBER");
                sc.next();
            }
        } while(true);

        return d;
    }

    public static Double getGrade(Scanner sc, String text) { 
        double d = 0;
        do{
            System.out.print(text); 
            d = sc.nextDouble();
            if(d < 0 || d > 20) {
                System.out.println(RED + "GRADE NOT BETWEEN 0-20!" + NORMAL);
            }
        } while(d < 0 || d > 20);

        return d;
    }
    

}
