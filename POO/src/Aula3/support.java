package Aula3;
import java.util.Scanner;

public class support {
    public static final String NORMAL = "\033[0m"; final static String RED = "\033[0;31m"; 
    // read positive doubles
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
    // read positive ints
    public static int getIntPos(Scanner sc, String text) {
        int d = 0;
        do {
            System.out.print(text);
            if(sc.hasNextInt()) {
                d = sc.nextInt();
                if(d > 0) break;     
                System.out.println(RED + "IT HAS TO BE POSITIVE!" + NORMAL); 
			} else {
                System.out.println("IT HAS TO BE A REAL NUMBER");
                sc.next();
            }
        } while(true);

        return d;
    }

    // read an int [min,max]
	public static int readIntervalInt(Scanner sc, String text, int min, int max) {
		int x;
		while( true ) {
			System.out.print(text);
			if(!sc.hasNextInt()) {
				sc.next();
				continue;
			}
			x = sc.nextInt();
			if( x >= min && x <= max )
				break;
			else
				System.out.println(RED + "NOT BETWEEN " + min + " - " + max + "!" + NORMAL);
		}
		return x;
	}
    // read a double [min,max]
	public static double readIntervalDouble(Scanner sc, String text, double min, double max) {
		double x;
		while( true ) {
			System.out.print(text);
			if(!sc.hasNextDouble()) {
				sc.next();
				continue;
			}
			x = sc.nextDouble();
			if( x >= min && x <= max ) 
				break;
			else
				System.out.println(RED + "NOT BETWEEN " + min + " - " + max + "!" + NORMAL);
		}
		return x;
	}
}
