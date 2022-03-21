package Aula3;
import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); 
        final String NORMAL = "\033[0m"; final String BLUE = "\u001B[34m"; 
        
        int[] days = {31,28,31,30,31,30,31,31,30,31,30,31};

		int month = support.readIntervalInt(sc, NORMAL + "Month: ", 0, 12);
		int yy = support.getIntPos(sc, NORMAL + "Year: ");

		if( (yy % 400 == 0) || ( (yy % 4 == 0) && (yy % 100 != 0) ) )
            if(month == 2) {
                days[1] = 29;
            } else {
                days[1] = 28;
            }
		
		System.out.println(BLUE + "Days: " + (days[month - 1] + NORMAL));
	}
}

