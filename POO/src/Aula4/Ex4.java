package Aula4;
import java.util.Scanner;

public class Ex4 {
    public static String NORMAL = "\033[0m"; public static String RED = "\033[0;31m"; public static String ANSI_PURPLE = "\u001B[36m";   
    public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        String[] Months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

        int month = readIntervalInt("Month: ", 1, 12);
        int year = readIntervalInt("Year: ", 0, Integer.MAX_VALUE);
        int WeekDay = readIntervalInt("Weekday(1-7): ", 1, 7);
        
        System.out.println("\n   " + Months[month-1] + " " + year);
        System.out.println("Su Mo Tu We Th Fr Sa");

        for (int i = 0; i < WeekDay-1; i++) {
            System.out.print("   ");    // create space depending on the WeekDay
        }

        for (int i = 1; i <= Days(month, year); i++) {
            System.out.printf("%2d ", i);
			if( ((WeekDay-1)+i) % 7 == 0 ) {    
				System.out.println();   // next line if > Sa
			}
        }
        System.out.println("\n");
        sc.close();
    }
    // read an int [min,max]
	public static int readIntervalInt(String text, int min, int max) {
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
    // get days of each month according the year
    public static int Days(int m, int y) {
        int[] days = {31,28,31,30,31,30,31,31,30,31,30,31};

		if( (y % 400 == 0) || ( (y % 4 == 0) && (y % 100 != 0) ) )
            if(m == 2) {
                days[1] = 29;
            } else {
                days[1] = 28;
            }
        return days[m - 1];
    }

}
